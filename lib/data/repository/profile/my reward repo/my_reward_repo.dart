import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRewardRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  MyRewardRepo({required this.apiClient, required this.sharedPreferences});


  /// reward data
  Future<Response> getRewarddData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData(AppConstants.MY_REWARD_URI+"/$customerID");
    return _response;
  }

  /// redeem reward data
  Future<Response> getRedeemRewardData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData(AppConstants.REDEEM_REWARD_URI+"/$customerID");
    return _response;
  }







}