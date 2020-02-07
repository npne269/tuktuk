import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final MapController _mapController = MapController();
  LatLng currentLocation;
  var locationPermission;
  Location _location = Location();

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    bool permission = await _location.serviceEnabled();
    print('Permission = $permission');
    if (permission)
    {
      LocationData currentlocation = await _location.getLocation();
      setState(() {
        currentLocation = LatLng(currentlocation.latitude,currentlocation.longitude);
        locationPermission = permission;
      });
      print('here comes');
      print(currentlocation.latitude);
      print(currentlocation.longitude);
    }else{
       bool result = await _location.requestService();
      (result)?_getLocation():print('Denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("My Location = $currentLocation");
    return (locationPermission == null)
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Loading'),
              SizedBox(height: 20),
              CircularProgressIndicator()
            ],
          ),
        )
        : FlutterMap(
            mapController: _mapController,
            options:
                new MapOptions(
                  center: currentLocation, zoom: 15, minZoom: 5.0),
            layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/rabimsoft/ck691wwi709ax1imrhmsii9cu/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmFiaW1zb2Z0IiwiYSI6ImNrNjd6b25uNDFtZmUzbHFwZ3JjdjB1YmwifQ.q8ZXamZA-CXWTEPe6S94RQ",
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoicmFiaW1zb2Z0IiwiYSI6ImNrNjd6b25uNDFtZmUzbHFwZ3JjdjB1YmwifQ.q8ZXamZA-CXWTEPe6S94RQ',
                      'id': 'mapbox.mapbox-streets-v8'
                    }),
                new MarkerLayerOptions(
                  markers: [
                  new Marker(
                      width: 45.0,
                      height: 45.0,
                      point: currentLocation,
                      builder: (context) => new Container(
                            child: IconButton(
                              icon: Icon(Icons.location_on),
                              tooltip: currentLocation.toString(),
                              color: Colors.blue,
                              iconSize: 45.0,
                              onPressed: () {
                                print('hello');
                              },
                            ),
                          )),
                ]),
               
              ],);
  }
}
