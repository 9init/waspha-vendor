import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/update_driver_data/providers/pick_image_provider/pick_image_provider.dart';

class ImagePickerDialog extends ConsumerWidget {
  const ImagePickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePickerReader = ref.read(pickImageProviderProvider.notifier);
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
                imagePickerReader.chooseImageSource('Camera').then((value) {
                  Navigator.of(context)
                      .pop(); // Use Navigator.of(context).pop()
                });
              },
            ),
            ListTile(
              title: Text(context.localization.from_gallery),
              leading: Icon(Icons.image),
              onTap: () {
                imagePickerReader.chooseImageSource('Gallery').then((value) {
                  Navigator.of(context)
                      .pop(); // Use Navigator.of(context).pop()
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
