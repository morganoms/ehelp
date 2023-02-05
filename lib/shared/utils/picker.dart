import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Picker {
  Picker._();

  static Future image(ImageSource source) async {
    try {
      final imageTemp = await ImagePicker().pickImage(source: source);
      if (imageTemp == null) return;
      return File(imageTemp.path);
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
    return null;
  }

  static Future multipleImages() async {
    try {
      final imageTemp = await ImagePicker().pickMultiImage();
      if (imageTemp.isEmpty) return;
      return imageTemp;
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
    return null;
  }
}
