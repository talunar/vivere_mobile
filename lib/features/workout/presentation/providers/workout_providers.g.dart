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
String _$topProgramsHash() => r'a182debcddfd5b2fffc59bc4943747e085df478e';

/// See also [topPrograms].
@ProviderFor(topPrograms)
final topProgramsProvider =
    AutoDisposeFutureProvider<List<WorkoutProgram>>.internal(
      topPrograms,
      name: r'topProgramsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$topProgramsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TopProgramsRef = AutoDisposeFutureProviderRef<List<WorkoutProgram>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
