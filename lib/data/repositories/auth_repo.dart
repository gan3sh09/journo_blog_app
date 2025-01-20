// ignore_for_file: unused_catch_clause

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:journo_blog_app/data/models/logout_model.dart';
import 'package:journo_blog_app/presentation/screens/auth/register/register_imports.dart';
import '../../core/constants/app_colors.dart';
import '../../presentation/screens/auth/login/login_imports.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<RegisterModel> userRegister(
      String name, String email, String password, context) async {
    final formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
    });
    try {
      final response =
          await postRequest(path: ApiEndpointUrls.register, body: formData);
      if (response.statusCode == 200) {
        final responseData = registerModelFromJson(jsonEncode(response.data));
        return responseData;
      } else {
        RegisterModel();
      }
    } on Exception {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.fail,
        label: AppLocalizations.of(context)!.theEmailHasAlreadyTaken,
        // label: e.toString(),
        labelTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
      RegisterModel();
    }
    return RegisterModel();
  }

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
    } on Exception catch (e) {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.fail,
        label: AppLocalizations.of(context)!.unauthorized,
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
        // label: e.toString(),
        label: AppLocalizations.of(context)!.somethingWentWrong,
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
