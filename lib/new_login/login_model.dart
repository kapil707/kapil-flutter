import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModelResponse {
  final String success;
  final String message;
  final List<LoginModelItem> items;

  LoginModelResponse(
      {required this.success, required this.message, required this.items});
  //UserResponse({required this.success, required this.message});

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginModelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelResponseToJson(this);
}

@JsonSerializable()
class LoginModelItem {
  final String user_session;
  final String user_fname;
  final String user_code;
  final String user_altercode;
  final String user_type;
  final String user_password;
  final String user_image;
  final String user_nrx;
  final String status;
  final String status_message;

  LoginModelItem(
      {required this.user_session,
      required this.user_fname,
      required this.user_code,
      required this.user_altercode,
      required this.user_type,
      required this.user_password,
      required this.user_image,
      required this.user_nrx,
      required this.status,
      required this.status_message});

  factory LoginModelItem.fromJson(Map<String, dynamic> json) =>
      _$LoginModelItemFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelItemToJson(this);
}
