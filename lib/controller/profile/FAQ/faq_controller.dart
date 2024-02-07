
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/FAQ/faq_response.dart';
import 'package:isletestapp/data/model/response/FAQ/faq_type_response.dart';
import 'package:isletestapp/data/model/response/main%20page/featured_brands_pagi_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/repository/main%20page/main_page_repo.dart';
import 'package:isletestapp/data/repository/profile/FAQ/faq_repo.dart';



class FAQController extends GetxController implements GetxService {
  final FAQRepo faqRepo;
  FAQController({required this.faqRepo});

 Future<void> dataInitialize()async {
    await getFAQTypeData();
    await getFAQData();
 }
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  FAQTypeResponse ? faqTypeResponse =null;
  FAQResponse ? faqResponse =null;

  // List<Result>? result =null;


  Future<void> getFAQTypeData() async {
    _isLoading = true;
    update();
    Response response = await faqRepo.getFAQTypeData();

    if (response.statusCode == 200) {
      faqTypeResponse= FAQTypeResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
     // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// faq
  Future<void> getFAQData() async {
    _isLoading = true;
    update();
    Response response = await faqRepo.getFAQData();

    if (response.statusCode == 200) {
      faqResponse= FAQResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

}
