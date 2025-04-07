import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MapStyle extends ChangeNotifier {
  String? _mapStyle;

  String? get mapStyle => _mapStyle;

  Future<void> loadMapStyle(Brightness brightness) async {
    final stylePath = brightness == Brightness.dark
        ? 'assets/mapStyle/light_theme.json'
        : 'assets/mapStyle/night_theme.json';
    _mapStyle = await rootBundle.loadString(stylePath);
    notifyListeners();
  }
}
