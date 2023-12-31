// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserLocale {
  @HiveField(0)
  String? get locale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserLocaleCopyWith<UserLocale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocaleCopyWith<$Res> {
  factory $UserLocaleCopyWith(
          UserLocale value, $Res Function(UserLocale) then) =
      _$UserLocaleCopyWithImpl<$Res, UserLocale>;
  @useResult
  $Res call({@HiveField(0) String? locale});
}

/// @nodoc
class _$UserLocaleCopyWithImpl<$Res, $Val extends UserLocale>
    implements $UserLocaleCopyWith<$Res> {
  _$UserLocaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLocaleImplCopyWith<$Res>
    implements $UserLocaleCopyWith<$Res> {
  factory _$$UserLocaleImplCopyWith(
          _$UserLocaleImpl value, $Res Function(_$UserLocaleImpl) then) =
      __$$UserLocaleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? locale});
}

/// @nodoc
class __$$UserLocaleImplCopyWithImpl<$Res>
    extends _$UserLocaleCopyWithImpl<$Res, _$UserLocaleImpl>
    implements _$$UserLocaleImplCopyWith<$Res> {
  __$$UserLocaleImplCopyWithImpl(
      _$UserLocaleImpl _value, $Res Function(_$UserLocaleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$UserLocaleImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1)
class _$UserLocaleImpl extends _UserLocale {
  _$UserLocaleImpl({@HiveField(0) this.locale}) : super._();

  @override
  @HiveField(0)
  final String? locale;

  @override
  String toString() {
    return 'UserLocale(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLocaleImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLocaleImplCopyWith<_$UserLocaleImpl> get copyWith =>
      __$$UserLocaleImplCopyWithImpl<_$UserLocaleImpl>(this, _$identity);
}

abstract class _UserLocale extends UserLocale {
  factory _UserLocale({@HiveField(0) final String? locale}) = _$UserLocaleImpl;
  _UserLocale._() : super._();

  @override
  @HiveField(0)
  String? get locale;
  @override
  @JsonKey(ignore: true)
  _$$UserLocaleImplCopyWith<_$UserLocaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
