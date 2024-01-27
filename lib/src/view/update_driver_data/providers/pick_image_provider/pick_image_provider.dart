import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pick_image_provider.g.dart';

@riverpod
class PickImageProvider extends _$PickImageProvider {
  final ImagePicker picker = ImagePicker();

  @override
  build() {
    return ImagePickerTypes(
      driverImageString: '',
      driverImagePath: '',
      documentImageString: '',
      documentImagePath: '',
    );
  }

  bool isImageChosen = false;

  Future<void> chooseImageSource(String pickerType) async {
    final pickedImage = await _pickImage(pickerType);
    if (pickedImage != null) {
      // state = base64Encode(await pickedImage.readAsBytes());
      state = ImagePickerTypes(
        driverImageString: base64Encode(await pickedImage.readAsBytes()),
        driverImagePath: pickedImage.path,
        vendorProfile:base64Encode(await pickedImage.readAsBytes()),
      );
      isImageChosen = true;
    }
  }

  Future<void> chooseDocumentImage(String pickerType) async {
    final pickedImage = await _pickImage(pickerType);
    if (pickedImage != null) {
      state = ImagePickerTypes(
        documentImageString: base64Encode(await pickedImage.readAsBytes()),
        documentImagePath: pickedImage.path,
      );
      // ... other code ...
    }
  }

  Future<File?> _pickImage(String pickerType) async {
    XFile? pickedImage;
    switch (pickerType) {
      case 'Gallery':
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        break;
      case 'Camera':
        pickedImage = await picker.pickImage(source: ImageSource.camera);
        break;
    }

    if (pickedImage != null) {
      try {
        final file = File(pickedImage.path);
        return file;
      } catch (e) {
        debugPrint('Error reading image file: $e');
        return null;
      }
    }
    return null;
  }
}

class ImagePickerTypes {
  String driverImageString;
  String driverImagePath;
  String documentImageString;
  String documentImagePath;
  String vendorProfile;

  ImagePickerTypes({
    this.driverImageString = '',
    this.driverImagePath = '',
    this.documentImageString = '',
    this.documentImagePath = '',
    this.vendorProfile = '',
  });

  ImagePickerTypes copyWith({
    String? driverImageString,
    String? driverImagePath,
    String? documentImageString,
    String? documentImagePath,
    String? vendorProfile,
  }) => ImagePickerTypes(
    driverImageString: driverImageString ?? this.driverImageString,
    driverImagePath: driverImagePath ?? this.driverImagePath,
    documentImageString: documentImageString ?? this.documentImageString,
    documentImagePath: documentImagePath ?? this.documentImagePath,
    vendorProfile: vendorProfile ?? this.vendorProfile,
  );
}
