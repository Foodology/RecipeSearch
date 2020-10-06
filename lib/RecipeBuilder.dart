import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Container(
      child: StreamBuilder(
          stream: Firestore.instance.collection('recipes').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data.documents.map((document) {
                return Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(document.documentID + " : " + document.data['ingredients'].toString(), style: TextStyle(fontSize: 15),),
                    ),
                  ),
                );
              }).toList(),
            );
          }
      ),
    );
  }
}
