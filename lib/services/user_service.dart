import 'package:tiktok/models/user_model.dart';

class UserService {
  // Singleton pattern to access data globally
  static final UserService _instance = UserService._internal();

  factory UserService() {
    return _instance;
  }

  UserService._internal();

  // List to hold users
  List<User> users = [];

  // Method to initialize users on app startup
  void initializeUsers() {
    users = [
      User(
        username: "Alice",
        profileImage:
            "https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg",
      ),
      User(
        username: "Bob",
        profileImage:
            "https://www.shutterstock.com/image-photo/head-shot-portrait-confident-positive-260nw-2473271385.jpg",
      ),
      User(
        username: "Charlie",
        profileImage:
            "https://sb.kaleidousercontent.com/67418/1920x1545/c5f15ac173/samuel-raita-ridxdghg7pw-unsplash.jpg",
      ),
      // Add up to 12 users
    ];
  }

  // Optional helper to get a user by name
  User? getUser(String username) {
    return users.firstWhere(
      (user) => user.username == username,
      orElse: () => User(username: "Unknown", profileImage: ""),
    );
  }
}
