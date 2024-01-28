import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.appBarHeight}) : super(key: key);
  final double? appBarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: context.canPop()?Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: CircleAvatar(
          radius: 20.r,
          backgroundColor: WasphaColors.blackColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: BackButton(
              color: WasphaColors.white,
            ),
          ),
        ),
      ):null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 60.h);
}
