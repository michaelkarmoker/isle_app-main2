import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/district/district_response.dart';
import 'package:isletestapp/data/model/response/division/division_response.dart';
import 'package:isletestapp/data/model/response/profile/address%20book/load_edit_addressbook_response.dart';
import 'package:isletestapp/data/model/response/profile/feedback/account_feedback_response.dart';
import 'package:isletestapp/data/model/response/profile/feedback/account_product_feedback_response.dart';
import 'package:isletestapp/data/model/response/profile/feedback/product_feedback_details_response.dart';
import 'package:isletestapp/data/model/response/profile/get_profile_response.dart';
import 'package:isletestapp/data/model/response/profile/address%20book/user_addressbook_response.dart';
import 'package:isletestapp/data/model/response/profile/refer%20friend/apply_refer_code_response.dart';
import 'package:isletestapp/data/model/response/profile/refer%20friend/get_refer_code_response.dart';
import 'package:isletestapp/data/model/response/social/socail_response.dart';
import 'package:isletestapp/data/model/response/thana/thana_response.dart';
import 'package:isletestapp/data/repository/profile/product%20feedback/product_feedback_repo.dart';
import 'package:isletestapp/data/repository/profile/user/user_profile__repo.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';

class ProductFeedbackController extends GetxController implements GetxService {
  final ProductFeedbackRepo productFeedbackRepo;
  ProductFeedbackController({required this.productFeedbackRepo});

 Future<void> dataInitialize()async {
    await getProductFeedbackData();
 }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AccountProductFeedbackResponse ? accountProductFeedbackResponse =null;
  ProductFeedbackDetailsResponse ? productFeedbackDetailsResponse =null;

  Future<void> dataClearForProductFeedback()async {
    accountProductFeedbackResponse = null;
  }


  ///  create feedback
  Future<void> createProductFeedback({
    required String? message,
    required String? product_id,
    required String? customer_id,
    required String? rating,
  }) async {
    _isLoading = true;
    update();
    Response response = await productFeedbackRepo.createProductFeedback(
      message : message,
      product_id : product_id,
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

  /// product feedback get data
  Future<void> getProductFeedbackData() async {
    _isLoading = true;
    update();
    Response response = await productFeedbackRepo.getProductFeedbackData();
    if (response.statusCode == 200) {
      accountProductFeedbackResponse= AccountProductFeedbackResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }
  /// View product feedback get data
  Future<void> getViewProductFeedbackData(String orderNo) async {
    _isLoading = true;
    update();
    Response response = await productFeedbackRepo.getViewProductFeedbackData(orderNo);
    if (response.statusCode == 200) {
      productFeedbackDetailsResponse= ProductFeedbackDetailsResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }







}
