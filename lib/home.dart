import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesearch/CreateRecipe.dart';
import 'package:recipesearch/FoodItemsCheckboxes.dart';
import 'package:recipesearch/Models/user.dart';
import 'package:recipesearch/RecipeBuilder.dart';
import 'package:recipesearch/RecommendedBuilder.dart';
import 'package:recipesearch/Services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String user;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User>(context);

    if (userProvider == null){
      return Scaffold(
        body: CircularProgressIndicator(),
      );
    }

    user = userProvider.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(user),
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
                    return FoodItemsCheckboxes(itemsMap: map,user: user,);
                  }
              ),
              RecommendedBuilder(user: user,),
              RaisedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateRecipe()),
                );
              },
                  child: Text('Create Recipe', style: TextStyle(fontSize: 20))
              ),
              RaisedButton(onPressed: () {
                AuthService().signOut();
              },
                child: Text('Logout', style: TextStyle(fontSize: 20))
              )
            ],
          ),
        ),
      ),
    );
  }
}
