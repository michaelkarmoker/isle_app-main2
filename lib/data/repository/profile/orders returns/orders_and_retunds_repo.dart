import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersReturnsRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  OrdersReturnsRepo({required this.apiClient, required this.sharedPreferences});

/*  /// orders returns
  Future<Response> getOrdersReturnData() async {
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI);
    return _response;
  }*/


  /// orders returns
  Future<Response> getRecentOrdersReturnData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    String status = "recent";
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI,query: {"corelation_id":deviceID, "customer_id": customerID, "status": status
    });
    return _response;
  }


  /// pending returns
  Future<Response> getPendingOrdersReturnData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    String status = "pending";
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI,query: {"corelation_id":deviceID, "customer_id": customerID, "status": status
    });
    return _response;
  }



  /// confirm returns
  Future<Response> getConfirmOrdersReturnData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    String status = "confirmed";
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI,query: {"corelation_id":deviceID, "customer_id": customerID, "status": status
    });
    return _response;
  }



  /// reject returns
  Future<Response> getRejectOrdersReturnData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    String status = "rejected";
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI,query: {"corelation_id":deviceID, "customer_id": customerID, "status": status
    });
    return _response;
  }





}