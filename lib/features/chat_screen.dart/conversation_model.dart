typedef ConversationModel = ({
  int id,
  String senderId,
  String content,
  String contentType,
});

ConversationModel createConversationModel({
  int id = -1,
  String sender = "",
  String receiver = "",
  String timestamp = "",
}) {
  return (
    id: id,
    senderId: sender,
    content: receiver,
    contentType: timestamp,
  );
}

extension ConversationModelHelper on Map<String, dynamic> {
  ConversationModel toConversationModel() {
    return createConversationModel(
      id: this["id"] as int,
      sender: this["sender_id"] as String,
      receiver: this["content"] as String,
      timestamp: this["type"] as String,
    );
  }

  ConversationModel copyWith({
    int? id,
    String? userOne,
    String? userTwo,
    String? timestamp,
  }) {
    return createConversationModel(
      id: id ?? this["id"] as int,
      sender: userOne ?? this["userOne"] as String,
      receiver: userTwo ?? this["userTwo"] as String,
      timestamp: timestamp ?? this["timestamp"] as String,
    );
  }
}

extension ChatModelToJson on ConversationModel {
  Map<String, dynamic> toJson() =>
      {"sender_id": senderId, "content": content, "type": contentType};
}
