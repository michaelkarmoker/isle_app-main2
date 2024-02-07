import 'dart:developer';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as di;

class UserProfileRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  UserProfileRepo({required this.apiClient, required this.sharedPreferences});

  /// feedback
  Future<Response> getFeedBackData() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData("${AppConstants.FEEDBACK_URI}/$customerID");
    return _response;
  }

  /// get profle
  Future<Response> getProfileData() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData("${AppConstants.PROFILE_URI}/$customerID");
    return _response;
  }

  /// communication preferences
  Future<Response> updateCommunicationPreference({
    required String is_email,
    required String is_sms,
  }) async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.putData(AppConstants.PROFILE_URI+"/$customerID/comuncation",{
      "is_email":is_email,
      "is_sms":is_sms,
    });
    return _response;
  }

  /// refer a friend
  Future<Response> getReferCodeData() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData("${AppConstants.REFER_CODE_URI}/$customerID");
    return _response;
  }

  /// apply refer code
  Future<Response> applyReferCode({
    required String customer_id,
    required String refer_code,
  }) async {
    Response _response = await apiClient.postData(AppConstants.APPLY_REFER_CODE_URI, {
      "customer_id":customer_id,
      "refer_code":refer_code,
    });
    print("API: ${_response.request?.url ?? ''}");
    return _response;
  }


  Future<Response> getPr() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData("${AppConstants.PROFILE_URI}/$customerID");
    return _response;
  }

  /// user address book
  Future<Response> getAddressBookData() async {
    Response _response = await apiClient.getData(AppConstants.USER_ADDRESSBOOK_URI);
    log('====/@ Api Url: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// load edit data
  Future<Response> getEditLoadData(int id) async {
    Response _response = await apiClient.getData(AppConstants.USER_ADDRESSBOOK_URI+"/$id");
    log('====/@ Api Url: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// delete addressbook
  Future<Response> deleteAddressBook(String id) async {
    Response _response = await apiClient.deleteData(AppConstants.DELETE_ADDRESSBOOK_URI+"/$id");
    return _response;
  }

  ///Profile Edit form
  Future<Response> userProfileEdit({
    required String first_name,
    required String last_name,
    required String phone,
    required String email,
    required String gender,
    required String date_of_birth,
    // required String state_id,
    // required String district_id,
    // required String sub_district_id,
    required String address,
    required XFile? photo,
  })
  async {
    String? token=sharedPreferences.getString(AppConstants.TOKEN);

    var multipartFile = photo!=null?await di.MultipartFile.fromFile(photo.path!):null;
    //var multipartFile2 = guardian_signature!=null?await di.MultipartFile.fromFile(guardian_signature.path!):null;
    di.FormData formData =  di.FormData.fromMap({
      "first_name":first_name,
      "last_name":last_name,
      "phone":phone,
      "email":email,
      "gender":gender,
      "date_of_birth":date_of_birth,
      "address":address,
      "photo":multipartFile,

    });
    di.Dio dio = di.Dio();

    final responses = await dio.put(
      '${AppConstants.BASE_URL}${AppConstants.PROFILE_EDIT_URI}',
      data: formData,
      options: di.Options(
          contentType: 'multipart/form-data',
          headers: {
            'Authorization': token.toString()
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );
    print(responses.toString());
    return Response(body: responses.data, statusCode: responses.statusCode!);

  }
  /// add new addressbook
  Future<Response> createNewAddressbook({
    required String address_type,
    required String first_name,
    required String last_name,
    required String phone,
    required String state_id,
    required String district_id,
    required String sub_district_id,
    required String address,
    required String is_primary,
  }) async {
    Response _response = await apiClient.postData(AppConstants.CREATE_NEW_ADDRESSBOOK_URI,{
      "address_type":address_type,
      "first_name":first_name,
      "last_name":last_name,
      "phone":phone,
      "state_id":state_id,
      "district_id":district_id,
      "sub_district_id":sub_district_id,
      "address":address,
      "is_primary":is_primary,
    });
    return _response;
  }

  /// add new addressbook
  Future<Response> updateAddressbook({
    required String id,
    required String address_type,
    required String first_name,
    required String last_name,
    required String phone,
    required String state_id,
    required String district_id,
    required String sub_district_id,
    required String address,
    // required String is_primary,
  }) async {
    Response _response = await apiClient.putData(AppConstants.CREATE_NEW_ADDRESSBOOK_URI+"/$id",{
      "address_type":address_type,
      "first_name":first_name,
      "last_name":last_name,
      "phone":phone,
      "state_id":state_id,
      "district_id":district_id,
      "sub_district_id":sub_district_id,
      "address":address,
      // "is_primary":is_primary,
    });
    return _response;
  }

  /// thana
  Future<Response> getThanaData(String id) async {
    Response _response = await apiClient.getData(AppConstants.GET_THANA_URI+"/${id}");
    return _response;
  }

  /// division
  Future<Response> getDivisionData() async {
    // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
    Response _response = await apiClient.getData(AppConstants.GET_DIVISION_URI);
    return _response;
  }

  /// district
  Future<Response> getDistrictData(String id) async {
    Response _response = await apiClient.getData(AppConstants.GET_DISTRICT_URI+"/${id}");
    return _response;
  }

  /// social
  Future<Response> getSocialData() async {
    Response _response = await apiClient.getData(AppConstants.SOCIAL_URI);
    return _response;
  }







}