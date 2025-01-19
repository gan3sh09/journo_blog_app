import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:journo_blog_app/data/models/logout_model.dart';
import 'package:journo_blog_app/presentation/screens/general/profile/profile_imports.dart';

import '../../presentation/screens/general/home/home_imports.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class PostsRepo extends ApiClient {
  PostsRepo();

  Future<HomeModel> getAllPosts() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.posts);
      if (response.statusCode == 200) {
        final responseData = homeModelFromJson(jsonEncode(response.data));

        return responseData;
      } else {
        HomeModel();
      }
    } on Exception catch (e) {
      log(e.toString());
      HomeModel();
    }
    return HomeModel();
  }

  Future<ProfileModel> getUserPosts() async {
    try {
      final response = await getRequest(
        path: ApiEndpointUrls.userPosts,
        isTokenRequired: true,
      );
      if (response.statusCode == 200) {
        final responseData = profileModelFromJson(jsonEncode(response.data));

        return responseData;
      } else {
        ProfileModel();
      }
    } on Exception catch (e) {
      log(e.toString());
      ProfileModel();
    }
    return ProfileModel();
  }

  Future<LogoutModel> addNewPosts(
    String title,
    String slug,
    String categories,
    String tags,
    String body,
    String userId,
    String filePath,
    String filename,
  ) async {
    final formData = FormData.fromMap({
      'title': title,
      'slug': slug,
      'categories': categories,
      'tags': tags,
      'body': body,
      'status': '1',
      'user_id': userId,
      'featuredimage':
          await MultipartFile.fromFile(filePath, filename: filename),
    });
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.addPosts,
        body: formData,
        isTokenRequired: true,
      );
      if (response.statusCode == 200) {
        final responseData = logoutModelFromJson(jsonEncode(response.data));

        return responseData;
      } else {
        LogoutModel();
      }
    } on Exception catch (e) {
      log(e.toString());
      LogoutModel();
    }
    return LogoutModel();
  }
}
