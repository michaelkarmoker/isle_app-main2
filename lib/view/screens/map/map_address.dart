import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
 late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Sample'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
               height: 500,
               // color: Colors.red,
               child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749, -122.4194), // Initial map center coordinates (San Francisco)
                  zoom: 12.0, // Initial zoom level
                ),
            ),
             ),
          ],
        ),
      ),
    );
  }
}
