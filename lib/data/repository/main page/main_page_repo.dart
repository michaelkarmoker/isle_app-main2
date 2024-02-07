import 'dart:developer';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainPageRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  MainPageRepo({required this.apiClient, required this.sharedPreferences});

  /// footer
  Future<Response> getFooterByTypeData() async {
    Response _response = await apiClient.getData(AppConstants.FOOTER_BY_TYPES_URI);
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


  /// colors
  Future<Response> getColors() async {
    Response _response = await apiClient.getData(AppConstants.COLORS_URI);
    return _response;
  }

  /// general settings
  Future<Response> getGeneralSettingData() async {
    Response _response = await apiClient.getData(AppConstants.GENERAL_SETTING_PAGE_URI);
    return _response;
  }


  /// feature slider
  Future<Response> getFeatureSliderData() async {
    Response _response = await apiClient.getData(AppConstants.FEATURE_SLIDER_PAGI_URI);
    return _response;
  }



  Future<Response> getGenderPageData() async {
    Response _response = await apiClient.getData(AppConstants.MAIN_PAGE_URI);
    return _response;
  }


  /// loving brands
  Future<Response> getLovingBrandsData() async {
    Response _response = await apiClient.getData(AppConstants.LOVING_BRANDS_PAGI_URI);
    return _response;
  }

  /// home headline
  Future<Response> getHomeHeadlineData() async {
    Response _response = await apiClient.getData(AppConstants.HOME_HEADLINE_URI);
    return _response;
  }

  /// isle membership
  Future<Response> getIsleMemberShipData() async {
    Response _response = await apiClient.getData(AppConstants.ISLE_MEMBERSHIP_URI);
    return _response;
  }


  /// membership info
  Future<Response> memberShipInfo() async {
    Response _response = await apiClient.getData(AppConstants.MEMBERSHIP_INFO_URI);
    return _response;
  }

  /// membership benifit info
  Future<Response> memberShipBenifitInfo() async {
    Response _response = await apiClient.getData(AppConstants.MEMBERSHIP_BENIFIT_INFO_URI);
    return _response;
  }


  /// newsletter

  Future<Response> submitNewsletter({
    required String email,
  }) async {
    Response _response = await apiClient.postData(AppConstants.NEWSLETTER_SUBSCRIBE_URI,{
      "email": email,
    });
    return _response;
  }


  /// social
  Future<Response> getSocialData() async {
    Response _response = await apiClient.getData(AppConstants.SOCIAL_URI);
    return _response;
  }


  /// home top slider
  Future<Response> getTopSliderData(String id) async {
    Response _response = await apiClient.getData("${AppConstants.HOME_SLIDER_START_URI}/$id${AppConstants.HOME_SLIDER_END_URI}");
    return _response;
  }

  ///  top brand
  Future<Response> getTopBrandData() async {
    Response _response = await apiClient.getData(AppConstants.TOP_BRAND_URI);
    return _response;
  }


  ///  top home banner
  Future<Response> getTopHomeBannerData() async {
    Response _response = await apiClient.getData(AppConstants.HOME_TOP_BANNER_URI);
    return _response;
  }


  ///  home page all data
  Future<Response> getHomePageAllData(String id) async {
    Response response = await apiClient.getData("${AppConstants.HOME_PAGE_ALL_DATA_START_URI}/$id${AppConstants.HOME_PAGE_ALL_DATA_END_URI}");
    log('Home Page Api: ${response.request?.url ?? ''}');
    return response;
  }


  /// brand product
  Future<Response> getBrandProductData(String id) async {
    // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
    Response _response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id${AppConstants.brandProductListUrl}");
    return _response;
  }


  ///  Multi Section Product
  Future<Response> getMultisectionProduct({
    int? pageId,
    List<int>? sectionId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    bool? isMostWishList,
  }) async {

    Response response = await apiClient.getData(
        AppConstants.getMultisectionProduct,
        query: {
          'page_id': pageId.toString(),
          'section_id': sectionId?.map((e) => '$e').toList() ?? [],
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  ///  Multi Section Product Filter
  Future<Response> getMultisectionProductFilter({
    required List<int> sectionId
  }) async {

    Response response = await apiClient.getData(
        AppConstants.getMultisectionProductFilter,
        query: {'section_id': sectionId.map((e) => '$e').toList()}
    );

    log('====/@ Query Api: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }


}

// RequestHandler requestHandler = Get.find<RequestHandler>();
//
// Future<HomePageAllDataResponse> reqMultisectionProductFilter({
//   required int sectionId
// }) async{
//
//   Response res = await requestHandler.get(AppConfig.getMultisectionProductFilter);
//   log('===========@ Response: $res');
//   log('===========@ Status Code: ${res.statusCode}');
//   if(res.statusCode == 200){
//     return HomePageAllDataResponse.fromJson(res.body);
//   } else{
//     throw RequestException(
//         url: AppConfig.getMultisectionProductFilter,
//         method: '#GET',
//         error: res.body['error'],
//         trace: StackTrace.current
//     );
//   }
//
//   // try{
//   //
//   // } catch(e){
//   //   rethrow;
//   // }
//
// }