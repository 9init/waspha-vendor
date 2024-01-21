import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/vendor/vendor.dart';
import 'package:vendor/src/routes/routes_names.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/edit_personal_name/edit_personal_name.dart';
import 'package:vendor/src/view/common/user_avatar/user_avatar.dart';

class VendorAvatarAndName extends StatelessWidget {
  const VendorAvatarAndName({Key? key, required this.vendor}) : super(key: key);
  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer(
          builder: (widget, ref, child) {
            return vendor.avatar != null && vendor.avatar!.isNotEmpty
                ? UserAvatar(
                    radius: 70.r,
                    backgroundColor: WasphaColors.transparentColor,
                    imageType: BackgroundImageType.network,
                    imageUrl: vendor.avatar!,
                  )
                : UserAvatar(
                    radius: 70.r,
                    backgroundColor: WasphaColors.transparentColor,
                    imageType: BackgroundImageType.memory,
                    imageUrl: vendor.avatar!,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  );
          },
        ),
        EditPersonalName(
          personalName: vendor.name,
          editPersonalNameFunction: () =>
              context.push(RoutesNames.profileDetailScreen),
        ),
      ],
    );
  }
}
