// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class QrCodeController extends GetxController{
  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> captureAndSaveImage() async {
    final Uint8List? uint8list = await screenshotController.capture();
    if (uint8list != null) {
      final PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        final result = await ImageGallerySaver.saveImage(uint8list);
        if (result['isSuccess']) {
          print("QR code saved successfully.");
        } else {
          print("Error saving QR code.");
        }
      } else {
        print("Permission denied.");
      }
    } else {
      print("Error capturing QR code.");
    }
  }
}
