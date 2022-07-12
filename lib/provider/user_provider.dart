import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/models/user.dart';
import 'package:flutter_insta_clone/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  final _authMethods = AuthMethods();
  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
