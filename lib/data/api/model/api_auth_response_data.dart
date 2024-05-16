import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_auth_response_data.freezed.dart';
part 'api_auth_response_data.g.dart';

@freezed
class ApiAuthResponseData with _$ApiAuthResponseData {
  const factory ApiAuthResponseData({
    @JsonKey(name: 'token') String? accessToken,
  }) = _ApiAuthResponseData;

  factory ApiAuthResponseData.fromJson(Map<String, dynamic> json) =>
      _$ApiAuthResponseDataFromJson(json);
}
