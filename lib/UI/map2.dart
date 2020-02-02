import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController _controller;
  LatLng currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
            setState(() {
              _controller = controller;
            });
  }

  void _getCurrentLocation() async{
    Position location = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    currentPosition = LatLng(location.latitude,location.longitude);

    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(location.latitude, location.longitude);
    print(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition==null?Center(child:Text('Enable location')):GoogleMap(
        // markers: _markers,
        onMapCreated: _onMapCreated,
                initialCameraPosition:CameraPosition(
                  target: currentPosition,
                  zoom: 14,
                  )
                ),
            );
          }
        
          
}