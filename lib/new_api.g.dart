// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MyApiService implements MyApiService {
  _MyApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://www.drdistributors.co.in/drd-live/flutter_api/Api01/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginModelResponse> get_login_api(
    String api_key,
    String user_name,
    String user_password,
    String firebase_token,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'api_key': api_key,
      'user_name': user_name,
      'user_password': user_password,
      'firebase_token': firebase_token,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginModelResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/get_login_api',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LoginModelResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
