import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  AuthService._internal();

  static final AuthService _singleton = AuthService._internal();

  factory AuthService() {
    return _singleton;
  }
}