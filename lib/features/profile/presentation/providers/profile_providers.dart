import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../../data/repositories/profile_repository_impl.dart';

part 'profile_providers.g.dart';

/// Провайдер репозитория. Следит за dioProvider.
@riverpod
IProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return ProfileRepositoryImpl(dio);
}

/// Провайдер данных профиля.
/// Позволяет UI просто вызвать ref.watch(userProfileProvider(id))
@riverpod
Future<UserProfile> userProfile(UserProfileRef ref, UserId id) {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.getProfile(id);
}
