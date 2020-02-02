import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  GoogleMapController mapController;

  // final LatLng _center = const LatLng(28.3949, 84.1240);
  var currentLocation;
  bool showMap = false;

  final Map<String, Marker> _markers = {};
  
  void initState(){
    super.initState();
    Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value){
      setState((){
        currentLocation = value;
        showMap = true;
        _markers.clear();
        _markers['current'] = Marker(
        markerId: MarkerId('current'),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(
          title: 'current location',
        )
      );
      });
    });
  }

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      mapController = controller;
    });
  }

  void _onTap(LatLng latlng){
    setState(() {
      _markers['tapped'] = Marker(
        markerId: MarkerId('tapped'),
        position: latlng,
        infoWindow: InfoWindow(
          title: 'tapped location',
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gantabya'),
      ),
      body: showMap ? GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 11.0,
        ),
        markers: _markers.values.toSet(),
        onTap: _onTap,
        myLocationEnabled: true,
      ): Text(''),
    );
  }
}