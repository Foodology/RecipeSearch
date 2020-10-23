import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesearch/Models/user.dart';
import 'package:recipesearch/Services/auth.dart';
import 'package:recipesearch/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Recipe Search',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}