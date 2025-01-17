import 'dart:convert';
import 'dart:developer';
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
}
