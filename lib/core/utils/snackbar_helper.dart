import 'package:alerto_emergency_response_app/core/utils/global_variable.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    IconData? icon,
    Color? bgColor,
    Color? textColor,
    Duration duration = const Duration(seconds: 3),
  }) {

    // Ensure the context is valid before showing the SnackBar
    if (!context.mounted) return;
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            icon ?? Icons.error_outline, // Default icon
            color: textColor ?? Colors.white,
            size: 35.0,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: textColor ?? colorScheme(context).surface,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      backgroundColor: bgColor ?? colorScheme(context).error,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
