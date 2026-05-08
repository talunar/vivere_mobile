import '../../../../core/domain/entities/user_id.dart';
import '../entities/user_profile.dart';

abstract class IProfileRepository {
  Future<UserId> createProfile(UserProfile profile);
  Future<UserProfile> getProfile(UserId id);
  Future<UserProfile> updateProfile(UserProfile profile);
  Future<bool> deleteProfile(UserId id);
}
