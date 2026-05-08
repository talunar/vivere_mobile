import '../../../../core/domain/entities/user_id.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../../domain/value_objects/physical_parameters.dart';

class MockProfileRepository implements IProfileRepository {
  @override
  Future<UserProfile> getProfile(UserId id) async {
    // Имитируем задержку сети
    await Future.delayed(const Duration(milliseconds: 800));
    
    return UserProfile(
      id: id,
      nickName: 'zero_latency',
      email: 'berserk_mode@vivere.app',
      firstName: 'Vita',
      lastName: 'Polaris',
      age: 30,
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
  Future<UserId> createProfile(UserProfile profile) async {
    return profile.id;
  }

  @override
  Future<void> deleteProfile(UserId id) async {}
}
