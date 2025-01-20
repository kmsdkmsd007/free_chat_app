class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final MessageType type;
  final String? mediaUrl;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.type = MessageType.text,
    this.mediaUrl,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: MessageType.values.firstWhere(
        (type) => type.toString() == json['type'],
        orElse: () => MessageType.text,
      ),
      mediaUrl: json['mediaUrl'] as String?,
    );
  }

  // Convert Message to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'type': type.toString(),
      'mediaUrl': mediaUrl,
    };
  }

  Message copyWith({
    String? id,
    String? senderId,
    String? content,
    DateTime? timestamp,
    MessageType? type,
    String? mediaUrl,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      mediaUrl: mediaUrl ?? this.mediaUrl,
    );
  }
}

enum MessageType {
  text,
  image,
  video,
  audio,
  file,
}

class MessageContent {
  final List<String> links;
  final String description;

  MessageContent({
    required this.links,
    required this.description,
  });
}
