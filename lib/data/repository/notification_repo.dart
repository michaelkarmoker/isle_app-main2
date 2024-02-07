import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as h;

class NotificationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  NotificationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getNotification() async {
    Response _response = await apiClient.getData(AppConstants.NOTIFICATION_URI);
    return _response;
  }

}
