import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:vivere_mobile/core/domain/entities/user_id.dart';
import 'package:vivere_mobile/core/domain/entities/gender.dart';
import 'package:vivere_mobile/core/domain/value_objects/app_value_objects.dart';
import 'package:vivere_mobile/features/profile/domain/entities/user_profile.dart';
import 'package:vivere_mobile/features/profile/domain/value_objects/physical_parameters.dart';

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
    required int gender, // 1 - муж, 2 - жен, 3 - другое
    @JsonKey(name: 'birth_date') required String birthDate,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  factory ProfileDto.fromDomain(UserProfile profile) => ProfileDto(
    id: profile.id.value,
    nickName: profile.nickName.value,
    email: profile.email.value,
    firstName: profile.firstName.value,
    lastName: profile.lastName.value,
    age: profile.age.value,
    weight: profile.weight.value,
    height: profile.height.value,
    gender: _genderToInt(profile.gender),
    birthDate: DateFormat('yyyy-MM-dd').format(profile.birthDate),
  );

  static int _genderToInt(Gender gender) {
    switch (gender) {
      case Gender.male: return 1;
      case Gender.female: return 2;
      case Gender.other: return 3;
    }
  }

  static Gender _intToGender(int val) {
    if (val == 2) return Gender.female;
    if (val == 3) return Gender.other;
    return Gender.male;
  }

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
    final nName = NickName(nickName.trim());
    final eMail = Email(email.trim());
    final fName = Name(firstName.trim());
    final lName = Name(lastName.trim());
    final aGe = Age(age);

    return UserProfile(
      id: UserId(id),
      nickName: nName,
      email: eMail,
      firstName: fName,
      lastName: lName,
      age: aGe,
      weight: w,
      height: h,
      gender: ProfileDto._intToGender(gender),
      birthDate: DateTime.tryParse(birthDate) ?? DateTime.now(),
    );
  }
}
