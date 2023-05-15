// To parse this JSON data, do
//
//     final userComment = userCommentFromJson(jsonString);

import 'dart:convert';

List<UserComment> userCommentFromJson(String str) => List<UserComment>.from(
    json.decode(str).map((x) => UserComment.fromJson(x)));

String userCommentToJson(List<UserComment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserComment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  UserComment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory UserComment.fromJson(Map<String, dynamic> json) => UserComment(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
