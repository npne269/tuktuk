import 'package:flutter/material.dart';
import 'package:tuktuk/UI/colors.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pYellow,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                // color: sGreen,
                child: Center(
                    child: Text(
                  'Confirm Route Is Coming\n\t\t\t\t\t\t\t\t\tStay Tuned',
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: sWhite),
                )),
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
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Thank You For Choosing Us.',
                            style: TextStyle(
                                color: sWhite, fontSize: 20, letterSpacing: 3),
                          ),
                          Text(
                            'Your ride will pick you soon.',
                            style: TextStyle(
                                color: sWhite,
                                fontSize: 18,
                                letterSpacing: 0.5),
                          ),
                          Divider(
                            color: pYellow,
                            thickness: 0.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/robert.jpg'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Driver Name',
                                        style: TextStyle(
                                            color: sWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'License: 12345',
                                        style: TextStyle(
                                          color: sWhite,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: sGreen,
                                      ),
                                      SizedBox(width: 5),
                                      Text('Your Location',
                                          style: TextStyle(
                                              color: sWhite, fontSize: 18)),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.directions_bike,
                                        color: pYellow,
                                      ),
                                      SizedBox(width: 5),
                                      Text('Destination',
                                          style: TextStyle(
                                              color: sWhite, fontSize: 18)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            color: pYellow,
                            thickness: 0.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Distance: 15 km',
                                  style:
                                      TextStyle(color: sWhite, fontSize: 18)),
                              Text('Price: Rs.450',
                                  style:
                                      TextStyle(color: sWhite, fontSize: 18)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Rate /KM :Rs 30',
                                  style:
                                      TextStyle(color: sWhite, fontSize: 18)),
                            ],
                          )
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
