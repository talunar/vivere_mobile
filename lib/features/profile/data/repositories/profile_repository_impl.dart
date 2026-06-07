import '../../../../core/domain/entities/user_id.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../models/profile_dto.dart';
import '../sources/i_profile_data_source.dart'; // Используем интерфейс

class ProfileRepositoryImpl implements IProfileRepository {
  final IProfileDataSource _dataSource;

  ProfileRepositoryImpl(this._dataSource);

  @override
  Future<UserId> createProfile(UserProfile profile) async {
    final dto = ProfileDto.fromDomain(profile);
    final id = await _dataSource.createProfile(dto);
    return UserId(id);
  }

  @override
  Future<UserProfile> getProfile(UserId id) async {
    final dto = await _dataSource.getProfile(id.value);
    return dto.toDomain();
  }

  @override
  Future<UserProfile> updateProfile(UserProfile profile) async {
    final dto = ProfileDto.fromDomain(profile);
    final updatedDto = await _dataSource.updateProfile(dto);
    return updatedDto.toDomain();
  }

  @override
  Future<bool> deleteProfile(UserId id) async {
    return await _dataSource.deleteProfile(id.value);
  }
}
