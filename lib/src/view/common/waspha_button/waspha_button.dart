import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class WasphaButton extends StatelessWidget {
  const WasphaButton(
      {Key? key,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.buttonColor,
      required this.borderRadiusGeometry,
      required this.buttonText,
      this.onButtonTapped})
      : super(key: key);
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColor;
  final BorderRadiusGeometry borderRadiusGeometry;
  final String buttonText;
  final VoidCallback? onButtonTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTapped,
      child: Container(
        width: buttonWidth.w,
        height: buttonHeight.h,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: borderRadiusGeometry,
        ),
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: WasphaColors.white),
        ).center(),
      ),
    );
  }
}
