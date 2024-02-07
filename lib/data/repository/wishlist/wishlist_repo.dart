import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../util/app_constants.dart';
import '../../api/api_client.dart';
import '../../model/body/login_body.dart';
import '../../model/body/signup_body.dart';
class WishlistRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  // final BlackOwlDatabase database;
  WishlistRepo({required this.apiClient, required this.sharedPreferences}
      // {
    // required this.database
  // }
  );



  /// add to cart from wishlist
  Future<Response> AddtoCartFromWishlist({
    required String client_corelation_id,
    required String customer_id,
    required String product_id,
    required String color_variant_id,
    required String discount,
    required String quantity,
    required String product_inventory_id,
    required String size,
    required String price,
    required String mrp_price,
    required String final_price,

  }) async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.postData(AppConstants.ADD_TO_CART_URI,{
      "client_corelation_id":client_corelation_id,
      "customer_id":customer_id,
      "product_id":product_id,
      "color_variant_id":color_variant_id,
      "discount":discount,
      "quantity":quantity,
      "size":size,
      "product_inventory_id":product_inventory_id,
      "price":price,
      "mrp_price":mrp_price,
      "final_price":final_price,
    });
    return _response;
  }

  /// bage page cart data  Area
  Future<Response> getWishlistData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.GET_WISHLIST_DATA_URI,query: {"corelation_id":deviceID, "customer_id": customerID
    });
    return _response;
  }

  /// checkWishlisted
  Future<Response> getCheckWishlisted(String id ) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.CHECK_WISHLIST_URI+"/$id",query: {"corelation_id":deviceID, "customer_id": customerID
    });
    return _response;
  }

/// deletewish
  Future<Response> deleteWish(String id) async {
    Response _response = await apiClient.deleteData(AppConstants.DELETE_WISH_URI+"/$id");
    return _response;
  }

  /// deletewardrobe
  Future<Response> deleteWardrobe(String id) async {
    Response _response = await apiClient.deleteData(AppConstants.DELETE_WARDROBE_URI+"/$id");
    return _response;
  }

  /// deletewardrobeProduct
  Future<Response> deleteWardrobeProduct(String id) async {
    Response _response = await apiClient.deleteData(AppConstants.DELETE_WARDROBE_PRODUCT_URI+"/$id");
    return _response;
  }

  /// wardrobe list
  Future<Response> getWardrobeData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.WARDROBE_LIST_URI+"/$customerID");
    return _response;
  }


  /// create wardrobe
  Future<Response> createWardrobe({
    required String name,
    required String customer_id,
  }) async {
    Response _response = await apiClient.postData(AppConstants.CREATE_WARDROBE_URI,{
      "name": name,
      "customer_id": customer_id,
    });
    return _response;
  }


  /// create wardrobe product
  Future<Response> createWardrobeProduct({
    required String wardrobe_id,
    required String wishlist_id,
  }) async {
    Response _response = await apiClient.postData(AppConstants.CREATE_WARDROBE_PRODUCT_URI,{
      "wardrobe_id": wardrobe_id,
      "wishlist_id": wishlist_id,
    });
    return _response;
  }

  Future<Response> updateCartQuantity(String id,int qty) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    Response _response = await apiClient.putData(AppConstants.ADD_TO_CART_URI+"/$id",{"quantity":qty,});
    return _response;
  }










}
