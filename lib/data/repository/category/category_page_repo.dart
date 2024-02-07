import 'dart:developer';

import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryPageRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CategoryPageRepo({required this.apiClient, required this.sharedPreferences});


  /// bage page cart data  Area
  Future<Response> getWishlistData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.GET_WISHLIST_DATA_URI,query: {"corelation_id":deviceID, "customer_id": customerID
    });
    return _response;
  }



  Future<Response> getGenderPageData() async {
    Response _response = await apiClient.getData(AppConstants.MAIN_PAGE_URI);
    log('====@ Response: $_response');
    log('====@ Gender Api: ${_response.request?.url ?? ''}');
    return _response;
  }



  Future<Response> getNestedCatSubCatData(String id) async {
    Response _response = await apiClient.getData(AppConstants.NESTED_CAT_SUBCAT_PAGE_URI+"/${id}");
    return _response;
  }


  Future<Response> getNestedSectionData(String id) async {
    Response _response = await apiClient.getData(AppConstants.NESTED_SECTION_PAGE_URI+"/${id}");
    log('====@ Section Query Api: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// brands nested
  Future<Response> getNestedBrandsData(String id) async {
    Response _response = await apiClient.getData(AppConstants.NESTED_BRANDS_PAGE_URI+"/${id}"+AppConstants.NESTED_BRANDS_PAGE_END_URI);
    log('====@ Brand Query Api: ${_response.request?.url ?? ''}');
    return _response;
  }




}