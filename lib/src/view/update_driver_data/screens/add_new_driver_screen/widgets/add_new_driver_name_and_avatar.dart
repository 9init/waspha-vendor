import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/custom_form/index.dart';
import 'package:vendor/src/view/common/user_avatar/user_avatar.dart';
import 'package:vendor/src/view/update_driver_data/enums/enums.dart';
import 'package:vendor/src/view/update_driver_data/providers/pick_image_provider/pick_image_provider.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/image_picker_dialog.dart';

class AddNewDriverNameAndAvatar extends HookWidget{
  const AddNewDriverNameAndAvatar( {
    Key? key,
    required this.driverType,
  }) : super(key: key);
  final DriverType driverType;

  @override
  Widget build(BuildContext context) {
    final driverNameController = useTextEditingController();
    final driverPasswordController = useTextEditingController();
    final driverConfirmPasswordController = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            '${driverType==DriverType.ONLINE? context.localization.new_online_carriers : context.localization.new_offline_carriers}',
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Gap(25.h),
        Container(
          width: 120.w,
          height: 120.h,
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final imagePickerState = ref.watch(pickImageProviderProvider) as ImagePickerTypes;;
              final driverImageString = imagePickerState.driverImageString;
              return UserAvatar(
                radius: 20,
                backgroundColor: WasphaColors.grey200.withOpacity(0.2),
                imageUrl: driverImageString.toString(),
                imageType: BackgroundImageType.memory,
                child: Visibility(
                  visible: driverImageString.isEmpty,
                  child: IconButton(
                    onPressed: () => showAdaptiveDialog(
                      context: context,
                      builder: (context) => ImagePickerDialog(pickImageSource: PickImageSource.Driver,),
                    ),
                    icon: Icon(
                      Icons.add,
                      color: WasphaColors.blackColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ).wrapCenter(),
        Gap(5.h),
        Text(
          context.localization.profile_picture,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: WasphaColors.grey300),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ).wrapCenter(),
        Gap(20.h),
        CustomFormField(
          paddingLeft: 65,
          paddingRight: 65,
          textFieldName: 'driverName',
          controller: driverNameController,
          text: context.localization.full_name,
          labelText: context.localization.full_name,
          validator: (value) {
            if (value!.isEmpty) {
              return context.localization.please_enter_driver_full_name;
            }
            return null;
          },
        ),
        CustomFormField(
          isPassword: true,
          paddingLeft: 65,
          paddingRight: 65,
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
          paddingLeft: 65,
          paddingRight: 65,
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
    ).PaddingColumn(paddingRight: 5, paddingLeft: 5);
  }
}
