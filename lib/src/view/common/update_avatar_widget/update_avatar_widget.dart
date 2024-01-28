import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class UpdateAvatarWidget extends StatelessWidget {
  const UpdateAvatarWidget(
      {Key? key, required this.onUpdateAvatar, required this.child})
      : super(key: key);
  final VoidCallback onUpdateAvatar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Stack(
        children: [
          child,
          GestureDetector(
            onTap: onUpdateAvatar,
            child: Align(
              alignment: Alignment(-1.6, 1.4),
              child: CircleAvatar(
                backgroundColor: WasphaColors.blackColor,
                child: Icon(
                  Icons.edit,
                  color: WasphaColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
