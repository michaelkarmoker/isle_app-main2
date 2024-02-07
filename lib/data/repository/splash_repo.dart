
import 'package:intl/intl.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo {
  ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({ required this.apiClient,required this.sharedPreferences,});

 /* Future<Response> getConfigData() async {
    Response _response = await apiClient.getData(AppConstants.CONFIG_URI);
    return _response;
  }*/

  Future<bool> initSharedData() {
  /*  if(!sharedPreferences.containsKey(AppConstants.THEME)) {
      sharedPreferences.setBool(AppConstants.THEME, false);
    }*/


    if(!sharedPreferences.containsKey(AppConstants.INTRO)) {
      sharedPreferences.setBool(AppConstants.INTRO, true);
    }

    return Future.value(true);
  }

  void disableIntro() {
    sharedPreferences.setBool(AppConstants.INTRO, false);
  }

  bool? showIntro() {
    return sharedPreferences.getBool(AppConstants.INTRO);
  }

}
