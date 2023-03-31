import 'dart:developer';

import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String username = '';
  String password = '';

  bool usernameInvalid = false;
  bool passwordInvalid = false;

  TextEditingController uText = TextEditingController();
  TextEditingController pText = TextEditingController();

  changeUsername(String value) {
    usernameInvalid = (!value.contains('@')) ? true : false;
    notifyListeners();
  }

  changePassword(String value) {
    passwordInvalid = (value.length <= 6) ? true : false;
    notifyListeners();
  }

  @override
  String toString() {
    username = uText.text;
    password = pText.text;
    return '$username | $password';
  }
}
