import 'dart:async';

import 'package:flutter/material.dart';
import 'secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  void completed() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextpage()));
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), completed);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 23.5),
      child: Image.asset(
        "assets/images/img1.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
}
