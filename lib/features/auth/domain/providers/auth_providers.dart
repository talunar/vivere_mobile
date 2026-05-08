import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../use_cases/use_cases.dart';
import '../../data/repositories/auth_repository.dart';
import '../repositories/i_auth_repository.dart';
import 'package:dio/dio.dart'; // Если DioProvider еще нет (а его нет)

// Сначала создаем провайдер для репозитория
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  // Пока предполагается, что есть dioProvider.
  // Но пока его нет - можно временно создать Dio() здесь
  return AuthRepository(Dio());
});

// Создаем провайдер для SignInUseCase
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository);
});

// Создаем провайдер для SignUpUseCase
final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repository);
});