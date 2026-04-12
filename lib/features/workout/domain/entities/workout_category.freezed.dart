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
  List<int> get exerciseIds => throw _privateConstructorUsedError;

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
  $Res call({int id, String name, String image, List<int> exerciseIds});
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
    Object? exerciseIds = null,
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
            exerciseIds: null == exerciseIds
                ? _value.exerciseIds
                : exerciseIds // ignore: cast_nullable_to_non_nullable
                      as List<int>,
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
  $Res call({int id, String name, String image, List<int> exerciseIds});
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
    Object? exerciseIds = null,
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
        exerciseIds: null == exerciseIds
            ? _value._exerciseIds
            : exerciseIds // ignore: cast_nullable_to_non_nullable
                  as List<int>,
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
    required final List<int> exerciseIds,
  }) : _exerciseIds = exerciseIds;

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  final List<int> _exerciseIds;
  @override
  List<int> get exerciseIds {
    if (_exerciseIds is EqualUnmodifiableListView) return _exerciseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exerciseIds);
  }

  @override
  String toString() {
    return 'WorkoutCategory(id: $id, name: $name, image: $image, exerciseIds: $exerciseIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(
              other._exerciseIds,
              _exerciseIds,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    image,
    const DeepCollectionEquality().hash(_exerciseIds),
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
    required final List<int> exerciseIds,
  }) = _$WorkoutCategoryImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  List<int> get exerciseIds;

  /// Create a copy of WorkoutCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutCategoryImplCopyWith<_$WorkoutCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
