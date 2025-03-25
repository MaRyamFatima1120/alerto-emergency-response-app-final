import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/utils/global_variable.dart';

class WaitingForRescuerPage extends StatefulWidget {
  const WaitingForRescuerPage({super.key});

  @override
  State<WaitingForRescuerPage> createState() => _WaitingForRescuerPageState();
}

class _WaitingForRescuerPageState extends State<WaitingForRescuerPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

   List<Marker> _markers =<Marker>[];


  Future<void> loadLocation() async {
    Position position = await getUserCurrentLocation();

    setState(() {
      _markers = [

        Marker(
          markerId: const MarkerId('2'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: const InfoWindow(title: "User"),
        ),
      ];
    });

    CameraPosition cameraPosition = CameraPosition(
      zoom: 14,
      target: LatLng(position.latitude, position.longitude),
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
  Future<Position> getUserCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled.");
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

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLocation();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: _markers.toSet(),


            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              color: Colors.white,
              width:double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Your request will be sent to the nearest rescuer.",
                    textAlign: TextAlign.center,
                    style: textTheme(context)
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                ],
              ),
            ),
          ),
       ]
      ),
      
    );
  }
}

// Circular Countdown Progress

// Circular Countdown Progress
/*  SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: countdown / 30, // Updates progress dynamically
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                    backgroundColor: Colors.grey[300],
                  ),
                  Center(
                    child: Text(
                      "$countdown sec",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),*/
/*  body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [



            Text("""Your request will be sent to
the nearest rescuer.""",
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500)),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),*/
