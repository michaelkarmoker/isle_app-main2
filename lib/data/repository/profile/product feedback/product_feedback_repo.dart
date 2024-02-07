import 'dart:developer';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as di;

class ProductFeedbackRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  ProductFeedbackRepo({required this.apiClient, required this.sharedPreferences});


  /// product feedback get data
  Future<Response> getProductFeedbackData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    String status = "completed";
    print(deviceID);
    print(customerID);
    Response _response = await apiClient.getData(AppConstants.PRODUCT_FEEDBACK_URI,query: {"corelation_id":deviceID, "customer_id" : customerID, "status": status});
    log('====/@ Product FeedBack Api Url: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// View product feedback get data
  Future<Response> getViewProductFeedbackData(String orderNo) async {
    Response response = await apiClient.getData("${AppConstants.VIEW_PRODUCT_FEEDBACK_URI}/$orderNo");
    log('View Product FeedBack Api Url: ${response.request?.url ?? ''}');
    return response;
  }

  /// product feedback review
  Future<Response> createProductFeedback({
    required String? message,
    required String? product_id,
    required String? customer_id,
    required String? rating,
  }) async {
    Response _response = await apiClient.postData(AppConstants.CREATE_PRODUCT_FEEDBACK_URI,{
      "message":message,
      "product_id":product_id,
      "customer_id":customer_id,
      "rating":rating,
    });
    return _response;
  }










}