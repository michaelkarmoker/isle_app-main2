
import 'package:get/get.dart';
import 'package:isletestapp/data/repository/splash_repo.dart';



class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});


  DateTime _currentTime = DateTime.now();
  DateTime get currentTime => DateTime.now();




  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }



  bool? showIntro() {
    return splashRepo.showIntro();
  }

  void disableIntro() {
    splashRepo.disableIntro();
  }


}