import 'package:flutter/material.dart';
import 'package:tuktuk/UI/colors.dart';
import 'package:tuktuk/UI/home_page.dart';
// import 'package:tuktuk/mapSearchTest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: pBlack,
        fontFamily: 'Raleway'
      ),
      home: MyHomePage(),
    );
  }
}
