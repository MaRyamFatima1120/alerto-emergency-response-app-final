import 'package:flutter/material.dart';

class EmergencyRequestProvider extends ChangeNotifier {
  String? _selectedEmergency;

  String? get selectedEmergency => _selectedEmergency;

  void selectEmergency(String emergency) {
    _selectedEmergency = emergency;
    notifyListeners();
  }
}
