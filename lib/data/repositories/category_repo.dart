import 'dart:developer';
import 'package:journo_blog_app/data/data_sources/remote/api_client.dart';
import 'package:journo_blog_app/data/data_sources/remote/api_endpoint_urls.dart';
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
}
