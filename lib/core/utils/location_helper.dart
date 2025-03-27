import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  /// Load and update the user's location on the map
  static Future<void> loadLocation(
      Completer<GoogleMapController> controller, Function(List<Marker>) updateMarkers) async {
    try {
      Position position = await getUserCurrentLocation();

      List<Marker> markers = [
        Marker(
          markerId: const MarkerId('user_location'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: const InfoWindow(title: "User"),
        ),
      ];

      updateMarkers(markers);

      CameraPosition cameraPosition = CameraPosition(
        zoom: 14,
        target: LatLng(position.latitude, position.longitude),
      );

      final GoogleMapController mapController = await controller.future;
      mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    } catch (e) {
      print("Error loading location: $e");
    }
  }
}
