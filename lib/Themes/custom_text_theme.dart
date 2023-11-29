import 'package:flutter/material.dart';
import 'package:vendor/core/constans/index.dart';
import 'package:vendor/core/gen/fonts.gen.dart';
// Custom Text Styles Class For Both Dark Isa  and Light Theme Now :)

class CustomTextTheme {
  static TextTheme textTheme() {
    const FontWeight medium = FontWeight.w600;
    const FontWeight regular = FontWeight.w400;
    const FontWeight normal = FontWeight.w500;
    const FontWeight normalBold = FontWeight.w700;
    const FontWeight bold = FontWeight.w800;
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: ColorConstants.blackColor,
        fontWeight: medium,
        fontFamily: MyFontFamily.openSans,
      ),
      titleMedium: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: ColorConstants.blackColor,
        fontWeight: normal,
        fontFamily: MyFontFamily.openSans,
      ),
      titleSmall: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: ColorConstants.blackColor,
        fontWeight: regular,
        fontFamily: MyFontFamily.openSans,
      ),
      displayLarge: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: ColorConstants.blackColor,
        fontWeight: bold,
        fontFamily: MyFontFamily.openSans,
      ),
      displayMedium: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: ColorConstants.blackColor,
        fontWeight: normal,
        fontFamily: MyFontFamily.openSans,
      ),
      displaySmall: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        fontWeight: normal,
        fontFamily: MyFontFamily.openSans,
      ),
      labelSmall: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        fontWeight: regular,
        fontFamily: MyFontFamily.openSans,
      ),
      headlineMedium: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: ColorConstants.blackColor,
        fontWeight: normalBold,
        fontFamily: MyFontFamily.openSans,
      ),
      headlineSmall: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: ColorConstants.whiteColor,
        fontWeight: medium,
        fontFamily: MyFontFamily.openSans,
      ),
      headlineLarge: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: ColorConstants.blackColor,
        fontWeight: medium,
        fontFamily: MyFontFamily.openSans,
      ),
    );
  }
}
