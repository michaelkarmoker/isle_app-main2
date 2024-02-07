import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as di;
import '../../util/app_constants.dart';
import '../api/api_client.dart';
import '../model/body/login_body.dart';
import '../model/body/signup_body.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});


  /// for registration code
/*  Future<Response> registration ({
    required String company_name,
    required String name,
    required String email,
*//*    required String district_id,
    required String area_id,*//*
    required String password,
    required String confirm_password,
    required String contact_number,
    required String business_address,
    required String fb_url,
  }) async {
    Response _response = await apiClient.postData(AppConstants.MERCHANT_REGISTRATION_URI,
        {
          "company_name": company_name,
          "name": name,
          "email": email,
          *//*   "district_id": district_id,
          "area_id": area_id,*//*
          "password": password,
          "confirm_password": confirm_password,
          "contact_number": contact_number,
          "business_address": business_address,
          "fb_url": fb_url,

        });
    return _response;
  }*/

  /// signup
  Future<Response> signup({
    required String email,
    required String password,
  }) async {
    Response _response = await apiClient.postData(AppConstants.REGISTRATION_URI,{
      "email": email,
      "password": password,
    });
    return _response;
  }


  /// for login code
  Future<Response> login({
    required String email,
    required String password,}) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.isLogInKey, true);
    return await apiClient.postData(AppConstants.LOGIN_URI, {
      "email":email,
      "password":password
    });
  }

  /// guest login
  Future<Response> guestLogin() async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.isLogInKey, true);
    return await apiClient.postData(AppConstants.GUEST_LOGIN_URI, {});
  }



  // for  user token
  Future<bool> saveUserToken(String accessToken) async {
    apiClient.token = accessToken;

    apiClient.updateHeader(accessToken);

    return await sharedPreferences.setString(AppConstants.TOKEN, accessToken);
  }
  // guest token
  Future<bool> saveGestToken(String accessToken) async {
    apiClient.token = accessToken;
    apiClient.updateHeader(accessToken);
    return await sharedPreferences.setString(AppConstants.TOKEN, accessToken);
  }

  // for  user refresh token
/*  Future<bool> saveUserRToken(String refreshToken) async {
    apiClient.token = refreshToken;

    apiClient.updateHeader(refreshToken);

    return await sharedPreferences.setString(AppConstants.TOKEN, refreshToken);
  }*/

  Future<bool> saveUserId(String id) async {
    return await sharedPreferences.setString(AppConstants.USERID, id);
  }
  ///
  Future<bool> saveUserIdGuest(String id) async {
    return await sharedPreferences.setString(AppConstants.USERID, id);
  }
  /// user fname
  Future<bool> saveUserFirstName(String first_name) async {
    return await sharedPreferences.setString(AppConstants.USER_FIRSTNAME, first_name);
  }
  /// user lname
  Future<bool> saveUserLastName(String last_name) async {
    return await sharedPreferences.setString(AppConstants.USER_LASTNAME, last_name);
  }
  /// user email
  Future<bool> saveUserEmail(String email) async {
    return await sharedPreferences.setString(AppConstants.USER_EMAIL, email);
  }
  /// user phone
  Future<bool> saveUserPhone(String phone) async {
    return await sharedPreferences.setString(AppConstants.PHONE, phone);
  }


  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }
  /// guest
  String getUserGuestToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }
  String getUserId() {
    return sharedPreferences.getString(AppConstants.USERID) ?? "";
  }
  ///
  String getUserIdGuest() {
    return sharedPreferences.getString(AppConstants.USERID) ?? "";
  }
  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }
/// guest
  bool isGuestLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  // for  Remember Email
  Future<void> saveUserNameAndPassword(String name, String password,) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_NAME, name);
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }


  Future<void> saveUserProfile(
      int id,
      String name,
      String email,
      String? phone,
      String? image,
      ) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_ID, id.toString());
      await sharedPreferences.setString(AppConstants.USER_EMAIL, email);
      await sharedPreferences.setString(AppConstants.USER_PHONE, phone??" ");
      await sharedPreferences.setString(AppConstants.USER_IMAGE, image??" ");
      await sharedPreferences.setString(AppConstants.USER_FIRSTNAME, name);

    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserType(String type,) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_TYPE, type);


    } catch (e) {
      throw e;
    }
  }
  String getUserType() {
    return sharedPreferences.getString(AppConstants.USER_TYPE) ?? "";
  }
  String getUserName() {
    return sharedPreferences.getString(AppConstants.USER_NAME) ?? "";
  }

  // using for user 1st name
  String getUserFirstName() {
    return sharedPreferences.getString(AppConstants.USER_FIRSTNAME) ?? "";
  }
  String getUserLastName() {
    return sharedPreferences.getString(AppConstants.USER_LASTNAME) ?? "";
  }
  String getUserEmail() {
    return sharedPreferences.getString(AppConstants.USER_EMAIL) ?? "";
  }
  String getUserPhone() {
    return sharedPreferences.getString(AppConstants.PHONE) ?? "";
  }
  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

//profile===
/*  String getUserFullName() {
    return sharedPreferences.getString(AppConstants.USER_NAMEP) ?? "";
  }*/

  String getUserMobile() {
    return sharedPreferences.getString(AppConstants.USER_PHONE) ?? "";
  }
  String getUserImage() {
    return sharedPreferences.getString(AppConstants.USER_IMAGE) ?? "";
  }



  Future<bool> signOut() async {
    return await sharedPreferences.remove(AppConstants.TOKEN);
  }
  /// guest
  Future<bool> signOutGuest() async {
    return await sharedPreferences.remove(AppConstants.TOKEN);
  }

  Future<bool> clearUserSigningInfo() async {


    //await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    await sharedPreferences.remove(AppConstants.USERID);
    //await sharedPreferences.remove(AppConstants.USER_NAME);
    return await sharedPreferences.remove(AppConstants.TOKEN);

  }

  Future<bool> clearUserNumberAndPassword() async {


    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(AppConstants.USER_NAME);
  }
}
