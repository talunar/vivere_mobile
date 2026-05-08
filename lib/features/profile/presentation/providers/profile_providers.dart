import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../data/sources/profile_mock_data_source.dart';

part 'profile_providers.g.dart';

@riverpod
IProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepositoryImpl(ProfileMockDataSource());
}

@riverpod
Future<UserProfile> userProfile(UserProfileRef ref, UserId id) {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.getProfile(id);
}