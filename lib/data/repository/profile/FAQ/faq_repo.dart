import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FAQRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  FAQRepo({required this.apiClient, required this.sharedPreferences});

  /// faq type
  Future<Response> getFAQTypeData() async {
    Response _response = await apiClient.getData(AppConstants.FAQ_TYPE_PAGE_URI);
    return _response;
  }


  /// faq
  Future<Response> getFAQData() async {
    Response _response = await apiClient.getData(AppConstants.FAQ_PAGE_URI);
    return _response;
  }

}