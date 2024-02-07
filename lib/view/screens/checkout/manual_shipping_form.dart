import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:isletestapp/controller/checkOut/checkout_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/data/model/response/profile/get_profile_response.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/util/text_SIZE.dart';
import 'package:isletestapp/view/base/coustom_searching.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_dropdown.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/checkout/checkout_page.dart';
import 'package:isletestapp/view/screens/checkout/thank_you_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/design%20backup/search_sunny.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wardrob/wardrob_name.dart';

class ManualForm extends StatefulWidget {
  final bool isFromProfile;
  const ManualForm({Key? key,  this.isFromProfile= true}) : super(key: key);

  @override
  State<ManualForm> createState() => _WardrobNameState();
}

class _WardrobNameState extends State<ManualForm> {

  // TextEditingController wardrobCtr = TextEditingController();
  /*TextEditingController addressCtr = TextEditingController();
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController specialnoteCtr = TextEditingController();*/
  FocusNode addressFcs = FocusNode();
  FocusNode firstNameFcs = FocusNode();
  FocusNode lastNameFcs = FocusNode();
  FocusNode phoneFcs = FocusNode();
  FocusNode emailFcs = FocusNode();
  FocusNode specialnoteFcs = FocusNode();
  FocusNode addressTypeFcs = FocusNode();



/*  String selectedDivision = "Choose Division";
  int selectedDivisionIndex=-1;

  String selectedDistrict = "Choose District";
  int selectedDistrictIndex=-1;

  String selectedThana = "Choose Thana";
  int selectedThanaIndex=-1;*/



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CheckOutController>().dataInitialize();
      Get.find<UserProfileController>().getProfileData().then((value) {
        UserProfileResponse? userProfileResponse = Get.find<UserProfileController>().userProfileResponse;
        if (userProfileResponse != null) {
          setProfileInfo(userProfileResponse);
        }
      });

    });
  }

  void setProfileInfo(UserProfileResponse userProfileResponse) {
    Get.find<CheckOutController>().firstNameCtr.text = userProfileResponse.data?.firstName ?? "";
    Get.find<CheckOutController>().lastNameCtr.text = userProfileResponse.data?.lastName ?? "";
    Get.find<CheckOutController>().phoneCtr.text = userProfileResponse.data?.phone ?? "";
    Get.find<CheckOutController>().emailCtr.text = userProfileResponse.data?.email ?? "";
    //  Get.find<CheckOutController>().specialnoteCtr.text = userProfileResponse.data?.s ?? "";
    // addressCtr.text = userProfileResponse.data?.address ?? "";
    // fromdateController.text = userProfileResponse.data?.dateOfBirth?.substring(0, 10) ?? "";

    // Perform null checks for other properties if needed
    // selectedGender = gender[userProfileResponse.teacher?.gender ?? ""];
    // selectedMaritStatus = bia[userProfileResponse.teacher?.maritalStatus ?? ""];
    // selectedBlood = userProfileResponse.teacher?.bloodGroup ?? "";
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: UniversalBottomNav(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xff000000)),
              titleSpacing: 0,
              backgroundColor: Color(0xffFFFFFF),
              centerTitle: true,
              elevation: 0,
              leadingWidth: Get.width / 3.5,
              title: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(MainScreen());
                    },
                    child: Container(
                      // margin: EdgeInsets.all(15),
                        padding: EdgeInsets.only(left: 5, right: 5, top: 5,bottom: 5),
                        // color: Colors.red,
                        height: 55, width: 75,
                        child: Image.asset(Images.logo, height: 55, width: 70, fit: BoxFit.fill,)),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 15,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    widget.isFromProfile?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping Address", style: railwaybold.copyWith(fontSize: 16,  fontWeight: FontWeight.w700,),),


                        Container(
                          color: Colors.black,
                          height: 30,
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Images.location, height: 15, width: 15,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text("Find Me on Map".toUpperCase(),
                                style: railway.copyWith(fontSize: 8, color: Colors.white),
                              ),
                            ],
                          ),
                        ),

                      ],
                    )
                        : SizedBox(),
                    SizedBox(height: 20),
                    Container(
                      height: 30,
                      color: Colors.grey.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text("Location".toUpperCase(), style: railwaybold.copyWith(color: Colors.black54 ,fontSize: 9,  fontWeight: FontWeight.w700,),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text("*Required fields", style: railwaybold.copyWith( color: Colors.black87 ,fontSize: 9,  fontWeight: FontWeight.w700,),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    InkWell(
                        onTap: () {
                          //contoller.setFilteredDealerList();
                          Get.dialog(
                            barrierDismissible: false,
                            CustomSearching(
                              title: 'Search Division',
                              hint: 'Searching...',
                              datalist: controller.divisions!,
                              onSelect: (value) async {
                                Get.back();
                                controller.selectedDivisionIndex=value;
                                controller.selectedDivision = controller.divisions![value];
                                await controller.getDistrict(controller.divisionResponse!.data![controller.selectedDivisionIndex].id.toString());
                                //await controller.getDistrict();
                                //clear all data
                                controller.selectedDistrict = "Choose District";
                                controller.selectedDistrictIndex=-1;
                                controller.selectedThanaIndex=-1;
                                controller.selectedThana = "Choose Thana";
                              },
                              onClose: () {
                                Get.back();
                                // Get.to(controller.coverageAreas);
                              },
                            ),
                          );
                        },
                        child: CustomDropDown(
                            isRequired: true,
                            text: controller.selectedDivision!,
                            title: "Division")),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                //contoller.setFilteredDealerList();
                                Get.dialog(
                                  barrierDismissible: false,
                                  CustomSearching(
                                    title: 'Search District',
                                    hint: 'Searching...',
                                    datalist: controller.districts!,
                                    onSelect: (value) {
                                      setState(() async {
                                        controller.selectedDistrictIndex=value;
                                        Get.back();
                                        controller.selectedDistrict = controller.districts![value];
                                        //  await controller.getDistrict(controller.divisionResponse!.data![selectedDivisionIndex].id.toString());
                                        await controller.getThana(controller.districtResponse!.data![value]!.id.toString());
                                      });
                                    },
                                    onClose: () {
                                      Get.back();
                                      // Get.to(controller.coverageAreas);
                                    },
                                  ),
                                );
                              },
                              child: CustomDropDown(
                                isRequired: true,
                                text: controller.selectedDistrict,
                                title: 'District',
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                //contoller.setFilteredDealerList();
                                Get.dialog(
                                  barrierDismissible: false,
                                  CustomSearching(
                                    title: 'Search Thana',
                                    hint: 'Searching...',
                                    datalist: controller.thanas!,
                                    onSelect: (value) {
                                      setState(() {
                                        controller.selectedThanaIndex=value;
                                        Get.back();
                                        controller.selectedThana = controller.thanas![value];
                                      });
                                    },
                                    onClose: () {
                                      Get.back();
                                      // Get.to(controller.coverageAreas);
                                    },
                                  ),
                                );
                              },
                              child: CustomDropDown(
                                isRequired: true,
                                text: controller.selectedThana,
                                title: 'Thana',
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),


                    MyTextField(
                      controller: controller.addressCtr,
                      focusNode: addressFcs,
                      nextFocus: specialnoteFcs,
                      title: "Delivery Address",
                      isRequired: true,
                      titlesize: 13,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      myfontWeight: FontWeight.bold,
                    ),

                    SizedBox(height: 12),
                    widget.isFromProfile?
                    MyTextField(
                      controller: controller.specialnoteCtr,
                      focusNode: specialnoteFcs,
                      nextFocus: firstNameFcs,
                      title: "Special Note",
                      // isRequired: true,
                      titlesize: 13,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      // myfontWeight: FontWeight.bold,
                    )
                        :    MyTextField(
                      controller: Get.find<UserProfileController>().addressTypeCtr,
                      focusNode: addressTypeFcs,
                      nextFocus: firstNameFcs,
                      title: "Address Type",
                      isRequired: true,
                      titlesize: 13,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      // myfontWeight: FontWeight.bold,
                    ),

                    /*    SizedBox(height: 8),
                  MyTextField(
                    controller: wardrobCtr,
                    focusNode: wardrobFcs,
                    title: "Apartment# / Hotel Room# / Villa#",
                    isRequired: true,
                    titlesize: 10,
                    // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                    myfontWeight: FontWeight.bold,
                  ),*/


                    SizedBox(height: 25),
                    Container(
                      height: 30,
                      color: Colors.grey.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text("Personal Information", style: railwaybold.copyWith(color: Colors.black54 ,fontSize: 10.5,  fontWeight: FontWeight.w700,),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text("*Required fields", style: railwaybold.copyWith( color: Colors.black87 ,fontSize: 9,  fontWeight: FontWeight.w700,),),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    MyTextField(
                      controller: controller.firstNameCtr,
                      focusNode: firstNameFcs,
                      nextFocus: lastNameFcs,
                      title: "First Name",
                      isRequired: true,
                      titlesize: 13,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      myfontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 12),
                    MyTextField(
                      controller: controller.lastNameCtr,
                      focusNode: lastNameFcs,
                      title: "Last Name",
                      isRequired: true,
                      titlesize: 13,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      myfontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 12),
                    MyTextField(
                      controller: controller.phoneCtr,
                      focusNode: phoneFcs,
                      title: "Phone Number",
                      hintText: "+88017XXXXXXXX",
                      isRequired: true,
                      titlesize: 14,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      myfontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 12),
                    MyTextField(
                      controller: controller.emailCtr,
                      focusNode: emailFcs,
                      title: "Email",
                      hintText: "isle@gmail.com",
                      isRequired: true,
                      titlesize: 14,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      myfontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 12),
                    /* Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Phone Code", style: railway.copyWith(fontSize: 10, fontWeight: FontWeight.bold,),),
                                Text("*", style: robotoRegular.copyWith(color: Colors.red),),
                              ],
                            ),
                            Container(
                              // width: 80,
                              height: 40,
                              // margin: EdgeInsets.all(10),
                              // padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text('+880'.toUpperCase(), style: poppins.copyWith(color: Colors.black, fontSize: 10.5, fontWeight: FontWeight.w600),),
                                  ),
                                  // SizedBox(width: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
                                      // color: Colors.blue,
                                        height: 16,
                                        width: 16,
                                        child: Image.asset(Images.drop, color: Colors.black87, height: 16, width: 16,)),
                                  ),
                               ],
                              ),
                              decoration: BoxDecoration(
                                // color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(3),
                                  // color: Colors.black87,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: MyTextField(
                          controller: wardrobCtr,
                          focusNode: wardrobFcs,
                          title: "phone Number",
                          isRequired: true,
                          titlesize: 10,
                          // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                          myfontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),*/

                    // SizedBox(height: 12),
                    /*  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Phone Number",style: robotoMedium.copyWith(fontSize: 10)),
                        TextSpan(
                          text: '*',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    // color: Colors.red,
                    height: 60,
                    child:  IntlPhoneField(
                      controller: controller.phoneCtr,
                      focusNode: phoneFcs,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top:0, bottom:2,left: 0),
                        // labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'BD',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),


                  ),*/





                    SizedBox(height: 30),

                    CustomButton(
                        height: 45,
                        width: Get.width / 1,
                        buttoncolor: gold,
                        color: Colors.white,
                        buttontextcolor: Colors.white,
                        radius: 0,
                        fontSize: 12.5,
                        onPressed: () {

                          if(widget.isFromProfile == false){
                            if (controller.selectedDivisionIndex>-1) {
                              if (controller.selectedDistrictIndex>-1) {
                                if (controller.selectedThanaIndex>-1) {
                                  if (controller.addressCtr.text.toString().isNotEmpty) {
                                    if (controller.firstNameCtr.text.toString().isNotEmpty) {
                                      if (controller.lastNameCtr.text.toString().isNotEmpty) {
                                        if (controller.phoneCtr.text.toString().isNotEmpty) {
                                          Get.find<UserProfileController>().createNewAddressbook(
                                              address_type: Get.find<UserProfileController>().addressTypeCtr.text,
                                              state_id: Get.find<UserProfileController>().divisionResponse!.data![controller.selectedDivisionIndex].id.toString(),
                                              district_id: Get.find<UserProfileController>().districtResponse!.data![controller.selectedDistrictIndex].id.toString(),
                                              sub_district_id: Get.find<UserProfileController>().thanaResponse!.data![controller.selectedThanaIndex].id.toString(),
                                              first_name: Get.find<UserProfileController>().firstNameCtr.text,
                                              last_name: Get.find<UserProfileController>().lastNameCtr.text,
                                              phone: Get.find<UserProfileController>().phoneCtr.text,
                                              address: Get.find<UserProfileController>().addressCtr.text,
                                              is_primary: "1"
                                          );
                                        }
                                        else {
                                          showCustomSnackBar("Please Enter your Phone Number");
                                        }
                                      }
                                      else {
                                        showCustomSnackBar("Please Enter your Last Name");
                                      }
                                    }
                                    else {
                                      showCustomSnackBar("Please Enter your First Name");
                                    }
                                  } else {
                                    showCustomSnackBar("Please Enter your Address");
                                  }
                                } else {
                                  showCustomSnackBar("Please Select Thana");
                                }
                              } else {
                                showCustomSnackBar("Please Select District");
                              }
                            } else {
                              showCustomSnackBar("Please Select Division");
                            }
                          }

                          else{

                            if (controller.selectedDivisionIndex>-1) {
                              if (controller.selectedDistrictIndex>-1) {
                                if (controller.selectedThanaIndex>-1) {
                                  if (controller.addressCtr.text.toString().isNotEmpty) {
                                    if (controller.firstNameCtr.text.toString().isNotEmpty) {
                                      if (controller.lastNameCtr.text.toString().isNotEmpty) {
                                        if (controller.phoneCtr.text.toString().isNotEmpty) {

                                          Get.to(CheckOutPage(
                                          ));
                                          showCustomSnackBar("Address Adding successfully", isError: false, isPosition: false);
                                        }
                                        else {
                                          showCustomSnackBar("Please Enter your Phone Number");
                                        }
                                      }
                                      else {
                                        showCustomSnackBar("Please Enter your Last Name");
                                      }
                                    }
                                    else {
                                      showCustomSnackBar("Please Enter your First Name");
                                    }
                                  } else {
                                    showCustomSnackBar("Please Enter your Address");
                                  }
                                } else {
                                  showCustomSnackBar("Please Select Thana");
                                }
                              } else {
                                showCustomSnackBar("Please Select District");
                              }
                            } else {
                              showCustomSnackBar("Please Select Division");
                            }
                          }
                          // Get.to(ThankYou());
                        },
                        myfontweight: FontWeight.bold,
                        buttonText: widget.isFromProfile?"ADD ADDRESS" : "ADD NEW ADDRESS".toUpperCase()),
                    SizedBox(height: 30),

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
