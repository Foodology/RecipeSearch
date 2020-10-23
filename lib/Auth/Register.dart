import 'package:flutter/material.dart';
import 'package:recipesearch/Auth/Login.dart';
import 'package:recipesearch/Services/auth.dart';

class Register extends StatefulWidget {

  final Function setPage;

  Register({this.setPage});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email, password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Register', style: TextStyle(fontSize: 50),),
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
                      AuthService().registerWithEmailAndPassword(email.trim(), password.trim());
                    }
                  },
                  child: new Text(
                    "Register",
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(child: Text('Need to Login?'), onTap: () {
                      this.widget.setPage(1);
                    })
                ),
              ],
            ),
          ),
        )
    );
  }
}
