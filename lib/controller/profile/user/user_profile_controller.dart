import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/district/district_response.dart';
import 'package:isletestapp/data/model/response/division/division_response.dart';
import 'package:isletestapp/data/model/response/profile/address%20book/load_edit_addressbook_response.dart';
import 'package:isletestapp/data/model/response/profile/feedback/account_feedback_response.dart';
import 'package:isletestapp/data/model/response/profile/get_profile_response.dart';
import 'package:isletestapp/data/model/response/profile/address%20book/user_addressbook_response.dart';
import 'package:isletestapp/data/model/response/profile/refer%20friend/apply_refer_code_response.dart';
import 'package:isletestapp/data/model/response/profile/refer%20friend/get_refer_code_response.dart';
import 'package:isletestapp/data/model/response/social/socail_response.dart';
import 'package:isletestapp/data/model/response/thana/thana_response.dart';
import 'package:isletestapp/data/repository/profile/user/user_profile__repo.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';


class UserProfileController extends GetxController implements GetxService {
  final UserProfileRepo userProfileRepo;
  UserProfileController({required this.userProfileRepo});

 Future<void> dataInitialize()async {
    await getProfileData();
    // await getAddressBookData();
    await getDivision();
    await getSocialData();
 }

  Future<void> dataInitializeForViewProfile()async {
    await getProfileData();
    await getAddressBookData();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  AccountFeedbackResponse ? accountFeedbackResponse =null;
  ApplyReferCodeResponse ? applyReferCodeResponse =null;
  ReferCodeResponse ? referCodeResponse =null;
  UserProfileResponse ? userProfileResponse =null;
  UserAddressBookResponse ? userAddressBookResponse =null;
  EditLoadAddressBookResponse ? editLoadAddressBookResponse =null;

  TextEditingController addressCtr = TextEditingController();
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController specialnoteCtr = TextEditingController();
  TextEditingController addressTypeCtr = TextEditingController();

  DivisionResponse ? divisionResponse =null;
  DistrictResponse ? districtResponse =null;
  ThanaResponse ? thanaResponse =null;
  List<String>? divisions=[];
  List<String>? districts=[];
  List<String>? thanas=[];
  SocialResponse ? socialResponse =null;
  /// manual address
  String selectedDivision = "Choose Division";
  int selectedDivisionIndex=-1;
  String selectedDistrict = "Choose District";
  int selectedDistrictIndex=-1;
  String selectedThana = "Choose Thana";
  int selectedThanaIndex=-1;

  Future<void> dataClear()async {
    // firstNameCtr.text = "";
    // lastNameCtr.text = "";
    // addressCtr.text = "";
    // // phoneCtr.text = "";
    // specialnoteCtr.text = "";
    // addressTypeCtr.text = "";
    divisions = [];
    districts = [];
    thanas = [];
    // selectedDivision = "";
    // selectedDistrict = "";
    // selectedThana = "";
  }

  Future<void> dataClearForFeedback()async {
    accountFeedbackResponse = null;
  }

  /// feedback
  Future<void> getFeedBackData() async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.getFeedBackData();
    if (response.statusCode == 200) {
      accountFeedbackResponse= AccountFeedbackResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

/// get profile
  Future<void> getProfileData() async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.getProfileData();
    if (response.statusCode == 200) {
      userProfileResponse= UserProfileResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
     // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// communication preferences
  Future<void> updateCommunicationPreference({
    required String is_email,
    required String is_sms,
  }) async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.updateCommunicationPreference(
      is_email : is_email,
      is_sms : is_sms,
    );
    if (response.statusCode == 200) {
      // Get.back();
      // getProfileData();
      showCustomSnackBar("Updated Successfully", isError: false, isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// refer a friend
  Future<void> getReferCodeData() async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.getReferCodeData();
    if (response.statusCode == 200) {
      referCodeResponse= ReferCodeResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  apply refer code
  Future<void> applyReferCode({
    required String customer_id,
    required String refer_code,
  }) async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.applyReferCode(
      customer_id : customer_id,
      refer_code : refer_code,
    );
    if (response.statusCode == 200) {
      showCustomSnackBar("Refer code apply Successfully", isError: false, isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// user address book
  Future<void> getAddressBookData() async {

    _isLoading = true;
    update();
    Response response = await userProfileRepo.getAddressBookData();
    if (response.statusCode == 200) {
      userAddressBookResponse= UserAddressBookResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// load edit address book
  Future<void> getEditLoadData(int id) async {

    _isLoading = true;
    update();
    Response response = await userProfileRepo.getEditLoadData(id);
    if (response.statusCode == 200) {
      editLoadAddressBookResponse= EditLoadAddressBookResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  ///  delete addressbook
  Future<void> deleteAddressBook(String id) async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.deleteAddressBook(id);
    if (response.statusCode == 200) {
      showCustomSnackBar("Successfully deleted!!",isPosition:true);
      await getAddressBookData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

/// profile edit
  Future<void> userProfileEdit({
    required String first_name,
    required String last_name,
    required String phone,
    required String email,
    required String gender,
    required String date_of_birth,
    // required String state_id,
    // required String district_id,
    // required String sub_district_id,
    required String address,
    required XFile? photo,

  }) async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.userProfileEdit(
      first_name:first_name,
      last_name:last_name,
      phone:phone,
      email:email,
      gender:gender,
      date_of_birth:date_of_birth,
      // state_id:state_id,
      // district_id:district_id,
      // sub_district_id:sub_district_id,
      address:address,
      photo:photo,
    );

    if (response.statusCode == 200) {
      print("bokchodddddddddddddddddd");
      Get.back();
      getProfileData();
      // Get.back();
      showCustomSnackBar("Updated successfully",isError: false);

      //Get.to(QuestionForm( grade: grade, name: name,email: email,phone: phone, address: address,seconds: totalDuration,));
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }



  ///  add new addressbook
  Future<void> createNewAddressbook({
    required String address_type,
    required String first_name,
    required String last_name,
    required String phone,
    required String state_id,
    required String district_id,
    required String sub_district_id,
    required String address,
    required String is_primary,

  }) async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.createNewAddressbook(
      address_type : address_type,
      first_name : first_name,
      last_name : last_name,
      phone : phone,
      state_id : state_id,
      district_id : district_id,
      sub_district_id : sub_district_id,
      address : address,
      is_primary : is_primary,
    );
    if (response.statusCode == 201) {
      Get.back();
      getAddressBookData();
      showCustomSnackBar("Add New Address Successfully", isError: false, isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  update addressbook
  Future<void> updateAddressbook({
    required String id,
    required String address_type,
    required String first_name,
    required String last_name,
    required String phone,
    required String state_id,
    required String district_id,
    required String sub_district_id,
    required String address,
    // required String is_primary,

  }) async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.updateAddressbook(
      id : id,
      address_type : address_type,
      first_name : first_name,
      last_name : last_name,
      phone : phone,
      state_id : state_id,
      district_id : district_id,
      sub_district_id : sub_district_id,
      address : address,
      // is_primary : is_primary,
    );
    if (response.statusCode == 200) {
      Get.back();
      getAddressBookData();
      showCustomSnackBar("Updated Address Successfully", isError: false, isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }



  /// division
  Future<void> getDivision() async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.getDivisionData();
    if (response.statusCode == 200) {
      divisions=[];
      divisionResponse= DivisionResponse.fromJson(response.body);
      divisionResponse!.data!.map((e) {
        divisions!.add(e.name!);
      }).toList();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// district
  Future<void> getDistrict(String divisionId) async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.getDistrictData(divisionId);
    if (response.statusCode == 200) {
      districts=[];
      districtResponse= DistrictResponse.fromJson(response.body);
      if(districtResponse!=null&&districtResponse!.data!=null) {
        districtResponse!.data!.map((e) {
          districts!.add(e.name!);
        }).toList();
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// thana
  Future<void> getThana(String id) async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.getThanaData(id);

    if (response.statusCode == 200) {
      thanas=[];
      thanaResponse= ThanaResponse.fromJson(response.body);
      if(thanaResponse!=null&&thanaResponse!.data!=null) {
        thanaResponse!.data!.map((e) {
          thanas!.add(e.name!);
        }).toList();
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// social
  Future<void> getSocialData() async {
    _isLoading = true;
    update();
    Response response = await userProfileRepo.getSocialData();

    if (response.statusCode == 200) {
      socialResponse= SocialResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }







}
