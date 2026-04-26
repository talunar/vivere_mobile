// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
    _$AuthInitialImpl value,
    $Res Function(_$AuthInitialImpl) then,
  ) = __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
    _$AuthInitialImpl _value,
    $Res Function(_$AuthInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl implements AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthState {
  const factory AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
    _$AuthLoadingImpl value,
    $Res Function(_$AuthLoadingImpl) then,
  ) = __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
    _$AuthLoadingImpl _value,
    $Res Function(_$AuthLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoadingImpl implements AuthLoading {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  const factory AuthLoading() = _$AuthLoadingImpl;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(
    _$UnauthenticatedImpl value,
    $Res Function(_$UnauthenticatedImpl) then,
  ) = __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
    _$UnauthenticatedImpl _value,
    $Res Function(_$UnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthenticatedImpl implements Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$RegistrationStepNameImplCopyWith<$Res> {
  factory _$$RegistrationStepNameImplCopyWith(
    _$RegistrationStepNameImpl value,
    $Res Function(_$RegistrationStepNameImpl) then,
  ) = __$$RegistrationStepNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String nickName, String password});
}

/// @nodoc
class __$$RegistrationStepNameImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$RegistrationStepNameImpl>
    implements _$$RegistrationStepNameImplCopyWith<$Res> {
  __$$RegistrationStepNameImplCopyWithImpl(
    _$RegistrationStepNameImpl _value,
    $Res Function(_$RegistrationStepNameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nickName = null, Object? password = null}) {
    return _then(
      _$RegistrationStepNameImpl(
        nickName: null == nickName
            ? _value.nickName
            : nickName // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RegistrationStepNameImpl implements RegistrationStepName {
  const _$RegistrationStepNameImpl({
    required this.nickName,
    required this.password,
  });

  @override
  final String nickName;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthState.registrationStepName(nickName: $nickName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationStepNameImpl &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nickName, password);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationStepNameImplCopyWith<_$RegistrationStepNameImpl>
  get copyWith =>
      __$$RegistrationStepNameImplCopyWithImpl<_$RegistrationStepNameImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) {
    return registrationStepName(nickName, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) {
    return registrationStepName?.call(nickName, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (registrationStepName != null) {
      return registrationStepName(nickName, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) {
    return registrationStepName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) {
    return registrationStepName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (registrationStepName != null) {
      return registrationStepName(this);
    }
    return orElse();
  }
}

abstract class RegistrationStepName implements AuthState {
  const factory RegistrationStepName({
    required final String nickName,
    required final String password,
  }) = _$RegistrationStepNameImpl;

  String get nickName;
  String get password;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationStepNameImplCopyWith<_$RegistrationStepNameImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegistrationStepPhysicalImplCopyWith<$Res> {
  factory _$$RegistrationStepPhysicalImplCopyWith(
    _$RegistrationStepPhysicalImpl value,
    $Res Function(_$RegistrationStepPhysicalImpl) then,
  ) = __$$RegistrationStepPhysicalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String nickName,
    String password,
    String firstName,
    String lastName,
    String email,
  });
}

/// @nodoc
class __$$RegistrationStepPhysicalImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$RegistrationStepPhysicalImpl>
    implements _$$RegistrationStepPhysicalImplCopyWith<$Res> {
  __$$RegistrationStepPhysicalImplCopyWithImpl(
    _$RegistrationStepPhysicalImpl _value,
    $Res Function(_$RegistrationStepPhysicalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickName = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
  }) {
    return _then(
      _$RegistrationStepPhysicalImpl(
        nickName: null == nickName
            ? _value.nickName
            : nickName // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RegistrationStepPhysicalImpl implements RegistrationStepPhysical {
  const _$RegistrationStepPhysicalImpl({
    required this.nickName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  final String nickName;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;

  @override
  String toString() {
    return 'AuthState.registrationStepPhysical(nickName: $nickName, password: $password, firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationStepPhysicalImpl &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nickName, password, firstName, lastName, email);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationStepPhysicalImplCopyWith<_$RegistrationStepPhysicalImpl>
  get copyWith =>
      __$$RegistrationStepPhysicalImplCopyWithImpl<
        _$RegistrationStepPhysicalImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) {
    return registrationStepPhysical(
      nickName,
      password,
      firstName,
      lastName,
      email,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) {
    return registrationStepPhysical?.call(
      nickName,
      password,
      firstName,
      lastName,
      email,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (registrationStepPhysical != null) {
      return registrationStepPhysical(
        nickName,
        password,
        firstName,
        lastName,
        email,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) {
    return registrationStepPhysical(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) {
    return registrationStepPhysical?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (registrationStepPhysical != null) {
      return registrationStepPhysical(this);
    }
    return orElse();
  }
}

abstract class RegistrationStepPhysical implements AuthState {
  const factory RegistrationStepPhysical({
    required final String nickName,
    required final String password,
    required final String firstName,
    required final String lastName,
    required final String email,
  }) = _$RegistrationStepPhysicalImpl;

  String get nickName;
  String get password;
  String get firstName;
  String get lastName;
  String get email;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationStepPhysicalImplCopyWith<_$RegistrationStepPhysicalImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileSetupRequiredImplCopyWith<$Res> {
  factory _$$ProfileSetupRequiredImplCopyWith(
    _$ProfileSetupRequiredImpl value,
    $Res Function(_$ProfileSetupRequiredImpl) then,
  ) = __$$ProfileSetupRequiredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthUser user});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ProfileSetupRequiredImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ProfileSetupRequiredImpl>
    implements _$$ProfileSetupRequiredImplCopyWith<$Res> {
  __$$ProfileSetupRequiredImplCopyWithImpl(
    _$ProfileSetupRequiredImpl _value,
    $Res Function(_$ProfileSetupRequiredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$ProfileSetupRequiredImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AuthUser,
      ),
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$ProfileSetupRequiredImpl implements ProfileSetupRequired {
  const _$ProfileSetupRequiredImpl(this.user);

  @override
  final AuthUser user;

  @override
  String toString() {
    return 'AuthState.profileSetupRequired(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSetupRequiredImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSetupRequiredImplCopyWith<_$ProfileSetupRequiredImpl>
  get copyWith =>
      __$$ProfileSetupRequiredImplCopyWithImpl<_$ProfileSetupRequiredImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) {
    return profileSetupRequired(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) {
    return profileSetupRequired?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (profileSetupRequired != null) {
      return profileSetupRequired(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) {
    return profileSetupRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) {
    return profileSetupRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (profileSetupRequired != null) {
      return profileSetupRequired(this);
    }
    return orElse();
  }
}

abstract class ProfileSetupRequired implements AuthState {
  const factory ProfileSetupRequired(final AuthUser user) =
      _$ProfileSetupRequiredImpl;

  AuthUser get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSetupRequiredImplCopyWith<_$ProfileSetupRequiredImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
    _$AuthenticatedImpl value,
    $Res Function(_$AuthenticatedImpl) then,
  ) = __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthUser user});

  $AuthUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
    _$AuthenticatedImpl _value,
    $Res Function(_$AuthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$AuthenticatedImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AuthUser,
      ),
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res> get user {
    return $AuthUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedImpl implements Authenticated {
  const _$AuthenticatedImpl(this.user);

  @override
  final AuthUser user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated(final AuthUser user) = _$AuthenticatedImpl;

  AuthUser get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
    _$AuthErrorImpl value,
    $Res Function(_$AuthErrorImpl) then,
  ) = __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Object? error});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
    _$AuthErrorImpl _value,
    $Res Function(_$AuthErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = freezed}) {
    return _then(
      _$AuthErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        error: freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  const _$AuthErrorImpl(this.message, {this.error});

  @override
  final String message;
  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthState.error(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unauthenticated,
    required TResult Function(String nickName, String password)
    registrationStepName,
    required TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )
    registrationStepPhysical,
    required TResult Function(AuthUser user) profileSetupRequired,
    required TResult Function(AuthUser user) authenticated,
    required TResult Function(String message, Object? error) error,
  }) {
    return error(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unauthenticated,
    TResult? Function(String nickName, String password)? registrationStepName,
    TResult? Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult? Function(AuthUser user)? profileSetupRequired,
    TResult? Function(AuthUser user)? authenticated,
    TResult? Function(String message, Object? error)? error,
  }) {
    return error?.call(message, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unauthenticated,
    TResult Function(String nickName, String password)? registrationStepName,
    TResult Function(
      String nickName,
      String password,
      String firstName,
      String lastName,
      String email,
    )?
    registrationStepPhysical,
    TResult Function(AuthUser user)? profileSetupRequired,
    TResult Function(AuthUser user)? authenticated,
    TResult Function(String message, Object? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(RegistrationStepName value) registrationStepName,
    required TResult Function(RegistrationStepPhysical value)
    registrationStepPhysical,
    required TResult Function(ProfileSetupRequired value) profileSetupRequired,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(AuthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(RegistrationStepName value)? registrationStepName,
    TResult? Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult? Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(AuthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(RegistrationStepName value)? registrationStepName,
    TResult Function(RegistrationStepPhysical value)? registrationStepPhysical,
    TResult Function(ProfileSetupRequired value)? profileSetupRequired,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(AuthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError(final String message, {final Object? error}) =
      _$AuthErrorImpl;

  String get message;
  Object? get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
