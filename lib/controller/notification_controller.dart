import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as h;
import 'package:isletestapp/data/model/response/notification_response.dart';
import 'package:isletestapp/data/repository/notification_repo.dart';


class NotificationController extends GetxController implements GetxService {
  final NotificationRepo notificationRepo;
  NotificationController({required this.notificationRepo});

 Future<void> dataInitialize()async {
    await getNotification();
 }
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int page=0;

  NotificationResponse ? notificationResponse=null;



  Future<void> getNotification() async {
    _isLoading = true;
    update();
    Response response = await notificationRepo.getNotification();
    if (response.statusCode == 200) {
      notificationResponse= NotificationResponse.fromJson(response.body);
      // page=orderHistoryResponse!.currentPage!;
    } else {
     // ApiChecker.checkApi(jsonDecode(response.statusCode));
     // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

}
