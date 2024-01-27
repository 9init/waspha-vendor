import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor/src/view/update_driver_data/providers/pick_image_provider/pick_image_provider.dart';

class ListImages extends StateNotifier<List<String>> {
  ListImages() : super(([]));

  void addNewDocument({required String image}) {
    state = [...state, image];
  }

  void removeDocument({required String image}) {
    state.remove(image);
    state = [...state];
  }
}



class DocumentImageProvider extends StateNotifier<ImagePickerTypes> {
  DocumentImageProvider() : super((ImagePickerTypes()));

  final ImagePicker picker = ImagePicker();

  bool isImageChosen = false;

  Future<void> chooseDocumentImage(
      String pickerType, Function()? onImagePicked) async {
    final pickedImage = await _pickImage(pickerType);
    if (pickedImage != null) {
      state = ImagePickerTypes(
        documentImageString: base64Encode(await pickedImage.readAsBytes()),
        documentImagePath: pickedImage.path,
      );
      if (onImagePicked != null) {
        onImagePicked();
      }
    }
  }

  void clearDocumentImageString() {
    state = state.copyWith(documentImageString: '');
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

final documentImageProvider =
    AutoDisposeStateNotifierProvider<DocumentImageProvider, ImagePickerTypes>(
  (ref) => DocumentImageProvider(),
);
final itemListProvider =
AutoDisposeStateNotifierProvider<ListImages, List<String>>(
      (ref) => ListImages(),
);