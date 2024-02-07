import 'dart:developer';

import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/category%20page/nested_brands_response.dart';
import 'package:isletestapp/data/model/response/category%20page/nested_category_response.dart';
import 'package:isletestapp/data/model/response/category%20page/nested_section_response.dart';
import 'package:isletestapp/data/model/response/general%20settings/general_settings_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/repository/category/category_page_repo.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart' as sunny;




class CategoryPageController extends GetxController implements GetxService {
  final CategoryPageRepo categoryPageRepo;
  CategoryPageController({required this.categoryPageRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int selectedIndex = 0;


  GenderPageResponse ? genderPageResponse =null;
  List<sunny.Data>? alldata=[];

  NestedCategoryResponse ? nestedCategoryResponse =null;
  // List<sunny.Data>? category=[];
  NestedSectionResponse ? nestedSectionResponse =null;
  NestedBrandsResponse ? nestedBrandsResponse =null;

  Future<void> dataInitialize()async {
    await getGenderPageData();
    // await getNestedBrandsData();

  }

  Future<void> disclose() async {
    //await getNestedCatSubCatData();
   // await getNestedSectionData();
    nestedSectionResponse=null;
    nestedCategoryResponse=null;
  }




  Future<void> getGenderPageData() async {
    _isLoading = true;
    alldata=[];
    update();
    Response response = await categoryPageRepo.getGenderPageData();
    log('====@ Response Con: $response');
    if (response.statusCode == 200) {
      genderPageResponse= GenderPageResponse.fromJson(response.body);
      // alldata!.add(new sunny.Data(title: "View All"));
      GenderPageResponse.fromJson(response.body).data!.map((e) {
        alldata!.add(e);
      }).toList();
      if(alldata!.length>0){
        await getNestedCatSubCatData(alldata![0].id.toString());
        await getNestedSectionData(alldata![0].id.toString());
        await getNestedBrandsData(alldata![0].id.toString());
      }
      log('====@ Gender Data Con: ${alldata![0].id.toString() ?? ''}');
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// nested cat, subcat, child cat
  Future<void> getNestedCatSubCatData(String id) async {
    _isLoading = true;
    update();
    Response response = await categoryPageRepo.getNestedCatSubCatData(id);

    if (response.statusCode == 200) {
      nestedCategoryResponse= NestedCategoryResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

/// nested section
  Future<void> getNestedSectionData(String id) async {
    _isLoading = true;
    update();
    Response response = await categoryPageRepo.getNestedSectionData(id);

    if (response.statusCode == 200) {
      nestedSectionResponse= NestedSectionResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// brands nested
  Future<void> getNestedBrandsData(String id) async {
    _isLoading = true;
    update();
    Response response = await categoryPageRepo.getNestedBrandsData(id);

    if (response.statusCode == 200) {
      nestedBrandsResponse= NestedBrandsResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }



}
