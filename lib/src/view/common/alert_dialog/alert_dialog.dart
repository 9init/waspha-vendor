import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor/core/constans/dimension/dimensions.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/waspha_button/waspha_button.dart';

class InterActiveAlertDialog extends StatelessWidget {
  const InterActiveAlertDialog(
      {Key? key,
      this.isUpdateOrAddNewDriver = true,
      required this.driverData,
      this.confirmationClick})
      : super(key: key);
  final bool isUpdateOrAddNewDriver;
  final Widget driverData;
  final VoidCallback? confirmationClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: Container(
        height: 300.h,
        width: 348.w,
        child: Column(
          children: [
            Text(
              isUpdateOrAddNewDriver
                  ? context.localization.update_confirmation_title
                  : context.localization.delete_confirmation_title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: AppDimensions.textSizeTitle,
                    fontWeight: AppDimensions.bold,
                  ),
            ),
            Gap(10.h),
            Text(
              isUpdateOrAddNewDriver
                  ? context.localization.update_confirmation_message
                  : context.localization.delete_confirmation_message,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Gap(10.h),
            driverData,
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WasphaButton(
                    onButtonTapped: () => context.pop(),
                    buttonHeight: 63,
                    buttonWidth: 75,
                    buttonColor: WasphaColors.redColor,
                    borderRadiusGeometry: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r),
                    ),
                    buttonText: context.localization.no),
                WasphaButton(
                    onButtonTapped: confirmationClick,
                    buttonHeight: 63,
                    buttonWidth: 150,
                    buttonColor: WasphaColors.primary,
                    borderRadiusGeometry: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                    buttonText: context.localization.yes),
              ],
            )
          ],
        ),
      ),
    );
  }
}
