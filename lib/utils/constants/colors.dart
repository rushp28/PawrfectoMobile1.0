import 'package:flutter/material.dart';

// Color Constants
class TColors{
  TColors._();

  // Basic App Colors
  static const Color primary = Color(0xFF00b743);
  static const Color secondary = Color(0xFF00c170);
  static const Color accent = Color(0xFF00beff);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFFff9a9e),
      Color(0xFFfad0c4),
      Color(0xFFfad0c4),
      ],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c7570);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color lightBackground = Color(0xFFf6f6f6);
  static const Color darkBackground = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFf3f5ff);

  // Container Colors
  static const Color lightContainer = Color(0xFFf6f6f6);
  static Color darkContainer = TColors.textWhite.withOpacity(0.1);

  // Button Colors
  static const buttonPrimary = Color(0xFF4b68ff);
  static const buttonSecondary = Color(0xFF6c7570);
  static const buttonDisabled = Color(0xFFc4c4c4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFd32f2f);
  static const Color success = Color(0xFF388e3c);
  static const Color warning = Color(0xFFf57c00);
  static const Color info = Color(0xFF197602);

  // Neutral Shade Colors
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4f4f4f);
  static const Color grey = Color(0xFFe0e0e0);
  static const Color softGrey = Color(0xFFf4f4f4);
  static const Color lightGrey = Color(0xFFf9f9f9);
  static const Color white = Color(0xFFffffff);
}