// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModelResponse _$LoginModelResponseFromJson(Map<String, dynamic> json) =>
    LoginModelResponse(
      success: json['success'] as String,
      message: json['message'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => LoginModelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoginModelResponseToJson(LoginModelResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'items': instance.items,
    };

LoginModelItem _$LoginModelItemFromJson(Map<String, dynamic> json) =>
    LoginModelItem(
      user_session: json['user_session'] as String,
      user_fname: json['user_fname'] as String,
      user_code: json['user_code'] as String,
      user_altercode: json['user_altercode'] as String,
      user_type: json['user_type'] as String,
      user_password: json['user_password'] as String,
      user_image: json['user_image'] as String,
      user_nrx: json['user_nrx'] as String,
      status: json['status'] as String,
      status_message: json['status_message'] as String,
    );

Map<String, dynamic> _$LoginModelItemToJson(LoginModelItem instance) =>
    <String, dynamic>{
      'user_session': instance.user_session,
      'user_fname': instance.user_fname,
      'user_code': instance.user_code,
      'user_altercode': instance.user_altercode,
      'user_type': instance.user_type,
      'user_password': instance.user_password,
      'user_image': instance.user_image,
      'user_nrx': instance.user_nrx,
      'status': instance.status,
      'status_message': instance.status_message,
    };
