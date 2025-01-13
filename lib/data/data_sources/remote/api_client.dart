import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  /// GET REQUEST
  Future<Response> getRequest({required String path}) async {
    try {
      debugPrint('🚀================== API Request =============🚀');
      debugPrint('Request url: ${baseOptions.baseUrl + path}');

      var response = await dio.get(path);

      debugPrint('❤️‍🔥================== API Response ============❤️‍🔥');
      debugPrint('Status code: ${response.statusCode.toString()}');
      log('DATA: ${response.data}');

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
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
      {required String path, required dynamic body}) async {
    final options = Options(
      headers: {
        "Authorization": "Bearer 2215|71m1MRP6DBtSzA9EDmecFovy2o9dGTI585KEhONM"
      },
    );
    try {
      debugPrint('🚀================== API Request =============🚀');
      debugPrint('Request url: ${baseOptions.baseUrl + path}');

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
        debugPrint(e.response!.data);
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
