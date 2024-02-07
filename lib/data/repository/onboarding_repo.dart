
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/images.dart';



class OnBoardingRepo {

  Future<Response> getOnBoardingList() async {
    try {
      List<OnBoardingModel> onBoardingList = [
        OnBoardingModel(Images.onboard_1, 'Keep healthy work-life balance'.tr, 'Lorem ipsum dolor sit amet, consectetuer adipisci elit, sed diam nonummy nibh euismod tincidunt u laoreet dolore magna aliquam er'.tr),
        OnBoardingModel(Images.onboard_2, 'Track your work & get result'.tr, 'Lorem ipsum dolor sit amet, consectetuer adipisci elit, sed diam nonummy nibh euismod tincidunt u laoreet dolore magna aliquam er'.tr),
        OnBoardingModel(Images.onboard_3, 'Stay organized with team'.tr, 'Lorem ipsum dolor sit amet, consectetuer adipisci elit, sed diam nonummy nibh euismod tincidunt u laoreet dolore magna aliquam er'.tr),
      ];

      Response response = Response(body: onBoardingList, statusCode: 200);
      return response;
    } catch (e) {
      return Response(statusCode: 404, statusText: 'Onboarding data not found');
    }
  }
}
class OnBoardingModel{
  String _imageUrl;
  String _title;
  String _description;

  get imageUrl => _imageUrl;
  get title => _title;
  get description => _description;

  OnBoardingModel(this._imageUrl, this._title, this._description);
}

