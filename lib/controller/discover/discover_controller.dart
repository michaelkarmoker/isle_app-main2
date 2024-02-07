import 'dart:developer';
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/discover/brand_promotion_response.dart';
import 'package:isletestapp/data/model/response/discover/promotion_banner_response.dart';
import 'package:isletestapp/data/model/response/home/top_brand_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/repository/discover/discover_repo.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart' as sunny;

class DiscoverController extends GetxController implements GetxService {
  final DiscoverRepo discoverRepo;
  DiscoverController({required this.discoverRepo,});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int sectedColorVAriantIndex=0;
  int selectedGenderIndex=0;
  GenderPageResponse ? genderPageResponse =null;
  PromotionBannerResponse ? promotionBannerResponse =null;
  BrandPromotionResponse ? brandPromotionResponse =null;
  TopBrandResponse ? topBrandResponse =null;
  List<sunny.Data> genderList=[];


  Future<void> dataInitialize()async {
    await getGenderPageData();
    await getTopBrandData();
    // await getPromotionBannerData(genderList![selectedGenderIndex].id.toString());
  }

  Future<void> dataClear()async {
    promotionBannerResponse= null;
  }

  /// page gender
  Future<void> getGenderPageData() async {
    _isLoading = true;
    genderList=[];
    update();
    Response response = await discoverRepo.getGenderPageData();
    log('====@ Response Con: $response');
    if (response.statusCode == 200) {
      genderPageResponse= GenderPageResponse.fromJson(response.body);
      // alldata!.add(new sunny.Data(title: "View All"));
      GenderPageResponse.fromJson(response.body).data!.map((e) {
        genderList!.add(e);
      }).toList();
      if(genderList!.length>0){
        await getPromotionBannerData(genderList![0].id.toString());
        await getBrandPromotionData(genderList![0].id.toString());
      }
      log('====@ Gender Data : ${genderPageResponse?.data ?? ''}');
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// promotion banner
  Future<void> getPromotionBannerData(String id) async {
    _isLoading = true;
    update();
    Response response = await discoverRepo.getPromotionBannerData(id);

    if (response.statusCode == 200) {
      promotionBannerResponse= PromotionBannerResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// brand promotion
  Future<void> getBrandPromotionData(String id) async {
    _isLoading = true;
    update();
    Response response = await discoverRepo.getBrandPromotionData(id);

    if (response.statusCode == 200) {
      brandPromotionResponse= BrandPromotionResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// top brand
  Future<void> getTopBrandData() async {
    _isLoading = true;
    update();
    Response response = await discoverRepo.getTopBrandData();

    if (response.statusCode == 200) {
      topBrandResponse= TopBrandResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }







}
