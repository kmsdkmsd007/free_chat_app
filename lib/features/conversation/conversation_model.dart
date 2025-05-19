typedef ConversationModel = ({
  String id,
  String senderId,
  String content,
  int chatId,
  String contentType,
});

ConversationModel createConversationModel({
  String id = "-1",
  int chatId = -1,
  String senderId = "",
  String content = "",
  String contentType = "",
}) {
  return (
    chatId: chatId,
    id: id,
    senderId: senderId,
    content: content,
    contentType: contentType,
  );
}

extension ConversationModelHelper on Map<String, dynamic> {
  ConversationModel toConversationModel() {
    return createConversationModel(
      id: this["id"] ?? "",
      chatId: this['chat_id'],
      senderId: this["sender_id"] as String? ?? "",
      content: this["content"] as String? ?? "",
      contentType: this["type"] as String? ?? "",
    );
  }
}

extension ChatModelToJson on ConversationModel {
  ConversationModel copyWith({
    String? id,
    int? chatId,
    String? senderId,
    String? content,
    String? contentType,
  }) {
    return createConversationModel(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      contentType: contentType ?? this.contentType,
    );
  }

  Map<String, dynamic> toJson() => {
        'chat_id': chatId,
        "sender_id": senderId,
        "content": content,
      };
}
