import 'package:flutter/material.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

class TTextFormFieldTheme {
  // Private Constructor
  TTextFormFieldTheme._();

  // Light Input Decoration Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkerGrey,
    suffixIconColor: TColors.darkerGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontMD, color: TColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSM, color: TColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: TColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkBackground),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.warning),
    ),
  );

  // Dark Input Decoration Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TColors.darkerGrey,
    suffixIconColor: TColors.darkerGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: TSizes.fontMD, color: TColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: TSizes.fontSM, color: TColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: TColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkerGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkerGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.warning),
    ),
  );
}