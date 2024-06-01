import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rusconsign/Api/mitra_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MitraController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController namajasaController = TextEditingController();
  final TextEditingController namaTokoController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController namaproductController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxBool successfulEditProduct = false.obs;
  RxBool successfulDestroyProduct = false.obs;
  RxBool successfulEditJasa = false.obs;
  RxBool successfulDestroyJasa = false.obs;
  RxString message = "".obs;
  RxBool isPending = false.obs;
  RxBool isAccepted = false.obs;
  var pickedImage = Rx<File?>(null);
  var mitraId = 0.obs;

  RxString statumitra = "".obs;
  @override
  void onInit() {
    super.onInit();
    fecthProfile();
  }

  Future<void> fecthProfile()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await http.get(
      Uri.parse("https://rusconsign.com/api/registermitra"),
      headers: {
        "Authorization":"Bearer ${token.toString()}"
      }
    );

    // statumitra.value = response.body.status;

  }

  Future<void> registerMitra(String nama, String namaToko, int nis,
      String noDompetDigital, File imageIdCard) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://rusconsign.com/api/registermitra"),
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields['nama_lengkap'] = nama;
    request.fields['nama_toko'] = namaToko;
    request.fields['nis'] = nis.toString();
    request.fields['no_dompet_digital'] = noDompetDigital;

    var imageStream = http.ByteStream(imageIdCard.openRead());
    var imageLength = await imageIdCard.length();
    var multipartFile = http.MultipartFile(
      'image_id_card',
      imageStream,
      imageLength,
      filename: basename(imageIdCard.path),
      contentType: MediaType('image', 'jpeg'),
    );
    request.files.add(multipartFile);

    print("Sending request with fields: ${request
        .fields} and file: ${multipartFile.filename}");

    var response = await request.send();

    print("Response status: ${response.statusCode}");


    if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      Mitra mitra = Mitra.fromJson(data);
      successfulRegister.value = true;
      message.value = "Registration successful";
      print('Success: ${mitra.nama_lengkap}');
      mitraId.value = mitra.id;


      isLoading.value = false;
    }
  }





}

