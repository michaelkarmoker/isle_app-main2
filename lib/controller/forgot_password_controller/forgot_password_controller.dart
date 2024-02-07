import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/repository/forgot_password/forgot_password_repo.dart';
import '../../data/api/api_checker.dart';
import '../../view/base/custom_snackbar.dart';

class ForgotPasswordController extends GetxController implements GetxService {
  final ForgotPasswordRepo forgotPasswordRepo;
  ForgotPasswordController({required this.forgotPasswordRepo,});
  TextEditingController phoneemailCtr = TextEditingController();

  bool _isLoading = false;
  int wishcartLength=0;
  bool get isLoading => _isLoading;

  /// get otp request
  Future<void> getOTPRequest({
    required String phone,
    required String email,
  }) async {
    _isLoading = true;
    update();
    print("Otp Request");
    Response response = await forgotPasswordRepo.getOTPRequest(
      phone : phone,
      email : email,
    );
    if (response.statusCode == 200) {
      Get.back();
      print("OTP Request 22");
      // showCustomSnackBar("Add Cat Successfully", isError: true, isPosition: true);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


 /* /// create wardrobe product
  Future<void> createWardrobeProduct({
    required String wardrobe_id,
    required String wishlist_id,
  }) async {
    _isLoading = true;
    update();
    Response response = await forgotPasswordRepo.createWardrobeProduct(
      wardrobe_id: wardrobe_id,
      wishlist_id: wishlist_id,
    );
    if (response.statusCode == 201) {
       // await getWardrobeData();
      showCustomSnackBar("Wardrobe product choose successful", isError: false , isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


*/







}