import 'dart:async';
import 'package:geolocator/geolocator.dart';


class LocationUtils {
  /// Get the user's current location
  static Future<Position> getUserCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error("Please enable location services.",);
      }
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permission is permanently denied. Please enable it in settings.");
    }

    // Return current location
    return await Geolocator.getCurrentPosition();
  }


}
