typedef ChatModel = ({
  int id,
  bool? isGrouped,
  DateTime? createdAt,
  String? name,
});

ChatModel createChatModel({
  int id = -1,
  bool? isGrouped,
  DateTime? createdAt,
  String? name,
}) {
  return (
    id: id,
    isGrouped: isGrouped,
    createdAt: createdAt,
    name: name,
  );
}

extension ChatModelHelper on Map<String, dynamic> {
  ChatModel toChatModel() {
    return createChatModel(
      id: this["id"] as int? ?? -1,
      isGrouped: this["is_grouped"] as bool?,
      createdAt: this["created_at"] is String
          ? DateTime.tryParse(this["created_at"] as String)
          : this["created_at"] as DateTime?,
      name: this["name"] as String?,
    );
  }

  ChatModel copyWith({
    int? id,
    bool? isGrouped,
    DateTime? createdAt,
    String? name,
  }) {
    return createChatModel(
      id: id ?? this["id"] as int? ?? -1,
      isGrouped: isGrouped ?? this["is_grouped"] as bool?,
      createdAt: createdAt ??
          (this["created_at"] is String
              ? DateTime.tryParse(this["created_at"] as String)
              : this["created_at"] as DateTime?),
      name: name ?? this["name"] as String?,
    );
  }
}

extension ChatModelToJson on ChatModel {
  Map<String, dynamic> toJson() => {
        "is_grouped": isGrouped,
        "created_at": createdAt?.toIso8601String(),
        "name": name,
      };
}
