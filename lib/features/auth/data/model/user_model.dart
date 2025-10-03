import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String uId;

  UserModel({required this.name, required this.email, required this.uId});

  factory UserModel.fromFirebaseUser(User user, {String name = ''}) {
    return UserModel(
      name: user.displayName ?? name,
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      uId: map['uId'],
    );
  }

  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}
