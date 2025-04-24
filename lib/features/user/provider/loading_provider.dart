import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool _isSubmitting = false;

  bool get isSubmitting => _isSubmitting;

  void setSubmitting(bool value) {
    _isSubmitting = value;
    notifyListeners();
  }
}
