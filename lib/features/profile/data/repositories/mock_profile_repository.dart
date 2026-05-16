import '../../../../core/domain/entities/user_id.dart';
import '../../../../core/domain/value_objects/app_value_objects.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../../domain/value_objects/physical_parameters.dart';

class MockProfileRepository implements IProfileRepository {
  @override
  Future<UserId> createProfile(UserProfile profile) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return profile.id;
  }

  @override
  Future<UserProfile> getProfile(UserId id) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return UserProfile(
      id: id,
      nickName: const NickName('zero_latency'),
      email: const Email('berserk_mode@vivere.app'),
      firstName: const Name('Vita'),
      lastName: const Name('Polaris'),
      age: const Age(30),
      birthDate: DateTime(1996, 2, 29),
      weight: const Weight(80.0),
      height: const Height(165.0),
    );
  }

  @override
  Future<UserProfile> updateProfile(UserProfile profile) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return profile;
  }

  @override
  Future<bool> deleteProfile(UserId id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
