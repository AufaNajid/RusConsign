// ignore_for_file: depend_on_referenced_packages, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rusconsign/Api/all_profile_response.dart';
import 'package:rusconsign/Api/mitra_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MitraController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController namaTokoController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController nomroWaController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxBool successfulEditProduct = false.obs;
  RxBool successfulDestroyProduct = false.obs;
  RxBool successfulEditJasa = false.obs;
  RxBool successfulDestroyJasa = false.obs;
  RxString message = "".obs;
  RxBool isAccepted = false.obs;
  var pickedImage = Rx<File?>(null);
  var mitraId = 0.obs;

  RxString statumitra = "".obs;

  @override
  void onInit() {
    super.onInit();
    fecthProfile();
    initStatusMitra();
  }

  Future<void> initStatusMitra() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? status = prefs.getString("statusMitra");
    print("Status Mitra Adalah ${status}");

    if (status != null) {
      statumitra.value = status;
    }
    await fecthProfile();
  }

  Future<void> fecthProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("Token User adalah${token}");
    var response = await http.get(
        Uri.parse("https://rusconsign.com/api/allprofile"),
        headers: {"Authorization": "Bearer ${token.toString()}"});

    if (response.statusCode == 200) {
      ModelResponseProfile responseProfile =
          modelResponseProfileFromJson(response.body);
      prefs.setString("statusMitra", responseProfile.data.status.toString());
      prefs.setString("idUser", responseProfile.data.id.toString());
      final responseBody = jsonDecode(response.body);
      final idMitra = responseBody['data']['id_mitra'].toString();
      prefs.setString("idMitra", idMitra);
      isAccepted.value = true;
      print(prefs.getString("statusMitra"));
    } else {
      print("Eror FetchingProfile${response.statusCode}");
    }
  }

  Future<void> registerMitra(String nama, String namaToko, int nis,
      String nomor, File imageIdCard, String nomorWa) async {
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
    request.fields['no_dompet_digital'] = nomor;
    

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
    request.fields['no_whatsapp'] = nomorWa;

    print(
        "Sending request with fields: ${request.fields} and file: ${multipartFile.filename}");

    var response = await request.send();

    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      Mitra mitra = Mitra.fromJson(data);
      successfulRegister.value = true;
      message.value = "Registration successful";
      print('Success: ${mitra.namaLengkap}');
      mitraId.value = mitra.id;
      isLoading.value = false;
    }
  }
}
