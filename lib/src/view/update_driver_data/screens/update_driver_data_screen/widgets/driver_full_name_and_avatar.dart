import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/custom_form/index.dart';
import 'package:vendor/src/view/update_driver_data/providers/pick_image_provider/pick_image_provider.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/image_picker_dialog.dart';

class DriverFullNameAndAvatar extends HookWidget {
  const DriverFullNameAndAvatar({
    Key? key,
    this.driverDataByIdResponseModel,
  }) : super(key: key);
  final GetDriverDataByIdResponseModel? driverDataByIdResponseModel;

  @override
  Widget build(BuildContext context) {
    final driverNameController =
        useTextEditingController(text: driverDataByIdResponseModel?.name ?? '');

    return Column(
      children: [
        Text(
          '${context.localization.update}${driverDataByIdResponseModel?.name ?? ''}',
          style: Theme.of(context).textTheme.titleLarge,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Gap(20.h),
        Container(
          width: 100.w,
          height: 100.h,
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final imageNotifier =
                  ref.watch(pickImageProviderProvider) as String;
              debugPrint('The Image Taken Is ${imageNotifier}');
              debugPrint('The Image Taken Is ${imageNotifier.isNotEmpty}');
              return Stack(
                children: [
                  imageNotifier.isNotEmpty
                      ? CircleAvatar(
                          radius: 50.r,
                          backgroundColor: WasphaColors.greyColor,
                          backgroundImage: MemoryImage(
                            base64Decode(
                              imageNotifier.toString(),
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 50.r,
                          backgroundColor: WasphaColors.greyColor,
                          backgroundImage: CachedNetworkImageProvider(
                            driverDataByIdResponseModel?.avatar ?? '',
                          ),
                        ),
                  Align(
                    alignment: Alignment(-1.3, 1),
                    child: CircleAvatar(
                      backgroundColor: WasphaColors.blackColor,
                      child: IconButton(
                        onPressed: () => showAdaptiveDialog(
                          context: context,
                          builder: (context) => ImagePickerDialog(),
                        ),
                        icon: Icon(
                          Icons.edit,
                          color: WasphaColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Gap(20.h),
        CustomFormField(
          textFieldName: 'driverName',
          controller: driverNameController,
          text: context.localization.full_name,
          labelText: context.localization.full_name,
        ),
        Gap(20.h),
      ],
    );
  }
}
