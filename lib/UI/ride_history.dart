import 'package:flutter/material.dart';

class RideHistory extends StatefulWidget {
  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {

  final List<List<Map<String,String>>> data = [
                      [{'from':'Biratnagar','place':'Chatta Chowk'},{'to':'Dhulari','place':'Picnic'},{'id':'123456','time':'5.15 PM'}],
                      [{'from':'Koteswor','place':'Office'},{'to':'Kalanki','place':'flat'},{'id':'148756','time':'10.08 AM'}],
                      [{'from':'Dharan','place':'College'},{'to':'Damak','place':'home'},{'id':'598721','time':'3.30 PM'}],
                    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(150, 30),
                  bottomRight: Radius.elliptical(150, 30)),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50, left: 30, bottom: 50),
                  child: Row(
                    children: <Widget>[
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.white,
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, color: Colors.green),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Ride History',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return historyList(index,data);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget historyList(i,data) {
  return Card(
    elevation: 8,
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
          ),
          subtitle: Text(data[i][0]['place'],style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25
          ),),
          title: Text('From - ${data[i][0]['from']}',style: TextStyle(
            fontSize: 18,
            color: Colors.black26
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70,right: 20),
          child: Divider(),
        ),
        ListTile(
          leading: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
          ),
          subtitle: Text(data[i][1]['place'],style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25
          ),),
          title: Text('To - ${data[i][1]['to']}',style: TextStyle(
            fontSize: 18,
            color: Colors.black26
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Divider(),
        ),
        ListTile(leading:Text('ID: ${data[i][2]['id']}',style: TextStyle(
            // fontSize: 18,
            color: Colors.black26
          ),),trailing: Text('Time: ${data[i][2]['time']}',style: TextStyle(
            // fontSize: 18,
            color: Colors.black26
          ),),)
      ],
    ),
  );
}
