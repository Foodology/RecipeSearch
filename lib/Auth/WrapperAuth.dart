import 'package:flutter/material.dart';
import 'package:recipesearch/Auth/Login.dart';
import 'package:recipesearch/Auth/Register.dart';

class WrapperAuth extends StatefulWidget {

  @override
  _WrapperAuthState createState() => _WrapperAuthState();
}

class _WrapperAuthState extends State<WrapperAuth> {

  int page = 1;

  void setPage(int i){
    setState(() => page = i);
  }


  @override
  Widget build(BuildContext context) {

    if (page == 1){
      return Login(setPage: setPage,);
    } else {
      return Register(setPage: setPage,);
    }
  }
}

