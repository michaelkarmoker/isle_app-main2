import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/home/newin_landing_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/repository/newin%20most%20popular/newin_most_popular_repo.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart' as sunny;



class NewinMostPopularController extends GetxController implements GetxService {
  final NewinMostPopularRepo newinMostPopularRepo;
  ScrollController scrollController = ScrollController();
  NewinMostPopularController({required this.newinMostPopularRepo}){
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int selectedGenderIndex=0;
  int sectedColorVAriantIndex=0;
  GenderPageResponse ? genderPageResponse =null;
  NewInLandingProductResponse ? newInLandingProductResponse =null;
  List<sunny.Data> genderList=[];


  Future<void> dataInitialize()async {
    await getGenderPageData();
    // await getHomePageAllData(genderList![selectedGenderIndex].id.toString());
    // await getBrandProductData(genderList![selectedGenderIndex].id.toString());
  }

  Future<void> discloseData() async {
    newInLandingProductResponse = null;
    // // featureSliderResponse=null;
    // homeHeadlineResponse=null;
    // homeSliderResponse=null;
    // topHomeBannerResponse=null;
    // homePageAllDataResponse=null;
  }

  /// page gender
  Future<void> getGenderPageData() async {
    _isLoading = true;
    genderList=[];
    update();
    Response response = await newinMostPopularRepo.getGenderPageData();

    if (response.statusCode == 200) {
      genderPageResponse= GenderPageResponse.fromJson(response.body);
      // alldata!.add(new sunny.Data(title: "View All"));
      GenderPageResponse.fromJson(response.body).data!.map((e) {
        genderList!.add(e);
      }).toList();
      if(genderList!.length>0){
        // await getNewinLandingData(genderList![selectedGenderIndex].id.toString(), "20");
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// newin landing data
  Future<void> getNewinLandingData(String id,  String? limit,) async {
    _isLoading = true;
    update();
    Response response = await newinMostPopularRepo.getNewinLandingData(id, limit);

    if (response.statusCode == 200) {
      newInLandingProductResponse= NewInLandingProductResponse.fromJson(response.body);

    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// most popular data
  Future<void> getMostPopularData(String id,  String? limit,) async {
    _isLoading = true;
    update();
    Response response = await newinMostPopularRepo.getMostPopularData(id, limit);
    if (response.statusCode == 200) {
      newInLandingProductResponse= NewInLandingProductResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }









}
