import 'package:brewcoffee/Screens/BrewList.dart';
import 'package:brewcoffee/model/brewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database{

  final CollectionReference brewcollection = FirebaseFirestore.instance.collection("brews");
  String user;
  Database(String s){
    user=s;
  }


  Future updateuserdata(String sugar,String name,int strength) async{
    return await brewcollection.doc(user).set({
      "sugar":sugar,
      "name":name,
      "strength":strength
    });
  }

  List<brewmodel> listfromsnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return brewmodel(
        name: doc.data()["name"],
        strength: doc.data()["strength"],
        sugar: doc.data()["sugar"]
      );
    }).toList();
  }

  Stream<List<brewmodel>> get brews{
    return brewcollection.snapshots().map(listfromsnapshot);
  }
}