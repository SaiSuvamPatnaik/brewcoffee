import 'dart:async';

import 'package:brewcoffee/Screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),()=>
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignIn())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Center(child: Text("WELCOME",style: TextStyle(fontSize: 50),)),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,80,0,0),
                child: Center(child: const SpinKitWave(color: Colors.black, type: SpinKitWaveType.start)),
              ),
            ],
          )


        ],
      ),
    );
  }
}

