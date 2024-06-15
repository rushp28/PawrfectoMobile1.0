import 'package:flutter/material.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

class TElevatedButtonTheme {
  // Private Constructor
  TElevatedButtonTheme._();

  // Light Elevated Button Theme
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.lightBackground,
      backgroundColor: TColors.primary,
      disabledForegroundColor: TColors.darkerGrey,
      disabledBackgroundColor: TColors.buttonDisabled,
      side: const BorderSide(color: TColors.primary),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: TColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );

  // Dark Elevated Button Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.lightBackground,
      backgroundColor: TColors.primary,
      disabledForegroundColor: TColors.darkerGrey,
      disabledBackgroundColor: TColors.darkerGrey,
      side: const BorderSide(color: TColors.primary),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: TColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}