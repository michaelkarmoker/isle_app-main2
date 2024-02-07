import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/model/response/cart/bag_response.dart';
import 'package:isletestapp/data/model/response/general%20settings/general_settings_response.dart';
import 'package:isletestapp/data/model/response/wardrobe/wardrobe_list_response.dart';
import 'package:isletestapp/data/model/response/wishlist/check_wishlist_response.dart';
import 'package:isletestapp/data/model/response/wishlist/get_wishlist_response.dart';
import 'package:isletestapp/data/repository/cart/cart_repo.dart';
import 'package:isletestapp/data/repository/wishlist/wishlist_repo.dart';
import 'package:isletestapp/view/screens/all_popup/add_to_cart_from_wishlist_popup.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';
import 'package:isletestapp/view/screens/wardrob/wardrob_name.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';

import '../../data/api/api_checker.dart';
import '../../view/base/custom_snackbar.dart';
import '../../view/screens/checkout/thank_you_page.dart';



class WishlistController extends GetxController implements GetxService {

  final WishlistRepo wishlistRepo;


  WishlistController({required this.wishlistRepo,});
  double subTotal=0;
  TextEditingController wardrobCtr = TextEditingController();


  GetWishlistResponse ? getWishlistResponse =null;
  CheckWishlistResponse ? checkWishlistResponse =null;
  WardrobeResponse ? wardrobeResponse =null;
  int sectedColorVAriantIndex=0;
  String? sectedSize;
  String? selectedStockQty;
  int stock=10;
  int sectedWishIndex=0;
  // List<Cart> cartList=[];
  List<String> cartList=[];
  BagePageCartResponse ? bagePageCartResponse =null;
  bool _isLoading = false;
  int wishcartLength=0;
  bool get isLoading => _isLoading;

  ///  add to cart
  Future<void> AddtoCartFromWishlist({
    required String client_corelation_id,
    required String customer_id,
    required String product_id,
    required String color_variant_id,
    required String discount,
    required String quantity,
    required String size,
    required String price,
    required String mrp_price,
    required String product_inventory_id,
    required String final_price,
  }) async {
    _isLoading = true;
    update();
    print("add to cart sunny");
    Response response = await wishlistRepo.AddtoCartFromWishlist(
      client_corelation_id : client_corelation_id,
      customer_id : customer_id,
      product_id : product_id,
      color_variant_id : color_variant_id,
      discount : discount,
      quantity : quantity,
      size : size,
      price : price,
      mrp_price : mrp_price,
      final_price : final_price,
      product_inventory_id: product_inventory_id,

    );
    if (response.statusCode == 201) {
      Get.back();
      print("add to cart sunny");
      // print(productDetailsResponse!.data!.discount);
      print("fsdd");
      // showCustomSnackBar("Add Cat Successfully", isError: true, isPosition: true);
      Get.dialog( AddtoCartFromWishlistPopup(
        // title: 'Product added to your shopping bag',
        brand: getWishlistResponse?.data?[0]?.product?.brand?.name??"",
        producttitle: getWishlistResponse?.data?[0]?.product?.name??"",
        color: getWishlistResponse?.data?[0]?.product?.productColorVariants?[sectedColorVAriantIndex]?.color?.name??"",
        size: sectedSize.toString()??"",
        /*qty: stockcount!.toString()??"",*/
        qty: "1",
        // qty: productDetailsResponse?.data?.productColorVariants?[sectedColorVAriantIndex]?.productInventories?[sectedColorVAriantIndex]?.stockQty.toString()??"",
        discount: getWishlistResponse?.data?[0]?.product?.discount??0,
        price: getWishlistResponse?.data?[0]?.product?.price??0,
        discountedprice: getWishlistResponse?.data?[0]?.product?.discountedPrice.toString()??"",
        image: getWishlistResponse?.data?[0]?.product?.productColorVariants?[sectedColorVAriantIndex]?.profilePhoto??"",
        season: getWishlistResponse?.data?[0]?.product?.season?.name??"",
        isError: false,
        iconString: getWishlistResponse?.data?[0]?.product?.name??"",
        noBtntap: ()
        {
          Get.back();
          // Get.to(BagPage());
          Get.to(()=>Dashboard(pageIndex: 4));
        },
        yesBtntap: () {
          Get.back();
          Get.back();
        },
        noBtnText: "GO TO BAG",
        yesBtnText: "CONTINUE SHOPPING",

      ));
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// wish list data
  Future<void> getWishlistData() async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.getWishlistData();
    if (response.statusCode == 200) {
      getWishlistResponse = GetWishlistResponse.fromJson(response.body);
      if(getWishlistResponse!=null){
        wishcartLength=getWishlistResponse!.data!.length;
      }else{
        wishcartLength=0;
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// checkWishlisted
  Future<void> getCheckWishlisted(String id) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.getCheckWishlisted(id);
    if (response.statusCode == 200) {
      checkWishlistResponse = CheckWishlistResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  delete wish
  Future<void> deleteWish(String id) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.deleteWish(id);
    if (response.statusCode == 200) {
      showCustomSnackBar("Successfully deleted!!",isPosition:true);
      await getWishlistData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  delete wardrobe
  Future<void> deleteWardrobe(String id) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.deleteWardrobe(id);
    if (response.statusCode == 200) {
      showCustomSnackBar("Successfully deleted!",isPosition:false);
      await getWardrobeData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  delete wardrobe product
  Future<void> deleteWardrobeProduct(String id) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.deleteWardrobeProduct(id);
    if (response.statusCode == 200) {
      showCustomSnackBar("Successfully deleted!",isPosition:false);
      await getWardrobeData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// wardrobe list
  Future<void> getWardrobeData() async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.getWardrobeData();
    if (response.statusCode == 200) {
      wardrobeResponse = WardrobeResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// create wardrobe
  Future<void> createWardrobe({
    required String name,
    required String customer_id,
  }) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.createWardrobe(
      name: name,
      customer_id: customer_id,
    );
    if (response.statusCode == 201) {
      /// main chilo
      // Get.to(WardrobNameList());
      wardrobCtr.clear();
      Get.back();
      showCustomSnackBar("Wardrobe Create Successful", isError: false , isPosition: false);
      getWardrobeData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// create wardrobe product
  Future<void> createWardrobeProduct({
    required String wardrobe_id,
    required String wishlist_id,
  }) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.createWardrobeProduct(
      wardrobe_id: wardrobe_id,
      wishlist_id: wishlist_id,
    );
    if (response.statusCode == 201) {
       await getWardrobeData();
      showCustomSnackBar("Wardrobe product choose successful", isError: false , isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///
/*  Future<void> cartQtyUpdate(String id,int qty) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.updateCartQuantity(id, qty);
    if (response.statusCode == 200) {
      if(response.body["status"]=="success"){
        await getProductDetailsData(id);
      }else{
        showCustomSnackBar(response.body["message"],isError: false);
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> addQuantity(bool isIncrease,int index)async {
    if(isIncrease){
      int stock= productDetailsResponse?.data?.productColorVariants?[index]?.productInventories?[index]?.stockQty??1;
      log("${productDetailsResponse?.data?.productColorVariants?[index]?.productInventories?[index]?.stockQty}");
      if(stockcount!<=stock){
        stockcount= stockcount+1;
        // productDetailsResponse!.data!.price= productDetailsResponse!.data!.price *stockcount;
        // bagePageCartResponse!.data![index].totalDiscountedPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.discountedPrice!;
        cartQtyUpdate(productDetailsResponse!.data!.id.toString(), stockcount);
      }
    }else{
      if(stockcount!>1){
        stockcount= stockcount-1;
        // bagePageCartResponse!.data![index].totalPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.price!;
        // bagePageCartResponse!.data![index].totalDiscountedPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.discountedPrice!;
        cartQtyUpdate(productDetailsResponse!.data!.id.toString(), stockcount);
      }
    }
    update();
    // getTotal();

  }*/









}