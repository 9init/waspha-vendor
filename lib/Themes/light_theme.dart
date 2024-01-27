import 'package:flutter/material.dart';
import 'package:vendor/Themes/index.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

ThemeData lightThemeData() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: WasphaColors.whiteColor,
    textTheme: CustomTextTheme.textTheme(),
    dialogBackgroundColor: WasphaColors.whiteColor,
  );
}
