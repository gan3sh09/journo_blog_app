import 'dart:convert';
import 'dart:developer';
import 'package:journo_blog_app/data/models/logout_model.dart';

import '../../presentation/screens/general/tags/tags_imports.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<TagsModel> getAllTags() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.tags);
      if (response.statusCode == 200) {
        //* 1st Solution
        /*  final responseData = tagsModelFromJson(jsonEncode(response.data));
        log(responseData.toString()); */

        //* 2nd Solution
        final responseData = TagsModel.fromJson(response.data);
        return responseData;
      } else {
        TagsModel();
      }
    } on Exception catch (e) {
      log(e.toString());
      TagsModel();
    }
    return TagsModel();
  }

  Future<LogoutModel> addNewTags(String title, String slug) async {
    Map body = {
      'title': title,
      'slug': slug,
    };
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.addTags,
        body: body,
        isTokenRequired: true,
      );
      if (response.statusCode == 200) {
        final responseData = logoutModelFromJson(jsonEncode(response.data));
        log(responseData.toString());

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

  Future<LogoutModel> updateTags(String id, String title, String slug) async {
    Map body = {
      'id': id,
      'title': title,
      'slug': slug,
    };
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.updateTags,
        body: body,
        isTokenRequired: true,
      );
      if (response.statusCode == 200) {
        final responseData = logoutModelFromJson(jsonEncode(response.data));
        log(responseData.toString());

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

  Future<LogoutModel> deleteTags(String id) async {
    try {
      final response = await postRequest(
        path: '${ApiEndpointUrls.deleteTags}/$id',
        isTokenRequired: true,
      );
      if (response.statusCode == 200) {
        final responseData = logoutModelFromJson(jsonEncode(response.data));
        log(responseData.toString());

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
