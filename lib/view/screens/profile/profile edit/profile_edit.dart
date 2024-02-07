import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/data/model/response/profile/get_profile_response.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_date_picker.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';

class UserProfileEdit extends StatefulWidget {
  UserProfileEdit({Key? key}) : super(key: key);
  @override
  State<UserProfileEdit> createState() => _TProfileEditFormState();
}
class _TProfileEditFormState extends State<UserProfileEdit> {
  String? selectedGender;
  List<String> gender = [];
  TextEditingController fromdateController = new TextEditingController();
  DateTime currentDate = DateTime.now();

  Future<void> _selectfromDate(BuildContext context,) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2030));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        fromdateController.text = pickedDate.toString().substring(0, 10);
      });
    }
  }

  TextEditingController firstnameCtr = new TextEditingController();
  TextEditingController lastnameCtr = new TextEditingController();
  TextEditingController phoneCtr = new TextEditingController();
  TextEditingController emailCtr = new TextEditingController();
  TextEditingController addressCtr = new TextEditingController();
  FocusNode firstnameFcs = new FocusNode();
  FocusNode lastnameFcs = new FocusNode();
  FocusNode phonenameFcs = new FocusNode();
  FocusNode emailnameFcs = new FocusNode();
  FocusNode addressFcs = new FocusNode();

  XFile? result = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) =>  Get.find<UserProfileController>().getProfileData().then((value) => {
      setProfileInfo(Get.find<UserProfileController>().userProfileResponse!)
    }));
  }

  void setProfileInfo(UserProfileResponse userProfileResponse) {
    firstnameCtr.text = userProfileResponse.data!.firstName ?? "";
    lastnameCtr.text = userProfileResponse.data!.lastName ?? "";
    phoneCtr.text = userProfileResponse.data!.phone ?? "";
    emailCtr.text = userProfileResponse.data!.email ?? "";
    fromdateController.text = userProfileResponse.data!.dateOfBirth!.substring(0,10) ?? "";
    addressCtr.text = userProfileResponse.data!.address ?? "";
    // selectedGender = gender[teacherProfileResponse.teacher!.gender!];
    // selectedMaritStatus = bia[teacherProfileResponse.teacher!.maritalStatus!];
    // selectedBlood = teacherProfileResponse.teacher!.bloodGroup!;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(builder: (controller) {
      if (result != null) {
        print("have result");
      } else {
        print("no result");
      }
      return Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Edit Profile", style: railway.copyWith(fontSize: 18, color: Colors.black),),
          iconTheme: IconThemeData(color: Color(0xff000000)),
          titleSpacing: 0,
          backgroundColor: Color(0xffFFFFFF),
          centerTitle: true,
          elevation: 0,
          leadingWidth: Get.width / 3.5,
          // toolbarHeight: 62,
          /*   title: Container(
            // color: Colors.red,
              height: 35, width: 100,
              child: Image.asset(Images.logo, height: 35, width: 100)),*/
        ),
        // backgroundColor: Color(0xffEBEFF3),
        backgroundColor: Color(0xffFFFFFF),
        body:  ProgressHUD(
          inAsyncCall: controller.isLoading,
          child: SingleChildScrollView(
            child: Container(
              color: Color(0xffF2F3F9),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(300)),
                              border:
                              Border.all(width: 5, color: Colors.white)),
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: result == null
                                ? CustomImageCached(
                              placeholder: "assets/image/placeholder.png",
                              // image: "",
                              image: '${AppConstants.BASE_URL}${controller.userProfileResponse!.data!.photo??""}',
                              // '${AppConstants.MERCHANT_IMAGE_URL} ${controller.teacherProfileResponse!.teacher!.photo??""}',
                              fit: BoxFit.fill,
                            )
                                : Image.file(
                              File(result!.path),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 4,
                            right: 6,
                            child: InkWell(
                              onTap: () async {
                                try {
                                  result = await ImagePicker().pickImage(
                                      maxHeight: 1000,
                                      maxWidth: 1000,
                                      source: ImageSource.gallery)
                                      .whenComplete(() {
                                    controller.update();
                                  });
                                  //print(result!.path);
                                } catch (e) {
                                  print(e.toString());
                                  showCustomSnackBar("Something Error");
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                    size: 18,
                                  )),
                            ))
                      ],
                    ),
                    SizedBox(height: 20),
        /*            Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: gold,
                          borderRadius: BorderRadius.circular(2)),
                      child: Center(
                        child: Text(
                          'personal_info'.tr,
                          style: robotoMedium.copyWith(
                              fontSize: 16, color: btntext),
                        ),
                      ),
                    ),*/
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: gold,
                          width: 1,
                          // style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 12),
                          MyTextField(
                            isPadding: true,
                            title: 'First Name',
                            controller: firstnameCtr,
                            focusNode: firstnameFcs,
                            isRequired: true,
                            hintText: 'Enter your first name',
                          ),
                          SizedBox(height: 12),
                          MyTextField(
                            isPadding: true,
                            title: 'Last Name',
                            controller: lastnameCtr,
                            focusNode: lastnameFcs,
                            isRequired: true,
                            hintText: 'Enter your last name',
                          ),
                          SizedBox(height: 12),
                          MyTextField(
                            isPadding: true,
                            title: 'Phone',
                            controller: phoneCtr,
                            focusNode: phonenameFcs,
                            isRequired: true,
                            hintText: 'Enter your phone number',
                          ),
                          SizedBox(height: 12),
                          MyTextField(
                            title: 'Email',
                            controller: emailCtr,
                            focusNode: emailnameFcs,
                            hintText: 'Enter your Email',
                          ),
                          SizedBox(height: 12),
                          CustomDatePickerWithTitle(
                            height: 47,
                            controller: fromdateController,
                            title: 'Date',
                            onpressed: () => _selectfromDate(context),
                          ),
                          SizedBox(height: 12),
                          MyTextField(
                            title: 'Address',
                            controller: addressCtr,
                            focusNode: addressFcs,
                            hintText: 'Enter your address',
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                     CustomButton(
                        onPressed: () {
                          validationEdit(controller);
                        },
                        buttoncolor: gold,
                         fontSize: 15,
                         myfontweight: FontWeight.bold,
                        buttonText: "SUBMIT"),
                    // SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void validationEdit(UserProfileController controller) {
    print("dsfdsgfsdgdsfg");
    if (firstnameCtr.text.toString().isNotEmpty) {
      if (lastnameCtr.text.toString().isNotEmpty) {
        if (phoneCtr.text.toString().isNotEmpty) {
          if (emailCtr.text.toString().isNotEmpty) {
            // if (selectedGender != null) {
              // if (fromdateController.text.toString().isNotEmpty) {
                // if (selectedBlood != null) {
                  controller.userProfileEdit(
                    first_name: firstnameCtr.text,
                    last_name: lastnameCtr.text,
                    phone: phoneCtr.text,
                    email: emailCtr.text,
                    address: addressCtr.text,
                    date_of_birth: fromdateController.text,
                    // state_id: "",
                    // district_id: "",
                    // sub_district_id: "",
                    photo: result,
                    // gender: gender.indexOf(selectedGender!).toString(),
                    gender: "",



                  /*  birthdate: fromdateController.text,
                    gender: gender.indexOf(selectedGender!).toString(),
                    blood_group: selectedBlood!,*/

                  );
                // }
                // else {
                //   showCustomSnackBar("blood_snack".tr);
                // }
              // }
              // else {
              //   showCustomSnackBar("marit_snack".tr);
              // }
            // }
            // else {
            //   showCustomSnackBar("gender_snack".tr);
            // }
          } else {
            showCustomSnackBar("phone_snack".tr);
          }
        } else {
          showCustomSnackBar("phone_snack".tr);
        }
      } else {
        showCustomSnackBar("email_snack".tr);
      }
    } else {
      showCustomSnackBar("name_snack".tr);
    }
  }
}
