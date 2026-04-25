// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<WorkoutProgram> get programs => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutCategoryCopyWith<WorkoutCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCategoryCopyWith<$Res> {
  factory $WorkoutCategoryCopyWith(
    WorkoutCategory value,
    $Res Function(WorkoutCategory) then,
  ) = _$WorkoutCategoryCopyWithImpl<$Res, WorkoutCategory>;
  @useResult
  $Res call({
    int id,
    String name,
    String image,
    String? description,
    List<WorkoutProgram> programs,
  });
}

/// @nodoc
class _$WorkoutCategoryCopyWithImpl<$Res, $Val extends WorkoutCategory>
    implements $WorkoutCategoryCopyWith<$Res> {
  _$WorkoutCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? description = freezed,
    Object? programs = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            programs: null == programs
                ? _value.programs
                : programs // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutProgram>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutCategoryImplCopyWith<$Res>
    implements $WorkoutCategoryCopyWith<$Res> {
  factory _$$WorkoutCategoryImplCopyWith(
    _$WorkoutCategoryImpl value,
    $Res Function(_$WorkoutCategoryImpl) then,
  ) = __$$WorkoutCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String image,
    String? description,
    List<WorkoutProgram> programs,
  });
}

/// @nodoc
class __$$WorkoutCategoryImplCopyWithImpl<$Res>
    extends _$WorkoutCategoryCopyWithImpl<$Res, _$WorkoutCategoryImpl>
    implements _$$WorkoutCategoryImplCopyWith<$Res> {
  __$$WorkoutCategoryImplCopyWithImpl(
    _$WorkoutCategoryImpl _value,
    $Res Function(_$WorkoutCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? description = freezed,
    Object? programs = null,
  }) {
    return _then(
      _$WorkoutCategoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        programs: null == programs
            ? _value._programs
            : programs // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutProgram>,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutCategoryImpl implements _WorkoutCategory {
  const _$WorkoutCategoryImpl({
    required this.id,
    required this.name,
    required this.image,
    this.description,
    required final List<WorkoutProgram> programs,
  }) : _programs = programs;

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String? description;
  final List<WorkoutProgram> _programs;
  @override
  List<WorkoutProgram> get programs {
    if (_programs is EqualUnmodifiableListView) return _programs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programs);
  }

  @override
  String toString() {
    return 'WorkoutCategory(id: $id, name: $name, image: $image, description: $description, programs: $programs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._programs, _programs));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    image,
    description,
    const DeepCollectionEquality().hash(_programs),
  );

  /// Create a copy of WorkoutCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutCategoryImplCopyWith<_$WorkoutCategoryImpl> get copyWith =>
      __$$WorkoutCategoryImplCopyWithImpl<_$WorkoutCategoryImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutCategory implements WorkoutCategory {
  const factory _WorkoutCategory({
    required final int id,
    required final String name,
    required final String image,
    final String? description,
    required final List<WorkoutProgram> programs,
  }) = _$WorkoutCategoryImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  String? get description;
  @override
  List<WorkoutProgram> get programs;

  /// Create a copy of WorkoutCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutCategoryImplCopyWith<_$WorkoutCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
