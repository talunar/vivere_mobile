import 'package:freezed_annotation/freezed_annotation.dart';

extension type const UserId(int value) {} // Указала ID как Int, если ID другого типа - переделать

class UserIdConverter implements JsonConverter<UserId, int> {
  const UserIdConverter();

  @override
  UserId fromJson(int json) => UserId(json);

  @override
  int toJson(UserId object) => object.value;
}