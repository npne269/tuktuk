import 'package:flutter/material.dart';
import 'package:tuktuk/UI/colors.dart';
import 'package:tuktuk/UI/mapRoute.dart';



class SearchDestination extends StatefulWidget {
  @override
  _SearchDestinationState createState() => _SearchDestinationState();
}

class _SearchDestinationState extends State<SearchDestination> {
  final List _address = ['Damak', 'Ithari', 'Dharan', 'Birtamod'];
  String current;
  String destination;

  final _currentLocationController = TextEditingController();
  final _destinationLocationController = TextEditingController();

  void _sendRequest() {
    setState(() {
      current = _currentLocationController.text;
      destination = _destinationLocationController.text;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapRoute(
          currentLocation: current,
          destinationLocation: destination,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _currentLocationController.dispose();
    _destinationLocationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              color: pBlack,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 80, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back, size: 30, color: sWhite),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: pYellow,
                              backgroundImage: AssetImage('images/robert.jpg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Nitesh Neupane',
                              style: TextStyle(color: sWhite, fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: sWhite,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            width: 5,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                    bottom: Radius.circular(20)),
                                color: sGrey),
                          ),
                          Icon(Icons.directions_bike, color: pYellow)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: sGrey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child:
                             TextField(
                              controller: _currentLocationController,
                              textAlign: TextAlign.left,
                              cursorColor: pBlack,
                              style: TextStyle(fontSize: 20, color: sWhite),
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.my_location,
                                    color: sWhite,
                                  ),
                                  hintText: 'Your current Location',
                                  hintStyle:
                                      TextStyle(fontSize: 20, color: sWhite),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: pYellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextField(
                              controller: _destinationLocationController,
                              onSubmitted: (value) {
                                _sendRequest();
                              },
                              textAlign: TextAlign.left,
                              cursorColor: sWhite,
                              style: TextStyle(fontSize: 20, color: pBlack),
                              decoration: InputDecoration(
                                  hintText: 'Destination',
                                  hintStyle:
                                      TextStyle(fontSize: 20, color: pBlack),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Divider(thickness: 1, indent: 20, endIndent: 20),
              ListTile(
                leading: Icon(
                  Icons.work,
                ),
                title: Text(
                  'Add Work',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Divider(thickness: 1, indent: 20, endIndent: 20),
            ],
          )),
          Expanded(
              flex: 2,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.history,
                          ),
                          title: Text(
                            _address[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Divider(thickness: 1, indent: 20, endIndent: 20),
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
