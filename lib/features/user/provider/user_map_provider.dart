import 'package:alerto_emergency_response_app/core/constants/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class UserMapProvider extends ChangeNotifier{
  BitmapDescriptor? _userMarker;

  BitmapDescriptor? get userMarker => _userMarker;

  Future<void> loadUserMarker() async{
    _userMarker=await BitmapDescriptor.asset(ImageConfiguration(
      size: Size(20, 20)
    ), AppImage.userMarker);
    notifyListeners();
  }
}