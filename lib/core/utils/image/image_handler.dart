import 'dart:developer';

import 'package:digixnet/core/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CImageHander {
  static Future imageHandler(BuildContext context, ImageSource source) async {
    try {
      final XFile? imagePicker = await ImagePicker().pickImage(source: source);
      if (imagePicker != null) {
        showSnackBar(context, 'Image selected Successfully');
        return imagePicker;
      } else {
        showErrorSnackBar(
          context,
          'please choose a image',
        );
      }
    } catch (e) {
      log(e.toString());
      showErrorSnackBar(
        context,
        'Try again',
      );
    }
  }
}
