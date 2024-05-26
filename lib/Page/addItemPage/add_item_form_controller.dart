import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemFormController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;
  RxString message = "".obs;
  var pickedImage = Rxn<File>();


  int get selectedIndex => _selectedIndex.value;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;

  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
        print(index);
  }

   Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }
}