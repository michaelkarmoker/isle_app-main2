import 'dart:developer';

import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscoverRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  DiscoverRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getGenderPageData() async {
    Response _response = await apiClient.getData(AppConstants.MAIN_PAGE_URI);
    return _response;
  }

  /// promotion banner
  Future<Response> getPromotionBannerData(String id) async {
    Response response = await apiClient.getData("${AppConstants.PROMOTION_BANNER_URI}/$id");
    log('Home Page Api: ${response.request?.url ?? ''}');
    return response;
  }

  /// brand promotion
  Future<Response> getBrandPromotionData(String id) async {
    Response response = await apiClient.getData("${AppConstants.BRAND_PROMOTION_URI}/$id");
    log('Discover Page Api: ${response.request?.url ?? ''}');
    return response;
  }

  ///  top brand
  Future<Response> getTopBrandData() async {
    Response _response = await apiClient.getData(AppConstants.TOP_BRAND_URI);
    return _response;
  }





}