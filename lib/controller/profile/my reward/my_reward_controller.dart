import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/profile/about%20isle%20rewards/about_isle-membership-benefit-response.dart';
import 'package:isletestapp/data/model/response/profile/my%20reward/my_reward_response.dart';
import 'package:isletestapp/data/model/response/profile/my%20reward/redeem_reward_response.dart';
import 'package:isletestapp/data/repository/profile/my%20reward%20repo/my_reward_repo.dart';

class MyRewardController extends GetxController implements GetxService {
  final MyRewardRepo myRewardRepo;
  MyRewardController({required this.myRewardRepo});


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RewardHistoryResponse ? rewardHistoryResponse =null;
  ReedeemHistoryResponse ? reedeemHistoryResponse =null;
  // List<Result>? result =null;

  Future<void> dataInitialize()async {
    await getRewarddData();
    await getRedeemRewardData();
  }

  /// my reward
  Future<void> getRewarddData() async {
    try {
      _isLoading = true;
      update();
      Response response = await myRewardRepo.getRewarddData();
      if (response.statusCode == 200) {
        rewardHistoryResponse = RewardHistoryResponse.fromJson(response.body);
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


  /// redeem reward
  Future<void> getRedeemRewardData() async {
    try {
      _isLoading = true;
      update();
      Response response = await myRewardRepo.getRedeemRewardData();
      if (response.statusCode == 200) {
        reedeemHistoryResponse = ReedeemHistoryResponse.fromJson(response.body);
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









}
