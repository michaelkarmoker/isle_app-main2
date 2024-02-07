import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/profile/about%20isle%20rewards/about_isle-membership-benefit-response.dart';
import 'package:isletestapp/data/model/response/profile/about%20isle%20rewards/exclusive_offer_response.dart';
import 'package:isletestapp/data/model/response/profile/about%20isle%20rewards/how_it_work_response.dart';
import 'package:isletestapp/data/model/response/profile/about%20isle%20rewards/member_terms_conditions_response.dart';
import 'package:isletestapp/data/model/response/profile/about%20isle%20rewards/membership-tier-response.dart';
import 'package:isletestapp/data/model/response/profile/about%20isle%20rewards/redeem_points_response.dart';
import 'package:isletestapp/data/repository/profile/isle%20reward%20repo/about_isle_reward_repo.dart';

class AboutIsleRewardController extends GetxController implements GetxService {
  final AboutIsleRewardRepo aboutIsleRewardRepo;
  AboutIsleRewardController({required this.aboutIsleRewardRepo});

  Future<void> dataInitialize()async {
    await getHowitWorkData();
    await getMembershiptierData();
    await getAboutIsleMembershipBenefitData();
    await getRedeemPointsData();
    await getExclusiveOfferData();
    await getMemberTermsConditionsData();

  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  HowItWorkResponse ? howItWorkResponse =null;
  MembershipTierResponse ? membershipTierResponse =null;
  List<String> membershiptierList=[];
  List<AboutIsleMembershipBenefitData> abountIsleMumberShipBenefitList = [];
  AboutIsleMembershipBenefitResponse ? aboutIsleMembershipBenefitResponse =null;
  AboutIsleRedeemPointResponse ? aboutIsleRedeemPointResponse =null;
  ExclusiveOfferResponse ? exclusiveOfferResponse =null;
  MemberTermsConditionsResponse ? memberTermsConditionsResponse =null;
  // List<Result>? result =null;

  /// how it work
  Future<void> getHowitWorkData() async {
    try {
      _isLoading = true;
      update();
      Response response = await aboutIsleRewardRepo.getHowitWorkData();

      if (response.statusCode == 200) {
        howItWorkResponse = HowItWorkResponse.fromJson(response.body);
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

/// membership tier
  Future<void> getMembershiptierData() async {
    try {
      _isLoading = true;
      update();
      Response response = await aboutIsleRewardRepo.getMembershiptierData();

      if (response.statusCode == 200) {
        membershiptierList = [];
        membershipTierResponse = MembershipTierResponse.fromJson(response.body);
        membershipTierResponse!.data!.map((e){
          membershiptierList!.add(e!.tiersName!);
        }).toList();
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

  /// membership benefit

  Future<void> getAboutIsleMembershipBenefitData() async {
    try {
      _isLoading = true;
      update();
      Response response = await aboutIsleRewardRepo.getAboutIsleMembershipBenefitData();

      if (response.statusCode == 200) {
        abountIsleMumberShipBenefitList = [];
        aboutIsleMembershipBenefitResponse = AboutIsleMembershipBenefitResponse.fromJson(response.body);
        aboutIsleMembershipBenefitResponse!.data!.map((e){
          abountIsleMumberShipBenefitList.add(e);
        }).toList();
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

  /// redeem points
  Future<void> getRedeemPointsData() async {
    try {
      _isLoading = true;
      update();
      Response response = await aboutIsleRewardRepo.getRedeemPointsData();

      if (response.statusCode == 200) {
        aboutIsleRedeemPointResponse = AboutIsleRedeemPointResponse.fromJson(response.body);
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

  /// exclusive offer
  Future<void> getExclusiveOfferData() async {
    try {
      _isLoading = true;
      update();
      Response response = await aboutIsleRewardRepo.getExclusiveOfferData();

      if (response.statusCode == 200) {
        exclusiveOfferResponse = ExclusiveOfferResponse.fromJson(response.body);
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

  /// member terms conditions
  Future<void> getMemberTermsConditionsData() async {
    try {
      _isLoading = true;
      update();
      Response response = await aboutIsleRewardRepo.getMemberTermsConditionsData();

      if (response.statusCode == 200) {
        memberTermsConditionsResponse = MemberTermsConditionsResponse.fromJson(response.body);
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
