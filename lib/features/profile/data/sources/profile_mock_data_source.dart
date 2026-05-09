import '../models/profile_dto.dart';

class ProfileMockDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 600));

  final ProfileDto _mockProfile = const ProfileDto(
    id: 1,
    nickName: 'ivan_iron',
    email: 'ivan@example.com',
    firstName: 'Иван',
    lastName: 'Иванов',
    age: 28,
    weight: 85.0,
    height: 180.0,
    birthDate: '1996-05-15',
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
