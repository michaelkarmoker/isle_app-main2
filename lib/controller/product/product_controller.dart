
import 'dart:developer';
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/Product/category_product_response.dart';
import 'package:isletestapp/data/model/response/Product/child_category_product_response.dart';
import 'package:isletestapp/data/model/response/Product/sub_category_list_response.dart';
import 'package:isletestapp/data/model/response/filter/brand_product_list_model.dart';
import 'package:isletestapp/data/model/response/filter/filter_data_response.dart';
import 'package:isletestapp/data/model/response/filter/most_popular_product_filter_term.dart';
import 'package:isletestapp/data/repository/product/product_repo.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import '../../data/model/response/filter/brand/all_brand_category_model.dart';
import '../../data/model/response/filter/brand/brand_product_filter_model.dart';
import '../../data/model/response/filter/brand_type_product_filter_term_model.dart';
import '../../data/model/response/filter/brand_type_products_model.dart';
import '../../data/model/response/filter/category_product_filter_term_model.dart';
import '../../data/model/response/filter/child_category_product_filter_model.dart';
import '../../data/model/response/filter/search_brand_list_model.dart';
import '../../data/model/response/filter/search_product_filter_term_model.dart';
import '../../data/model/response/filter/search_product_list_model.dart';
import '../../data/model/response/filter/section_newin_filter_model.dart';
import '../../data/model/response/filter/section_product_filter_model.dart';
import '../../data/model/response/filter/sell_product_filter_term_model.dart';
import '../../data/model/response/filter/sub_category_filter_model.dart';
import '../../data/model/response/product/most_popular_list_model.dart';
import '../../data/model/response/product/search_brand_type_model.dart';
import '../../data/model/response/product/search_category_list_data.dart';
import '../../data/model/response/product/section_newin_model.dart';
import '../../data/model/response/product/section_product_list_data_model.dart';
import '../../data/model/response/product/sell_product_data_model.dart';

class ProductListController extends GetxController implements GetxService {
  final ProductListRepo productListRepo;
  ProductListController({required this.productListRepo,});


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int sectedColorVAriantIndex=0;


  // SectionProductListResponse ? sectionProductListResponse =null;
  // CategoryProductResponse ? categoryProductResponse =null;
  FilterDataResponse ? filterDataResponse =null;
  SubCategoryModel ? subCategoryResponse =null;
  // ChildCategoryResponse ? childCategoryResponse =null;
  // BrandSectionProductResponse ? brandSectionProductResponse =null;

  List<String>? photos=[];

  Future<void> dataInitialize()async {
    // await getGeneralSettingData();
    // await getCategoryProductData(categoryId);
    // await getFeaturedBrandsData();
  }

  Future<void> dataClear()async {
    childCategoryList = [];
    // sectionProductListResponse= null;
    // categoryProductResponse= null;
    // subCategoryResponse= null;
    // childCategoryResponse= null;
    // brandSectionProductResponse= null;
  }

  ///  create feedback
  Future<void> createFeedback({
    required String? message,
    required String? customer_id,
    required String? rating,
  }) async {
    _isLoading = true;
    update();
    Response response = await productListRepo.createFeedback(
      message : message,
      customer_id : customer_id,
      rating : rating,
    );
    if (response.statusCode == 201) {
      Get.back();
      showCustomSnackBar("Send Feedback message Successfully", isError: false, isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  bool productsFound = true;

  /// ====/@ section product

  List<SectionDataResult> sectionHomepageList = [];
  SectionProductListDataModel? sectionHomepageDetails;

  Future<void> getSectionProductData({
    String? id,
    int? pageId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    String? discount,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getSectionProductData(
          id: id,
          pageId: pageId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          priceOrder: priceOrder,
          discount: discount ?? '',
          isMostWishList: isMostWishList
      );

      log('====/@ Home1 Response Con: ${response.body}');
      log('====/@ Home1 Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        sectionHomepageList = [];
        sectionHomepageDetails = SectionProductListDataModel.fromJson(response.body);

        /// Add to list data
        sectionHomepageList.addAll(sectionHomepageDetails?.data?.result ?? []);

        log('====/@ Section1 List Con1: $sectionHomepageList');
        log('====/@ Section1 List Con1: ${sectionHomepageDetails?.data?.result}');
        log('====/@ Section1 List Con1: ${sectionHomepageDetails?.toJson()}');

        // Update the productsFound flag
        productsFound = sectionHomepageList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ Section NewIn product

  List<SectionNewInResult> sectionNewInList = [];
  SectionNewInModel? sectionNewInModel;

  Future<void> getSectionNewInData({
    String? id,
    int? pageId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? limit,
    String? priceOrder,
    String? discount,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getSectionNewInData(
          id: id,
          pageId: pageId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          limit: limit,
          priceOrder: priceOrder,
          discount: discount,
          isMostWishList: isMostWishList
      );

      log('====/@ Home1 Response Con: ${response.body}');
      log('====/@ Home1 Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        sectionNewInList = [];
        sectionNewInModel = SectionNewInModel.fromJson(response.body);

        /// Add to list data
        sectionNewInList.addAll(sectionNewInModel?.data?.result ?? []);

        log('====/@ Section1 List Con1: $sectionNewInList');
        log('====/@ Section1 List Con1: ${sectionNewInModel?.data?.result}');
        log('====/@ Section1 List Con1: ${sectionNewInModel?.toJson()}');

        // Update the productsFound flag
        productsFound = sectionNewInList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }


  /// ====/@ Category product

  List<CategoryProductResult> categoryProductList = [];
  CategoryProductHomeModel? categoryProductModel;

  Future<void> getCategoryProductData({
    String? categoryId,
    int? pageId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    String? discount,
    String? limit,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getCategoryProductData(
          categoryId: categoryId,
          pageId: pageId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          priceOrder: priceOrder,
          discount: discount,
          limit: limit,
          isMostWishList: isMostWishList
      );

      log('====/@ Category Response Con: ${response.body}');
      log('====/@ Category Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        categoryProductList = [];
        categoryProductModel = CategoryProductHomeModel.fromJson(response.body);

        /// Add to list data
        categoryProductList.addAll(categoryProductModel?.data?.result ?? []);

        log('====/@ Category List Con1: $categoryProductList');
        log('====/@ Category List Con1: ${categoryProductModel?.data?.result}');
        log('====/@ Category List Con1: ${categoryProductModel?.toJson()}');

        // Update the productsFound flag
        productsFound = categoryProductList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ SubCategory product

  List<SubCategoryResult> subCategoryList = [];
  SubCategoryModel? subCategoryModel;

  Future<void> getSubCategoryProductData({
    String? subCategoryId,
    int? pageId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    String? discount,
    String? limit,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getSubCategoryProductData(
          subCategoryId: subCategoryId,
          pageId: pageId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          priceOrder: priceOrder,
          discount: discount,
          limit: limit,
          isMostWishList: isMostWishList
      );

      log('====/@ Category Response Con: ${response.body}');
      log('====/@ Category Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        subCategoryList = [];
        subCategoryModel = SubCategoryModel.fromJson(response.body);

        /// Add to list data
        subCategoryList.addAll(subCategoryModel?.data?.result ?? []);

        log('====/@ Category List Con1: $subCategoryList');
        log('====/@ Category List Con1: ${subCategoryModel?.data?.result}');
        log('====/@ Category List Con1: ${subCategoryModel?.toJson()}');

        // Update the productsFound flag
        productsFound = subCategoryList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ ChildCategory product List

  List<ChildCategoryProductResult> childCategoryList = [];
  ChildCategoryProductModel? childCategoryProductModel;

  Future<void> getChildCategoryProductData({
    String? childCategoryId,
    int? pageId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    String? discount,
    String? limit,
    String? sectionType,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getChildCategoryProductData(
          childCategoryId: childCategoryId,
          pageId: pageId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          priceOrder: priceOrder,
          discount: discount,
          limit: limit,
          sectionType: sectionType,
          isMostWishList: isMostWishList
      );

      log('====/@ Category Response Con: ${response.body}');
      log('====/@ Category Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        childCategoryList = [];
        childCategoryProductModel = ChildCategoryProductModel.fromJson(response.body);

        /// Add to list data
        childCategoryList.addAll(childCategoryProductModel?.data?.result ?? []);

        log('====/@ Category List Con1: $childCategoryList');
        log('====/@ Category List Con1: ${childCategoryProductModel?.data?.result}');
        log('====/@ Category List Con1: ${childCategoryProductModel?.toJson()}');

        // Update the productsFound flag
        productsFound = childCategoryList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ ChildCategory product List

  List<SellProductListResult> sellProductList = [];
  SellProductListDataModel? sellProductListDataModel;

  Future<void> getSellProductData({
    int? page,
    int? pageId,
    int? genderId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    String? discount,
    String? brandText,
    String? sizeText,
    String? categoryText,
    String? limit,
    String? sectionType,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getSaleProductData(
          page: page,
          pageId: pageId,
          genderId: genderId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          priceOrder: priceOrder,
          discount: discount,
          brandText: brandText,
          sizeText: sizeText,
          categoryText: categoryText,
          limit: limit,
          sectionType: sectionType,
          isMostWishList: isMostWishList
      );

      log('====/@ Sell Response Con: ${response.body}');
      log('====/@ Sell Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        sellProductList = [];
        sellProductListDataModel = SellProductListDataModel.fromJson(response.body);

        /// Add to list data
        sellProductList.addAll(sellProductListDataModel?.data?.result ?? []);

        log('====/@ Sell List Con1: $sellProductList');
        log('====/@ Sell List Con1: ${sellProductListDataModel?.data?.result}');
        log('====/@ Sell List Con1: ${sellProductListDataModel?.toJson()}');

        // Update the productsFound flag
        productsFound = sellProductList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ brandList product List

  List<BrandProductListResult> brandProductList = [];
  BrandProductListModel? brandProductListModel;

  Future<void> getBrandProductData({
    String? id,
    int? page,
    int? pageId,
    int? genderId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    String? discount,
    String? brandText,
    String? sizeText,
    String? categoryText,
    String? limit,
    String? sectionType,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getBrandProductData(
          id: id,
          page: page,
          pageId: pageId,
          genderId: genderId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          priceOrder: priceOrder,
          discount: discount,
          brandText: brandText,
          sizeText: sizeText,
          categoryText: categoryText,
          limit: limit,
          sectionType: sectionType,
          isMostWishList: isMostWishList
      );

      log('====/@ Sell Response Con: ${response.body}');
      log('====/@ Sell Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        brandProductList = [];
        brandProductListModel = BrandProductListModel.fromJson(response.body);

        /// Add to list data
        brandProductList.addAll(brandProductListModel?.data?.result ?? []);

        log('====/@ Sell List Con1: $brandProductList');
        log('====/@ Sell List Con1: ${brandProductListModel?.data?.result}');
        log('====/@ Sell List Con1: ${brandProductListModel?.toJson()}');

        // Update the productsFound flag
        productsFound = brandProductList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ All Brand product List

  List<AllBrandData>? allBrandsList = [];
  AllBrandModel? allBrandModel;

  Future<void> getAllBrandData({
    int? pageId,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getAllBrandData(
          pageId: pageId,
      );

      log('====/@ Brand Response Con: ${response.body}');
      log('====/@ Brand Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        allBrandsList = [];
        allBrandModel = AllBrandModel.fromJson(response.body);

        /// Add to list data
        allBrandsList?.addAll(allBrandModel?.data ?? []);

        log('====/@ Brand List Con1: $allBrandsList');
        log('====/@ Brand List Con1: ${allBrandModel?.data}');
        log('====/@ Brand List Con1: ${allBrandModel?.toJson()}');

        // Update the productsFound flag
        productsFound = allBrandModel!.data!.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
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

  /// ====/@ Search Brand Type product List

  // List<SearchBrandsTypeData>? searchBrandTypeList = [];
  // SearchBrandTypeModel? searchBrandTypeModel;
  //
  // Future<void> getSearchBrandType({
  //   int? pageId,
  //
  // }) async {
  //
  //   try{
  //     _isLoading = true;
  //     update();
  //
  //     Response response = await productListRepo.getSearchBrandType(
  //       pageId: pageId,
  //     );
  //
  //     log('====/@ Search Brand Type Response Con: ${response.body ?? ''}');
  //     log('====/@ Search Brand Type Response statuscode: ${response.statusCode ?? ''}');
  //
  //     if (response.statusCode == 200) {
  //
  //       searchBrandTypeList = [];
  //       searchBrandTypeModel = SearchBrandTypeModel.fromJson(response.body);
  //
  //       /// Add to list data
  //       searchBrandTypeList?.addAll(searchBrandTypeModel?.data ?? []);
  //
  //       log('====/@ Search Brand Type List Con1: $searchBrandTypeList');
  //       log('====/@ Search Brand Type List Con1: ${allBrandModel?.data}');
  //       log('====/@ Search Brand Type List Con1: ${allBrandModel?.toJson()}');
  //
  //       // Update the productsFound flag
  //       productsFound = searchBrandTypeModel!.data!.brands!.isNotEmpty;
  //     } else {
  //       ApiChecker.checkApi(response);
  //       // showCustomSnackBar(response.statusCode!.toString());
  //     }
  //
  //   } catch (e, s) {
  //     // Handle the error here
  //     log('====/@ Error fetching data: $e', error: e, stackTrace: s);
  //     // You can choose to show a custom snackbar or handle the error in some other way
  //   } finally {
  //     _isLoading = false;
  //     update();
  //   }
  // }

  SearchBrandTypeModel? searchBrandTypeModel;

  Future<void> getSearchBrandType({
    String? id,
    int? pageId,
    // String? searchQuery, // Add searchQuery parameter
  }) async {
    try {
      _isLoading = true;
      update();
      Response response = await productListRepo.getSearchBrandType(
        pageId: pageId,
      );

      if (response.statusCode == 200) {
        searchBrandTypeModel = SearchBrandTypeModel.fromJson(response.body);

        // Filter the data based on the search query
        // if (searchQuery != null && searchQuery.isNotEmpty) {
        //   searchBrandTypeModel?.data?.brands?.removeWhere((brandType) =>
        //   brandType.name?.toLowerCase().contains(searchQuery.toLowerCase()) == false);
        // }

        log('====/@ Filter Section List Size Con1: ${searchBrandTypeModel?.data?.brands}');
        log('====/@ Filter Section List Con1: ${searchBrandTypeModel?.toJson()}');
      } else {
        ApiChecker.checkApi(response);
      }
      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }



  // List<SearchBrandsTypeData>? searchBrandTypeList = [];
  // SearchBrandTypeModel? searchBrandTypeModel;
  //
  // Future<void> getSearchBrandType({
  //   int? pageId,
  //
  // }) async {
  //
  //   try{
  //     _isLoading = true;
  //     update();
  //
  //     Response response = await productListRepo.getSearchBrandType(
  //       pageId: pageId,
  //     );
  //
  //     log('====/@ Search Brand Type Response Con: ${response.body ?? ''}');
  //     log('====/@ Search Brand Type Response statuscode: ${response.statusCode ?? ''}');
  //
  //     if (response.statusCode == 200) {
  //
  //       searchBrandTypeList = []; // Clear the list before adding new items
  //
  //       searchBrandTypeModel = SearchBrandTypeModel.fromJson(response.body);
  //
  //       if (searchBrandTypeModel?.data is List<SearchBrandsTypeData>) {
  //         List<SearchBrandsTypeData>? searchDataList = searchBrandTypeModel?.data as List<SearchBrandsTypeData>;
  //         searchBrandTypeList?.addAll(searchDataList);
  //       }
  //
  //
  //       // searchBrandTypeList = [];
  //       // searchBrandTypeModel = SearchBrandTypeModel.fromJson(response.body);
  //       //
  //       // /// Add to list data
  //       // searchBrandTypeList?.addAll(searchBrandTypeModel?.data ?? []);
  //
  //       log('====/@ Search Brand Type List Con1: $searchBrandTypeList');
  //       log('====/@ Search Brand Type List Con1: ${allBrandModel?.data}');
  //       log('====/@ Search Brand Type List Con1: ${allBrandModel?.toJson()}');
  //
  //       // Update the productsFound flag
  //       productsFound = searchBrandTypeModel!.data!.brands!.isNotEmpty;
  //     } else {
  //       ApiChecker.checkApi(response);
  //       // showCustomSnackBar(response.statusCode!.toString());
  //     }
  //
  //   } catch (e, s) {
  //     // Handle the error here
  //     log('====/@ Error fetching data: $e', error: e, stackTrace: s);
  //     // You can choose to show a custom snackbar or handle the error in some other way
  //   } finally {
  //     _isLoading = false;
  //     update();
  //   }
  // }

  /// ====/@ Most Popular product

  List<MostPopularListResult> mostPopularList = [];
  MostPopularListModel? mostPopularListModel;

  Future<void> getMostPopularProductData({
    String? id,
    int? pageId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? limit,
    String? priceOrder,
    String? discount,
    String? sectionType,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getMostPopularProductData(
          id: id,
          pageId: pageId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          limit: limit,
          priceOrder: priceOrder,
          discount: discount,
          isMostWishList: isMostWishList
      );

      log('====/@ Most Popular Response Con: ${response.body}');
      log('====/@ Most Popular Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        mostPopularList = [];
        mostPopularListModel = MostPopularListModel.fromJson(response.body);

        /// Add to list data
        mostPopularList.addAll(mostPopularListModel?.data?.result ?? []);

        log('====/@ Most Popular List Con1: $mostPopularList');
        log('====/@ Most Popular List Con1: ${mostPopularListModel?.data?.result}');
        log('====/@ Most Popular List Con1: ${mostPopularListModel?.toJson()}');

        // Update the productsFound flag
        productsFound = mostPopularList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ Most Popular product

  List<BrandTypeProductResult> brandTypeList = [];
  BrandTypeProductModel? brandTypeProductModel;

  Future<void> getBrandTypeProductData({
    String? id,
    int? pageId,
    int? genderId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? limit,
    String? priceOrder,
    String? discount,
    String? sectionType,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getBrandTypeProductData(
          id: id,
          genderId: genderId,
          pageId: pageId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          limit: limit,
          priceOrder: priceOrder,
          discount: discount,
          isMostWishList: isMostWishList
      );

      log('====/@ Most Popular Response Con: ${response.body}');
      log('====/@ Most Popular Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        brandTypeList = [];
        brandTypeProductModel = BrandTypeProductModel.fromJson(response.body);

        /// Add to list data
        brandTypeList.addAll(brandTypeProductModel?.data?.result ?? []);

        log('====/@ Most Popular List Con1: $brandTypeList');
        log('====/@ Most Popular List Con1: ${brandTypeProductModel?.data?.result}');
        log('====/@ Most Popular List Con1: ${brandTypeProductModel?.toJson()}');

        // Update the productsFound flag
        productsFound = brandTypeList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ ChildCategory product List

  List<SearchPoductListResult> searchProductList = [];
  SearchPoductListModel? searchPoductListModel;

  Future<void> getSearchProductData({
    String? searchTerm,
    int? pageId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    String? discount,
    String? limit,
    String? sectionType,
    bool? isMostWishList,

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getSearchProductData(
          searchTerm: searchTerm,
          pageId: pageId,
          sizeId: sizeId,
          brandId: brandId,
          colorId: colorId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          priceOrder: priceOrder,
          discount: discount,
          limit: limit,
          sectionType: sectionType,
          isMostWishList: isMostWishList
      );

      log('====/@ Category Response Con: ${response.body}');
      log('====/@ Category Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        searchProductList = [];
        searchPoductListModel = SearchPoductListModel.fromJson(response.body);

        /// Add to list data
        searchProductList.addAll(searchPoductListModel?.data?.result ?? []);

        log('====/@ Category List Con1: $searchProductList');
        log('====/@ Category List Con1: ${searchPoductListModel?.data?.result}');
        log('====/@ Category List Con1: ${searchPoductListModel?.toJson()}');

        // Update the productsFound flag
        productsFound = searchProductList.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ Search Category product List

  List<SeachCategoryListData>? searchCategoryList = [];
  SeachCategoryListModel? seachCategoryListModel;

  Future<void> getSearchCategoryProductData({
    String? pageId,
    String? searchTerm

  }) async {

    try{
      _isLoading = true;
      update();

      Response response = await productListRepo.getSearchCategoryProductData(
          pageId: pageId,
          searchTerm: searchTerm
      );

      log('====/@ Category Response Con: ${response.body}');
      log('====/@ Category Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {

        searchCategoryList = [];
        seachCategoryListModel = SeachCategoryListModel.fromJson(response.body);

        /// Add to list data
        searchCategoryList?.addAll(seachCategoryListModel?.data ?? []);

        log('====/@ Category List Con1: $searchCategoryList');
        log('====/@ Category List Con1: ${searchPoductListModel?.data?.result}');
        log('====/@ Category List Con1: ${searchPoductListModel?.toJson()}');

        // Update the productsFound flag
        productsFound = searchCategoryList!.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// ====/@ Search Brand product List

  List<SearchBrandListData>? searchBrandList = [];
  SearchBrandListModel? searchBrandListModel;

  Future<void> getSearchBrandProductData({
    String? pageId,
    String? searchTerm,
  }) async {
    try {
      _isLoading = true;
      update();

      if (searchTerm?.isEmpty ?? true) {
        // Clear the search results if the searchTerm is empty
        searchBrandList?.clear();
        update();
        return;
      }

      Response response = await productListRepo.getSearchBrandProductData(
        pageId: pageId,
        searchTerm: searchTerm,
      );

      log('====/@ Category Response Con: ${response.body}');
      log('====/@ Category Response statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {
        searchBrandList = [];
        searchBrandListModel = SearchBrandListModel.fromJson(response.body);
        searchBrandList?.addAll(searchBrandListModel?.data ?? []);

        // Update the productsFound flag
        productsFound = searchBrandList!.isNotEmpty;
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (e, s) {
      // Handle the error here
      log('====/@ Error1 fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }


  /// ====/@ Suction product Filter

  SectionProductFilterModel? sectionProductFilterModel;

  Future<void> getSectionProductFilter({
    String? id,
    String? parentId,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getSectionProductFilter(
          id: id,
          parentId: parentId
      );

      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        sectionProductFilterModel = SectionProductFilterModel.fromJson(response.body);

        log('====/@ Filter Section List Sections Con1: ${sectionProductFilterModel?.data?.sections}');
        log('====/@ Filter Section List Brands Con1: ${sectionProductFilterModel?.data?.brands}');
        log('====/@ Filter Section List Sizes Con1: ${sectionProductFilterModel?.data?.sizes}');
        log('====/@ Filter Section List Con1: ${sectionHomepageDetails?.toJson()}');

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


  /// ====/@ Section NewIn product Filter

  SectionNewInProductFilterModel? sectionNewInProductFilterModel;

  Future<void> getSectionNewInFilter({
    String? id,
    int? pageId,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getSectionNewInFilter(
          id: id,
          pageId: pageId,
      );

      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        sectionNewInProductFilterModel = SectionNewInProductFilterModel.fromJson(response.body);

        log('====/@ Filter Section List Size Con1: ${sectionNewInProductFilterModel?.data?.sizes}');
        log('====/@ Filter Section List Discount Con1: ${sectionNewInProductFilterModel?.data?.discount}');
        log('====/@ Filter Section List Brands Con1: ${sectionNewInProductFilterModel?.data?.brands}');
        log('====/@ Filter Section List Color Con1: ${sectionNewInProductFilterModel?.data?.colors}');
        log('====/@ Filter Section List Con1: ${sectionNewInProductFilterModel?.toJson()}');

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

  /// ====/@ Category Product Filter product
  CategoryProductFilterTermModel? categoryProductFilterTermModel;

  Future<void> getCategoryProductFilter({
    String? id,
    String? parentId,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getCategoryProductFilter(
          id: id,
          parentId: parentId
      );

      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        categoryProductFilterTermModel = CategoryProductFilterTermModel.fromJson(response.body);

        log('====/@ Filter Category List Sections Con1: ${categoryProductFilterTermModel?.data?.sections}');
        log('====/@ Filter Category List Brands Con1: ${categoryProductFilterTermModel?.data?.brands}');
        log('====/@ Filter Category List Discount Con1: ${categoryProductFilterTermModel?.data?.discount}');
        log('====/@ Filter Category List Color Con1: ${categoryProductFilterTermModel?.data?.colors}');
        // log('====/@ Filter Section List Sizes Con1: ${categoryProductFilterTermModel?.data?.sizes}');
        log('====/@ Filter Category List Con1: ${categoryProductFilterTermModel?.toJson()}');

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

  /// ====/@ SubCategory product Filter
  SubCategoryProductFilterModel? subCategoryProductFilterModel;

  Future<void> getSubCategoryProductFilter({
    String? id,
    String? parentId,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getSubCategoryProductFilter(
          id: id,
          parentId: parentId
      );

      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        subCategoryProductFilterModel = SubCategoryProductFilterModel.fromJson(response.body);

        log('====/@ Filter Category List Sections Con1: ${subCategoryProductFilterModel?.data?.sections}');
        log('====/@ Filter Category List Brands Con1: ${subCategoryProductFilterModel?.data?.brands}');
        log('====/@ Filter Category List Discount Con1: ${subCategoryProductFilterModel?.data?.discount}');
        log('====/@ Filter Category List Color Con1: ${subCategoryProductFilterModel?.data?.colors}');
        // log('====/@ Filter Section List Sizes Con1: ${categoryProductFilterTermModel?.data?.sizes}');
        log('====/@ Filter Category List Con1: ${subCategoryProductFilterModel?.toJson()}');

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


  /// ====/@ SubCategory product Filter
  ChildCategoryProductFilterModel? childCategoryProductFilterModel;

  Future<void> getChildCategoryProductFilter({
    String? id,
    String? parentId,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getChildCategoryProductFilter(
          id: id,
          parentId: parentId
      );

      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        childCategoryProductFilterModel = ChildCategoryProductFilterModel.fromJson(response.body);

        log('====/@ Filter Category List Sections Con1: ${childCategoryProductFilterModel?.data?.sections}');
        log('====/@ Filter Category List Brands Con1: ${childCategoryProductFilterModel?.data?.brands}');
        log('====/@ Filter Category List Discount Con1: ${childCategoryProductFilterModel?.data?.discount}');
        log('====/@ Filter Category List Color Con1: ${childCategoryProductFilterModel?.data?.colors}');
        // log('====/@ Filter Section List Sizes Con1: ${categoryProductFilterTermModel?.data?.sizes}');
        log('====/@ Filter Category List Con1: ${childCategoryProductFilterModel?.toJson()}');

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

  /// ====/@ Sell product Filter
  SellProductFilterTermModel? sellProductFilterTermModel;

  Future<void> getSellProductFilterTerm({
    String? genderId,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getSellProductFilter(
          genderId: genderId
      );

      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        sellProductFilterTermModel = SellProductFilterTermModel.fromJson(response.body);

        log('====/@ Filter Sell List Sections Con1: ${sellProductFilterTermModel?.data?.categories}');
        log('====/@ Filter Sell List Brands Con1: ${sellProductFilterTermModel?.data?.brands}');
        log('====/@ Filter Sell List Discount Con1: ${sellProductFilterTermModel?.data?.discount}');
        log('====/@ Filter Sell List Color Con1: ${sellProductFilterTermModel?.data?.colors}');
        log('====/@ Filter Sell List Sizes Con1: ${sellProductFilterTermModel?.data?.sizes}');
        log('====/@ Filter Sell List Con1: ${sellProductFilterTermModel?.toJson()}');

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


  /// ====/@ Brand product Filter
  BrandProductFilterTermModel? brandProductFilterTermModel;

  Future<void> getBrandProductFilter({
    String? id,
    String? genderId,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getBrandProductFilter(
          id: id,
          genderId: genderId
      );

      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        brandProductFilterTermModel = BrandProductFilterTermModel.fromJson(response.body);

        log('====/@ Filter Sell List Sections Con1: ${brandProductFilterTermModel?.data?.allBrands}');
        log('====/@ Filter Sell List Color Con1: ${brandProductFilterTermModel?.data?.colors}');
        log('====/@ Filter Sell List Sizes Con1: ${brandProductFilterTermModel?.data?.sizes}');
        log('====/@ Filter Sell List Con1: ${brandProductFilterTermModel?.toJson()}');

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

  /// ====/@ Most Popular product Filter
  MostPopularFilterTermModel? mostPopularFilterTermModel;

  Future<void> getMostPopularFilter({
    String? id,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getMostPopularFilter(
          id: id
      );

      log('====/@ Most Popular Filter Response Con: ${response.body}');
      log('====/@ Most Popular Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        mostPopularFilterTermModel = MostPopularFilterTermModel.fromJson(response.body);

        log('====/@ Filter Most Popular List Sections Con1: ${brandProductFilterTermModel?.data?.allBrands}');
        log('====/@ Filter Most Popular List Color Con1: ${brandProductFilterTermModel?.data?.colors}');
        log('====/@ Filter Most Popular List Sizes Con1: ${brandProductFilterTermModel?.data?.sizes}');
        log('====/@ Filter Most Popular List Con1: ${brandProductFilterTermModel?.toJson()}');

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

  /// ====/@ Search Product Filter product
  SearchPoductFilterTermModel? searchPoductFilterTermModel;

  Future<void> getSearchProductFilterTerm({
    String? pageId,
    String? searchTerm,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getSearchProductFilterTerm(
          pageId: pageId,
          searchTerm: searchTerm
      );

      log('====/@ Section Filter Response Con: ${response.body}');
      log('====/@ Section Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        searchPoductFilterTermModel = SearchPoductFilterTermModel.fromJson(response.body);

        log('====/@ Filter Search List Brands Con1: ${searchPoductFilterTermModel?.data?.brands}');
        log('====/@ Filter Search List Color Con1: ${searchPoductFilterTermModel?.data?.colors}');
        log('====/@ Filter Search List Sizes Con1: ${searchPoductFilterTermModel?.data?.sizes}');
        log('====/@ Filter Search List Con1: ${searchPoductFilterTermModel?.toJson()}');

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

  /// ====/@ Most Popular product Filter
  BrandTypeProductFilterModel? brandTypeProductFilterModel;

  Future<void> getBrandTypeProductFilterTerm({
    String? id,
    int? genderId,
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productListRepo.getBrandTypeProductFilterTerm(
          id: id,
          genderId: genderId
      );

      log('====/@ Most Popular Filter Response Con: ${response.body}');
      log('====/@ Most Popular Response statuscode: ${response.statusCode}');

      if(response.statusCode == 200){

        brandTypeProductFilterModel = BrandTypeProductFilterModel.fromJson(response.body);

        log('====/@ Filter Most Popular List Sections Con1: ${brandTypeProductFilterModel?.data?.allBrands}');
        log('====/@ Filter Most Popular List Color Con1: ${brandTypeProductFilterModel?.data?.colors}');
        log('====/@ Filter Most Popular List Sizes Con1: ${brandTypeProductFilterModel?.data?.sizes}');
        log('====/@ Filter Most Popular List Con1: ${brandTypeProductFilterModel?.toJson()}');

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


//   /// section product
//   Future<void> getSectionProductData(String id) async {
//     _isLoading = true;
//     update();
//     Response response = await productListRepo.getSectionProductData(id);
//
//     if (response.statusCode == 200) {
//       // photos = [];
//       sectionProductListResponse= SectionProductListResponse.fromJson(response.body);
// /*      categoryProductResponse!.data!.result!.map((e) {
//         photos!.add(e.productColorVariants!);
//       }).toList();*/
//
//     } else {
//       ApiChecker.checkApi(response);
//       // showCustomSnackBar(response.statusCode!.toString());
//     }
//     _isLoading = false;
//     update();
//   }


//   /// category product
//   Future<void> getCategoryProductData(String categoryId) async {
//     _isLoading = true;
//     update();
//     Response response = await productListRepo.getCategoryProductData(categoryId);
//
//     if (response.statusCode == 200) {
//       // photos = [];
//       categoryProductResponse= CategoryProductResponse.fromJson(response.body);
// /*      categoryProductResponse!.data!.result!.map((e) {
//         photos!.add(e.productColorVariants!);
//       }).toList();*/
//
//     } else {
//       ApiChecker.checkApi(response);
//       // showCustomSnackBar(response.statusCode!.toString());
//     }
//     _isLoading = false;
//     update();
//   }


//   /// subcategory
//   Future<void> getSubCategoryProductData(String subCategoryId) async {
//     _isLoading = true;
//     update();
//     Response response = await productListRepo.getSubCategoryProductData(subCategoryId);
//
//     if (response.statusCode == 200) {
//       // photos = [];
//       subCategoryResponse= SubCategoryResponse.fromJson(response.body);
// /*      categoryProductResponse!.data!.result!.map((e) {
//         photos!.add(e.productColorVariants!);
//       }).toList();*/
//
//     } else {
//       ApiChecker.checkApi(response);
//       // showCustomSnackBar(response.statusCode!.toString());
//     }
//     _isLoading = false;
//     update();
//   }


//   /// childcategory
//   Future<void> getChildCategoryProductData(String childCategoryId) async {
//     _isLoading = true;
//     update();
//     Response response = await productListRepo.getChildCategoryProductData(childCategoryId);
//
//     if (response.statusCode == 200) {
//       // photos = [];
//       childCategoryResponse= ChildCategoryResponse.fromJson(response.body);
// /*      categoryProductResponse!.data!.result!.map((e) {
//         photos!.add(e.productColorVariants!);
//       }).toList();*/
//
//     } else {
//       ApiChecker.checkApi(response);
//       // showCustomSnackBar(response.statusCode!.toString());
//     }
//     _isLoading = false;
//     update();
//   }





//   ///  brand section
//   Future<void> getBrandProductData(String brandId) async {
//     _isLoading = true;
//     update();
//     Response response = await productListRepo.getBrandProductData(brandId);
//
//     if (response.statusCode == 200) {
//       // photos = [];
//       brandSectionProductResponse= BrandSectionProductResponse.fromJson(response.body);
// /*      categoryProductResponse!.data!.result!.map((e) {
//         photos!.add(e.productColorVariants!);
//       }).toList();*/
//
//     } else {
//       ApiChecker.checkApi(response);
//       // showCustomSnackBar(response.statusCode!.toString());
//     }
//     _isLoading = false;
//     update();
//   }



  Future<void> getFilterListData(String id,int type) async {
    _isLoading = true;
    update();
    Response response = await productListRepo.getFilterData(id,type);

    if (response.statusCode == 200) {
      // photos = [];
      filterDataResponse= FilterDataResponse.fromJson(response.body);
/*      categoryProductResponse!.data!.result!.map((e) {
        photos!.add(e.productColorVariants!);
      }).toList();*/

    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }




}
