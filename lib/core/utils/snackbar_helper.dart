import 'package:alerto_emergency_response_app/core/utils/global_variable.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showAnimatedSnackBar(BuildContext context, String message, ) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final snackBar = SnackBar(
      content: Text(
        message,
        style:textTheme(context).bodyMedium
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: colorScheme(context).surface,
      width: double.infinity,

      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );

    scaffoldMessenger.showSnackBar(snackBar);
  }
}
