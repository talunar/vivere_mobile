import '../models/profile_dto.dart';

class ProfileMockDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 600));

  final ProfileDto _mockProfile = const ProfileDto(
    id: 1,
    nickName: 'zero_latency',
    email: 'berserk_mode45@vivere.com',
    firstName: 'Nova',
    lastName: 'Polaris',
    age: 30,
    weight: 123.0,
    height: 170.0,
    birthDate: '1996-02-29',
  );

  Future<ProfileDto> getProfile(int id) async {
    await _delay();
    return _mockProfile.copyWith(id: id);
  }

  Future<int> createProfile(ProfileDto data) async {
    await _delay();
    return 123;
  }

  Future<ProfileDto> updateProfile(ProfileDto data) async {
    await _delay();
    return data;
  }

  Future<bool> deleteProfile(int id) async {
    await _delay();
    return true;
  }
}
