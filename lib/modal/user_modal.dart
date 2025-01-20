class User {
  final String id;
  final String name;
  final String phoneNumber;
  final String profilePictureUrl;
  final bool isOnline;
  final DateTime lastSeen;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.profilePictureUrl,
    required this.isOnline,
    required this.lastSeen,
  });
}
