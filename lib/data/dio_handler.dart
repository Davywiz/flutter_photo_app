import 'package:dio/dio.dart';

import 'package:flutter_photo_app/app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "Content-Type";
const String ACCEPT = "*/*";

class DioFactory {
  static Dio getDio() {
    Dio dio = Dio();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
    };
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
    );

    return dio;
  }
}
