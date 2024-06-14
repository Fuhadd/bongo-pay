class ChatModel {
  ChatModel({
    required this.message,
    required this.byMe,
  });

  String message;
  bool byMe;
}

List<ChatModel> chats = [];
