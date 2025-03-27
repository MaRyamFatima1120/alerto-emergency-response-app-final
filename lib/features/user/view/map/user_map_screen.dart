import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMapPage extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String emergencyType;
  final String phone;
  final String notes;

  const UserMapPage({super.key,  required this.latitude, required this.longitude, required this.emergencyType, required this.phone, required this.notes, });

  @override
  State<UserMapPage> createState() => _UserMapPageState();
}

class _UserMapPageState extends State<UserMapPage> {
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:  Column(
       children: [
         Expanded(
           child: GoogleMap(
             initialCameraPosition: CameraPosition(
               target: LatLng(widget.latitude, widget.longitude),
               zoom: 16,

             ),
             myLocationEnabled: true,
             onMapCreated: (GoogleMapController controller) {
               mapController = controller;
             },
             markers: {
               Marker(
                 markerId: MarkerId("user_location"),
                 position: LatLng(widget.latitude, widget.longitude),
                 infoWindow: InfoWindow(
                   title: widget.phone,
                   snippet: "${widget.notes}\nEmergency: ${widget.emergencyType}",
                 ),
               ),
             },
           ),
         ),
         Padding(
           padding: EdgeInsets.all(16),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text("User: ${widget.phone}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
               Text("Description: ${widget.notes}"),
               Text("Emergency Type: ${widget.emergencyType}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
             ],
           ),
         ),
       ],
     ),
   );
  }
}
