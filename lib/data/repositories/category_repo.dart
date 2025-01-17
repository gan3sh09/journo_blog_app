import 'dart:convert';
import 'dart:developer';
import 'package:journo_blog_app/data/data_sources/remote/api_client.dart';
import 'package:journo_blog_app/data/data_sources/remote/api_endpoint_urls.dart';
import 'package:journo_blog_app/data/models/logout_model.dart';
import '../../presentation/screens/general/category/category_model.dart';

class CategoryRepo extends ApiClient {
  CategoryRepo();

  Future<CategoryModel> getAllCategory() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.categories);
      if (response.statusCode == 200) {
        final responseData = CategoryModel.fromJson(response.data);
        return responseData;
      } else {
        CategoryModel();
      }
    } on Exception catch (e) {
      log(e.toString());
      CategoryModel();
    }
    return CategoryModel();
  }

  Future<LogoutModel> addNewCategory(String title, String slug) async {
    Map body = {
      'title': title,
      'slug': slug,
    };
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.addCategories,
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

  Future<LogoutModel> updateCategory(
      String id, String title, String slug) async {
    Map body = {
      'id': id,
      'title': title,
      'slug': slug,
    };
    try {
      final response = await postRequest(
        path: ApiEndpointUrls.updateCategories,
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

  Future<LogoutModel> deleteCategory(String id) async {
    try {
      final response = await postRequest(
        path: '${ApiEndpointUrls.deleteCategories}/$id',
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
