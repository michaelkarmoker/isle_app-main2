import 'dart:developer';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../http_cleint/app_config.dart';
import '../../../http_cleint/request_handler.dart';
import '../../model/response/home/home_page_all_section_data_reponse.dart';

class NewinMostPopularRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  NewinMostPopularRepo({required this.apiClient, required this.sharedPreferences});

  /// page id
  Future<Response> getGenderPageData() async {
    Response _response = await apiClient.getData(AppConstants.MAIN_PAGE_URI);
    return _response;
  }

  /// new in land product data
  Future<Response> getNewinLandingData(String id,  String? limit,) async {
    Response _response = await apiClient.getData("${AppConstants.HOME_PAGE_ALL_DATA_START_URI}/$id${AppConstants.NEWIN_LAND_PRODUCT_END_URI}", query: {
      'limit': limit?.toString() ?? '',
    });
    return _response;
  }

  /// most popular data
  Future<Response> getMostPopularData(String id,  String? limit,) async {
    Response _response = await apiClient.getData("${AppConstants.HOME_PAGE_ALL_DATA_START_URI}/$id${AppConstants.MOSTPOPULAR_LAND_PRODUCT_END_URI}", query: {
      'limit': limit?.toString() ?? '',
    });
    return _response;
  }



}

