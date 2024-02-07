import 'dart:developer';

import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProductListRepo({required this.apiClient, required this.sharedPreferences});

  /// create feedback
  Future<Response> createFeedback({
    required String? message,
    required String? customer_id,
    required String? rating,
  }) async {
    Response _response = await apiClient.postData(AppConstants.CREATE_FEEDBACK_URI,{
      "message":message,
      "customer_id":customer_id,
      "rating":rating,
    });
    return _response;
  }

  /// ====/@ Section product
  Future<Response> getSectionProductData({
    String? id,
    int? pageId,
    List<int>? sizeId,
    List<int>? brandId,
    List<int>? colorId,
    String? minPrice,
    String? maxPrice,
    String? priceOrder,
    String? discount,
    String? sectionType,
    bool? isMostWishList,
  }) async {
    Response response = await apiClient.getData('${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id${AppConstants.sectionProductUrl}',
        query: {
          'page_id': pageId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log("Discount: $discount");
    log("Discount: ${discount.runtimeType}");
    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  // Future<Response> getSectionProductData({
  //   String? id,
  //   int? pageId,
  //   List<int>? sizeId,
  //   List<int>? brandId,
  //   List<int>? colorId,
  //   String? minPrice,
  //   String? maxPrice,
  //   String? priceOrder,
  //   String? discount,
  //   String? sectionType,
  //   bool? isMostWishList,
  // }) async {
  //   // Construct query parameters
  //   Map<String, dynamic> queryParams = {
  //     'page_id': pageId?.toString() ?? '',
  //     'size_id': sizeId?.map((e) => '$e').toList() ?? [],
  //     'brand_id': brandId?.map((e) => '$e').toList() ?? [],
  //     'color_id': colorId?.map((e) => '$e').toList() ?? [],
  //     'max_price': maxPrice?.toString() ?? '',
  //     'min_price': minPrice?.toString() ?? '',
  //     'price_order': priceOrder?.toString() ?? '',
  //     'section_type': sectionType?.toString() ?? '',
  //     'is_most_wishlist': isMostWishList?.toString() ?? '',
  //   };
  //
  //   // Add discount to query parameters only if it's not null and not an empty string
  //   if (discount != null) {
  //     queryParams['discount'] = discount.isNotEmpty ? discount : ''; // Handle empty string case
  //   }
  //
  //   // Make API call with constructed query parameters
  //   Response response = await apiClient.getData(
  //     '${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id${AppConstants.sectionProductUrl}',
  //     query: queryParams,
  //   );
  //
  //   log('====/@ Query Api 1: ${response.request?.url ?? ''}');
  //   // log('=============@ Response: ${response.body}');
  //   return response;
  // }




  /// ====/@ Section NewIn product
  Future<Response> getSectionNewInData({
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
    Response response = await apiClient.getData('${AppConstants.HOME_PAGE_ALL_DATA_START_URI}/$id/new-in',
        query: {
          'page_id': pageId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'limit': limit,
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Category Data List
  Future<Response> getCategoryProductData({
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
    String? sectionType,
    bool? isMostWishList,
  }) async {
    Response response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$categoryId${AppConstants.CATEGORY_PRODUCT_END_PAGE_URI}",
        query: {
          'page_id': pageId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'limit': limit?.toString() ?? '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Sub Category Data List
  Future<Response> getSubCategoryProductData({
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
    String? sectionType,
    bool? isMostWishList,
  }) async {
    Response response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$subCategoryId${AppConstants.subCategoryProductListData}",
        query: {
          'page_id': pageId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'limit': limit?.toString() ?? '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Sub Category Data List
  Future<Response> getChildCategoryProductData({
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
    Response response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$childCategoryId${AppConstants.childCategoryProductFilter}",
        query: {
          'page_id': pageId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'limit': limit?.toString() ?? '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Sale Product
  Future<Response> getSaleProductData({
    int? page,
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
    String? brandText,
    String? sizeText,
    String? categoryText,
    String? sectionType,
    bool? isMostWishList,
  }) async {
    Response response = await apiClient.getData('${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/sell',
        query: {
          'page': page?.toString() ?? '',
          'page_id': pageId?.toString() ?? '',
          'gender_id': genderId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'limit': limit?.toString() ?? '',
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'brand_text': brandText?.toString() ?? '',
          'size_text': sizeText?.toString() ?? '',
          'category_text': categoryText?.toString() ?? '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Brand Product
  Future<Response> getBrandProductData({
    String? id,
    int? page,
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
    String? brandText,
    String? sizeText,
    String? categoryText,
    String? sectionType,
    bool? isMostWishList,
  }) async {
    Response response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id${AppConstants.brandProductListUrl}",
        query: {
          'page': page?.toString() ?? '',
          'page_id': pageId?.toString() ?? '',
          'gender_id': genderId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'limit': limit?.toString() ?? '',
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'brand_text': brandText?.toString() ?? '',
          'size_text': sizeText?.toString() ?? '',
          'category_text': categoryText?.toString() ?? '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Search Data List
  Future<Response> getSearchProductData({
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
    Response response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/search",
        query: {
          'search_term': searchTerm?.toString() ?? '',
          'page_id': pageId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'limit': limit?.toString() ?? '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Search Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Brand Product
  Future<Response> getAllBrandData({
    int? pageId,
  }) async {
    Response response = await apiClient.getData(AppConstants.allBrand,
        query: {
          'page_id': pageId?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Search Brand Type
  Future<Response> getSearchBrandType({
    int? pageId,
    String? brandType,
  }) async {
    Response response = await apiClient.getData('${AppConstants.allBrand}/search-brand-type/$pageId/brand',
        query: {
          'brandtype': brandType?.toString() ?? '',
        }
    );

    log('====/@ Search Brand Type Query Api: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Most Popular product
  Future<Response> getMostPopularProductData({
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
    Response response = await apiClient.getData('${AppConstants.HOME_PAGE_ALL_DATA_START_URI}/$id/most-popular',
        query: {
          'page_id': pageId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'limit': limit,
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Most Popular product
  Future<Response> getBrandTypeProductData({
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
    Response response = await apiClient.getData('${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/brand-type-products/$id',
        query: {
          'page_id': pageId?.toString() ?? '',
          'gender_id': genderId?.toString() ?? '',
          'size_id': sizeId?.map((e) => '$e').toList() ?? [],
          'brand_id': brandId?.map((e) => '$e').toList() ?? [],
          'color_id': colorId?.map((e) => '$e').toList() ?? [],
          'max_price': maxPrice?.toString() ?? '',
          'limit': limit,
          'min_price': minPrice?.toString() ?? '',
          'price_order': priceOrder?.toString() ?? '',
          'discount': discount != null && discount != 'null' ? discount.toString() : '',
          'section_type': sectionType?.toString() ?? '',
          'is_most_wishlist': isMostWishList?.toString() ?? '',
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }


  /// ====/@ Most Popular product
  Future<Response> getSearchCategoryProductData({
    String? pageId,
    String? searchTerm,
  }) async {
    Response response = await apiClient.getData('${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$pageId/categories-search',
        query: {
          'search_term': searchTerm,
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Most Popular product
  Future<Response> getSearchBrandProductData({
    String? pageId,
    String? searchTerm,
  }) async {
    Response response = await apiClient.getData('${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$pageId/brand-search',
        query: {
          'search_term': searchTerm,
        }
    );

    log('====/@ Query Api 1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }


  // /// brand product
  // Future<Response> getBrandProductData(String brandId) async {
  //   // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
  //   Response _response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$brandId${AppConstants.BRAND_PRODUCT_END_PAGE_URI}");
  //   return _response;
  // }

  // /// childcategory product
  // Future<Response> getChildCategoryProductData(String childCategoryId) async {
  //   // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
  //   Response _response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$childCategoryId${AppConstants.childCategoryProductFilter}");
  //   return _response;
  // }

  /// ====/@ Multi Section Product Filter
  Future<Response> getSectionProductFilter({
    String? id,
    String? parentId,
  }) async {

    Response response = await apiClient.getData(
        '${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id${AppConstants.sectionProductFilterTermUrl}',
        query: {'parent_id': parentId}
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Multi Section Product Filter
  Future<Response> getSectionNewInFilter({
    String? id,
    int? pageId,
  }) async {

    Response response = await apiClient.getData('${AppConstants.HOME_PAGE_ALL_DATA_START_URI}/$id/new-in-filter-term',
        query: {'page_id': pageId.toString(),}
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Category Product Filter
  Future<Response> getCategoryProductFilter({
    String? id,
    String? parentId,
  }) async {

    Response response = await apiClient.getData(
        '${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id${AppConstants.categoryProductFilterTermUrl}',
        query: {'parent_id': parentId}
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Sub Category Product Filter
  Future<Response> getSubCategoryProductFilter({
    String? id,
    String? parentId
  }) async {

    Response response = await apiClient.getData(
        '${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id${AppConstants.subCategoryProductFilterTermUrl}',
        query: {'parent_id': parentId}
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Child Category Product Filter
  Future<Response> getChildCategoryProductFilter({
    String? id,
    String? parentId,
  }) async {

    Response response = await apiClient.getData(
        '${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id${AppConstants.childCategoryProductFilterTermUrl}',
        query: {'parent_id': parentId}
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Sell Product Filter
  Future<Response> getSellProductFilter({
    String? genderId,
  }) async {

    Response response = await apiClient.getData('${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/sale-filter-term',
        query: {'gender_id': genderId}
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Child Category Product Filter
  Future<Response> getBrandProductFilter({
    String? id,
    String? genderId,
  }) async {

    Response response = await apiClient.getData(
        '${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id/brand-products-filter-term',
        query: {
          'gender_id': genderId != null && genderId != 'null' ? genderId.toString() : '',
        }
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Most Popular Product Filter
  Future<Response> getMostPopularFilter({
    String? id,
  }) async {

    Response response = await apiClient.getData(
      '${AppConstants.HOME_PAGE_ALL_DATA_START_URI}/$id/most-popular-filter-term',
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  /// ====/@ Search Product Filter
  Future<Response> getSearchProductFilterTerm({
    String? pageId,
    String? searchTerm,
  }) async {

    Response response = await apiClient.getData(
        '${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/search-filter-term',
        query: {
          'page_id': pageId,
          'search_term': searchTerm,
        }
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  Future<Response> getBrandTypeProductFilterTerm({
    String? id,
    int? genderId,
  }) async {

    Response response = await apiClient.getData(
        '${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/brand-type-products-filter-term/$id',
        query: {
          'gender_id': genderId.toString() ?? '',
        }
    );

    log('====/@ Query Filter Api1: ${response.request?.url ?? ''}');
    // log('=============@ Response: ${response.body}');
    return response;
  }

  // Future<Response> getSectionProductData(String id) async {
  //   // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
  //   Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI+"/${id}"+AppConstants.SECTION_PRODUCT_END_PAGE_URI);
  //   return _response;
  // }

  /// category product
  // Future<Response> getCategoryProductData(String categoryId) async {
  //   // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
  //   Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI+"/${categoryId}"+AppConstants.CATEGORY_PRODUCT_END_PAGE_URI);
  //   return _response;
  // }

  /// subcategory product
  // Future<Response> getSubCategoryProductData(String subCategoryId) async {
  //   // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
  //   Response _response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$subCategoryId${AppConstants.SUB_CATEGORY_PRODUCT_END_PAGE_URI}");
  //   return _response;
  // }

  // /// childcategory product
  // Future<Response> getChildCategoryProductData(String childCategoryId) async {
  //   // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
  //   Response _response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$childCategoryId${AppConstants.childCategoryProductFilter}");
  //   return _response;
  // }



  /// section product details
  Future<Response> getProductDetailsData(String sectionId) async {
    // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
    Response _response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$sectionId");
    return _response;
  }



  // /// brand product
  // Future<Response> getBrandProductData(String brandId) async {
  //   // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
  //   Response _response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$brandId${AppConstants.BRAND_PRODUCT_END_PAGE_URI}");
  //   return _response;
  // }


  /// brand product
  Future<Response> getFilterData(String id,int type) async {
    // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
    String endPoint="";
    if(type==AppConstants.SECTION){
      endPoint=AppConstants.FILTER_SECTION;
    }
    Response _response = await apiClient.getData("${AppConstants.CATEGORY_PRODUCT_PAGE_URI}/$id$endPoint");
    return _response;
  }


}