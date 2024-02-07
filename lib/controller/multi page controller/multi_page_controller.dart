import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/contact_us_response.dart';
import 'package:isletestapp/data/model/response/enquiry_type_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/about_us_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/career_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/collaborate_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/how_find_itens_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/how_order_pay_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/order_delivery_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/payment_pricing_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/privecy_cookies_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/return_refund_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/shipping_delivery_response.dart';
import 'package:isletestapp/data/model/response/multi%20page/terms_conditions_response.dart';
import 'package:isletestapp/data/repository/multi%20page%20repo/multi_page_repo.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class MultiPageController extends GetxController implements GetxService {
  final MultiPageRepo multiPageRepo;
  MultiPageController({required this.multiPageRepo});

  AboutUsResponse? aboutUsResponse=null;
  CareerResponse? careerResponse=null;
  TermsConditionResponse? termsConditionResponse=null;
  PrivecyCookiesResponse? privecyCookiesResponse=null;
  CollaborateResponse? collaborateResponse=null;
  ShippingDeliveryResponse? shippingDeliveryResponse=null;
  PaymentPricingResponse? paymentPricingResponse=null;
  ReturnRefundResponse? returnRefundResponse=null;
  OrderDeliveryresponse? orderDeliveryresponse=null;
  FindItemsResponse? findItemsResponse=null;
  OrderPayResponse? orderPayResponse=null;


  TextEditingController emailCtr = TextEditingController();
  TextEditingController firstnameCtr = TextEditingController();
  TextEditingController lastnameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController subjectCtr = TextEditingController();
  TextEditingController msgCtr = TextEditingController();
  TextEditingController orderidCtr = TextEditingController();

  ContactusResponse? contactusResponse=null;
  EnquiryResponse? enquiryResponse=null;
  List<String>? selectEnquiry=[];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> dataForAboutus()async {
    await getAboutUs();
  }
  Future<void> dataClearForAboutus()async {
    aboutUsResponse = null;
  }

  Future<void> dataForEnquiry()async {
    await getEnquiry();
    await getContactus();
  }
  Future<void> dataClearForEnquiry()async {
    enquiryResponse = null;
    emailCtr.text = "";
    firstnameCtr.text = "";
    lastnameCtr.text = "";
    phoneCtr.text = "";
    subjectCtr.text = "";
    msgCtr.text = "";
    orderidCtr.text = "";
  }

  /// order delivery
  Future<void> getOrderDelivery() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getOrderDelivery();
    if (response.statusCode == 200) {
      orderDeliveryresponse= OrderDeliveryresponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// return refund
  Future<void> getReturnRefund() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getReturnRefund();
    if (response.statusCode == 200) {
      returnRefundResponse= ReturnRefundResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// payment pricing
  Future<void> getPaymentPricing() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getPaymentPricing();
    if (response.statusCode == 200) {
      paymentPricingResponse= PaymentPricingResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// about us
  Future<void> getAboutUs() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getAboutUs();
      if (response.statusCode == 200) {
        aboutUsResponse= AboutUsResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// career
  Future<void> getCareer() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getCareer();
    if (response.statusCode == 200) {
      careerResponse= CareerResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// terms nd conditions
  Future<void> getTermsConditions() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getTermsConditions();
    if (response.statusCode == 200) {
      termsConditionResponse= TermsConditionResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// privecy nd cookies
  Future<void> getPrivecyCookies() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getPrivecyCookies();
    if (response.statusCode == 200) {
      privecyCookiesResponse= PrivecyCookiesResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// collaborate
  Future<void> getCollaborate() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getCollaborate();
    if (response.statusCode == 200) {
      collaborateResponse= CollaborateResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// find items
  Future<void> getFindItems() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getFindItems();
    if (response.statusCode == 200) {
      findItemsResponse= FindItemsResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// collaborate
  Future<void> getOrderPay() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getOrderPay();
    if (response.statusCode == 200) {
      orderPayResponse= OrderPayResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }


  /// shipping delivery
  Future<void> getShippingDelivery() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getShippingDelivery();
    if (response.statusCode == 200) {
      shippingDeliveryResponse= ShippingDeliveryResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }






  /// enquiry list
  Future<void> getEnquiry() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getEnguiry();
    if (response.statusCode == 200) {
      selectEnquiry=[];
      enquiryResponse= EnquiryResponse.fromJson(response.body);
      enquiryResponse!.data!.map((e) {
        selectEnquiry!.add(e.title!);
      }).toList();
    } else {
      ApiChecker.checkApi(response.body);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }
  Future<void> enquirySubmit({
    required String enquiry_type_id,
    required String email,
    required String first_name,
    required String last_name,
    required String phone,
    required String subject,
    required String message,
    required String order_no,
  }) async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.enquirySubmit(
      enquiry_type_id:enquiry_type_id,
      email:email,
      first_name:first_name,
      last_name:last_name,
      phone:phone,
      subject:subject,
      message:message,
      order_no:order_no,
    );
    if (response.statusCode == 201) {
      showCustomSnackBar("Successfully Submitted", isError: false);
      getEnquiry();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// contact us
  Future<void> getContactus() async {
    _isLoading = true;
    update();
    Response response = await multiPageRepo.getContactus();
    if (response.statusCode == 200) {
      contactusResponse= ContactusResponse.fromJson(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }












}
