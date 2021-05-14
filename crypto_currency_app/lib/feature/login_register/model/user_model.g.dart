// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    name: json['name'] as String?,
    surname: json['surname'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    deviceId: json['deviceId'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'password': instance.password,
      'deviceId': instance.deviceId,
    };
