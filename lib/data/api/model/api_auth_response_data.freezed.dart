// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_auth_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiAuthResponseData _$ApiAuthResponseDataFromJson(Map<String, dynamic> json) {
  return _ApiAuthResponseData.fromJson(json);
}

/// @nodoc
mixin _$ApiAuthResponseData {
  @JsonKey(name: 'token')
  String? get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiAuthResponseDataCopyWith<ApiAuthResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiAuthResponseDataCopyWith<$Res> {
  factory $ApiAuthResponseDataCopyWith(
          ApiAuthResponseData value, $Res Function(ApiAuthResponseData) then) =
      _$ApiAuthResponseDataCopyWithImpl<$Res, ApiAuthResponseData>;
  @useResult
  $Res call({@JsonKey(name: 'token') String? accessToken});
}

/// @nodoc
class _$ApiAuthResponseDataCopyWithImpl<$Res, $Val extends ApiAuthResponseData>
    implements $ApiAuthResponseDataCopyWith<$Res> {
  _$ApiAuthResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiAuthResponseDataImplCopyWith<$Res>
    implements $ApiAuthResponseDataCopyWith<$Res> {
  factory _$$ApiAuthResponseDataImplCopyWith(_$ApiAuthResponseDataImpl value,
          $Res Function(_$ApiAuthResponseDataImpl) then) =
      __$$ApiAuthResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'token') String? accessToken});
}

/// @nodoc
class __$$ApiAuthResponseDataImplCopyWithImpl<$Res>
    extends _$ApiAuthResponseDataCopyWithImpl<$Res, _$ApiAuthResponseDataImpl>
    implements _$$ApiAuthResponseDataImplCopyWith<$Res> {
  __$$ApiAuthResponseDataImplCopyWithImpl(_$ApiAuthResponseDataImpl _value,
      $Res Function(_$ApiAuthResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
  }) {
    return _then(_$ApiAuthResponseDataImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiAuthResponseDataImpl implements _ApiAuthResponseData {
  const _$ApiAuthResponseDataImpl({@JsonKey(name: 'token') this.accessToken});

  factory _$ApiAuthResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiAuthResponseDataImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String? accessToken;

  @override
  String toString() {
    return 'ApiAuthResponseData(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiAuthResponseDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiAuthResponseDataImplCopyWith<_$ApiAuthResponseDataImpl> get copyWith =>
      __$$ApiAuthResponseDataImplCopyWithImpl<_$ApiAuthResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiAuthResponseDataImplToJson(
      this,
    );
  }
}

abstract class _ApiAuthResponseData implements ApiAuthResponseData {
  const factory _ApiAuthResponseData(
          {@JsonKey(name: 'token') final String? accessToken}) =
      _$ApiAuthResponseDataImpl;

  factory _ApiAuthResponseData.fromJson(Map<String, dynamic> json) =
      _$ApiAuthResponseDataImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String? get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$ApiAuthResponseDataImplCopyWith<_$ApiAuthResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
