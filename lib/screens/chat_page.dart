import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:simple_application/components/chat_bubble.dart';
import 'package:simple_application/components/chat_input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi Nnaemeka",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log("I pressed the logout button");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(),
                ChatBubble(),
                ChatBubble(),
                ChatBubble(),
                ChatBubble(),
                ChatBubble(),
              ],
            ),
          ),
          ChatInputWidget(),
        ],
      ),
    );
  }
}
