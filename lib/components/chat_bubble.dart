import 'package:flutter/material.dart';
import 'package:simple_application/models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;
  const ChatBubble({super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          color: Colors.blue,
        ),
        child: Column(
          // the default for crossAxisAlignment in Column is center
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entity.text),
            // conditionally render the chat bubbles image
            entity.imageUrl == null
                // changed from container to sizedBox
                ? SizedBox()
                : Image.asset(
                    "assets/images/silver_ball.jpg",
                    width: 100,
                    height: 100,
                  ),
            Text("Author: ${entity.author.name}"),
          ],
        ),
      ),
    );
  }
}
