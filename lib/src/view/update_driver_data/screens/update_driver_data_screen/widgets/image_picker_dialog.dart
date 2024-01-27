import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/update_driver_data/enums/enums.dart';
import 'package:vendor/src/view/update_driver_data/providers/pick_image_provider/pick_image_provider.dart';
import 'package:vendor/src/view/update_driver_data/providers/upload_document_provider/upload_document_provider.dart';


class ImagePickerDialog extends ConsumerWidget {
  const ImagePickerDialog(
     {
    Key? key,
    required this.pickImageSource,
       this.onImagePicked,
  }) : super(key: key);
  final PickImageSource pickImageSource;
  final VoidCallback? onImagePicked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePickerReader = ref.read(pickImageProviderProvider.notifier);
    final documentImageReader = ref.read(documentImageProvider.notifier);

    return AlertDialog.adaptive(
      content: Container(
        height: 200.h,
        width: 200.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text(context.localization.from_camera),
              leading: Icon(Icons.camera),
              onTap: () {
                pickImageSource == PickImageSource.Driver
                    ? imagePickerReader
                        .chooseImageSource('Camera')
                        .then((value) {
                        Navigator.of(context).pop();
                      })
                    : documentImageReader
                        .chooseDocumentImage('Camera',
                    onImagePicked)
                        .then((value) {
                        Navigator.of(context).pop();
                      });
              },
            ),
            ListTile(
              title: Text(context.localization.from_gallery),
              leading: Icon(Icons.image),
              onTap: () {
                pickImageSource == PickImageSource.Driver
                    ? imagePickerReader
                        .chooseImageSource('Gallery')
                        .then((value) {
                        Navigator.of(context).pop();
                      })
                    : documentImageReader
                        .chooseDocumentImage('Gallery',onImagePicked)
                        .then((value) {
                        Navigator.of(context).pop();
                      });
              },
            ),
          ],
        ),
      ),
    );
  }
}
