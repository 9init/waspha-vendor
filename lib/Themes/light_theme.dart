import 'package:flutter/material.dart';
import 'package:vendor/Themes/index.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

ThemeData lightThemeData() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (BuildContext context) => Icon(
        Icons.arrow_back_ios,
      ),
    ),
    //Setting the Brightness to light  so that this can be used as Light ThemeData
    textTheme: CustomTextTheme.textTheme(),
    dialogBackgroundColor: WasphaColors.whiteColor,
  );
}
