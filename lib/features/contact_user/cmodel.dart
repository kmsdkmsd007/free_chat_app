import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String lastLogin;
  final String profilePicture;
  final bool isActive;
  final DateTime? createdAt;

  const MyUser({
    this.userId,
    required this.username,
    required this.email,
    required this.lastLogin,
    required this.profilePicture,
    this.isActive = true,
    this.createdAt,
  });

  factory MyUser.fromJson(Map<String, dynamic> json) {
    return MyUser(
      userId: json['user_id'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      lastLogin: json['last_login'] ?? "",
      profilePicture: json['profile_picture'],
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'email': email,
      'last_login': lastLogin,
      'profile_picture': profilePicture,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props =>
      [userId, username, email, lastLogin, profilePicture, isActive, createdAt];
}
