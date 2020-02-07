import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:tuktuk/UI/colors.dart';
import 'package:tuktuk/UI/confirmBook.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:polyline/polyline.dart' as p;

const apiKey =
    "pk.eyJ1IjoicmFiaW1zb2Z0IiwiYSI6ImNrNjd6b25uNDFtZmUzbHFwZ3JjdjB1YmwifQ.q8ZXamZA-CXWTEPe6S94RQ";

class MapRoute extends StatefulWidget {
  final String currentLocation;
  final String destinationLocation;
  MapRoute({this.currentLocation, this.destinationLocation});

  @override
  _MapRouteState createState() => _MapRouteState();
}

class _MapRouteState extends State<MapRoute> {
  MapBoxStaticImage staticImage = MapBoxStaticImage(apiKey: apiKey);
  Map<String, double> currentLocation = {'lati': 26.798136, 'long': 87.291393};
  Map<String, double> destinationLocation = {
    'lati': 26.798136,
    'long': 87.291393
  };

  p.Polyline polyline;
  List<List<double>> coordinates = [
    [26.798136, 87.291393],
    [26.798136, 87.291393]
  ];
  int precision = 5;
  List points;

  // Encode a list of coordinates with precision 5 to produce the encoded string
  getPoints() {
    polyline =
        p.Polyline.Encode(decodedCoords: coordinates, precision: precision);
    print(
        'Encoded String: ${polyline.encodedString}, Coords: ${polyline.decodedCoords}');
        points=_decodePoly(polyline.encodedString);
        print('points = $points');
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
// repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

/*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  @override
  void initState() {
    super.initState();
    getPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pYellow,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  // color: sGreen,
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(26.798136, 87.291393),
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://api.mapbox.com/styles/v1/rabimsoft/ck691wwi709ax1imrhmsii9cu/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmFiaW1zb2Z0IiwiYSI6ImNrNjd6b25uNDFtZmUzbHFwZ3JjdjB1YmwifQ.q8ZXamZA-CXWTEPe6S94RQ",
                          additionalOptions: {
                            'accessToken':
                                'pk.eyJ1IjoicmFiaW1zb2Z0IiwiYSI6ImNrNjd6b25uNDFtZmUzbHFwZ3JjdjB1YmwifQ.q8ZXamZA-CXWTEPe6S94RQ',
                            'id': 'mapbox.mapbox-streets-v8'
                          }),
                      PolylineLayerOptions(polylines: [
                        Polyline(
                            color: Colors.red,
                            strokeWidth: 2,
                            borderColor: Colors.black,
                            points: [
                              LatLng(26.798136, 87.291393),
                              LatLng(26.735498, 87.2107028),
                            ])
                      ])
                    ],
                  )
                  // Image.network("https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-s-a+9ed4bd(${currentLocation['lati']},${currentLocation['long']}),pin-s-b+000(${destinationLocation['lati']},${destinationLocation['long']}),path-5+f44-0.5(%7DrpeFxbnjVsFwdAvr@cHgFor@jEmAlFmEMwM_FuItCkOi@wc@bg@wBSgM)/auto/500x300?access_token=$apiKey")
                  //  Center(
                  //     child: Text(
                  //   'Map Route Is Coming\n\t\t\t\t\t\t\t\t\tStay Tuned \n Your Location:${widget.currentLocation}, & ${widget.destinationLocation}',
                  //   style: TextStyle(
                  //       fontSize: 30, fontWeight: FontWeight.bold, color: sWhite),
                  // )),
                  ),
              Expanded(
                child: Card(
                    color: pBlack,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        side: BorderSide(
                          width: 2,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                              child: Text(
                            'Nearest Riders',
                            style: TextStyle(
                                color: sWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          )),
                          Divider(
                            color: sWhite,
                            thickness: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, bottom: 10),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          maxRadius: 30,
                                          backgroundColor: pYellow,
                                          backgroundImage:
                                              AssetImage('images/robert.jpg'),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Driver Name',
                                          style: TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 0.5,
                                              color: sWhite),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: sWhite,
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Selected Rider:',
                                    style: TextStyle(
                                        color: sWhite,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Driver 1',
                                    style: TextStyle(
                                        color: sWhite,
                                        fontSize: 18,
                                        letterSpacing: 1),
                                  )
                                ],
                              ),
                              RaisedButton(
                                color: sGreen,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ConfirmPage()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Submit ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: pBlack),
                                    ),
                                    Icon(
                                      Icons.send,
                                      color: pYellow,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))
                        ],
                      ),
                    )),
              ),
            ],
          ),
          Positioned(
            top: 30,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: sWhite,
              ),
            ),
          ),
          //mapwithroute()
        ],
      ),
    );
  }
}
