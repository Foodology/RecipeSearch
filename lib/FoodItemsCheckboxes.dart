import 'package:flutter/material.dart';

class FoodItemsCheckboxes extends StatefulWidget {
  @override
  _FoodItemsCheckboxesState createState() => _FoodItemsCheckboxesState();
}

class _FoodItemsCheckboxesState extends State<FoodItemsCheckboxes> {

  Map<String, bool> itemsMap = {
    "Salmon" : false,
    "Hot Sauce" : false,
    "Bell Pepper" : false,
    "Pepper" : false,
    "Salt" : false,
    "Beef" : false,
    "Shrimp" : false,
    "Chicken" : false,
    "Lemon Pepper" : false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            for (var v in itemsMap.keys)
              Row(
                children: [
                  Checkbox(
                    onChanged: (bool value) {
                      setState(() {
                        itemsMap[v] = value;
                      });
                    },
                    value: itemsMap[v],
                  ),
                  Text(
                    v,
                  ),
                ],
              ),
            RaisedButton(
              onPressed: () {},
              child: const Text('Search', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}