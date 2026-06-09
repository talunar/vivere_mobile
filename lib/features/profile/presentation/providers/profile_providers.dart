import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/domain/entities/user_id.dart';
import '../../../../core/network/dio_provider.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../data/sources/i_profile_data_source.dart';
import '../../data/sources/profile_mock_data_source.dart';
import '../../data/sources/profile_remote_data_source.dart';

part 'profile_providers.g.dart';

// Флаг для переключения между моками и реальным бэкендом
const bool _useRemoteDataSource = false;

@riverpod
IProfileDataSource profileDataSource(ProfileDataSourceRef ref) {
  if (_useRemoteDataSource) {
    final dio = ref.watch(dioProvider);
    return ProfileRemoteDataSource(dio);
  }
  return ProfileMockDataSource();
}

@riverpod
IProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final dataSource = ref.watch(profileDataSourceProvider);
  return ProfileRepositoryImpl(dataSource);
}

@riverpod
Future<UserProfile> userProfile(UserProfileRef ref, UserId id) {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.getProfile(id);
}
