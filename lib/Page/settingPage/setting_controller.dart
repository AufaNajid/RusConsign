// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rusconsign/Api/model_response_profile.dart';
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

  static final box = GetStorage();

  RxBool isNotificationSwitched = false.obs;
  RxBool isDarkModeSwitched = false.obs;
  RxBool isOpenMenu = false.obs;
  RxString selectedLanguage = 'Indonesia'.obs;
  RxBool isShow = false.obs;

  final AuthLoginController authLoginController =
      Get.put(AuthLoginController());

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
      pickedImage.value = File(pickedFile.path);
      imageUrl.value = null;
    }
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('https://rusconsign.com/api/allprofile'),
      headers: <String, String>{
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      ModelResponseProfile allProfile = modelResponseProfileFromJson(response.body);
      print("Nama saya adalah ${allProfile.data.name.toString()}");
      namaProfileController.text = allProfile.data.name.toString();
      namaTokoController.text = allProfile.data.namaToko.toString();
      bioDescController.text = allProfile.data.bioDesc.toString();
      imageUrl.value = allProfile.data.imageProfiles.toString();
    } else {
      // print('error');
      // Get.snackbar('Error', 'Ada data error: ${response.statusCode}');
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
    }

    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = await response.stream.bytesToString();
      print('Raw Response Body: $responseBody');

      try {
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
        Get.offAllNamed("/menu");
      } catch (e) {
        print('Error parsing JSON: $e');
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
