import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../use_cases/use_cases.dart';
import '../../data/repositories/auth_repository.dart';
import '../repositories/i_auth_repository.dart';
import 'package:dio/dio.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  // Предполагается, что есть dioProvider
  return AuthRepository(Dio());
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository);
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repository);
});