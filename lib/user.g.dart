// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      success: json['success'] as String,
      message: json['message'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => UserItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'items': instance.items,
    };

UserItem _$UserItemFromJson(Map<String, dynamic> json) => UserItem(
      user_session: json['user_session'] as String,
    );

Map<String, dynamic> _$UserItemToJson(UserItem instance) => <String, dynamic>{
      'user_session': instance.user_session,
    };
