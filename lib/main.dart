import 'package:brewcoffee/Screens/Splash.dart';
import 'package:brewcoffee/Screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
      home: MyApp()));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DatabaseReference ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Splash(),
    );
  }
}
