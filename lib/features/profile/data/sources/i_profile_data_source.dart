import '../models/profile_dto.dart';

abstract class IProfileDataSource {
  Future<ProfileDto> getProfile(int id);
  Future<int> createProfile(ProfileDto profile);
  Future<ProfileDto> updateProfile(ProfileDto profile);
  Future<bool> deleteProfile(int id);
}
