import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../util/app_constants.dart';
import '../../api/api_client.dart';
import '../../model/body/login_body.dart';
import '../../model/body/signup_body.dart';
class ForgotPasswordRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  // final BlackOwlDatabase database;
  ForgotPasswordRepo({required this.apiClient, required this.sharedPreferences}
      // {
    // required this.database
  // }
  );

  /// get otp request
  Future<Response> getOTPRequest({
    required String phone,
    required String email,
  }) async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.putData(AppConstants.GET_OTP_CODE_URI,{
      "phone":phone,
      "email":email,
    });
    return _response;
  }

  Future<Response> updateCartQuantity(String id,int qty) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    Response _response = await apiClient.putData(AppConstants.ADD_TO_CART_URI+"/$id",{"quantity":qty,});
    return _response;
  }










}
