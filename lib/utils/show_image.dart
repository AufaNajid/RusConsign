import 'dart:io';
import 'package:flutter/material.dart';

class ShowImage {
  void showImageBefore(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(164, 0, 0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  void showImageAfter(BuildContext context, File imageData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(164, 0, 0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              imageData,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
