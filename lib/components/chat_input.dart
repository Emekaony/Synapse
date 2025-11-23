import 'dart:developer';

import 'package:flutter/material.dart';

class ChatInputWidget extends StatefulWidget {
  const ChatInputWidget({super.key});

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              log("pressd the add button");
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              controller: textFieldController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'write...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              log("sending ${textFieldController.text} to the backend!");
              setState(() {
                textFieldController.text = "";
              });
            },
            icon: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
