import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/value_objects/physical_parameters.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto {
  const ProfileDto._();

  const factory ProfileDto({
    required int id,
    @JsonKey(name: 'nick_name') required String nickName,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required int age,
    required double weight,
    required double height,
    @JsonKey(name: 'birth_date') required String birthDate,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  factory ProfileDto.fromDomain(UserProfile profile) => ProfileDto(
        id: profile.id.value,
        nickName: profile.nickName,
        email: profile.email,
        firstName: profile.firstName,
        lastName: profile.lastName,
        age: profile.age,
        weight: profile.weight.value,
        height: profile.height.value,
        birthDate: DateFormat('yyyy-MM-dd').format(profile.birthDate),
      );

  Map<String, dynamic> toCreateJson() {
    final map = toJson();
    map.remove('id');
    map['weight'] = weight.toInt();
    map['height'] = height.toInt();
    map['age'] = age.clamp(0, 255);
    return map;
  }

  Map<String, dynamic> toUpdateJson() {
    final map = toJson();
    map['weight'] = weight.toInt();
    map['height'] = height.toInt();
    map['age'] = age.clamp(0, 255);
    return map;
  }
}

extension ProfileDtoX on ProfileDto {
  UserProfile toDomain() {
    final w = Weight(weight);
    final h = Height(height);
    w.validate();
    h.validate();

    return UserProfile(
      id: UserId(id),
      nickName: nickName,
      email: email,
      firstName: firstName,
      lastName: lastName,
      age: age,
      weight: w,
      height: h,
      birthDate: DateTime.parse(birthDate),
    );
  }
}
