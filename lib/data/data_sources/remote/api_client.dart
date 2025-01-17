import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:journo_blog_app/utils/utils.dart';
import 'api_constant.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;

  ApiClient() {
    baseOptions = BaseOptions(
      baseUrl: ApiConstant.mainUrl,
    );
    dio = Dio(baseOptions);
  }

  Options options = Options();

  /// GET REQUEST
  Future<Response> getRequest(
      {required String path, bool isTokenRequired = false}) async {
    if (isTokenRequired == true) {
      var token = await Utils.getToken();

      options.headers = baseOptions.headers
        ..addAll({"Authorization": "Bearer $token"});
    }
    try {
      debugPrint('🚀================== API Request =============🚀');
      debugPrint('Request url: ${baseOptions.baseUrl + path}');

      var response = await dio.get(path, options: options);

      debugPrint('❤️‍🔥================== API Response ============❤️‍🔥');
      debugPrint('Status code: ${response.statusCode.toString()}');
      log('DATA: ${response.data.toString().substring(0, 300)}');

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusCode);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  /// POST REQUEST
  Future<Response> postRequest(
      {required String path,
      dynamic body,
      bool isTokenRequired = false}) async {
    if (isTokenRequired == true) {
      var token = await Utils.getToken();

      options.headers = baseOptions.headers
        ..addAll({"Authorization": "Bearer $token"});
    }
    try {
      debugPrint('🚀================== API Request =============🚀');
      debugPrint('Request url: ${baseOptions.baseUrl + path}');
      debugPrint('Body: $body');

      var response = await dio.post(
        path,
        data: body,
        options: options,
      );

      debugPrint('❤️‍🔥================== API Response ============❤️‍🔥');
      debugPrint('Status code: ${response.statusCode.toString()}');
      log('DATA: ${response.data}');

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusCode);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
