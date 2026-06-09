// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authDataSourceHash() => r'2a1ee7bbda92532aaa30c8810e94ebebadc86f17';

/// See also [authDataSource].
@ProviderFor(authDataSource)
final authDataSourceProvider = Provider<IAuthDataSource>.internal(
  authDataSource,
  name: r'authDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthDataSourceRef = ProviderRef<IAuthDataSource>;
String _$authRepositoryHash() => r'b73027d4ed90ffa1ba04235904e5819df9e0ccaf';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<IAuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = ProviderRef<IAuthRepository>;
String _$authControllerHash() => r'4d06bc378ecf80b83755d885f3d7aca213ac377a';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    NotifierProvider<AuthController, AuthState>.internal(
      AuthController.new,
      name: r'authControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthController = Notifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
