// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:tuktuk/UI/services/google_map_services.dart';

// class MyMap extends StatefulWidget {
//   @override
//   _MyMapState createState() => _MyMapState();
// }

// class _MyMapState extends State<MyMap> {
//   GoogleMapController mapController;
//   MapService _mapService = MapService();

//   // final LatLng _center = const LatLng(28.3949, 84.1240);
//   var currentLocation;
//   var destinationLocation;

//   TextEditingController currentLocationController = TextEditingController();
//   TextEditingController destinationLocationController = TextEditingController();
//   final Map<String, Marker> _markers = {};
//   bool showmap = false;

//   Set<Polyline> _polylines = {};

//   String googleApiKey = "AIzaSyCPgFCxosQy-mrdFo-faYbCPVsODHZjQ1I";

//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints = PolylinePoints();

//   void initState() {
//     super.initState();
//     Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((value) {
//       setState(() {
//         currentLocation = LatLng(value.latitude, value.longitude);
//         showmap = true;
//         _markers.clear();
//         _markers['current'] = Marker(
//             markerId: MarkerId('current'),
//             position:
//                 LatLng(currentLocation.latitude, currentLocation.longitude),
//             infoWindow: InfoWindow(
//               title: 'Your location',
//             ));
//       });
//     });
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;
//     });
//   }

//   void _onTap(LatLng latlng) {
//     setState(() {
//       destinationLocation = latlng;
//       _markers['tapped'] = Marker(
//           markerId: MarkerId('tapped'),
//           position: latlng,
//           infoWindow: InfoWindow(
//             title: 'Destination location',
//           ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SafeArea(
//           child: Stack(
//         children: <Widget>[
//           currentLocation != null
//               ? buildGoogleMap()
//               : Center(child: Text('Please Enable location!')),
//           buildLocationSearchContainer()
//         ],
//       )),
//     );
//   }

//   Container buildLocationSearchContainer() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(top: 40, bottom: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       'https://townsquare.media/site/442/files/2019/11/Tony-Stark.png?w=980&q=75'),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Good Morning, Dude',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Where are you going?',
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Card(
//             elevation: 8,
//             color: Colors.white,
//             // margin: EdgeInsets.symmetric(horizontal: 30),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             child: Container(
//               // padding: EdgeInsets.symmetric(horizontal:20),
//               child: ExpansionTile(
//                 title: Text(
//                   'Search for a destination',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 trailing: Icon(Icons.search),
//                 children: <Widget>[
//                   TextField(
//                     cursorColor: Colors.black,
//                     controller: currentLocationController,
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.location_on,color:Colors.black),
//                         hintText: 'Your place',
//                         border: InputBorder.none),
//                   ),
//                   Divider(),
//                   TextField(
//                     controller: destinationLocationController,
//                     textInputAction: TextInputAction.go,
//                     onSubmitted: (value) {
//                       sendRequest(value);
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.local_taxi,color: Colors.black,),
//                         hintText: 'Destination ',
//                         border: InputBorder.none),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   GoogleMap buildGoogleMap() {
//     return GoogleMap(
//       onMapCreated: _onMapCreated,
//       initialCameraPosition: CameraPosition(
//         target: LatLng(currentLocation.latitude, currentLocation.longitude),
//         zoom: 11.0,
//       ),
//       markers: _markers.values.toSet(),
//       polylines: _polylines,
//       onTap: _onTap,
//     );
//   }

//   void sendRequest(String value) async {
//     List<Placemark> placemark = await Geolocator().placemarkFromAddress(value);
//     double lat = placemark[0].position.latitude;
//     double long = placemark[0].position.longitude;
//     LatLng desti = LatLng(lat,long);
//     _onTap(desti);
//     String route = await _mapService.getRoute(currentLocation, destinationLocation);
//     print('route = $route');
//   }
// }
