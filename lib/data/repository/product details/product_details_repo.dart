import 'dart:developer';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProductDetailsRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> updateCartQuantity(String id,int qty) async {

    String deviceID = await Get.find<AuthController>().getDeviceID();
    Response _response = await apiClient.putData(AppConstants.ADD_TO_CART_URI+"/$id",{"quantity":qty,});
    return _response;
  }

  /// product details product review
  Future<Response> ProductDetailsReview(String id) async {
    Response _response = await apiClient.getData(AppConstants.PRODUCT_DETAILS_PRODUCT_REVIEW_URI+"/$id"+AppConstants.PRODUCT_DETAILS_PRODUCT_REVIEW_END_URI);
    return _response;
  }

  /// section product
  Future<Response> getProductDetailsData(String id) async {
    Response _response = await apiClient.getData("${AppConstants.PRODUCT_DETAILS_PAGE_URI}/$id");
    return _response;
  }

  /// more from brands
  Future<Response> getMoreFromBrandsData(String id, String page, String brand) async {
    Response _response = await apiClient.getData("${AppConstants.PRODUCT_DETAILS_PAGE_URI}/$id/more-brand", query: {"page" : page, "brand": brand});
    return _response;
  }

  /// you may also like
  Future<Response> getYouMayAlsoLike({
    String? id,
    List<int>? childCat,
    List<int>? page,
    required String brand
  }) async {
    Response response = await apiClient.getData(
      "${AppConstants.PRODUCT_DETAILS_PAGE_URI}/$id/also-like",
      query: {
        'child_cat': childCat?.map((e) => '$e').toList() ?? [],
        'page': page?.map((e) => '$e').toList() ?? [],
        'brand': brand,
      },
    );

    log('====/@ Also Like Query Api: ${response.request?.url ?? ''}');
    log("====/@ You May Also: ${response.body}");
    return response;
  }



  /// checkWishlisted
  Future<Response> getCheckWishlisted(String id ) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    print(deviceID);
    Response _response = await apiClient.getData("${AppConstants.CHECK_WISHLIST_URI}/$id",query: {"corelation_id":deviceID, "customer_id": customerID});
    return _response;
  }


  /// add to cart
  Future<Response> AddtoCart({
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

  /// add wishlist without customer id
  Future<Response> AddtoWishlistWithout({
    required String product_id,
    // required String? customer_id,
    required String? corelation_id,
  }) async {
    Response _response = await apiClient.postData(AppConstants.ADD_TO_WISH_URI,{
      "product_id":product_id,
      // "customer_id":customer_id,
      "corelation_id":corelation_id,
    });
    return _response;
  }


  /// add wishlist
  Future<Response> AddtoWishlist({
    required String product_id,
    required String? customer_id,
    required String? corelation_id,
  }) async {
    Response _response = await apiClient.postData(AppConstants.ADD_TO_WISH_URI,{
      "product_id":product_id,
      "customer_id":customer_id,
      "corelation_id":corelation_id,
    });
    return _response;
  }

  /// deletewish
  Future<Response> deleteWish(String id) async {
    Response _response = await apiClient.deleteData(AppConstants.DELETE_WISH_URI+"/$id");
    return _response;
  }

  /// all delivery type
  Future<Response> getAllDeliveryTypeData() async {
    Response _response = await apiClient.getData(AppConstants.ALL_DELIVERY_TYPE_URI);
    return _response;
  }

  /// all favorite list
  Future<Response> allFavouriteListData() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData(AppConstants.ALL_FAVOURITE_LIST_URI+"/$customerID");
    return _response;
  }

  /// favorite create
  Future<Response> createFollowing(String id) async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.postData(AppConstants.MY_FAVORITE_BRANDS_URI+"/$customerID"+"/$id",{id});
    return _response;
  }

  /// follow writeup
  Future<Response> getFollowWriteUpData() async {
    Response _response = await apiClient.getData(AppConstants.FOLLOW_WRITEUP_URI);
    return _response;
  }

  /// shop the look
  Future<Response> getShopTheLookData({
    required String gender_id,
    required String? product_id,
    required String? child_category_id,
  }) async {
    Response _response = await apiClient.getData(AppConstants.SHOP_THE_LOOK_URI, query: {
      "gender_id" : gender_id,
      "product_id" : product_id,
      "child_category_id" : child_category_id,
    });
    return _response;
  }
  Future<Response> getGenderPageData() async {
    Response _response = await apiClient.getData(AppConstants.MAIN_PAGE_URI);
    return _response;
  }







}
