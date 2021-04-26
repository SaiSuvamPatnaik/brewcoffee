import 'package:brewcoffee/Screens/BrewList.dart';
import 'package:brewcoffee/Screens/signin.dart';
import 'package:brewcoffee/model/brewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:brewcoffee/Services/Database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class homepage extends StatefulWidget {
  String username;
  homepage({this.username});
  @override
  _homepageState createState() => _homepageState(username: username);
}

class _homepageState extends State<homepage> {
  String username;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool _isLoggedIn = true;

  _homepageState({this.username});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<brewmodel>>.value(
      value: Database(username).brews,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              )),
          title: Text("Welcome To Brew Coffee"),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: IconButton(
                  onPressed: () {
                    _googleSignIn.signOut();
                    setState(() {
                      _isLoggedIn = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 30,
                  )),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}