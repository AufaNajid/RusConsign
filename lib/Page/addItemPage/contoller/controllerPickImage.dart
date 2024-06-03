// ignore_for_file: file_names

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class PickedImageController extends GetxController {
  var pickedImage = Rxn<File>();

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }
}