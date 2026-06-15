import '../models/profile_dto.dart';
import 'i_profile_data_source.dart';

class ProfileMockDataSource implements IProfileDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 600));

  final ProfileDto _mockProfile = const ProfileDto(
    id: 1,
    nickName: 'zero_latency',
    email: 'berserk_mode45@vivere.com',
    firstName: 'Nova',
    lastName: 'Polaris',
    age: 30,
    weight: 70.0,
    height: 170.0,
    gender: 2,
    birthDate: '1996-02-29',
  );

  @override
  Future<ProfileDto> getProfile(int id) async {
    await _delay();
    return _mockProfile.copyWith(id: id);
  }

  @override
  Future<int> createProfile(ProfileDto profile) async {
    await _delay();
    return 123;
  }

  @override
  Future<ProfileDto> updateProfile(ProfileDto profile) async {
    await _delay();
    return profile;
  }

  @override
  Future<bool> deleteProfile(int id) async {
    await _delay();
    return true;
  }
}
