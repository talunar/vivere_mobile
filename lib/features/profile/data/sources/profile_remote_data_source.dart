import 'package:dio/dio.dart';
import '../../../../core/network/api_error.dart';
import '../models/profile_dto.dart';
import 'i_profile_data_source.dart';

class ProfileRemoteDataSource implements IProfileDataSource {
  final Dio _dio;

  ProfileRemoteDataSource(this._dio);

  @override
  Future<ProfileDto> getProfile(int id) async {
    try {
      final response = await _dio.get('/get-user/$id');
      return ProfileDto.fromJson(response.data['profile']);
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<int> createProfile(ProfileDto profile) async {
    try {
      final response = await _dio.post('/create-user', data: profile.toCreateJson());
      return response.data['userId'];
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<ProfileDto> updateProfile(ProfileDto profile) async {
    try {
      final response = await _dio.put('/update-user/${profile.id}', data: profile.toUpdateJson());
      return ProfileDto.fromJson(response.data['profile']);
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }

  @override
  Future<bool> deleteProfile(int id) async {
    try {
      await _dio.delete('/delete-user', queryParameters: {'id': id});
      return true;
    } on DioException catch (e) {
      throw ApiError.fromDioException(e);
    }
  }
}
