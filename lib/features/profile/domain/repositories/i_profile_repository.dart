import '../../../../core/domain/entities/user_id.dart';
import '../entities/user_profile.dart';

abstract class IProfileRepository {
  Future<UserProfile> getProfile(UserId id);
  Future<UserId> createProfile(UserProfile profile);
  Future<UserProfile> updateProfile(UserProfile profile);
  Future<void> deleteProfile(UserId id);
}
