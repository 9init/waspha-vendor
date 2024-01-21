import 'package:flutter/material.dart';
import 'package:vendor/core/constans/index.dart';
import 'package:vendor/core/gen/fonts.gen.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

// Custom Text Styles Class For Both Dark Isa  and Light Theme Now :)
////100	extralight/ultralight
// 200	light/thin
// 300	book/demi/light
// 400	regular/normal
// 500	medium
// 600	semibold/demibold
// 700	bold
// 800	black/extrabold/heavy
// 900	extrablack/fat/poster/ultrablack/heavy
class CustomTextTheme {
  static TextTheme textTheme() {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: WasphaColors.blackColor,
        fontWeight: AppDimensions.bold,
        fontFamily: MyFontFamily.openSans,
      ),
      titleMedium: TextStyle(
        fontSize: AppDimensions.textSizeMedium,
        color: WasphaColors.darkBlackColor,
        fontWeight: AppDimensions.regular,
        fontFamily: MyFontFamily.openSans,
      ),
      titleSmall: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: WasphaColors.blackColor,
        fontWeight: AppDimensions.regular,
        fontFamily: MyFontFamily.openSans,
      ),
      displayMedium: TextStyle(
        fontSize: AppDimensions.textSizeTitle,
        color: WasphaColors.blackColor,
        fontWeight: AppDimensions.bold,
        fontFamily: MyFontFamily.openSans,
      ),
      displaySmall: TextStyle(
        fontSize: AppDimensions.textSizeSmall,
        fontWeight: AppDimensions.regular,
        fontFamily: MyFontFamily.openSans,
        color: WasphaColors.lightBlackColor,
      ),
      labelSmall: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        fontWeight: AppDimensions.regular,
        fontFamily: MyFontFamily.openSans,
        color: WasphaColors.lightBlackColor,
      ),
      labelLarge: TextStyle(
          fontSize: AppDimensions.textSizeLarge,
          fontWeight: AppDimensions.semiBold,
          fontFamily: MyFontFamily.openSans,
          color: WasphaColors.lightBlackColor),
      labelMedium: TextStyle(
          fontSize: AppDimensions.textSizeMedium,
          fontWeight: AppDimensions.semiBold,
          fontFamily: MyFontFamily.openSans,
          color: WasphaColors.lightBlackColor),
      headlineLarge: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: WasphaColors.blackColor,
        fontWeight: AppDimensions.medium,
        fontFamily: MyFontFamily.openSans,
      ),
      headlineMedium: TextStyle(
        fontSize: AppDimensions.textSizeMedium,
        color: WasphaColors.darkBlackColor,
        fontWeight: AppDimensions.bold,
        fontFamily: MyFontFamily.openSans,
      ),
      headlineSmall: TextStyle(
        fontSize: AppDimensions.textSizeLarge,
        color: WasphaColors.whiteColor,
        fontWeight: AppDimensions.medium,
        fontFamily: MyFontFamily.openSans,
      ),
    );
  }
}
