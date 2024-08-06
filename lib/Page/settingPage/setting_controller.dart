import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rusconsign/Api/all_profile_response.dart';
import 'package:rusconsign/Api/edit_profile_model.dart';
import 'package:rusconsign/Api/profile_response.dart';
import 'package:rusconsign/authentication/controllers/auth_login_controller.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class SettingController extends GetxController {
  RxBool isLoading = false.obs;
  var pickedImage = Rxn<File>();
  var imageUrl = Rxn<String>();

  var profileAll = Rxn<Profile>();

  final TextEditingController namaProfileController = TextEditingController(); 
  final TextEditingController namaTokoController = TextEditingController();
  final TextEditingController bioDescController = TextEditingController();

  var originalNamaProfile = ''.obs;
  var originalNamaToko = ''.obs;
  var originalBioDesc = ''.obs;
  var originalImageUrl = ''.obs;
  RxString dataEmail = ''.obs;
  RxInt dataJumJasa = 0.obs;
  RxInt dataJumProduk = 0.obs;
  RxInt dataPenilaian = 0.obs;
  RxInt dataPengikut = 0.obs;

  static final box = GetStorage();

  RxBool isNotificationSwitched = false.obs;
  RxBool isDarkModeSwitched = false.obs;
  RxBool isOpenMenu = false.obs;
  RxString selectedLanguage = 'Indonesia'.obs;
  RxBool isShow = false.obs;

  final AuthLoginController authLoginController = Get.put(AuthLoginController());

  @override
  void onInit() async {
    fetchData();
    super.onInit();
    isNotificationSwitched.value = box.read('isNotificationSwitched') ?? false;
    isDarkModeSwitched.value = box.read('isDarkModeSwitched') ?? false;
    isOpenMenu.value = box.read('isOpenMenu') ?? false;
    selectedLanguage.value = box.read('selectedLanguage') ?? 'Indonesia';
    update();
  }

  Future<void> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // Simpan path asli tanpa menghapus spasi
    pickedImage.value = File(pickedFile.path);
    imageUrl.value = null;
    print('Picked file path: ${pickedFile.path}');
  }
}

  Future<void> fetchData() async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      Get.snackbar('Error', 'Token hilang');
      isLoading.value = false;
      return;
    }

    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/allprofile'),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      ModelResponseProfile editData = modelResponseProfileFromJson(response.body);
      Profile allProfile = profileFromJson(response.body);
      var dataProfile = allProfile.profiles;

      // Cetak field spesifik dari dataProfile
      print('ID: ${dataProfile.id}');
      print('Nama: ${dataProfile.name}');
      print('Email: ${dataProfile.email}');
      print('Bio Desc: ${dataProfile.bioDesc}');

      namaProfileController.text = editData.data.name;
      namaTokoController.text = editData.data.namaToko!;
      bioDescController.text = editData.data.bioDesc!;

      String originalPath = allProfile.profiles.imageProfiles; 
      String newPath = originalPath.replaceFirst("/storage/profiles/", "/api/storage/public/profiles/");
      imageUrl.value = 'https://rusconsign.com$newPath';
      print(imageUrl.value); 

      originalNamaProfile.value = editData.data.name;
      originalBioDesc.value = editData.data.bioDesc!;
      originalNamaToko.value = editData.data.namaToko.toString();
      originalImageUrl.value = imageUrl.value!;

      dataEmail.value = editData.data.email.toString();
      dataJumProduk.value = editData.data.jumlahproduct!;
      dataPenilaian.value = editData.data.penilaian!;
      dataPengikut.value = editData.data.pengikut;
    } else {
      print('error');
      Get.snackbar('Error', 'Ada data error: ${response.statusCode}');
    }

    isLoading.value = false;

    print('Response body: ${response.body}');
  }

Future<void> updateData() async {
  isLoading.value = true;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token == null) {
    Get.snackbar('Error', 'Token hilang');
    isLoading.value = false;
    return;
  }

  final uri = Uri.parse('https://rusconsign.com/api/edit-profile');
  final request = http.MultipartRequest('POST', uri);
  request.headers['Authorization'] = "Bearer $token";
  request.fields['name'] = namaProfileController.text;
  request.fields['bio_desc'] = bioDescController.text;
  request.fields['nama_toko'] = namaTokoController.text;

  if (pickedImage.value != null) {
    print("data galeri");
    imageUrl.value = null;
    var imageStream = http.ByteStream(pickedImage.value!.openRead());
    var imageLength = await pickedImage.value!.length();
    request.files.add(
      http.MultipartFile(
        'image_profile',
        imageStream,
        imageLength,
        filename: basename(pickedImage.value!.path), // Gunakan path asli
        contentType: MediaType('image', 'jpeg,img,png,jpg'),
      ),
    );
  } else {
    print("data bawaan");
  }

  var response = await request.send();

  if (response.statusCode == 200 || response.statusCode == 201) {
    final responseBody = await response.stream.bytesToString();
    print('Raw Response Body: $responseBody');

    try {

      
      // Log jsonResponse untuk debugging
      // print(' woyy ${jsonResponse.runtimeType}');


      //   // Tambahkan log untuk jsonResponse['data']
      //   print('Data part of JSON: ${jsonResponse['data']}');

        print("fff ${responseBody}");

        final Map<String, dynamic>? decoded = json.decode(responseBody);

        final parsedResponse = EditProfileModel.fromJson(decoded!);

        String newPath = parsedResponse.user.imageProfiles.replaceFirst("/storage/profiles/", "/api/storage/public/profiles/");

        imageUrl.value = "https://rusconsign.com${newPath}"; // Update imageUrl dengan nilai baru

        print('ini value image url : ${imageUrl.value}');
        await authLoginController.emailData();
        Get.snackbar(
          duration: const Duration(seconds: 2),
          borderRadius: 10,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          'berhasil'.tr,
          'dataUbah'.tr,
          backgroundColor: AppColors.success,
          colorText: Colors.white,
        );
        Get.offNamed("/menu");
      
    } catch (e) {
      // final jsonResponse = json.decode(responseBody);
      print('Error parsing JSON: $e');
      // print("json response : ${jsonResponse}");
      Get.snackbar('Error', 'Ada kesalahan dalam memproses data: $e');
    }
  } else {
    print('Ada kesalahan: ${response.statusCode}');
    Get.snackbar('Error', 'Ada kesalahan: ${response.statusCode}');
  }
  isLoading.value = false;
}



  void toggleNotificationSwitch() {
    isNotificationSwitched.value = !isNotificationSwitched.value;
    box.write('isNotificationSwitched', isNotificationSwitched.value);
    update();
  }

  void toggleDarkModeSwitch() {
    isDarkModeSwitched.value = !isDarkModeSwitched.value;
    box.write('isDarkModeSwitched', isDarkModeSwitched.value);
    update();
  }

  void changeLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
    box.write('selectedLanguage', selectedLanguage.value);
    update();
  }

  void showPassword() {
    isShow.value = !isShow.value;
    update();
  }
}
