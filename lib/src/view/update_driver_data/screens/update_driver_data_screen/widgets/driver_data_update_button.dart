import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/alert_dialog/alert_dialog.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/waspha_button/waspha_button.dart';

class DriverDataUpdateButton extends StatelessWidget {
  const DriverDataUpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WasphaButton(
            onButtonTapped: () => showAdaptiveDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => InterActiveAlertDialog(
                    driverData: Container(),
                    isUpdateOrAddNewDriver: false,
                  ),
                ),
            buttonHeight: 63,
            buttonWidth: 114,
            buttonColor: WasphaColors.redColor,
            borderRadiusGeometry: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
            ),
            buttonText: context.localization.delete),
        WasphaButton(
          onButtonTapped: () => showAdaptiveDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => InterActiveAlertDialog(
              driverData: Container(),
            ),
          ),
          buttonHeight: 63,
          buttonWidth: 233,
          buttonColor: WasphaColors.primary,
          borderRadiusGeometry: BorderRadius.only(
            topRight: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r),
          ),
          buttonText: context.localization.update_team_member,
        ),
      ],
    ).center();
  }
}
