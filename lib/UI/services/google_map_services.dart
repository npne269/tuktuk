// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// const myApi = 'AIzaSyCPgFCxosQy-mrdFo-faYbCPVsODHZjQ1I';

// class MapService {
//   Future<String> getRoute(LatLng source,LatLng desti) async{
//     String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${source.latitude},${source.longitude}&destination=${desti.latitude},${desti.longitude}&key=$myApi";
//     http.Response response = await http.get(url);
//     if (response.statusCode == 200 )
//     {
//     Map values = jsonDecode(response.body);
//     print(values['routes']);
    
//      print(values['error_message']);
//     // return values['routes'][0]['overview_polyline']['points'];/
//     }
//     else{
//       print('failed');
//       return null;
//     }
//   }
// }