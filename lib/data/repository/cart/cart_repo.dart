import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../util/app_constants.dart';
import '../../api/api_client.dart';
import '../../model/body/login_body.dart';
import '../../model/body/signup_body.dart';
class CartRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  // final BlackOwlDatabase database;
  CartRepo({required this.apiClient, required this.sharedPreferences}
      // {
      // required this.database
      // }
      );



  /// general settings
  Future<Response> getGeneralSettingData() async {
    Response _response = await apiClient.getData(AppConstants.GENERAL_SETTING_PAGE_URI);
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

  void clearCoupon(){
    sharedPreferences.remove(AppConstants.COUPONDISCOUNTTEXT);
    sharedPreferences.remove(AppConstants.ISLEDISCOUNTTEXT);
    sharedPreferences.remove(AppConstants.COUPONDISCOUNT);
    sharedPreferences.remove(AppConstants.ISLEDISCOUNT);
  }


  Future<Response> deleteCart(String id,) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.deleteData(AppConstants.BAG_PAGE_CART_URI,query: {"cart_id":id,"corelation_id":deviceID, "customer_id": customerID});
    return _response;
  }

  Future<Response> updateCartQuantity(String id,int qty) async {

    String deviceID = await Get.find<AuthController>().getDeviceID();
    Response _response = await apiClient.putData(AppConstants.ADD_TO_CART_URI+"/$id",{"quantity":qty,});
    return _response;
  }

  /// isle coupon apply
  Future<Response> applyIsleCoupon({
    required String? customer_id,
    required String? corelation_id,
    required String? code,
    required String? type,
    required String? is_guest,

  }) async {
    Response _response = await apiClient.postData(AppConstants.APPLYCOUPON_URI,{
      "customer_id":customer_id,
      "corelation_id":corelation_id,
      "code":code,
      "type":type,
      "is_guest":is_guest,
    });
    return _response;
  }

  /// isle coupon apply
  Future<Response> applyBrandCoupon({
    required String? customer_id,
    required String? corelation_id,
    required String? code,
    required String? type,
    required String? is_guest,

  }) async {
    Response _response = await apiClient.postData(AppConstants.APPLYCOUPON_URI,{
      "customer_id":customer_id,
      "corelation_id":corelation_id,
      "code":code,
      "type":type,
      "is_guest":is_guest,
    });
    return _response;
  }

  Future<bool> saveIsleCouponDiscount(String discount) async {
    return await sharedPreferences.setString(AppConstants.ISLEDISCOUNT, discount);
  }
  Future<bool> saveBrandDiscount(String discount) async {
    return await sharedPreferences.setString(AppConstants.COUPONDISCOUNT, discount);
  }


  String getIsleCouponDiscount() {
    return sharedPreferences.getString(AppConstants.ISLEDISCOUNT) ?? "0.0";
  }

  String getBrandDiscount() {
    return sharedPreferences.getString(AppConstants.COUPONDISCOUNT) ?? "0.0";
  }





  Future<bool> saveIsleCouponText(String discount) async {
    return await sharedPreferences.setString(AppConstants.ISLEDISCOUNTTEXT, discount);
  }
  Future<bool> saveBrandText(String discount) async {
    return await sharedPreferences.setString(AppConstants.COUPONDISCOUNTTEXT, discount);
  }


  String getIsleCouponText() {
    return sharedPreferences.getString(AppConstants.ISLEDISCOUNTTEXT) ?? "";
  }

  String getBrandText() {
    return sharedPreferences.getString(AppConstants.COUPONDISCOUNTTEXT) ?? "";
  }


}
