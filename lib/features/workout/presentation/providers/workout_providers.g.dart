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

String _$allUserProgramsHash() => r'92c421a088af227e0665503a3b7a089d7849027f';

/// Мои тренировки (Планы + Избранное)
///
/// Copied from [allUserPrograms].
@ProviderFor(allUserPrograms)
const allUserProgramsProvider = AllUserProgramsFamily();

/// Мои тренировки (Планы + Избранное)
///
/// Copied from [allUserPrograms].
class AllUserProgramsFamily extends Family<AsyncValue<List<WorkoutProgram>>> {
  /// Мои тренировки (Планы + Избранное)
  ///
  /// Copied from [allUserPrograms].
  const AllUserProgramsFamily();

  /// Мои тренировки (Планы + Избранное)
  ///
  /// Copied from [allUserPrograms].
  AllUserProgramsProvider call(int userId) {
    return AllUserProgramsProvider(userId);
  }

  @override
  AllUserProgramsProvider getProviderOverride(
    covariant AllUserProgramsProvider provider,
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
  String? get name => r'allUserProgramsProvider';
}

/// Мои тренировки (Планы + Избранное)
///
/// Copied from [allUserPrograms].
class AllUserProgramsProvider
    extends AutoDisposeFutureProvider<List<WorkoutProgram>> {
  /// Мои тренировки (Планы + Избранное)
  ///
  /// Copied from [allUserPrograms].
  AllUserProgramsProvider(int userId)
    : this._internal(
        (ref) => allUserPrograms(ref as AllUserProgramsRef, userId),
        from: allUserProgramsProvider,
        name: r'allUserProgramsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$allUserProgramsHash,
        dependencies: AllUserProgramsFamily._dependencies,
        allTransitiveDependencies:
            AllUserProgramsFamily._allTransitiveDependencies,
        userId: userId,
      );

  AllUserProgramsProvider._internal(
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
  Override overrideWith(
    FutureOr<List<WorkoutProgram>> Function(AllUserProgramsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllUserProgramsProvider._internal(
        (ref) => create(ref as AllUserProgramsRef),
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
  AutoDisposeFutureProviderElement<List<WorkoutProgram>> createElement() {
    return _AllUserProgramsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllUserProgramsProvider && other.userId == userId;
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
mixin AllUserProgramsRef on AutoDisposeFutureProviderRef<List<WorkoutProgram>> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _AllUserProgramsProviderElement
    extends AutoDisposeFutureProviderElement<List<WorkoutProgram>>
    with AllUserProgramsRef {
  _AllUserProgramsProviderElement(super.provider);

  @override
  int get userId => (origin as AllUserProgramsProvider).userId;
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
String _$paginatedProgramsByCategoryHash() =>
    r'ead212292ccfca143df5ee828b55144b1067c1d6';

abstract class _$PaginatedProgramsByCategory
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkoutProgram>> {
  late final int categoryId;

  FutureOr<List<WorkoutProgram>> build(int categoryId);
}

/// ПАГИНАЦИЯ ПРОГРАММ ВНУТРИ КАТЕГОРИИ
///
/// Copied from [PaginatedProgramsByCategory].
@ProviderFor(PaginatedProgramsByCategory)
const paginatedProgramsByCategoryProvider = PaginatedProgramsByCategoryFamily();

/// ПАГИНАЦИЯ ПРОГРАММ ВНУТРИ КАТЕГОРИИ
///
/// Copied from [PaginatedProgramsByCategory].
class PaginatedProgramsByCategoryFamily
    extends Family<AsyncValue<List<WorkoutProgram>>> {
  /// ПАГИНАЦИЯ ПРОГРАММ ВНУТРИ КАТЕГОРИИ
  ///
  /// Copied from [PaginatedProgramsByCategory].
  const PaginatedProgramsByCategoryFamily();

  /// ПАГИНАЦИЯ ПРОГРАММ ВНУТРИ КАТЕГОРИИ
  ///
  /// Copied from [PaginatedProgramsByCategory].
  PaginatedProgramsByCategoryProvider call(int categoryId) {
    return PaginatedProgramsByCategoryProvider(categoryId);
  }

  @override
  PaginatedProgramsByCategoryProvider getProviderOverride(
    covariant PaginatedProgramsByCategoryProvider provider,
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
  String? get name => r'paginatedProgramsByCategoryProvider';
}

/// ПАГИНАЦИЯ ПРОГРАММ ВНУТРИ КАТЕГОРИИ
///
/// Copied from [PaginatedProgramsByCategory].
class PaginatedProgramsByCategoryProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          PaginatedProgramsByCategory,
          List<WorkoutProgram>
        > {
  /// ПАГИНАЦИЯ ПРОГРАММ ВНУТРИ КАТЕГОРИИ
  ///
  /// Copied from [PaginatedProgramsByCategory].
  PaginatedProgramsByCategoryProvider(int categoryId)
    : this._internal(
        () => PaginatedProgramsByCategory()..categoryId = categoryId,
        from: paginatedProgramsByCategoryProvider,
        name: r'paginatedProgramsByCategoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$paginatedProgramsByCategoryHash,
        dependencies: PaginatedProgramsByCategoryFamily._dependencies,
        allTransitiveDependencies:
            PaginatedProgramsByCategoryFamily._allTransitiveDependencies,
        categoryId: categoryId,
      );

  PaginatedProgramsByCategoryProvider._internal(
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
  FutureOr<List<WorkoutProgram>> runNotifierBuild(
    covariant PaginatedProgramsByCategory notifier,
  ) {
    return notifier.build(categoryId);
  }

  @override
  Override overrideWith(PaginatedProgramsByCategory Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedProgramsByCategoryProvider._internal(
        () => create()..categoryId = categoryId,
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
  AutoDisposeAsyncNotifierProviderElement<
    PaginatedProgramsByCategory,
    List<WorkoutProgram>
  >
  createElement() {
    return _PaginatedProgramsByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedProgramsByCategoryProvider &&
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
mixin PaginatedProgramsByCategoryRef
    on AutoDisposeAsyncNotifierProviderRef<List<WorkoutProgram>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;
}

class _PaginatedProgramsByCategoryProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          PaginatedProgramsByCategory,
          List<WorkoutProgram>
        >
    with PaginatedProgramsByCategoryRef {
  _PaginatedProgramsByCategoryProviderElement(super.provider);

  @override
  int get categoryId =>
      (origin as PaginatedProgramsByCategoryProvider).categoryId;
}

String _$plannedProgramsHash() => r'7238ea0e079ed9ee3802c8da15f6d98455c50e35';

abstract class _$PlannedPrograms
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkoutProgram>> {
  late final int userId;

  FutureOr<List<WorkoutProgram>> build(int userId);
}

/// Текущие программы (Планы)
///
/// Copied from [PlannedPrograms].
@ProviderFor(PlannedPrograms)
const plannedProgramsProvider = PlannedProgramsFamily();

/// Текущие программы (Планы)
///
/// Copied from [PlannedPrograms].
class PlannedProgramsFamily extends Family<AsyncValue<List<WorkoutProgram>>> {
  /// Текущие программы (Планы)
  ///
  /// Copied from [PlannedPrograms].
  const PlannedProgramsFamily();

  /// Текущие программы (Планы)
  ///
  /// Copied from [PlannedPrograms].
  PlannedProgramsProvider call(int userId) {
    return PlannedProgramsProvider(userId);
  }

  @override
  PlannedProgramsProvider getProviderOverride(
    covariant PlannedProgramsProvider provider,
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
  String? get name => r'plannedProgramsProvider';
}

/// Текущие программы (Планы)
///
/// Copied from [PlannedPrograms].
class PlannedProgramsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          PlannedPrograms,
          List<WorkoutProgram>
        > {
  /// Текущие программы (Планы)
  ///
  /// Copied from [PlannedPrograms].
  PlannedProgramsProvider(int userId)
    : this._internal(
        () => PlannedPrograms()..userId = userId,
        from: plannedProgramsProvider,
        name: r'plannedProgramsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$plannedProgramsHash,
        dependencies: PlannedProgramsFamily._dependencies,
        allTransitiveDependencies:
            PlannedProgramsFamily._allTransitiveDependencies,
        userId: userId,
      );

  PlannedProgramsProvider._internal(
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
    covariant PlannedPrograms notifier,
  ) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(PlannedPrograms Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlannedProgramsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PlannedPrograms, List<WorkoutProgram>>
  createElement() {
    return _PlannedProgramsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlannedProgramsProvider && other.userId == userId;
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
mixin PlannedProgramsRef
    on AutoDisposeAsyncNotifierProviderRef<List<WorkoutProgram>> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _PlannedProgramsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          PlannedPrograms,
          List<WorkoutProgram>
        >
    with PlannedProgramsRef {
  _PlannedProgramsProviderElement(super.provider);

  @override
  int get userId => (origin as PlannedProgramsProvider).userId;
}

String _$favoriteProgramsHash() => r'4def4509433bbccf594ab5354c30361a86307c6a';

abstract class _$FavoritePrograms
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkoutProgram>> {
  late final int userId;

  FutureOr<List<WorkoutProgram>> build(int userId);
}

/// Избранное
///
/// Copied from [FavoritePrograms].
@ProviderFor(FavoritePrograms)
const favoriteProgramsProvider = FavoriteProgramsFamily();

/// Избранное
///
/// Copied from [FavoritePrograms].
class FavoriteProgramsFamily extends Family<AsyncValue<List<WorkoutProgram>>> {
  /// Избранное
  ///
  /// Copied from [FavoritePrograms].
  const FavoriteProgramsFamily();

  /// Избранное
  ///
  /// Copied from [FavoritePrograms].
  FavoriteProgramsProvider call(int userId) {
    return FavoriteProgramsProvider(userId);
  }

  @override
  FavoriteProgramsProvider getProviderOverride(
    covariant FavoriteProgramsProvider provider,
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
  String? get name => r'favoriteProgramsProvider';
}

/// Избранное
///
/// Copied from [FavoritePrograms].
class FavoriteProgramsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          FavoritePrograms,
          List<WorkoutProgram>
        > {
  /// Избранное
  ///
  /// Copied from [FavoritePrograms].
  FavoriteProgramsProvider(int userId)
    : this._internal(
        () => FavoritePrograms()..userId = userId,
        from: favoriteProgramsProvider,
        name: r'favoriteProgramsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$favoriteProgramsHash,
        dependencies: FavoriteProgramsFamily._dependencies,
        allTransitiveDependencies:
            FavoriteProgramsFamily._allTransitiveDependencies,
        userId: userId,
      );

  FavoriteProgramsProvider._internal(
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
    covariant FavoritePrograms notifier,
  ) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(FavoritePrograms Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavoriteProgramsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<
    FavoritePrograms,
    List<WorkoutProgram>
  >
  createElement() {
    return _FavoriteProgramsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteProgramsProvider && other.userId == userId;
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
mixin FavoriteProgramsRef
    on AutoDisposeAsyncNotifierProviderRef<List<WorkoutProgram>> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _FavoriteProgramsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          FavoritePrograms,
          List<WorkoutProgram>
        >
    with FavoriteProgramsRef {
  _FavoriteProgramsProviderElement(super.provider);

  @override
  int get userId => (origin as FavoriteProgramsProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
