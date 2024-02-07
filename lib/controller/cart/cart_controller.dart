import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/model/request%20model/order_place_request.dart';
import 'package:isletestapp/data/model/response/cart/apply_coupon-response.dart';
import 'package:isletestapp/data/model/response/cart/bag_response.dart';
import 'package:isletestapp/data/model/response/general%20settings/general_settings_response.dart';
import 'package:isletestapp/data/repository/cart/cart_repo.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import '../../data/api/api_checker.dart';
import '../../view/base/custom_snackbar.dart';
import '../../view/screens/checkout/thank_you_page.dart';
import 'package:isletestapp/data/model/response/cart/bag_response.dart' as s;

class CartController extends GetxController implements GetxService {
  final CartRepo cartRepo;
  CartController({
    required this.cartRepo,
  });


  OrderPlaceRequest orderPlaceRequest=OrderPlaceRequest();

  ///cart amounts values
  double subTotal=0;
  double grandTotal=0;
  double vat=0;
  double isleCouponDis=0.0;
  double brandCouponDis=0.0;

  String? selectedDeliveryType=null;

  TextEditingController msgCtr = TextEditingController();
  TextEditingController islecouponCtr = TextEditingController();
  TextEditingController brandcouponCtr = TextEditingController();

  ApplyCouponResponse ? applyCouponResponse =null;
  GeneralSettingResponse ? generalSettingResponse =null;

  // List<Cart> cartList=[];
  List<String> cartList=[];
  BagePageCartResponse ? bagePageCartResponse =null;
  bool _isLoading = false;

  int cartLength=0;
  bool get isLoading => _isLoading;


  /// general settings
  Future<void> getGeneralSettingData() async {
    _isLoading = true;
    update();
    Response response = await cartRepo.getGeneralSettingData();

    if (response.statusCode == 200) {
      generalSettingResponse = GeneralSettingResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// bag page cart data
  Future<void> getBagPageCartData() async {
    _isLoading = true;
    update();

    islecouponCtr.text=cartRepo.getIsleCouponText();
    brandcouponCtr.text=cartRepo.getBrandText();


    Response response = await cartRepo.getBagPageCartData();
    if (response.statusCode == 200) {
      bagePageCartResponse= BagePageCartResponse.fromJson(response.body);
      if(bagePageCartResponse!=null){
        isleCouponDis=double.parse(cartRepo.getIsleCouponDiscount());
        brandCouponDis=double.parse(cartRepo.getBrandDiscount());

        bagePageCartResponse!.data!.map((e) {
          //  e.totalPrice= e.finalPrice!;
          e.stock=e.productInventory?.stockQty??0;
          e.totalPrice=e.product!.price!*e.quantity!;
        }).toList();
        bagePageCartResponse!.data!.map((e) {
          //  e.totalPrice= e.finalPrice!;
          e.stock=e.productInventory?.stockQty??0;
          e.totalDiscountedPrice=e.product!.discountedPrice!*e.quantity!;
        }).toList();
        cartLength=bagePageCartResponse!.data!.length;
      }else{
        cartLength=0;
      }
      getTotal();
      // getGrandTotal();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///
  Future<void> cartQtyUpdate(String id,int qty) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.updateCartQuantity(id, qty);

    if (response.statusCode == 200) {

      if(response.body["status"]=="success"){
        await getBagPageCartData();
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

  Future<void> cartDelete(String id) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.deleteCart(id);

    if (response.statusCode == 200) {
      await getBagPageCartData();
      showCustomSnackBar("Successfully deleted!!",isPosition:true);
      Get.back();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }



  Future<void> addQuantity(bool isIncrease,int index)async {
    if(isIncrease){

      int stock=bagePageCartResponse!.data![index]?.productInventory?.stockQty??1;
      if(bagePageCartResponse!.data![index].quantity!<=stock){
        bagePageCartResponse!.data![index].quantity= bagePageCartResponse!.data![index].quantity!+1;
        bagePageCartResponse!.data![index].totalPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.price!;
        bagePageCartResponse!.data![index].totalDiscountedPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.discountedPrice!;
        cartQtyUpdate(bagePageCartResponse!.data![index].id.toString(), bagePageCartResponse!.data![index].quantity!);
      }
    }else{
      if(bagePageCartResponse!.data![index].quantity!>1){
        bagePageCartResponse!.data![index].quantity= bagePageCartResponse!.data![index].quantity!-1;
        bagePageCartResponse!.data![index].totalPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.price!;
        bagePageCartResponse!.data![index].totalDiscountedPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.discountedPrice!;
        cartQtyUpdate(bagePageCartResponse!.data![index].id.toString(), bagePageCartResponse!.data![index].quantity!);
      }
    }
    getTotal();
  }

  Future<void> getTotal() async {
    subTotal = 0;
    grandTotal = 0;
    vat=0;
    if (bagePageCartResponse != null) {
      bagePageCartResponse!.data!.forEach((e) {
        e.stock = e.productInventory?.stockQty ?? 0;
        double qty = double.parse(e.quantity.toString());
        // Check for discount availability, if available, use discountedPrice, otherwise use price
        double price = e.product!.discount != null && e.product!.discount! > 0
            ? e.product!.discountedPrice!
            : e.product!.price!;
        subTotal += price * qty;
        if(e.product!.vatType=="percent"){
          double vatPercentAmount=((e.product!.vat!*price)/100);
          vat=vat+vatPercentAmount;
          print(vat);
        }else{
          vat=vat+e.product!.vat!.toDouble();

        }
      });
    }


    grandTotal = subTotal-isleCouponDis-brandCouponDis; // Subtract discount from subTotal
    // grandTotal -= discountValue; // Subtract discount from subTotal
    orderPlaceRequest.vat=vat.ceilToDouble();
    print(vat);
    orderPlaceRequest.subtotal=subTotal;
    orderPlaceRequest.grandTotal=grandTotal;
    orderPlaceRequest.brandCouponAmount=brandCouponDis;
    orderPlaceRequest.isleCouponAmount=isleCouponDis;
    update();
  }

/*  Future<void> getTotal() async {
    subTotal = 0;
    if (bagePageCartResponse != null) {
      bagePageCartResponse!.data!.forEach((e) {
        e.stock = e.productInventory?.stockQty ?? 0;
        double qty = double.parse(e.quantity.toString());
        // Check for discount availability, if available, use discountedPrice, otherwise use price
        double price = e.product!.discount != null && e.product!.discount! > 0
            ? e.product!.discountedPrice!
            : e.product!.price!;
        subTotal += price * qty;
      });
    }
    update();
  }*/

/*  Future<void> getTotal()async {
    subTotal=0;

    if(bagePageCartResponse!=null){
      bagePageCartResponse!.data!.map((e) {
        e.stock = e.productInventory?.stockQty ?? 0;
        double qty=double.parse(e.quantity.toString());
        subTotal=subTotal+(e.product!.price!*qty);

      }).toList();
    }
    update();
  }*/



  /// isle coupon apply
  Future<void> applyIsleCoupon({
    required String? customer_id,
    required String? corelation_id,
    required String? code,
    required String? type,
    required String? is_guest,
  }) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.applyIsleCoupon(
      customer_id : customer_id,
      corelation_id : corelation_id,
      code : code,
      type : type,
      is_guest : is_guest,
    );
    log('customer id:$customer_id');
    log('corelation id:$corelation_id');
    log('code:$code');
    log('Type:$type');
    if (response.statusCode == 201) {
      log('Full response: ${response.body}');
      applyCouponResponse = ApplyCouponResponse.fromJson(response.body);
      //  Get.to(BagPage(isleCoupon: applyCouponResponse!.data!.discount!.toString(), coupontype: applyCouponResponse!.data!.type??"",));

      if(applyCouponResponse!.data!.type=="isle"){
        isleCouponDis=applyCouponResponse!.data!.discount!.toDouble();
        cartRepo.saveIsleCouponDiscount(isleCouponDis.toString());
        cartRepo.saveIsleCouponText(code.toString());
      }else{
        brandCouponDis=applyCouponResponse!.data!.discount!.toDouble();
        cartRepo.saveBrandDiscount(brandCouponDis.toString());
        cartRepo.saveBrandText(code.toString());
      }
      getTotal();

      if (response.statusCode == 500) {
        if (response.body.contains("This coupon is not valid")) {
          // Display a specific message for invalid coupon
          showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
        } else {
          // Display a generic error message for other errors
          ApiChecker.checkApi(response);
        }
      }
      showCustomSnackBar("You Got ${applyCouponResponse!.data!.discount!.toString()} discount", isError: false, isPosition: false);
      // islecouponCtr.text = "";
    } else {
      // ApiChecker.checkApi(response);
      showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
    }
    _isLoading = false;
    update();
  }


  void clearAllCoupon(){
    cartRepo.clearCoupon();
  }

/*
  /// brand coupon apply
  Future<void> applyBrandCoupon({
    required String? customer_id,
    required String? corelation_id,
    required String? code,
    required String? type,
    required String? is_guest,
  }) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.applyBrandCoupon(
      customer_id : customer_id,
      corelation_id : corelation_id,
      code : code,
      type : type,
      is_guest : is_guest,
    );
    log('customer id:$customer_id');
    log('corelation id:$corelation_id');
    log('code:$code');
    log('Type:$type');
    if (response.statusCode == 201) {
      log('Full response: ${response.body}');
      applyCouponResponse = ApplyCouponResponse.fromJson(response.body);
      Get.to(BagPage(brandCoupon: applyCouponResponse!.data!.discount!.toString(), coupontype: applyCouponResponse!.data!.type??"",));
      if (response.statusCode == 500) {
        if (response.body.contains("This coupon is not valid")) {
          // Display a specific message for invalid coupon
          showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
        } else {
          // Display a generic error message for other errors
          ApiChecker.checkApi(response);
        }
      }
      showCustomSnackBar("You Got ${applyCouponResponse!.data!.discount!.toString()} discount", isError: false, isPosition: false);
      // brandcouponCtr.text = "";
    } else {
      // ApiChecker.checkApi(response);
      showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
    }
    _isLoading = false;
    update();
  }
*/
















}
