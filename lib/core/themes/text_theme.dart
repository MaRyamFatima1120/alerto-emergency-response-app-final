import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme.dart';

class AppTextTheme {
  static final TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
        textStyle: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: onSurface)),
    headlineMedium: GoogleFonts.inter(
        textStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: onSurface)),
    titleLarge: GoogleFonts.inter(
        textStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: onSurface)),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: onSurface, // Medium Gray for body text
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: onSurface,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: onPrimary, // White text for buttons
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: error, // White text for buttons
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: onSurface, // White text for buttons
    ),
  );

  static final TextTheme darkTextTheme = TextTheme(
      headlineLarge: GoogleFonts.inter(
          textStyle: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: darkOnSurface)),
      headlineMedium: GoogleFonts.inter(
          textStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: darkOnSurface)),
      titleLarge: GoogleFonts.inter(
          textStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: darkOnSurface)),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: darkOnSurface, // Medium Gray for body text
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: darkOnSurface,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: darkOnPrimary, // White text for buttons
      ));
}
