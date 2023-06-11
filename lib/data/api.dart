import 'package:dio/dio.dart';

import 'dio_handler.dart';

class AppApi {
  final _dio = DioFactory.getDio();

  Future<Response<dynamic>> getImages(
      {required String page, String perPage = '15'}) {
    final result = _dio.get(
      '?page=1&per_page=$page',
    );

    return result;
  }
}
