import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rusconsign/Api/mitra_response.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class MitraController extends GetxController {
  final TextEditingController namaController = TextEditingController();
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
  RxString message = "".obs;
  var pickedImage = Rx<File?>(null);

  Future<void> registerMitra(
    String nama,
    String namaToko,
    int nis,
    String no_dompet_digital,
    File imageIdCard,
  ) async {
    isLoading.value = true;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://rusconsign.com/api/registermitra"),
    );

    request.fields['nama_lengkap'] = nama;
    request.fields['nama_toko'] = namaToko;
    request.fields['nis'] = nis.toString();
    request.fields['no_dompet_digital'] = no_dompet_digital;

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
      print('Success: ${mitra.nama}');
    } else {
      var responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      successfulRegister.value = false;
      message.value = data['message'] ?? 'Registration failed';
      print('Failed to register: $responseBody');
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  Future<void> addProduct(int mitraId) async {
    isLoading.value = true;

    try {
      final mitraResponse = await http
          .get(Uri.parse('https://rusconsign.com/api/mitra/$mitraId'));

      if (mitraResponse.statusCode == 200) {
        final mitraData = json.decode(mitraResponse.body);

        if (mitraData['status'] == 'accepted') {
          final productData = {
            'name_product': namaproductController.text,
            'desc_product': deskripsiController.text,
            'price_product': hargaController.text,
            'rating_product': ratingController.text,
            'image': imageController.text,
            'mitra_id': mitraId.toString(),
          };

          final response = await http.post(
            Uri.parse('https://rusconsign.com/api/addProduct'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(productData),
          );
          if (response.statusCode == 201) {
            successfulRegister.value = true;
            message.value = 'Produk berhasil ditambahkan';
          } else {
            successfulRegister.value = false;
            message.value = 'Gagal menambahkan produk';
            print('Failed to add product: ${response.body}');
          }
        } else {
          successfulRegister.value = false;
          message.value = 'Mitra belum diterima';
          print('Mitra status: ${mitraData['status']}');
        }
      } else {
        successfulRegister.value = false;
        message.value = 'Gagal mengambil data mitra';
        print('Failed to fetch mitra data: ${mitraResponse.body}');
      }
    } catch (e) {
      successfulRegister.value = false;
      message.value = 'Terjadi kesalahan: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
