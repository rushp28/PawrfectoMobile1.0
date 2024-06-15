import 'package:flutter/material.dart';
import 'package:pawrfecto/utils/constants/colors.dart';

class TTextTheme {
  // Private Constructor
  TTextTheme._();

  // Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.darkBackground),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.darkBackground),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.darkBackground),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.darkBackground),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.darkBackground),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.darkBackground),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.darkBackground),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.darkBackground),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.darkBackground.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.darkBackground),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.darkBackground.withOpacity(0.5)),
  );

  /// Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.lightBackground),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.lightBackground),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.lightBackground),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.lightBackground),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.lightBackground),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.lightBackground),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.lightBackground),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.lightBackground),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.lightBackground.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.lightBackground),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.lightBackground.withOpacity(0.5)),
  );
}