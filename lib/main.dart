import 'package:flutter/material.dart';
import 'package:recipesearch/FoodItemsCheckboxes.dart';

void main() => runApp(MyApp());

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
          child: FoodItemsCheckboxes(),
        ),
      ),
    );
  }
}