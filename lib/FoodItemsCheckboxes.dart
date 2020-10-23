import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodItemsCheckboxes extends StatefulWidget {

  final Map<String, bool> itemsMap;
  final String user;
  FoodItemsCheckboxes({this.itemsMap, this.user});

  @override
  _FoodItemsCheckboxesState createState() => _FoodItemsCheckboxesState();
}

class _FoodItemsCheckboxesState extends State<FoodItemsCheckboxes> {

  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (var v in this.widget.itemsMap.keys)
            Row(
              children: [
                Checkbox(
                  onChanged: (bool value) {
                    setState(() {
                      this.widget.itemsMap[v] = value;
                    });
                  },
                  value: this.widget.itemsMap[v],
                ),
                Text(
                  v,
                ),
              ],
            ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['1', '2', '3', '4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          RaisedButton(
            onPressed: () {
              List<String> search = [];
              for (var v in this.widget.itemsMap.keys){
                if (this.widget.itemsMap[v] == true) {
                  search.add(v);
                }
              }
              Firestore.instance
                  .collection('users')
                  .document(this.widget.user)
                  .updateData({
                    'searchRecipe': search,
                    'numberOfNeighbors': int.parse(dropdownValue)
              }).then((value) => Firestore.instance
                  .collection('users')
                  .document(this.widget.user).updateData({
                'start': true
              }));
            },
            child: const Text('Search', style: TextStyle(fontSize: 20)),
          ),
          RaisedButton(onPressed: () {
            Firestore.instance.collection('users')
                .document(this.widget.user)
                .setData({
              'start': false
            });
          },
            child: const Text('Clean', style: TextStyle(fontSize: 20)),)
        ],
      ),
    );
  }
}