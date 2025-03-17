import 'package:flutter/material.dart';

// Light Theme Colors
const Color primary = Color(0xff1976D2);
const Color onPrimary = Color(0xffFFFFFF);
const Color secondary=Color(0xff0474ED);
const Color onSecondary = Color(0xffFFFFFF);
const Color surface = Color(0xffFAFAFA);
const Color onSurface= Color(0xff424242);
const Color background = Color(0xFFF5F5F5);
const Color onBackground = Color(0xFF666666);
const Color error = Color(0xFFD32F2F);
const Color onError = Colors.white;

//  Light Mode Color Scheme
ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    error: error,
    onError: onError,
    surface: surface,
    onSurface: onSurface,

);

// Dark Theme Colors

const Color darkPrimary = Color(0xff1976D2);
const Color darkOnPrimary = Color(0xffFFFFFF);
const Color darkSecondary=Color(0xff0474ED);
const Color darkOnSecondary = Color(0xff000000);
const Color darkSurface = Color(0xFF1d1d1d);
const Color darkOnSurface= Color(0xffFFFFFF);
const Color darkError = Color(0xFFD32F2F);
const Color darkOnError = Colors.white;
const Color darkBackground = Color(0xFF121212);
const Color darkOnBackground = Colors.white; // Text on Background

// Dark Mode Color Scheme
ColorScheme darkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: darkPrimary,
  onPrimary: darkOnPrimary,
  secondary: darkSecondary,
  onSecondary: darkOnSecondary,
  error: darkError,
  onError: darkOnError,
  surface: darkSurface,
  onSurface: darkOnError,
);
