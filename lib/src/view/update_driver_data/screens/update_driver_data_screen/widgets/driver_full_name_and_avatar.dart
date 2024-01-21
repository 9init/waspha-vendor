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
import 'package:vendor/src/view/common/update_avatar_widget/update_avatar_widget.dart';
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
    final driverPasswordController = useTextEditingController();
    final driverConfirmPasswordController = useTextEditingController();

    return Column(
      children: [
        Text(
          '${context.localization.update} ${driverDataByIdResponseModel?.name ?? ''}',
          style: Theme.of(context).textTheme.titleLarge,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Gap(20.h),
        Consumer(
          builder: (widget, ref, child) {
            final imageNotifier =
                ref.watch(pickImageProviderProvider) as String;
            debugPrint('The Image Taken Is ${imageNotifier}');
            debugPrint('The Image Taken Is ${imageNotifier.isNotEmpty}');
            return UpdateAvatarWidget(
              onUpdateAvatar: () => showAdaptiveDialog(
                context: context,
                builder: (context) => ImagePickerDialog(),
              ),
              child: imageNotifier.isNotEmpty
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
            );
          },
        ),
        Gap(20.h),
        CustomFormField(
          paddingLeft: 25,
          paddingRight: 25,
          textFieldName: 'driverName',
          controller: driverNameController,
          text: context.localization.full_name,
          labelText: context.localization.full_name,
          validator: (value) {
            if (value!.isEmpty) {
              return context.localization.please_enter_a_value;
            }
            return null;
          },
        ),
        CustomFormField(
          isPassword: true,
          paddingLeft: 25,
          paddingRight: 25,
          textFieldName: 'driverPassword',
          controller: driverPasswordController,
          text: "*******",
          labelText: context.localization.password,
          validator: (value) {
            if (value!.isEmpty) {
              return context.localization.please_enter_a_password;
            }
            // Add more password validation logic if needed
            return null;
          },
        ),
        CustomFormField(
          isPassword: true,
          paddingLeft: 25,
          paddingRight: 25,
          textFieldName: 'driverConfirmationPassword',
          controller: driverConfirmPasswordController,
          text: "*******",
          labelText: context.localization.retype_password,
          validator: (value) {
            if (value!.isEmpty) {
              return context.localization.please_re_enter_driver_password;
            }
            if (value != driverPasswordController.text) {
              return context.localization.passwords_do_not_match;
            }
            return null;
          },
        ),
        Gap(20.h),
      ],
    );
  }
}
