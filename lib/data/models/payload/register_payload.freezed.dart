// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterPayload _$RegisterPayloadFromJson(Map<String, dynamic> json) {
  return _RegisterPayload.fromJson(json);
}

/// @nodoc
mixin _$RegisterPayload {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterPayloadCopyWith<RegisterPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPayloadCopyWith<$Res> {
  factory $RegisterPayloadCopyWith(
          RegisterPayload value, $Res Function(RegisterPayload) then) =
      _$RegisterPayloadCopyWithImpl<$Res, RegisterPayload>;
  @useResult
  $Res call({String? name, String? email, String? password});
}

/// @nodoc
class _$RegisterPayloadCopyWithImpl<$Res, $Val extends RegisterPayload>
    implements $RegisterPayloadCopyWith<$Res> {
  _$RegisterPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPayloadImplCopyWith<$Res>
    implements $RegisterPayloadCopyWith<$Res> {
  factory _$$RegisterPayloadImplCopyWith(_$RegisterPayloadImpl value,
          $Res Function(_$RegisterPayloadImpl) then) =
      __$$RegisterPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? email, String? password});
}

/// @nodoc
class __$$RegisterPayloadImplCopyWithImpl<$Res>
    extends _$RegisterPayloadCopyWithImpl<$Res, _$RegisterPayloadImpl>
    implements _$$RegisterPayloadImplCopyWith<$Res> {
  __$$RegisterPayloadImplCopyWithImpl(
      _$RegisterPayloadImpl _value, $Res Function(_$RegisterPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$RegisterPayloadImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterPayloadImpl implements _RegisterPayload {
  const _$RegisterPayloadImpl({this.name, this.email, this.password});

  factory _$RegisterPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterPayloadImplFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'RegisterPayload(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPayloadImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPayloadImplCopyWith<_$RegisterPayloadImpl> get copyWith =>
      __$$RegisterPayloadImplCopyWithImpl<_$RegisterPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterPayloadImplToJson(
      this,
    );
  }
}

abstract class _RegisterPayload implements RegisterPayload {
  const factory _RegisterPayload(
      {final String? name,
      final String? email,
      final String? password}) = _$RegisterPayloadImpl;

  factory _RegisterPayload.fromJson(Map<String, dynamic> json) =
      _$RegisterPayloadImpl.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$RegisterPayloadImplCopyWith<_$RegisterPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
