import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/Thank_you_controller/thank_you_controller.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/cart/cart_controller.dart';
import 'package:isletestapp/controller/category/category_page_controller.dart';
import 'package:isletestapp/controller/discover/discover_controller.dart';
import 'package:isletestapp/controller/forgot_password_controller/forgot_password_controller.dart';
import 'package:isletestapp/controller/localization_controller.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/controller/multi%20page%20controller/multi_page_controller.dart';
import 'package:isletestapp/controller/newin%20most%20popular/newin_most_popular_controller.dart';
import 'package:isletestapp/controller/onboarding_controller.dart';
import 'package:isletestapp/controller/order%20track/order_track_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/controller/profile/FAQ/faq_controller.dart';
import 'package:isletestapp/controller/profile/about%20isle%20reward/about_isle_reward_controller.dart';
import 'package:isletestapp/controller/profile/my%20favorite%20brands/my_favorite_brands_controller.dart';
import 'package:isletestapp/controller/profile/my%20reward/my_reward_controller.dart';
import 'package:isletestapp/controller/profile/orders%20refunds/orders_and_retunds_controller.dart';
import 'package:isletestapp/controller/profile/product%20feedback/product_feedback_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/controller/splash_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/data/model/body/language_model.dart';
import 'package:isletestapp/data/repository/auth_repo.dart';
import 'package:isletestapp/data/repository/cart/cart_repo.dart';
import 'package:isletestapp/data/repository/category/category_page_repo.dart';
import 'package:isletestapp/data/repository/checkOut/checkout_repo.dart';
import 'package:isletestapp/data/repository/discover/discover_repo.dart';
import 'package:isletestapp/data/repository/forgot_password/forgot_password_repo.dart';
import 'package:isletestapp/data/repository/multi%20page%20repo/multi_page_repo.dart';
import 'package:isletestapp/data/repository/newin%20most%20popular/newin_most_popular_repo.dart';
import 'package:isletestapp/data/repository/onboarding_repo.dart';
import 'package:isletestapp/data/repository/order%20track/order_track_repo.dart';
import 'package:isletestapp/data/repository/product%20details/product_details_repo.dart';
import 'package:isletestapp/data/repository/product/product_repo.dart';
import 'package:isletestapp/data/repository/profile/FAQ/faq_repo.dart';
import 'package:isletestapp/data/repository/profile/isle%20reward%20repo/about_isle_reward_repo.dart';
import 'package:isletestapp/data/repository/profile/my%20favorite%20brands/my_favorite_brands_repo.dart';
import 'package:isletestapp/data/repository/profile/my%20reward%20repo/my_reward_repo.dart';
import 'package:isletestapp/data/repository/profile/orders%20returns/orders_and_retunds_repo.dart';
import 'package:isletestapp/data/repository/profile/product%20feedback/product_feedback_repo.dart';
import 'package:isletestapp/data/repository/profile/user/user_profile__repo.dart';
import 'package:isletestapp/data/repository/splash_repo.dart';
import 'package:isletestapp/data/repository/main%20page/main_page_repo.dart';
import 'package:isletestapp/data/repository/thank_you_repo/thank_you_repo.dart';
import 'package:isletestapp/data/repository/wishlist/wishlist_repo.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/checkOut/checkout_controller.dart';
import '../http_cleint/request_handler.dart';


Future<Map<String, Map<String, String>>>  init() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: sharedPreferences));
  Get.put(RequestHandler(dio: Dio(), prefs: sharedPreferences));
  //repo

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => OnBoardingRepo());
  Get.lazyPut(() => MainPageRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => FAQRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => CategoryPageRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => ProductListRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => ProductDetailsRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => CartRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => CheckOutRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => MultiPageRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => WishlistRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => OrdersReturnsRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => UserProfileRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => OrderTrackRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => AboutIsleRewardRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => MyFavoriteBrandsRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => MyRewardRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => NewinMostPopularRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => DiscoverRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => ThankYouRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => ProductFeedbackRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  Get.lazyPut(() => ForgotPasswordRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));





  ///controller
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => OnBoardingController(onboardingRepo: Get.find(),));
  Get.lazyPut(() => MainPageController(mainPageRepo: Get.find()));
  Get.lazyPut(() => FAQController(faqRepo: Get.find()));
  Get.lazyPut(() => CategoryPageController(categoryPageRepo: Get.find()));
  Get.lazyPut(() => ProductListController(productListRepo: Get.find()));
  Get.lazyPut(() => ProductDetailsController(productDetailsRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => CheckOutController(checkOutRepo: Get.find()));
  Get.lazyPut(() => MultiPageController(multiPageRepo: Get.find()));
  Get.lazyPut(() => WishlistController(wishlistRepo: Get.find()));
  Get.lazyPut(() => OrdersReturnsController(ordersReturnsRepo: Get.find()));
  Get.lazyPut(() => UserProfileController(userProfileRepo: Get.find()));
  Get.lazyPut(() => OrderTrackController(orderTrackRepo: Get.find()));
  Get.lazyPut(() => AboutIsleRewardController(aboutIsleRewardRepo: Get.find()));
  Get.lazyPut(() => MyFavoriteBrandsController(myFavoriteBrandsRepo: Get.find()));
  Get.lazyPut(() => MyRewardController(myRewardRepo: Get.find()));
  Get.lazyPut(() => NewinMostPopularController(newinMostPopularRepo: Get.find()));
  Get.lazyPut(() => DiscoverController(discoverRepo: Get.find()));
  Get.lazyPut(() => ThankYouController(thankYouRepo: Get.find()));
  Get.lazyPut(() => ProductFeedbackController(productFeedbackRepo: Get.find()));
  Get.lazyPut(() => ForgotPasswordController(forgotPasswordRepo: Get.find()));








  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return _languages;


}
// */
