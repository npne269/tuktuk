import 'package:flutter/material.dart';
import 'package:tuktuk/UI/colors.dart';
import 'package:tuktuk/UI/locationSearch.dart';
import 'package:tuktuk/UI/map2.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _drawer = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      key: _drawer,
      body: Stack(children: [
        Container(
          height: double.infinity,
          color: Colors.white10,
          child: Map(),
        ),
        Positioned(
          top: 40,
          right: 20,
          left: 20,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        print('tapped');
                        _drawer.currentState.openDrawer();
                      },
                      child: Container(
                        height: 22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              color: pBlack,
                              height: 3,
                              width: 35,
                            ),
                            Container(
                              color: pBlack,
                              height: 3,
                              width: 20,
                            ),
                            Container(
                              color: pBlack,
                              height: 3,
                              width: 30,
                            )
                          ],
                        ),
                      ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: pYellow,
                    backgroundImage: AssetImage('images/robert.jpg'),
                  )
                ],
              ),
              SizedBox(height: 20),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchDestination()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: pBlack),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Let\'s Ride',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        )
                      ]),
                      Row(
                        children: <Widget>[
                          VerticalDivider(
                            indent: 5,
                            endIndent: 5,
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Icon(Icons.directions_bike)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
