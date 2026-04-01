class User {
  final String username;
  final String profileImage;

  User({required this.username, required this.profileImage});

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() {
    return {'username': username, 'profileImage': profileImage};
  }
}
