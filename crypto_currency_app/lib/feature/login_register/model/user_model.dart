import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? name;
  String? surname;
  String? email;
  String? password;
  String? deviceId;

  UserModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.deviceId,
  });

  factory UserModel.fromJson(json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
