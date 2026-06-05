import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../domain/entities/user_profile.dart';
import 'profile_providers.dart';

part 'profile_notifier.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  FutureOr<UserProfile> build(UserId id) async {
    final repository = ref.watch(profileRepositoryProvider);
    return repository.getProfile(id);
  }

  /// Сохранения изменений
  Future<void> saveProfile(UserProfile updatedProfile) async {
    state = const AsyncLoading<UserProfile>().copyWithPrevious(state);

    final result = await AsyncValue.guard(() async {
      final repository = ref.read(profileRepositoryProvider);
      return await repository.updateProfile(updatedProfile);
    });

    state = result;

    if (result.hasError) {
      throw result.error!;
    }
  }

  /// Удаления аккаунта
  Future<void> deleteAccount() async {
    final previousState = state;
    state = const AsyncLoading<UserProfile>().copyWithPrevious(state);

    try {
      final repository = ref.read(profileRepositoryProvider);
      final success = await repository.deleteProfile(id);
      
      if (success) {
        await ref.read(authControllerProvider.notifier).logout();
      }
    } catch (e, st) {
      state = AsyncError<UserProfile>(e, st).copyWithPrevious(previousState);
      rethrow;
    }
  }

  void updateLocal(UserProfile profile) {
    state = AsyncData(profile);
  }
}
