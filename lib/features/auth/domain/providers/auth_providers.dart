import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../use_cases/use_cases.dart';
import '../../data/repositories/auth_repository.dart'; // Путь к реализации
import '../repositories/i_auth_repository.dart';
import 'package:dio/dio.dart'; // Если DioProvider еще нет

// 1. Сначала создаем провайдер для репозитория
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  // Здесь предполагается, что у тебя есть dioProvider.
  // Если нет, можно временно создать Dio() прямо здесь.
  return AuthRepository(Dio());
});

// 2. Создаем провайдер для SignInUseCase
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository);
});

// 3. Создаем провайдер для SignUpUseCase
final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repository);
});