import 'package:flutter/material.dart';
import 'package:vendor/Themes/index.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

ThemeData lightThemeData() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    //Setting the Brightness to light  so that this can be used as Light ThemeData
    textTheme: CustomTextTheme.textTheme(),
    //Setting the Text Theme to LightTextTheme
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: WasphaColors.whiteColor,
      ),
    ),
    dialogBackgroundColor: WasphaColors.whiteColor,
  );
}
