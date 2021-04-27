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
  String username,needed;
  int sugarstrength;
  String _chosenValue;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool _isLoggedIn = true;
  final CollectionReference brewcollection1 = FirebaseFirestore.instance.collection("brews");

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
            IconButton(
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
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: (builder) => bottompart());
                },
                icon: Icon(
                  Icons.settings,
                  size: 30,
                )),
            SizedBox(width: 10,)
          ],
        ),
        body: BrewList(),
      ),
    );
  }

  Widget bottompart() {
    return SingleChildScrollView(
      child: Container(
        height: 350,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(60,100,60,0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Do You Need Sugar ??',
                      labelStyle: TextStyle(
                          fontSize:19,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),),
                    style: TextStyle(fontSize: 19),
                    onChanged: (text){
                      needed=text;
                    },
                  ),
                ),
                DropdownButton<String>(
                  focusColor:Colors.white,
                  value: _chosenValue,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor:Colors.black,
                  items: <String>[
                    '1', '2', '3', '4', '5', '6', '7', '8', '9','10'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:TextStyle(color:Colors.black),),
                    );
                  }).toList(),
                  hint:Text(
                    "Choose the strength of Sugar",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _chosenValue = value;
                      sugarstrength = int.parse(value);
                    });
                  },
                ),
                RaisedButton(onPressed: (){
                  brewcollection1.doc(username).set({
                    "sugar":"chinhi",
                    "name":username,
                    "strength":sugarstrength
                  });
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
