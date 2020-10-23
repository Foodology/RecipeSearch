import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipesearch/Auth/Login.dart';
import 'package:recipesearch/Auth/WrapperAuth.dart';
import 'package:recipesearch/Models/user.dart';
import 'package:recipesearch/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null){
      return WrapperAuth();
    } else {
      return Home();
    }
  }
}