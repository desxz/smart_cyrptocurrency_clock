// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserModel _$RegisterUserModelFromJson(Map<String, dynamic> json) {
  return RegisterUserModel(
    username: json['username'] as String?,
    email: json['email'] as String?,
    passwd: json['passwd'] as String?,
    confirmPasswd: json['confirmPasswd'] as String?,
  );
}

Map<String, dynamic> _$RegisterUserModelToJson(RegisterUserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'passwd': instance.passwd,
      'confirmPasswd': instance.confirmPasswd,
    };
