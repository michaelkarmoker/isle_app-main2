import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFavoriteBrandsRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  MyFavoriteBrandsRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getGenderPageData() async {
    Response _response = await apiClient.getData(AppConstants.MAIN_PAGE_URI);
    return _response;
  }

  /// all favorite brands
  Future<Response> getFavoriteBrandsAllData() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData(AppConstants.MY_FAVORITE_BRANDS_URI+"/$customerID");
    return _response;
  }

  /// all favorite brands
  Future<Response> getFavoriteBrandsGenderWiseData({required String id}) async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData(AppConstants.MY_FAVORITE_BRANDS_URI+"/$customerID"+AppConstants.MY_FAVORITE_BRANDS_END_URI,query: {"page_id": id});
    return _response;
  }

  /// loving brands
  Future<Response> getLovingBrandsData() async {
    Response _response = await apiClient.getData(AppConstants.LOVING_BRANDS_PAGI_URI);
    return _response;
  }







}