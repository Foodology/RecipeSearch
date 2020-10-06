import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipesearch/FoodItemsCheckboxes.dart';
import 'package:recipesearch/RecipeBuilder.dart';
import 'package:recipesearch/RecommendedBuilder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Search',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recipe Search'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RecipeBuilder(),
                StreamBuilder(
                    stream: Firestore.instance.collection('all_items').document('all_ingredients').snapshots(),
                    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading");
                      }
                      var dlist = snapshot.data['all_ingredients'];
                      var list = List<String>.from(dlist);
                      var map = Map.fromIterable(list, key: (v) => v.toString(), value: (v) => false);
                      return FoodItemsCheckboxes(itemsMap: map,);
                    }
                ),
                RecommendedBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}