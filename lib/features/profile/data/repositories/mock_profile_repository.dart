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
      nickName: 'Iron_User',
      email: 'mock@vivere.app',
      firstName: 'Иван',
      lastName: 'Иванов',
      age: 28,
      birthDate: DateTime(1996, 5, 20),
      weight: const Weight(85.0),
      height: const Height(180.0),
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
