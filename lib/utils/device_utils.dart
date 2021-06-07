import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

//Helper class for device related operations.
class DeviceUtils {
  // hides the keyboard if its already open
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  //Pick Image from gallery and returns the cropped image
  static Future<Uri?> pickFromGallery() async {
    final _picker = ImagePicker();
    var pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );

    Uri? croppedImage;
    if (pickedFile != null) {
      croppedImage = await _cropImage(pickedFile.path);
    }
    return croppedImage;
  }

  // Pick Image from camera and returns the cropped image
  static Future<Uri?> pickFromCamera() async {
    final _picker = ImagePicker();
    var pickedFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 1200,
      maxHeight: 1200,
    );

    Uri? croppedImage;
    if (pickedFile != null) {
      croppedImage = await _cropImage(pickedFile.path);
    }
    return croppedImage;
  }

  //Image cropper
  static Future<Uri?> _cropImage(filePath) async {
    var croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      iosUiSettings: IOSUiSettings(
          aspectRatioLockEnabled: true,
          rectWidth: 1080,
          rectHeight: 1080,
          rectX: 1080,
          rectY: 1080),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      maxWidth: 1080,
      maxHeight: 1080,
    );
    Uri? photoUri;
    if (croppedImage != null) {
      photoUri = croppedImage.uri;
    }
    return photoUri;
  }
}
