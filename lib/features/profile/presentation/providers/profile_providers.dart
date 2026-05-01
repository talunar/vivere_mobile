import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../../data/repositories/profile_repository_impl.dart';

part 'profile_providers.g.dart';

@riverpod
IProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return ProfileRepositoryImpl(dio);
}

@riverpod
Future<UserProfile> userProfile(UserProfileRef ref, UserId id) {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.getProfile(id);
}
