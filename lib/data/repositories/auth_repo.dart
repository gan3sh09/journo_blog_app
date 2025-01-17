import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:journo_blog_app/data/models/logout_model.dart';
import '../../core/constants/app_colors.dart';
import '../../presentation/screens/auth/login/login_imports.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<LoginModel> userLogin(String email, String password, context) async {
    Map body = {
      "email": email,
      "password": password,
    };
    try {
      final response =
          await postRequest(path: ApiEndpointUrls.login, body: body);
      if (response.statusCode == 200) {
        final responseData = loginModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        LoginModel();
      }
    } on Exception {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.fail,
        label: 'Unauthorized',
        // label: e.toString(),
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      LoginModel();
    }
    return LoginModel();
  }

  Future<LogoutModel> userLogout(context) async {
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.logout, isTokenRequired: true);
      if (response.statusCode == 200) {
        final responseData = logoutModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        LogoutModel();
      }
    } on Exception catch (e) {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.fail,
        label: e.toString(),
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      LogoutModel();
    }
    return LogoutModel();
  }
}
