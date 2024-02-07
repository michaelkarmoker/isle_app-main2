import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/Product/brand_section_product_response.dart';
import 'package:isletestapp/data/model/response/color_response.dart';
import 'package:isletestapp/data/model/response/feature%20slider/feature_slider_response.dart';
import 'package:isletestapp/data/model/response/footer/footer_by_type_response.dart';
import 'package:isletestapp/data/model/response/general%20settings/general_settings_response.dart';
import 'package:isletestapp/data/model/response/home/home_page_all_section_data_reponse.dart';
import 'package:isletestapp/data/model/response/home/home_headline_response.dart';
import 'package:isletestapp/data/model/response/home/home_slider_response.dart';
import 'package:isletestapp/data/model/response/main%20page/brand_product_response.dart';
import 'package:isletestapp/data/model/response/main%20page/featured_brands_pagi_response.dart';
import 'package:isletestapp/data/model/response/main%20page/isle_membership_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/model/response/home/top_brand_response.dart';
import 'package:isletestapp/data/model/response/home/top_home_banner_respanse.dart';
import 'package:isletestapp/data/model/response/main%20page/membership__benifit_info_response.dart';
import 'package:isletestapp/data/model/response/main%20page/membership_info_response.dart';
import 'package:isletestapp/data/model/response/social/socail_response.dart';
import 'package:isletestapp/data/model/response/wishlist/get_wishlist_response.dart';
import 'package:isletestapp/data/repository/main%20page/main_page_repo.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart' as sunny;
import '../../data/model/response/main page/multiple_section_product_filter_model.dart';
import '../../data/model/response/main page/section_home_page_details.dart';
import '../../http_cleint/request_handler.dart';



class MainPageController extends GetxController implements GetxService {
  final MainPageRepo mainPageRepo;
  ScrollController scrollController = ScrollController();
  MainPageController({required this.mainPageRepo}){
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int selectedGenderIndex=0;
  int sectedColorVAriantIndex=0;

  Rx<GetWishlistResponse?> getWishlistResponse = Rx<GetWishlistResponse?>(null);
  RxInt wishlistCount = RxInt(0);
  BrandProductResponse ? brandProductResponse =null;
  ColorResponse ? colorResponse =null;
  GeneralSettingResponse ? generalSettingResponse =null;
  GenderPageResponse ? genderPageResponse =null;
  FeatureSliderResponse ? featureSliderResponse =null;
  LovingBrandResponse ? lovingBrandResponse =null;
  IsleMemberShipResponse ? isleMemberShipResponse =null;
  MembershipInfoResponse ? membershipInfoResponse =null;
  MembershipBenifitInfoResponse ? membershipBenifitInfoResponse =null;
  SocialResponse ? socialResponse =null;
  HomeSliderResponse ? homeSliderResponse =null;
  TopBrandResponse ? topBrandResponse =null;
  TopHomeBannerResponse ? topHomeBannerResponse =null;

  HomePageAllDataResponse ? homePageAllDataResponse =null;

  FooterByTypesResponse ? footerByTypesResponse =null;

  BrandSectionProductResponse ? brandSectionProductResponse =null;
  HomeHeadlineResponse ? homeHeadlineResponse =null;
  List<sunny.Data> genderList=[];
  // List<Result>? result =null;


  Future<void> dataInitialize()async {
    await getWishlistData();
    // await getFooterByTypeData();
    await getGeneralSettingData();
    await getGenderPageData();
    await getFeatureSliderData();
    await getLovingBrandsData();
    await getIsleMemberShipData();
    await getSocialData();
    await getTopBrandData();
    await getTopHomeBannerData();
    await getHomeHeadlineData();
    await memberShipInfo();
    await memberShipBenifitInfo();
    // await getHomePageAllData();

  }
  Future<void> dataInitializeForHome()async {
    await getColors();
    await getTopSliderData(genderList![selectedGenderIndex].id.toString());
    await getHomePageAllData(genderList![selectedGenderIndex].id.toString());
    await getBrandProductData(genderList![selectedGenderIndex].id.toString());
    // await getHomePageAllData();
    await getTopHomeBannerData();
    await getHomeHeadlineData();

  }
  /// for continue shopping feature
  Future<void> dataInitializeForHomeContinueShopping(int id)async {
    await getColors();
    await getTopSliderData(id.toString());
    await getHomePageAllData(id.toString());
    await getBrandProductData(id.toString());
    // await getHomePageAllData();
    await getTopHomeBannerData();
    await getHomeHeadlineData();

  }

  Future<void> discloseForHome() async {
    // featureSliderResponse=null;
    homeHeadlineResponse=null;
    homeSliderResponse=null;
    topHomeBannerResponse=null;
    homePageAllDataResponse=null;
  }


  // Existing methods...

  /// colors
  Future<void> getFooterByTypeData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getFooterByTypeData();
    if (response.statusCode == 200) {
      footerByTypesResponse = FooterByTypesResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> getWishlistData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getWishlistData();
    if (response.statusCode == 200) {
      getWishlistResponse.value = GetWishlistResponse.fromJson(response.body);
      wishlistCount.value = getWishlistResponse.value!.data!.length ?? 0;
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }


  /// colors
  Future<void> getColors() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getColors();

    if (response.statusCode == 200) {
      colorResponse = ColorResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// general settings
  Future<void> getGeneralSettingData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getGeneralSettingData();

    if (response.statusCode == 200) {
      generalSettingResponse = GeneralSettingResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// feature slider
  Future<void> getFeatureSliderData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getFeatureSliderData();

    if (response.statusCode == 200) {
      featureSliderResponse= FeatureSliderResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// page gender
  Future<void> getGenderPageData() async {
    _isLoading = true;
    genderList=[];
    update();
    Response response = await mainPageRepo.getGenderPageData();

    if (response.statusCode == 200) {
      genderPageResponse= GenderPageResponse.fromJson(response.body);
      // alldata!.add(new sunny.Data(title: "View All"));
      GenderPageResponse.fromJson(response.body).data!.map((e) {
        genderList!.add(e);
      }).toList();
      if(genderList!.length>0){
        await getTopSliderData(genderList![selectedGenderIndex].id.toString());
        await getHomePageAllData(genderList![selectedGenderIndex].id.toString());
        await getBrandProductData(genderList![selectedGenderIndex].id.toString());
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// loving brands
  Future<void> getLovingBrandsData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getLovingBrandsData();

    if (response.statusCode == 200) {
      lovingBrandResponse= LovingBrandResponse.fromJson(response.body);
      // if(lovingBrandResponse!=null&&  lovingBrandResponse!.data!=null){
      //   // result=[];
      //   // result = lovingBrandResponse!.data!;
      // }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// home headline
  Future<void> getHomeHeadlineData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getHomeHeadlineData();

    if (response.statusCode == 200) {
      homeHeadlineResponse= HomeHeadlineResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// isle membership
  Future<void> getIsleMemberShipData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getIsleMemberShipData();

    if (response.statusCode == 200) {
      isleMemberShipResponse= IsleMemberShipResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// membership info
  Future<void> memberShipInfo() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.memberShipInfo();

    if (response.statusCode == 200) {
      membershipInfoResponse= MembershipInfoResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// membership benifit info
  Future<void> memberShipBenifitInfo() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.memberShipBenifitInfo();

    if (response.statusCode == 200) {
      membershipBenifitInfoResponse= MembershipBenifitInfoResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// newsletter
  Future<void> submitNewsletter({required String email,}) async {

    _isLoading = true;
    update();
    Response response = await mainPageRepo.submitNewsletter(email: email,);
    if (response.statusCode == 200) {
      showCustomSnackBar("Subscribe Successful", isError: false,);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// social
  Future<void> getSocialData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getSocialData();

    if (response.statusCode == 200) {
      socialResponse= SocialResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// home top slider
  Future<void> getTopSliderData(String id) async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getTopSliderData(id);

    if (response.statusCode == 200) {
      homeSliderResponse= HomeSliderResponse.fromJson(response.body);

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
    Response response = await mainPageRepo.getTopBrandData();

    if (response.statusCode == 200) {
      topBrandResponse= TopBrandResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// top home banner
  Future<void> getTopHomeBannerData() async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getTopHomeBannerData();

    if (response.statusCode == 200) {
      topHomeBannerResponse= TopHomeBannerResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }





  ///  home page all data
  Future<void> getHomePageAllData(String id) async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getHomePageAllData(id);

    if (response.statusCode == 200) {
      homePageAllDataResponse= HomePageAllDataResponse.fromJson(response.body);

    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  // Future<void> getMultisectionProductFilter(int sectionId) async {
  //   _isLoading = true;
  //   update();
  //   Response response = await mainPageRepo.getMultisectionProductFilter(sectionId);
  //   log('=======================@ Home Response Con: ${response.body}');
  //   if (response.statusCode == 200) {
  //     sectionHomepageList = [];
  //     sectionHomepageDetails = HomePageData.fromJson(response.body);
  //     sectionHomepageDetails!.sectionHomepageDetails!.map((e){
  //       sectionHomepageList!.add(e);
  //     });
  //
  //     log('=======================@ Home Page List: $sectionHomepageList');
  //     log('=======================@ Home Page Details: ${sectionHomepageDetails!.sectionId}');
  //
  //   } else {
  //     ApiChecker.checkApi(response);
  //     // showCustomSnackBar(response.statusCode!.toString());
  //   }
  //   _isLoading = false;
  //   update();
  // }


  List<PeopleResult> sectionHomepageList = [];
  PeopleHomePageModel? sectionHomepageDetails;
  bool productsFound = true;

  Future<void> getMultisectionProduct({
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

    try{
      _isLoading = true;
      update();
      Response response = await mainPageRepo.getMultisectionProduct(
          pageId: pageId,
          sectionId: sectionId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          priceOrder: priceOrder,
          isMostWishList: isMostWishList
      );

      log('====/@ Home Response Con: ${response.body}');
      log('====/@ Home Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        sectionHomepageList = [];
        sectionHomepageDetails = PeopleHomePageModel.fromJson(response.body);

        /// Add to list data
        sectionHomepageList.addAll(sectionHomepageDetails?.data?.result ?? []);

        log('====/@ Section List Con: $sectionHomepageList');
        log('====/@ Section List Con: ${sectionHomepageDetails?.data?.result}');
        log('====/@ Section List Con1: ${sectionHomepageDetails?.toJson()}');

        // Update the productsFound flag
        productsFound = sectionHomepageList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
      }

    } catch (e, s) {
      // Handle the error here
      log('====/@ Error fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }

  }

  // ====/@ Update SizedBox Id @/====
  Map<int, bool> selectedSizes = {};
  void updateSelectedSize(int sizeId, bool isSelected) {
    if (selectedSizes.containsKey(sizeId)) {
      // If the sizeId is already present, update its value
      selectedSizes[sizeId] = isSelected;
    } else {
      // If the sizeId is not present, add it to the map
      selectedSizes.addAll({sizeId: isSelected});
    }
    update(); // Notify listeners
  }


  // List<MultipleSectionProductFilterData> multipleSectionProductFilterList = [];
  MultipleSectionProductFilterModel? multipleSectionProductFilterModel;

  Future<void> getMultisectionProductFilter({required List<int> sectionId}) async {

    try{
      _isLoading = true;
      update();
      Response response = await mainPageRepo.getMultisectionProductFilter(sectionId: sectionId);
      log('====/@ Home Response Con: ${response.body}');
      log('====/@ Home Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        // multipleSectionProductFilterList = [];
        // multipleSectionProductFilterModel = MultipleSectionProductFilterModel.fromJson(response.body);

        // /// Add to list data
        // multipleSectionProductFilterList.addAll(multipleSectionProductFilterModel?.data ?? []);

        multipleSectionProductFilterModel = MultipleSectionProductFilterModel.fromJson(response.body);

        log('====/@ Filter Section List Sections Con: ${multipleSectionProductFilterModel?.data?.sections}');
        log('====/@ Filter Section List Brands Con: ${multipleSectionProductFilterModel?.data?.brands}');
        log('====/@ Filter Section List Sizes Con: ${multipleSectionProductFilterModel?.data?.sizes}');
        log('====/@ Filter Section List Con: ${sectionHomepageDetails?.toJson()}');

      } else {
        ApiChecker.checkApi(response);
      }

    } catch (e, s) {
      // Handle the error here
      log('====/@ Error fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }

  }


  ///  brand section
  Future<void> getBrandProductData(String id) async {
    _isLoading = true;
    update();
    Response response = await mainPageRepo.getBrandProductData(id);

    if (response.statusCode == 200) {
      brandSectionProductResponse= BrandSectionProductResponse.fromJson(response.body);

    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

}
