// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutRepositoryHash() => r'e8bfded22ff919abf26aedc1a40b02febabf7cd8';

/// See also [workoutRepository].
@ProviderFor(workoutRepository)
final workoutRepositoryProvider =
    AutoDisposeProvider<IWorkoutRepository>.internal(
      workoutRepository,
      name: r'workoutRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$workoutRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkoutRepositoryRef = AutoDisposeProviderRef<IWorkoutRepository>;
String _$userExercisesRepositoryHash() =>
    r'8452265dce628fe8e941fff2ea145194800a1f02';

/// See also [userExercisesRepository].
@ProviderFor(userExercisesRepository)
final userExercisesRepositoryProvider =
    AutoDisposeProvider<IUserExercisesRepository>.internal(
      userExercisesRepository,
      name: r'userExercisesRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userExercisesRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserExercisesRepositoryRef =
    AutoDisposeProviderRef<IUserExercisesRepository>;
String _$workoutCategoryHash() => r'4df32374cbfc91de7b2fd46b51d14410288f5c42';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [workoutCategory].
@ProviderFor(workoutCategory)
const workoutCategoryProvider = WorkoutCategoryFamily();

/// See also [workoutCategory].
class WorkoutCategoryFamily extends Family<AsyncValue<WorkoutCategory>> {
  /// See also [workoutCategory].
  const WorkoutCategoryFamily();

  /// See also [workoutCategory].
  WorkoutCategoryProvider call(int id) {
    return WorkoutCategoryProvider(id);
  }

  @override
  WorkoutCategoryProvider getProviderOverride(
    covariant WorkoutCategoryProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workoutCategoryProvider';
}

/// See also [workoutCategory].
class WorkoutCategoryProvider
    extends AutoDisposeFutureProvider<WorkoutCategory> {
  /// See also [workoutCategory].
  WorkoutCategoryProvider(int id)
    : this._internal(
        (ref) => workoutCategory(ref as WorkoutCategoryRef, id),
        from: workoutCategoryProvider,
        name: r'workoutCategoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$workoutCategoryHash,
        dependencies: WorkoutCategoryFamily._dependencies,
        allTransitiveDependencies:
            WorkoutCategoryFamily._allTransitiveDependencies,
        id: id,
      );

  WorkoutCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<WorkoutCategory> Function(WorkoutCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutCategoryProvider._internal(
        (ref) => create(ref as WorkoutCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WorkoutCategory> createElement() {
    return _WorkoutCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutCategoryProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkoutCategoryRef on AutoDisposeFutureProviderRef<WorkoutCategory> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WorkoutCategoryProviderElement
    extends AutoDisposeFutureProviderElement<WorkoutCategory>
    with WorkoutCategoryRef {
  _WorkoutCategoryProviderElement(super.provider);

  @override
  int get id => (origin as WorkoutCategoryProvider).id;
}

String _$programsByCategoryHash() =>
    r'0e5036cbb7e43dac3d1fc2f3303b510521d56ee4';

/// See also [programsByCategory].
@ProviderFor(programsByCategory)
const programsByCategoryProvider = ProgramsByCategoryFamily();

/// See also [programsByCategory].
class ProgramsByCategoryFamily
    extends Family<AsyncValue<List<WorkoutProgram>>> {
  /// See also [programsByCategory].
  const ProgramsByCategoryFamily();

  /// See also [programsByCategory].
  ProgramsByCategoryProvider call(int categoryId) {
    return ProgramsByCategoryProvider(categoryId);
  }

  @override
  ProgramsByCategoryProvider getProviderOverride(
    covariant ProgramsByCategoryProvider provider,
  ) {
    return call(provider.categoryId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'programsByCategoryProvider';
}

/// See also [programsByCategory].
class ProgramsByCategoryProvider
    extends AutoDisposeFutureProvider<List<WorkoutProgram>> {
  /// See also [programsByCategory].
  ProgramsByCategoryProvider(int categoryId)
    : this._internal(
        (ref) => programsByCategory(ref as ProgramsByCategoryRef, categoryId),
        from: programsByCategoryProvider,
        name: r'programsByCategoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$programsByCategoryHash,
        dependencies: ProgramsByCategoryFamily._dependencies,
        allTransitiveDependencies:
            ProgramsByCategoryFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  ProgramsByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final int categoryId;

  @override
  Override overrideWith(
    FutureOr<List<WorkoutProgram>> Function(ProgramsByCategoryRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProgramsByCategoryProvider._internal(
        (ref) => create(ref as ProgramsByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WorkoutProgram>> createElement() {
    return _ProgramsByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgramsByCategoryProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProgramsByCategoryRef
    on AutoDisposeFutureProviderRef<List<WorkoutProgram>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _ProgramsByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<WorkoutProgram>>
    with ProgramsByCategoryRef {
  _ProgramsByCategoryProviderElement(super.provider);

  @override
  int get categoryId => (origin as ProgramsByCategoryProvider).categoryId;
}

String _$workoutProgramDetailsHash() =>
    r'3f343eff1314d667aefc58bc7fa31cc205ac348e';

/// See also [workoutProgramDetails].
@ProviderFor(workoutProgramDetails)
const workoutProgramDetailsProvider = WorkoutProgramDetailsFamily();

/// See also [workoutProgramDetails].
class WorkoutProgramDetailsFamily extends Family<AsyncValue<WorkoutProgram>> {
  /// See also [workoutProgramDetails].
  const WorkoutProgramDetailsFamily();

  /// See also [workoutProgramDetails].
  WorkoutProgramDetailsProvider call(int id) {
    return WorkoutProgramDetailsProvider(id);
  }

  @override
  WorkoutProgramDetailsProvider getProviderOverride(
    covariant WorkoutProgramDetailsProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workoutProgramDetailsProvider';
}

/// See also [workoutProgramDetails].
class WorkoutProgramDetailsProvider
    extends AutoDisposeFutureProvider<WorkoutProgram> {
  /// See also [workoutProgramDetails].
  WorkoutProgramDetailsProvider(int id)
    : this._internal(
        (ref) => workoutProgramDetails(ref as WorkoutProgramDetailsRef, id),
        from: workoutProgramDetailsProvider,
        name: r'workoutProgramDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$workoutProgramDetailsHash,
        dependencies: WorkoutProgramDetailsFamily._dependencies,
        allTransitiveDependencies:
            WorkoutProgramDetailsFamily._allTransitiveDependencies,
        id: id,
      );

  WorkoutProgramDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<WorkoutProgram> Function(WorkoutProgramDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutProgramDetailsProvider._internal(
        (ref) => create(ref as WorkoutProgramDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WorkoutProgram> createElement() {
    return _WorkoutProgramDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutProgramDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkoutProgramDetailsRef on AutoDisposeFutureProviderRef<WorkoutProgram> {
  /// The parameter `id` of this provider.
  int get id;
}

class _WorkoutProgramDetailsProviderElement
    extends AutoDisposeFutureProviderElement<WorkoutProgram>
    with WorkoutProgramDetailsRef {
  _WorkoutProgramDetailsProviderElement(super.provider);

  @override
  int get id => (origin as WorkoutProgramDetailsProvider).id;
}

String _$paginatedWorkoutCategoriesHash() =>
    r'4d9d37c6c33f4fd36eb0aa76cd93fda718b80ebc';

/// ПАГИНАЦИЯ КАТЕГОРИЙ
///
/// Copied from [PaginatedWorkoutCategories].
@ProviderFor(PaginatedWorkoutCategories)
final paginatedWorkoutCategoriesProvider =
    AutoDisposeAsyncNotifierProvider<
      PaginatedWorkoutCategories,
      List<WorkoutCategory>
    >.internal(
      PaginatedWorkoutCategories.new,
      name: r'paginatedWorkoutCategoriesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paginatedWorkoutCategoriesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PaginatedWorkoutCategories =
    AutoDisposeAsyncNotifier<List<WorkoutCategory>>;
String _$userProgramsHash() => r'63cb0b9ee0d44b98ef8e336b68fdeeabd4c9f1a8';

abstract class _$UserPrograms
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkoutProgram>> {
  late final int userId;

  FutureOr<List<WorkoutProgram>> build(int userId);
}

/// Управление программами пользователя
///
/// Copied from [UserPrograms].
@ProviderFor(UserPrograms)
const userProgramsProvider = UserProgramsFamily();

/// Управление программами пользователя
///
/// Copied from [UserPrograms].
class UserProgramsFamily extends Family<AsyncValue<List<WorkoutProgram>>> {
  /// Управление программами пользователя
  ///
  /// Copied from [UserPrograms].
  const UserProgramsFamily();

  /// Управление программами пользователя
  ///
  /// Copied from [UserPrograms].
  UserProgramsProvider call(int userId) {
    return UserProgramsProvider(userId);
  }

  @override
  UserProgramsProvider getProviderOverride(
    covariant UserProgramsProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userProgramsProvider';
}

/// Управление программами пользователя
///
/// Copied from [UserPrograms].
class UserProgramsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          UserPrograms,
          List<WorkoutProgram>
        > {
  /// Управление программами пользователя
  ///
  /// Copied from [UserPrograms].
  UserProgramsProvider(int userId)
    : this._internal(
        () => UserPrograms()..userId = userId,
        from: userProgramsProvider,
        name: r'userProgramsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userProgramsHash,
        dependencies: UserProgramsFamily._dependencies,
        allTransitiveDependencies:
            UserProgramsFamily._allTransitiveDependencies,
        userId: userId,
      );

  UserProgramsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  FutureOr<List<WorkoutProgram>> runNotifierBuild(
    covariant UserPrograms notifier,
  ) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(UserPrograms Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserProgramsProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserPrograms, List<WorkoutProgram>>
  createElement() {
    return _UserProgramsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProgramsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserProgramsRef
    on AutoDisposeAsyncNotifierProviderRef<List<WorkoutProgram>> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _UserProgramsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          UserPrograms,
          List<WorkoutProgram>
        >
    with UserProgramsRef {
  _UserProgramsProviderElement(super.provider);

  @override
  int get userId => (origin as UserProgramsProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
