import 'package:brewcoffee/model/brewmodel.dart';
import 'package:brewcoffee/widget/brewtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final val = Provider.of<List<brewmodel>>(context);
    return ListView.builder(
      itemCount: val.length,
      itemBuilder: (context,index){
        return brewtile(brew:val[index]);
      },
    );
  }
}
