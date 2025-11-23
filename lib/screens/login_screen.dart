import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
      drawer: Drawer(),
      body: SizedBox(
        child: Column(
          children: [
            Text(
              "Let's sign you in",
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text("welcome back\nYou've been missed!"),
            Image.asset(
              "assets/images/silver_ball.jpg",
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
