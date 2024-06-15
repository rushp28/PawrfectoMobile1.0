import 'package:flutter/material.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

class TOutlinedButtonTheme {
  // Private Constructor
  TOutlinedButtonTheme._();

  // Light Outlined Button Theme
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.darkBackground,
      side: const BorderSide(color: TColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: TColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );

  // Dark Outlined Button Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: TColors.lightBackground,
      side: const BorderSide(color: TColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: TColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}