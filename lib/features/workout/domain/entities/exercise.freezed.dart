// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Exerciser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<Repeated> get repeats => throw _privateConstructorUsedError;

  /// Create a copy of Exerciser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciserCopyWith<Exerciser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciserCopyWith<$Res> {
  factory $ExerciserCopyWith(Exerciser value, $Res Function(Exerciser) then) =
      _$ExerciserCopyWithImpl<$Res, Exerciser>;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String image,
    List<Repeated> repeats,
  });
}

/// @nodoc
class _$ExerciserCopyWithImpl<$Res, $Val extends Exerciser>
    implements $ExerciserCopyWith<$Res> {
  _$ExerciserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Exerciser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? repeats = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            repeats: null == repeats
                ? _value.repeats
                : repeats // ignore: cast_nullable_to_non_nullable
                      as List<Repeated>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciserImplCopyWith<$Res>
    implements $ExerciserCopyWith<$Res> {
  factory _$$ExerciserImplCopyWith(
    _$ExerciserImpl value,
    $Res Function(_$ExerciserImpl) then,
  ) = __$$ExerciserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String image,
    List<Repeated> repeats,
  });
}

/// @nodoc
class __$$ExerciserImplCopyWithImpl<$Res>
    extends _$ExerciserCopyWithImpl<$Res, _$ExerciserImpl>
    implements _$$ExerciserImplCopyWith<$Res> {
  __$$ExerciserImplCopyWithImpl(
    _$ExerciserImpl _value,
    $Res Function(_$ExerciserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Exerciser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? repeats = null,
  }) {
    return _then(
      _$ExerciserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        repeats: null == repeats
            ? _value._repeats
            : repeats // ignore: cast_nullable_to_non_nullable
                  as List<Repeated>,
      ),
    );
  }
}

/// @nodoc

class _$ExerciserImpl implements _Exerciser {
  const _$ExerciserImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required final List<Repeated> repeats,
  }) : _repeats = repeats;

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;
  final List<Repeated> _repeats;
  @override
  List<Repeated> get repeats {
    if (_repeats is EqualUnmodifiableListView) return _repeats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repeats);
  }

  @override
  String toString() {
    return 'Exerciser(id: $id, name: $name, description: $description, image: $image, repeats: $repeats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._repeats, _repeats));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    image,
    const DeepCollectionEquality().hash(_repeats),
  );

  /// Create a copy of Exerciser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciserImplCopyWith<_$ExerciserImpl> get copyWith =>
      __$$ExerciserImplCopyWithImpl<_$ExerciserImpl>(this, _$identity);
}

abstract class _Exerciser implements Exerciser {
  const factory _Exerciser({
    required final int id,
    required final String name,
    required final String description,
    required final String image,
    required final List<Repeated> repeats,
  }) = _$ExerciserImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get image;
  @override
  List<Repeated> get repeats;

  /// Create a copy of Exerciser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciserImplCopyWith<_$ExerciserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
