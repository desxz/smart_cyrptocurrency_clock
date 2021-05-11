import 'package:json_annotation/json_annotation.dart';

part 'register_user_model.g.dart';

@JsonSerializable()
class RegisterUserModel {
  String? username;
  String? email;
  String? passwd;
  String? confirmPasswd;

  RegisterUserModel({
    required this.username,
    required this.email,
    required this.passwd,
    required this.confirmPasswd,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterUserModelToJson(this);
  }
}
