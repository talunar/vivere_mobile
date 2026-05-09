import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  Future<void> saveProfile(UserProfile updatedProfile) async {
    state = const AsyncLoading<UserProfile>().copyWithPrevious(state);

    state = await AsyncValue.guard(() async {
      final repository = ref.read(profileRepositoryProvider);
      // await Future.delayed(const Duration(seconds: 1));
      return await repository.updateProfile(updatedProfile);
    });
  }

  void updateLocal(UserProfile profile) {
    state = AsyncData(profile);
  }
}
