import 'dart:developer';
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
}
