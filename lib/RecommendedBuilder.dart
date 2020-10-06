import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecommendedBuilder extends StatefulWidget {
  @override
  _RecommendedBuilderState createState() => _RecommendedBuilderState();
}

class _RecommendedBuilderState extends State<RecommendedBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: Firestore.instance.collection('users')
              .document('user1')
              .snapshots(),
          builder: (context, AsyncSnapshot < DocumentSnapshot > snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading");
            }
            if (snapshot.data.data.keys.contains('recommended')){
              return AlertDialog(
                title: Text('recommended recipes'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      for (var v in List<String>.from(snapshot.data.data['recommended']))
                        Text(v)
                    ],
                  ),
                ),
              );
            }
            return Text('');
          }
      ),);
  }
}

