import 'package:alerto_emergency_response_app/core/utils/global_variable.dart';
import 'package:alerto_emergency_response_app/features/user/provider/user_map_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class UserMapPage extends StatefulWidget {
  final String phone;

  const UserMapPage({
    super.key,
    required this.phone,
  });

  @override
  State<UserMapPage> createState() => _UserMapPageState();
}

class _UserMapPageState extends State<UserMapPage> {
  late GoogleMapController mapController;
  LatLng? userLocation;
  String? emergencyType, notes;
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    final userMarker = context.watch<UserMapProvider>().userMarker;
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: firestore
            .collection('emergency_requests')
            .doc(widget.phone)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Text("No Emergency Data Found",
                  style: textTheme(context).bodyMedium),
            );
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
              child: Text("No Emergency Data Found",
                  style: textTheme(context).bodyMedium),
            );
          }

          var data = snapshot.data!.data() as Map<String, dynamic>?;
          if (data == null || !data.containsKey("requests")) {
            return const Center(child: Text("No Emergency Requests"));
          }

          var requestMap = Map<String, dynamic>.from(data["requests"]);

          if (requestMap.isEmpty) {
            return const Center(child: Text("No Emergency Requests"));
          }

          // Sort requests by timestamp
          var sortedRequests = requestMap.entries.toList()
            ..sort((a, b) {
              var aTime =
                  (a.value['timestamp'] as Timestamp?)?.toDate() ?? DateTime(0);
              var bTime =
                  (b.value['timestamp'] as Timestamp?)?.toDate() ?? DateTime(0);
              return bTime.compareTo(aTime); // Latest first
            });

          var latestRequest = sortedRequests.first.value;
          double latitude = latestRequest["latitude"];
          double longitude = latestRequest["longitude"];
          emergencyType = latestRequest["emergencyType"];
          notes = latestRequest["notes"];
          userLocation = LatLng(latitude, longitude);

          return Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: userLocation!,
                    zoom: 16,
                  ),
                  //myLocationEnabled: true,
                  //  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  markers: {
                    if (userMarker != null)
                      Marker(
                        markerId: const MarkerId("user_location"),
                        position: userLocation!,
                        infoWindow: InfoWindow(
                          title: "Emergency: $emergencyType",
                          snippet: notes ?? "No additional details",
                        ),
                        icon: userMarker,
                      ),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("User: ${widget.phone}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Emergency Type: $emergencyType",
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                    Text("Notes: ${notes ?? "N/A"}"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
