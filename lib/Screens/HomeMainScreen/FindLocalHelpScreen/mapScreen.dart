

import 'package:b_safe/GlobalController/GlobalController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  String? name;
  LatLng? destinantion;
  LatLng? currentPosition;
   MapScreen({super.key,this.name,this.destinantion,this.currentPosition});
  // static const LatLng _initialPosition = LatLng(37.4223, -122.0848);
  Polyline createLine(){
    PolylineId id = PolylineId('route');
    List<LatLng> points = [
      currentPosition!, // Starting point
      destinantion!, // Ending point
    ];
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      width: 5,
      points: points,
    );
    return polyline;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.chevron_left)),
      ),
      body: SafeArea(
        child: GetBuilder<GlobalController>(
            builder: (__) {
              return GoogleMap(
                // polylines: {createLine()},
                myLocationEnabled:true,
                onMapCreated: (controller)=> __.mapController.complete(controller),
                initialCameraPosition: CameraPosition(target: destinantion!, zoom: 13),
                markers: {
                  Marker(
                      markerId: MarkerId('My Posotion'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(320),
                      position: destinantion!
                  ),
                },
              );
            }
        ),
      ),
    );
  }
}
