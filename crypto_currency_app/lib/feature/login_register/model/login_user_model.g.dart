// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserModel _$LoginUserModelFromJson(Map<String, dynamic> json) {
  return LoginUserModel(
    email: json['email'] as String?,
    passwd: json['passwd'] as String?,
  );
}

Map<String, dynamic> _$LoginUserModelToJson(LoginUserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'passwd': instance.passwd,
    };
