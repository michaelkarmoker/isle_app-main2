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
class ThankYouRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ThankYouRepo({required this.apiClient, required this.sharedPreferences});



  /// order track
  Future<Response> getOrderTrackData(String id) async {
    Response _response = await apiClient.getData(AppConstants.ORDER_TRACK_URI+"/$id", );
    return _response;
  }

  /// general settings
  Future<Response> getGeneralSettingData() async {
    Response _response = await apiClient.getData(AppConstants.GENERAL_SETTING_PAGE_URI);
    return _response;
  }

  /// create feedback
  Future<Response> createFeedback({
    required String? message,
    required String? customer_id,
    required String? rating,
  }) async {
    Response _response = await apiClient.postData(AppConstants.CREATE_FEEDBACK_URI,{
      "message":message,
      "customer_id":customer_id,
      "rating":rating,
    });
    return _response;
  }




}
