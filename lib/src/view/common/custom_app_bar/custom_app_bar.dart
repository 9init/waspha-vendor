import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.appBarHeight,
      this.hasCloseButton,
      // this.hasBackButton,
      required this.automaticallyImplyLeading})
      : super(key: key);
  final double? appBarHeight;
  final bool? hasCloseButton;

  // final bool? hasBackButton;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    //TODO://Fix App Change Color When Scrolling
    return AppBar(
      backgroundColor: WasphaColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading && context.canPop()
          ? Padding(
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
            )
          : null,
      actions: hasCloseButton != null && context.canPop()
          ? [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: CircleAvatar(
                  // radius: 20.r,
                  backgroundColor: WasphaColors.blackColor,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(
                      Icons.close,
                      color: WasphaColors.white,
                    ),
                  ),
                ),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 60.h);
}
