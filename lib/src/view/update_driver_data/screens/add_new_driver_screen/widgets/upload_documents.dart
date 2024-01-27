import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/user_avatar/user_avatar.dart';
import 'package:vendor/src/view/update_driver_data/enums/enums.dart';
import 'package:vendor/src/view/update_driver_data/providers/upload_document_provider/upload_document_provider.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/image_picker_dialog.dart';

class UploadDocuments extends HookConsumerWidget {
  const UploadDocuments({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final documents = ref.watch(itemListProvider);
    final imagePickerState = ref.watch(documentImageProvider);
    final documentImageString = imagePickerState.documentImageString;

    return Column(
      children: [
      Container(
      height: 95.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: documents.length,
        itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  UserAvatar(
                    radius: 40,
                    backgroundColor: WasphaColors.grey200,
                    imageUrl: documents[index].toString(),
                    imageType: BackgroundImageType.memory,
                    hasRadiusColor: true,
                    child: Align(
                      alignment: Alignment(-1.4, -2.2),
                      child: IconButton(
                        onPressed: () {
                          ref
                              .read(itemListProvider.notifier)
                              .removeDocument(
                            image: documents[index],
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
      ),
      Gap(12.h),
      Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) =>
                  ImagePickerDialog(
                    pickImageSource: PickImageSource.Document,
                    onImagePicked: () {
                      ref.read(itemListProvider.notifier).addNewDocument(
                        image: documentImageString,
                      );
                      ref.watch(documentImageProvider.notifier).clearDocumentImageString();
                      debugPrint('The Item Is Added ${documents.length}');
                      debugPrint('New document added: $documentImageString');
                    },
                  ),
            );
            debugPrint('documentImageString $documentImageString');
          },
          child: Container(
            height: 63.h,
            width: 271.w,
            decoration: BoxDecoration(
              color: WasphaColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.upl),
                Text(
                  context.localization.upload_documents,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                    color: WasphaColors.whiteColor,
                  ),
                )
              ],
            ),
          ),
        ),
      )
      ],
    );
  }
}
