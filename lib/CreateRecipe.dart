import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateRecipe extends StatefulWidget {
  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {

  String name;
  List<String> ingredients = [];

  List<Widget> list = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create Recipe'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Widget widget = list.elementAt(index);
                    return widget;
                  },
                  itemCount: list.length,
                ),
              ),
            ),
          ),
          RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()){
                  Firestore.instance
                      .collection('recipes')
                      .document(name)
                      .setData({
                    'ingredients': ingredients
                  }).then((value) {
                    Navigator.pop(context);
                  });
                }
              },
              child: Text('Submit', style: TextStyle(fontSize: 20)))
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          if(list.length == 0){
            list.add(new TextFormField(
                decoration: InputDecoration(hintText: 'Recipe name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  name = value;
                  return null;
                }));
          } else {
            list.add(new TextFormField(
              decoration:
              InputDecoration(hintText: 'Ingredient ${list.length}'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                ingredients.add(value);
                return null;
              },
            ));
          }
          setState(() {});
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}
