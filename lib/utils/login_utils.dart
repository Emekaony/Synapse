// this will be triggered when the user presses the log in button
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_application/screens/chat_screen.dart';

void loginUser(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required TextEditingController usernameController,
  required TextEditingController passwordController,
}) {
  if (formKey.currentState != null && formKey.currentState!.validate()) {
    if (kDebugMode) {
      print("Log in Successiful");

      print("Username: ${usernameController.text}");
      print("Username: ${passwordController.text}");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return ChatScreen();
          },
        ),
      );
    }
  }
}

String? validateUserName(String? userName) {
  String? message;
  if (userName != null) {
    if (userName.isEmpty) {
      message = "Username can NOT be empty";
    } else if (userName.isNotEmpty && userName.length < 5) {
      message = "Username must be greater than 4 characters";
    }
  }
  return message;
}

String? validatePassword(String? password) {
  String? message;
  if (password != null) {
    if (password.isEmpty) {
      message = "password CANNOT be empty!";
    } else if (password.isNotEmpty && password.length < 5) {
      message = "password must have more than 4 characters";
    }
  }
  return message;
}
