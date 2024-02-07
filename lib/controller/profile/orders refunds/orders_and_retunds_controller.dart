
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/FAQ/faq_response.dart';
import 'package:isletestapp/data/model/response/FAQ/faq_type_response.dart';
import 'package:isletestapp/data/model/response/main%20page/featured_brands_pagi_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/model/response/profile/orders_and_returns_response.dart';
import 'package:isletestapp/data/repository/main%20page/main_page_repo.dart';
import 'package:isletestapp/data/repository/profile/FAQ/faq_repo.dart';
import 'package:isletestapp/data/repository/profile/orders%20returns/orders_and_retunds_repo.dart';



class OrdersReturnsController extends GetxController implements GetxService {
  final OrdersReturnsRepo ordersReturnsRepo;
  OrdersReturnsController({required this.ordersReturnsRepo});

 Future<void> dataInitialize()async {
    await getRecentOrdersReturnData();
    await getPendingOrdersReturnData();
    await getConfirmOrdersReturnData();
    await getRejectOrdersReturnData();

 }
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  OrdersReturnsListResponse ? recentOrdersReturnsListResponse =null;
  OrdersReturnsListResponse ? pendingOrdersReturnsListResponse =null;
  OrdersReturnsListResponse ? confirmOrdersReturnsListResponse =null;
  OrdersReturnsListResponse ? rejectOrdersReturnsListResponse =null;

  // List<Result>? result =null;


  Future<void> getRecentOrdersReturnData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getRecentOrdersReturnData();

    if (response.statusCode == 200) {
      recentOrdersReturnsListResponse= OrdersReturnsListResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
     // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

/// pending
  Future<void> getPendingOrdersReturnData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getPendingOrdersReturnData();

    if (response.statusCode == 200) {
      pendingOrdersReturnsListResponse = OrdersReturnsListResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// confirmed
  Future<void> getConfirmOrdersReturnData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getConfirmOrdersReturnData();

    if (response.statusCode == 200) {
      confirmOrdersReturnsListResponse = OrdersReturnsListResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// reject
  Future<void> getRejectOrdersReturnData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getRejectOrdersReturnData();

    if (response.statusCode == 200) {
      rejectOrdersReturnsListResponse = OrdersReturnsListResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }







}
