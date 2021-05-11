import 'package:json_annotation/json_annotation.dart';

part 'login_user_model.g.dart';

@JsonSerializable()
class LoginUserModel {
  String? email;
  String? passwd;

  LoginUserModel({
    required this.email,
    required this.passwd,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return _$LoginUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginUserModelToJson(this);
  }
}
