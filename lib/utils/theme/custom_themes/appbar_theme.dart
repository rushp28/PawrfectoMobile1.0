import 'package:flutter/material.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

class TAppBarTheme{
  // Private Constructor
  TAppBarTheme._();

  // Light App Bar Theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.black, size: TSizes.iconMD),
    actionsIconTheme: IconThemeData(color: TColors.black, size: TSizes.iconMD),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.black),
  );

  // Dark App Bar Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.black, size: TSizes.iconMD),
    actionsIconTheme: IconThemeData(color: TColors.white, size: TSizes.iconMD),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.white),
  );
}