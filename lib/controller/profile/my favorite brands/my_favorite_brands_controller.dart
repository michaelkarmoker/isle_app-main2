import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/main%20page/featured_brands_pagi_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/model/response/profile/favorite%20brands/all_favourite_brands_response.dart';
import 'package:isletestapp/data/model/response/profile/favorite%20brands/favorite_brands_response.dart';
import 'package:isletestapp/data/repository/profile/my%20favorite%20brands/my_favorite_brands_repo.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart' as sunny;

class MyFavoriteBrandsController extends GetxController implements GetxService {
  final MyFavoriteBrandsRepo myFavoriteBrandsRepo;
  MyFavoriteBrandsController({required this.myFavoriteBrandsRepo});


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  GenderPageResponse ? genderPageResponse =null;
  List<sunny.Data>? alldata=[];
  AllFavouriteBrandsResponse ? allFavouriteBrandsResponse =null;
  FavoriteBrandsResponse ? favoriteBrandsResponse =null;
  LovingBrandResponse ? lovingBrandResponse =null;
  Future<void> dataInitialize()async {
    await getGenderPageData();
    await getFavoriteBrandsAllData();
    await getLovingBrandsData();
  }
  Future<void> dataClear()async {
    favoriteBrandsResponse = null;
    lovingBrandResponse = null;
  }
  Future<void> getGenderPageData() async {
    _isLoading = true;
    alldata=[];
    update();
    Response response = await myFavoriteBrandsRepo.getGenderPageData();
    if (response.statusCode == 200) {
      genderPageResponse= GenderPageResponse.fromJson(response.body);
      // alldata!.add(new sunny.Data(title: "View All"));
      GenderPageResponse.fromJson(response.body).data!.map((e) {
        alldata!.add(e);
      }).toList();
      if(alldata!.length>0){
        await getFavoriteBrandsGenderWiseData(alldata![0].id.toString());
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// all favorite brands
  Future<void> getFavoriteBrandsAllData() async {
    try {
      _isLoading = true;
      update();
      Response response = await myFavoriteBrandsRepo.getFavoriteBrandsAllData();

      if (response.statusCode == 200) {
        allFavouriteBrandsResponse = AllFavouriteBrandsResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (error) {
      // Handle the error here
      print('Error fetching data: $error');
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  ///  favorite brands
  Future<void> getFavoriteBrandsGenderWiseData(String id) async {
    try {
      _isLoading = true;
      update();
      Response response = await myFavoriteBrandsRepo.getFavoriteBrandsGenderWiseData( id: id);

      if (response.statusCode == 200) {
        favoriteBrandsResponse = FavoriteBrandsResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (error) {
      // Handle the error here
      print('Error fetching data: $error');
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// loving brands
  Future<void> getLovingBrandsData() async {
    _isLoading = true;
    update();
    Response response = await myFavoriteBrandsRepo.getLovingBrandsData();
    if (response.statusCode == 200) {
      lovingBrandResponse= LovingBrandResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }









}
