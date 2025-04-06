typedef UserChatModel = ({
  String username,
  String profilePicture,
  String lastMessage,
  DateTime messageTime,
  int chatId,
});

UserChatModel createUserChatModel({
  String username = "",
  String profilePicture = "",
  String lastMessage = "",
  DateTime? messageTime,
  int chatId = -1,
}) {
  return (
    username: username,
    profilePicture: profilePicture,
    lastMessage: lastMessage,
    messageTime: messageTime ?? DateTime.now(),
    chatId: chatId,
  );
}

extension UserChatModelHelper on Map<String, dynamic> {
  UserChatModel toUserChatModel() {
    return createUserChatModel(
      username: this["username"] as String? ?? "",
      profilePicture: this["profile_picture"] as String? ?? "",
      lastMessage: this["last_message"] as String? ?? "",
      messageTime: this["message_time"] is String
          ? DateTime.tryParse(this["message_time"] as String)
          : this["message_time"] as DateTime? ?? DateTime.now(),
      chatId: this["chat_id"] as int? ?? -1,
    );
  }
}

extension UserChatModelToJson on UserChatModel {
  Map<String, dynamic> toJson() => {
        "username": username,
        "profile_picture": profilePicture,
        "last_message": lastMessage,
        "message_time": messageTime.toIso8601String(),
        "chat_id": chatId,
      };
}
