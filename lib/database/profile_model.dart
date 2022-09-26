
import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.message,
    required this.success,
    required this.data,
  });

  final String message;
  final bool success;
  final Data data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json['message'],
        success: json['success'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'data': data.toJson(),
      };
}

class Data {
  Data({
    required this.user,
    required this.authToken,
  });

  final User user;
  final String authToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json['user']),
        authToken: json['authToken'],
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'authToken': authToken,
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
