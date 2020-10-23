import 'package:flutter/material.dart';
import 'package:recipesearch/Auth/Register.dart';
import 'package:recipesearch/Services/auth.dart';

class Login extends StatefulWidget {

  final Function setPage;

  Login({this.setPage});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email;
  String password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(fontSize: 50),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (val) {
                    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)){
                      setState(() {
                        email = val;
                      });
                      return null;
                    } else {
                      return 'Bad email';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter your username'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  validator: (val) {
                    if (val.length >= 5){
                      setState(() {
                        password = val;
                      });
                      return null;
                    } else {
                      return 'Bad password';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter your password'
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if(_formKey.currentState.validate()) {
                    AuthService().signInWithEmailAndPassword(email.trim(), password.trim());
                  }
                },
                child: new Text(
                  "Login",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(child: Text('Need to register?'), onTap: () {
                  this.widget.setPage(2);
                })
              ),
            ],
          ),
        ),
      )
    );
  }
}
