import 'package:flutter/material.dart';

class EmergencyRequestProvider extends ChangeNotifier {
  String? _selectedEmergency;
  String? _selectedEmergencyIcon;

  String? get selectedEmergency => _selectedEmergency;
  String? get selectedEmergencyIcon => _selectedEmergencyIcon;

  void selectEmergency(String emergency,String icon) {
    _selectedEmergency = emergency;
    _selectedEmergencyIcon =icon;
    notifyListeners();
  }
}
