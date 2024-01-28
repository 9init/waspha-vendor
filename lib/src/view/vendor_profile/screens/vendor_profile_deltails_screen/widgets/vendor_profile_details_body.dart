import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/repository/auth/login.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/update_avatar_widget/update_avatar_widget.dart';
import 'package:vendor/src/view/common/user_avatar/user_avatar.dart';
import 'package:vendor/src/view/update_driver_data/providers/pick_image_provider/pick_image_provider.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/image_picker_dialog.dart';
import 'package:vendor/src/view/vendor_profile/screens/vendor_profile_deltails_screen/widgets/index.dart';

class VendorProfileDetailsBody extends ConsumerWidget {
  const VendorProfileDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendor = ref.watch(LoginRepository.vendorProvider);

    return Column(
      children: [
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
              child: UserAvatar(
                  hasRadiusColor: true,
                  radius: 60.r,
                  backgroundColor: WasphaColors.transparentColor,
                  imageType: imageNotifier.isEmpty
                      ? BackgroundImageType.network
                      : BackgroundImageType.memory,
                  imageUrl: imageNotifier.isEmpty
                      ? vendor.value?.avatar ?? ''
                      : imageNotifier),
            ).wrapCenter();
          },
        ),
        Gap(20.h),
        UserDetails(
          title: context.localization.name,
          subTitle: vendor.value?.name ?? '',
        ),
        UserDetails(
          isVerified: vendor.value?.isContactVerified ?? false,
          title: context.localization.phone_number,
          subTitle: vendor.value?.contact ?? '',
        ),
        UserDetails(
          isVerified: vendor.value?.isEmailVerified ?? false,
          title: context.localization.email,
          subTitle: vendor.value?.email ?? '',
        ),
        UserDetails(
          title: context.localization.Password,
          subTitle: '',
        ),
      ],
    );
  }
}
