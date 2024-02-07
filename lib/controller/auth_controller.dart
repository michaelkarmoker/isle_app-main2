import 'dart:developer';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/auth/guest_login_response.dart';
import 'package:isletestapp/data/model/response/auth/login_response.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/profile/profile.dart';
import '../data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

/*  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();*/
  TextEditingController passCtr = new TextEditingController();
  TextEditingController emailCtr = new TextEditingController();
  LoginResponse? loginResponse = null;
  GuestLoginResponse? guestLoginResponse = null;
  bool _isLoading = false;
  int notification=0;
  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  set isActiveRememberMe(bool value) {
    _isActiveRememberMe = value;
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  Future<void> setuserName() async {
    String userName = getUserName();
    String password = getUserPassword();
    emailCtr.text = userName;
    passCtr.text = password;

  }

  /// for registration
  /* Future<void> getRegistration({
    required String company_name,
    required String name,
    required String email,
    *//*  required String district_id,
    required String area_id,*//*
    required String password,
    required String confirm_password,
    required String contact_number,
    required String business_address,
    required String fb_url,
  }) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(
      company_name: company_name,
      name: name,
      email: email,
      *//*   district_id: district_id,
      area_id: area_id,*//*
      password: password,
      confirm_password: confirm_password,
      contact_number: contact_number,
      business_address: business_address,
      fb_url: fb_url,
    );
    if (response.statusCode == 200) {
      Get.back();
      showCustomSnackBar('Registration Successful', isError: false);
      Get.off(MerchantSignIn()) ;
      // showCustomSnackBar(response.body["message"], isError: false);
    } else {
      // showCustomSnackBar(response.body("message").toString(), isError: false);
      // ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }*/


  /// signup
  Future<void> signup({required String email, required String password }) async {

    _isLoading = true;
    update();
    Response response = await authRepo.signup(email: email, password: password );
    if (response.statusCode == 201) {
      showCustomSnackBar("Signup Successful", isError: false,);
      Get.off(MainScreen()) ;
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// for login Code
  Future<void> login({required String email,required String password, bool? isfromCart}) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email: email,password: password, );
    if (response.statusCode == 201) {
      loginResponse=LoginResponse.fromJson(response.body);

      if(_isActiveRememberMe){
        await authRepo.saveUserNameAndPassword(email, password);
      }else{
        await authRepo.clearUserNumberAndPassword();
      }
      // await authRepo.saveUserType(userSelectValue);
      await authRepo.saveUserId(loginResponse!.data!.user!.id!.toString());
      // await authRepo.saveUserFirstName(loginResponse!.data!.user!.firstName!);
      // await authRepo.saveUserLastName(loginResponse!.data!.user!.lastName!);
      // await authRepo.saveUserEmail(loginResponse!.data!.user!.email!);
      // await authRepo.saveUserPhone(loginResponse!.data!.user!.phone!);
      await authRepo.saveUserToken(loginResponse!.data!.accessToken!);
      log('==========@ Access Token : ${loginResponse!.data!.accessToken!}');
      // await authRepo.saveUserRToken(loginResponse!.data!.refreshToken!);
      showCustomSnackBar(response.body["message"], isError: false);
      /*     await authRepo.saveUserToken(loginResponse!.data!.accessToken!).then((value) {
        if(isfromCart!){
          Get.back();
        }else{
          update();
          Get.offAll(Dashboard(pageIndex: 0,));
        }
        showCustomSnackBar("Login Successfully",isError: false);
      });*/
      Get.to(()=>UserInfo());
/*   if(userSelectValue==AppConstants.STUDENT){
        // Get.offNamed(RouteHelper.getStudentPanelRoute());
      }else{
        // Get.offNamed(RouteHelper.getTeacherPanelRoute());
      }*/

    }else{
      _isLoading = false;
      update();
      ApiChecker.checkApi(response);
      showCustomSnackBar(response.body["message"]);
    }
    _isLoading = false;
    update();
  }

  /// for login Code
  Future<void> guestLogin() async {
    _isLoading = true;
    update();
    Response response = await authRepo.guestLogin();
    if (response.statusCode == 201) {
      guestLoginResponse =GuestLoginResponse.fromJson(response.body);
      await authRepo.saveUserIdGuest(guestLoginResponse!.data!.user!.id!.toString());
      await authRepo.saveGestToken(guestLoginResponse!.data!.accessToken!);
      log('==========@ Guest Access Token : ${guestLoginResponse!.data!.accessToken!}');
      // await authRepo.saveUserRToken(loginResponse!.data!.refreshToken!);
      showCustomSnackBar(response.body["message"], isError: false);
      /*     await authRepo.saveUserToken(loginResponse!.data!.accessToken!).then((value) {
        if(isfromCart!){
          Get.back();
        }else{
          update();
          Get.offAll(Dashboard(pageIndex: 0,));
        }
        showCustomSnackBar("Login Successfully",isError: false);
      });*/
      // Get.off(Dashboard(pageIndex: 0,));
/*   if(userSelectValue==AppConstants.STUDENT){
        // Get.offNamed(RouteHelper.getStudentPanelRoute());
      }else{
        // Get.offNamed(RouteHelper.getTeacherPanelRoute());
      }*/

    }else{
      _isLoading = false;
      update();
      ApiChecker.checkApi(response);
      showCustomSnackBar(response.body["message"]);
    }
    _isLoading = false;
    update();
  }

  Future<String> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.androidId; // Use androidId for Android devices
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor; // Use identifierForVendor for iOS devices
      }
    } catch (e) {
      print("Error getting device ID: $e");
    }

    return ""; // Return an empty string in case of an error
  }

  void loginVerification() async {
    String _email = emailCtr.text.trim();
    String _password = passCtr.text.trim();

    if (_email.isEmpty) {
      showCustomSnackBar('Enter User ID');
    } else if (_password.isEmpty) {
      showCustomSnackBar('Enter Password'.tr);
    } else if (_password.length < 4) {
      showCustomSnackBar('The Password must be at least 5 Characters');
    } else {
      login(password: _password, email: _email, );
    }
  }

  bool isLoggedIn() {
    print(authRepo.isLoggedIn());
    return authRepo.isLoggedIn();
  }
///
  bool isLoggedInGuest() {
    print(authRepo.isGuestLoggedIn());
    return authRepo.isGuestLoggedIn();
  }

  String getUserPermission() {
    return authRepo.getUserName() ?? "";
  }

  String getUserType() {
    return authRepo.getUserType() ?? "";
  }
  String getUserId() {
    return authRepo.getUserId() ?? "";
  }
  /// guest
  String getUserIdGuest() {
    return authRepo.getUserIdGuest() ?? "";
  }
  String getUserFirstName() {
    return authRepo.getUserFirstName() ?? "";
  }
  String getUserLastName() {
    return authRepo.getUserLastName() ?? "";
  }
  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }
  String getUserPhone() {
    return authRepo.getUserPhone() ?? "";
  }
  String getUserToken() {
    return authRepo.getUserToken();
  }
///
  String getUserGuestToken() {
    return authRepo.getUserGuestToken();
  }

  void saveUserNameAndPassword(
      String UserName,
      String password,
      ) {
    authRepo.saveUserNameAndPassword(UserName, password);
  }

  String getUserName() {
    return authRepo.getUserName() ?? "";
  }

  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }


  Future<void> signOut() async {
    isLoading=true;
    update();
    await authRepo.clearUserSigningInfo();
    Get.offAll(()=>Dashboard(pageIndex: 0));
    showCustomSnackBar("Logout Successful", isPosition: true);
    isLoading=false;
    update();
  }
  /// guest
  Future<void> signOutGuest() async {
    isLoading=true;
    update();
    await authRepo.signOutGuest();
    showCustomSnackBar("Logout Successful", isPosition: true);
    isLoading=false;
    update();
    //Get.offAll(SignIn(exitFromApp: false,));
    // Get.offNamed(RouteHelper.getInitialRoute());
  }
/*
  Future<bool> signOut() async {
    return authRepo.clearUserSigningInfo();
  }*/

}
