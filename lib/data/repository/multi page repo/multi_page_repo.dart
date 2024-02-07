
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiPageRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  MultiPageRepo({required this.apiClient, required this.sharedPreferences});


  /// order delivery
  Future<Response> getOrderDelivery() async {
    Response _response = await apiClient.getData(AppConstants.ORDER_DELIVERY_URI);
    return _response;
  }

  /// return refund
  Future<Response> getReturnRefund() async {
    Response _response = await apiClient.getData(AppConstants.RETURN_REFUND_URI);
    return _response;
  }

  /// payment pricing
  Future<Response> getPaymentPricing() async {
    Response _response = await apiClient.getData(AppConstants.PAYMENT_PRICING_URI);
    return _response;
  }

  /// about us
  Future<Response> getAboutUs() async {
    Response _response = await apiClient.getData(AppConstants.ABOUT_US_URI);
    return _response;
  }

  /// career
  Future<Response> getCareer() async {
    Response _response = await apiClient.getData(AppConstants.CAREER_URI);
    return _response;
  }

  /// terms nd condition
  Future<Response> getTermsConditions() async {
    Response _response = await apiClient.getData(AppConstants.TERMS_CONDITIONS_URI);
    return _response;
  }

  /// privecy nd cookies
  Future<Response> getPrivecyCookies() async {
    Response _response = await apiClient.getData(AppConstants.PRIVECY_COOKIES_URI);
    return _response;
  }

  /// collaborate
  Future<Response> getCollaborate() async {
    Response _response = await apiClient.getData(AppConstants.COLLABORATE_URI);
    return _response;
  }

  /// find items
  Future<Response> getFindItems() async {
    Response _response = await apiClient.getData(AppConstants.FIND_ITEMS_URI);
    return _response;
  }

  /// order pay
  Future<Response> getOrderPay() async {
    Response _response = await apiClient.getData(AppConstants.ORDER_PAY_URI);
    return _response;
  }

  /// shipping delivery
  Future<Response> getShippingDelivery() async {
    Response _response = await apiClient.getData(AppConstants.COLLABORATE_URI);
    return _response;
  }






  /// enquiry list
  Future<Response> getEnguiry() async {
    Response _response = await apiClient.getData(AppConstants.ENQUIRY_URI);
    return _response;
  }

  /// enquiry submit
  Future<Response> enquirySubmit({
    required String enquiry_type_id,
    required String email,
    required String first_name,
    required String last_name,
    required String phone,
    required String subject,
    required String message,
    required String order_no,
  }) async {
    Response response = await apiClient.postData(AppConstants.ENQUIRY_SUBMIT_URI,  {
      "enquiry_type_id":enquiry_type_id,
      "email":email,
      "first_name":first_name,
      "last_name":last_name,
      "phone":phone,
      "subject":subject,
      "message":message,
      "order_no":order_no,

    });
    return response;
  }

  /// contact us
  Future<Response> getContactus() async {
    Response _response = await apiClient.getData(AppConstants.CONTACT_US_URI);
    return _response;
  }











}
