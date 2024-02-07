import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../util/app_constants.dart';
import '../../api/api_client.dart';
import '../../model/body/login_body.dart';
import '../../model/body/signup_body.dart';
import '../../model/request model/order_place_request.dart';
class CheckOutRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CheckOutRepo({required this.apiClient, required this.sharedPreferences});


  /// for order id
  Future<Response> getOrderId() async {
    Response _response = await apiClient.getData(AppConstants.GENERAL_SETTING_PAGE_URI);
    return _response;
  }


  /// general settings
  Future<Response> getGeneralSettingData() async {
    Response _response = await apiClient.getData(AppConstants.GENERAL_SETTING_PAGE_URI);
    return _response;
  }

  /// all delivery type
  Future<Response> getAllDeliveryTypeData() async {
    Response _response = await apiClient.getData(AppConstants.ALL_DELIVERY_TYPE_URI);
    return _response;
  }


  /// order place
  Future<Response> placeOrder({
    required OrderPlaceRequest orderPlaceRequest

  }) async {
    Response _response = await apiClient.postData(AppConstants.PLACE_ORDER_URI,jsonEncode(orderPlaceRequest.toJson()));
    return _response;
  }

  /// thana
  Future<Response> getThanaData(String id) async {
    Response _response = await apiClient.getData(AppConstants.GET_THANA_URI+"/${id}");
    return _response;
  }
  /// division
  Future<Response> getDivisionData() async {
    // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
    Response _response = await apiClient.getData(AppConstants.GET_DIVISION_URI);
    return _response;
  }


  /// district
  Future<Response> getDistrictData(String id) async {
    Response _response = await apiClient.getData(AppConstants.GET_DISTRICT_URI+"/${id}");
    return _response;
  }


  /// bage page cart data  Area
  Future<Response> getBagPageCartData() async {

    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    print(deviceID);
    print(customerID);
    print("AAAAAA");
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.BAG_PAGE_CART_URI,query: {"corelation_id":deviceID, "customer_id" : customerID});
    return _response;
  }

}
