import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:simple_application/models/chat_message_entity.dart';

class MessageRepository {
  static Future<List<ChatMessageEntity>> loadInitialMessages() async {
    List<ChatMessageEntity> messages = [];
    final response = await rootBundle.loadString("assets/json/messages.json");
    // decode the json file into a list dart understands
    final List<dynamic> decodedList = jsonDecode(response) as List;
    messages = decodedList.map((item) {
      // manually deserialize the json into a class instance
      return ChatMessageEntity.fromJson(item);
    }).toList();
    return messages;
  }
}
