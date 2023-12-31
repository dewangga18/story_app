// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddStoryPayload _$AddStoryPayloadFromJson(Map<String, dynamic> json) {
  return _AddStoryPayload.fromJson(json);
}

/// @nodoc
mixin _$AddStoryPayload {
  String get description => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  List<int> get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddStoryPayloadCopyWith<AddStoryPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryPayloadCopyWith<$Res> {
  factory $AddStoryPayloadCopyWith(
          AddStoryPayload value, $Res Function(AddStoryPayload) then) =
      _$AddStoryPayloadCopyWithImpl<$Res, AddStoryPayload>;
  @useResult
  $Res call({String description, String fileName, List<int> photo});
}

/// @nodoc
class _$AddStoryPayloadCopyWithImpl<$Res, $Val extends AddStoryPayload>
    implements $AddStoryPayloadCopyWith<$Res> {
  _$AddStoryPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? fileName = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStoryPayloadImplCopyWith<$Res>
    implements $AddStoryPayloadCopyWith<$Res> {
  factory _$$AddStoryPayloadImplCopyWith(_$AddStoryPayloadImpl value,
          $Res Function(_$AddStoryPayloadImpl) then) =
      __$$AddStoryPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String fileName, List<int> photo});
}

/// @nodoc
class __$$AddStoryPayloadImplCopyWithImpl<$Res>
    extends _$AddStoryPayloadCopyWithImpl<$Res, _$AddStoryPayloadImpl>
    implements _$$AddStoryPayloadImplCopyWith<$Res> {
  __$$AddStoryPayloadImplCopyWithImpl(
      _$AddStoryPayloadImpl _value, $Res Function(_$AddStoryPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? fileName = null,
    Object? photo = null,
  }) {
    return _then(_$AddStoryPayloadImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value._photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddStoryPayloadImpl implements _AddStoryPayload {
  const _$AddStoryPayloadImpl(
      {required this.description,
      required this.fileName,
      required final List<int> photo})
      : _photo = photo;

  factory _$AddStoryPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddStoryPayloadImplFromJson(json);

  @override
  final String description;
  @override
  final String fileName;
  final List<int> _photo;
  @override
  List<int> get photo {
    if (_photo is EqualUnmodifiableListView) return _photo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photo);
  }

  @override
  String toString() {
    return 'AddStoryPayload(description: $description, fileName: $fileName, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoryPayloadImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            const DeepCollectionEquality().equals(other._photo, _photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, fileName,
      const DeepCollectionEquality().hash(_photo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoryPayloadImplCopyWith<_$AddStoryPayloadImpl> get copyWith =>
      __$$AddStoryPayloadImplCopyWithImpl<_$AddStoryPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddStoryPayloadImplToJson(
      this,
    );
  }
}

abstract class _AddStoryPayload implements AddStoryPayload {
  const factory _AddStoryPayload(
      {required final String description,
      required final String fileName,
      required final List<int> photo}) = _$AddStoryPayloadImpl;

  factory _AddStoryPayload.fromJson(Map<String, dynamic> json) =
      _$AddStoryPayloadImpl.fromJson;

  @override
  String get description;
  @override
  String get fileName;
  @override
  List<int> get photo;
  @override
  @JsonKey(ignore: true)
  _$$AddStoryPayloadImplCopyWith<_$AddStoryPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
