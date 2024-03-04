import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserResponse {
  final String success;
  final String message;
  final List<UserItem> items;

  UserResponse({required this.success, required this.message, required this.items});
  //UserResponse({required this.success, required this.message});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserItem {
  final String user_session;

  UserItem({
    required this.user_session
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => _$UserItemFromJson(json);
  Map<String, dynamic> toJson() => _$UserItemToJson(this);
}