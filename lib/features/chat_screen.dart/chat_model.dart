typedef ChatModel = ({
  int id,
  String userOne,
  String userTwo,
  String timestamp,
});

ChatModel createChatModel({
  int id = -1,
  String userOne = "",
  String userTwo = "",
  String timestamp = "",
}) {
  return (
    id: id,
    userOne: userOne,
    userTwo: userTwo,
    timestamp: timestamp,
  );
}

extension ChatModelHelper on Map<String, dynamic> {
  ChatModel toChatModel() {
    return createChatModel(
      id: this["id"] as int,
      userOne: this["userOne"] as String,
      userTwo: this["userTwo"] as String,
      timestamp: this["timestamp"] as String,
    );
  }

  ChatModel copyWith({
    int? id,
    String? userOne,
    String? userTwo,
    String? timestamp,
  }) {
    return createChatModel(
      id: id ?? this["id"] as int,
      userOne: userOne ?? this["userOne"] as String,
      userTwo: userTwo ?? this["userTwo"] as String,
      timestamp: timestamp ?? this["timestamp"] as String,
    );
  }
}

extension ChatModelToJson on ChatModel {
  Map<String, dynamic> toJson() => {
        "id": id,
        "userOne": userOne,
        "userTwo": userTwo,
        "timestamp": timestamp,
      };
}
