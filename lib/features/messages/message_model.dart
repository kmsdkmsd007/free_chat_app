typedef MessageModel = ({
  String id,
  String? senderId,
  String content,
  DateTime createdAt,
  int? chatId,
});

MessageModel createMessageModel({
  String id = "",
  String? senderId,
  String content = "",
  DateTime? createdAt,
  int? chatId,
}) {
  return (
    id: id,
    senderId: senderId,
    content: content,
    createdAt: createdAt ?? DateTime.now(),
    chatId: chatId,
  );
}

extension MessageModelHelper on Map<String, dynamic> {
  MessageModel toMessageModel() {
    return createMessageModel(
      id: this["id"] as String? ?? "",
      senderId: this["sender_id"] as String?,
      content: this["content"] as String? ?? "",
      createdAt: this["created_at"] is String
          ? DateTime.tryParse(this["created_at"] as String) ?? DateTime.now()
          : this["created_at"] as DateTime? ?? DateTime.now(),
      chatId: this["chat_id"] as int?,
    );
  }
}

extension MessageModelToJson on MessageModel {
  Map<String, dynamic> toJson() => {
        "id": id,
        "sender_id": senderId,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "chat_id": chatId,
      };
}
