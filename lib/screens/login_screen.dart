import 'package:flutter/material.dart';
import 'package:simple_application/utils/login_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Hello",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Let's sign you in",
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Text(
              "welcome back\nYou've been missed!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/images/silver_ball.jpg",
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 10),
            /*
            u need the TextFormField to be a descendant of this form for u to 
            be able to validate it using the formKey property
            */
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // use a form field when u need a validator
                  // regular TextField does NOT have a validator property
                  TextFormField(
                    autocorrect: false,
                    controller: usernameController,
                    validator: (value) => validateUserName(value),
                    decoration: InputDecoration(
                      label: Text(("Username")),
                      // hintText: "enter your username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autocorrect: false,
                    controller: passwordController,
                    validator: (value) => validatePassword(value),
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      // hintText: "enter ur password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () => loginUser(
                    context,
                    formKey: _formKey,
                    usernameController: usernameController,
                    passwordController: passwordController,
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
