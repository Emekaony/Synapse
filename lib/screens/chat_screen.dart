// ignore_for_file: avoid_print
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:simple_application/components/chat_bubble.dart';
import 'package:simple_application/components/chat_input.dart';
import 'package:simple_application/models/chat_message_entity.dart';
import 'package:simple_application/repo/message_repository.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageEntity> _messages = [];

  @override
  // init state is called once when the app first runs
  void initState() {
    // quick dirty async hack!
    MessageRepository.loadInitialMessages().then((result) {
      _messages = result;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hi Nnaemeka",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log("I pressed the logout button");
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Alignment buttonAlignment = index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight;
                  return ChatBubble(
                    entity: _messages[index],
                    alignment: buttonAlignment,
                  );
                },
              ),
            ),
            // ignore this function for now
            ChatInputWidget(onSubmit: (_) {}),
          ],
        ),
      ),
    );
  }
}
