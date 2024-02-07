import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../util/app_constants.dart';
import '../../api/api_client.dart';
import '../../model/body/login_body.dart';
import '../../model/body/signup_body.dart';
class OrderTrackRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  OrderTrackRepo({required this.apiClient, required this.sharedPreferences});


  /// order track
  Future<Response> getOrderTrackData(String id) async {
    Response _response = await apiClient.getData(AppConstants.ORDER_TRACK_URI+"/$id", );
    return _response;
  }





}
