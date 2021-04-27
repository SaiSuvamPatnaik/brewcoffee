import 'package:brewcoffee/Screens/BrewList.dart';
import 'package:brewcoffee/model/brewmodel.dart';
import 'package:flutter/material.dart';

class brewtile extends StatelessWidget {
  final brewmodel brew;
  brewtile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.brown[(brew.strength + 20)],
            ),
            title: Text(brew.name,style: TextStyle(fontSize: 17),),
          ),
        ),
      ),
    );
  }
}
