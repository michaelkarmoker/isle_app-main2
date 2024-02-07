import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:isletestapp/controller/checkOut/checkout_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/data/model/response/profile/address%20book/load_edit_addressbook_response.dart';
import 'package:isletestapp/data/model/response/profile/address%20book/user_addressbook_response.dart';
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

class EditAddressBook extends StatefulWidget {
  final int id;
  const EditAddressBook({Key? key, required this.id,}) : super(key: key);
  @override
  State<EditAddressBook> createState() => _EditAddressBookState();
}

class _EditAddressBookState extends State<EditAddressBook> {
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController addressCtr = TextEditingController();
  TextEditingController addressTypeCtr = TextEditingController();

  FocusNode firstNameFcs = FocusNode();
  FocusNode lastNameFcs = FocusNode();
  FocusNode phoneFcs = FocusNode();
  FocusNode addressFcs = FocusNode();
  FocusNode addressTypeFcs = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    WidgetsBinding.instance
        .addPostFrameCallback((_) =>  Get.find<UserProfileController>().getEditLoadData(widget.id).then((value) => {
      setProfileInfo(Get.find<UserProfileController>().editLoadAddressBookResponse!)
    }));
  }
  void setProfileInfo(EditLoadAddressBookResponse editLoadAddressBookResponse) {
    firstNameCtr.text = editLoadAddressBookResponse.data?.firstName ?? "";
    lastNameCtr.text = editLoadAddressBookResponse.data?.lastName ?? "";
    phoneCtr.text = editLoadAddressBookResponse.data?.phone ?? "";
    // emailCtr.text = editLoadAddressBookResponse.data?. ?? "";
    addressCtr.text = editLoadAddressBookResponse.data?.address ?? "";
    addressTypeCtr.text = editLoadAddressBookResponse.data?.addressType ?? "";
    // selectedDivision = editLoadAddressBookResponse!.data!.stateId!.toString();

    // fromdateController.text = userProfileResponse.data?.dateOfBirth?.substring(0, 10) ?? "";

    // Perform null checks for other properties if needed
    // selectedGender = gender[userProfileResponse.teacher?.gender ?? ""];
    // selectedMaritStatus = bia[userProfileResponse.teacher?.maritalStatus ?? ""];
    // selectedBlood = userProfileResponse.teacher?.bloodGroup ?? "";
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
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
                      controller: addressCtr,
                      focusNode: addressFcs,
                      nextFocus: addressTypeFcs,
                      title: "Delivery Address",
                      isRequired: true,
                      titlesize: 13,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      myfontWeight: FontWeight.bold,
                    ),

                    SizedBox(height: 12),
                 MyTextField(
                      controller: addressTypeCtr,
                      focusNode: addressTypeFcs,
                      nextFocus: firstNameFcs,
                      title: "Address Type",
                      isRequired: true,
                      titlesize: 13,
                      hintText: "home/office",
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      // myfontWeight: FontWeight.bold,
                    ),
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
                      controller: firstNameCtr,
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
                      controller: lastNameCtr,
                      focusNode: lastNameFcs,
                      title: "Last Name",
                      isRequired: true,
                      titlesize: 13,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      myfontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 12),
                    MyTextField(
                      controller: phoneCtr,
                      focusNode: phoneFcs,
                      title: "Phone Number",
                      hintText: "+88017XXXXXXXX",
                      isRequired: true,
                      titlesize: 14,
                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                      myfontWeight: FontWeight.bold,
                    ),
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
                          // if (selectedDivisionIndex>-1) {
                          //   if (selectedDistrictIndex>-1) {
                          //     if (selectedThanaIndex>-1) {
                                if (addressTypeCtr.text.toString().isNotEmpty) {
                                  if (addressCtr.text.toString().isNotEmpty) {
                                    if (firstNameCtr.text.toString().isNotEmpty) {
                                      if (lastNameCtr.text.toString().isNotEmpty) {
                                        if (phoneCtr.text.toString().isNotEmpty) {
                                          print("yhuiyhiouj");
                                          Get.find<UserProfileController>().updateAddressbook(
                                            id: widget.id!.toString(),
                                              address_type: addressTypeCtr.text,
                                              state_id: controller.divisionResponse!.data![controller.selectedDivisionIndex].id.toString(),
                                              district_id: controller.districtResponse!.data![controller.selectedDistrictIndex].id.toString(),
                                              sub_district_id: controller.thanaResponse!.data![controller.selectedThanaIndex].id.toString(),
                                              first_name: firstNameCtr.text,
                                              last_name: lastNameCtr.text,
                                              phone: phoneCtr.text,
                                              address: addressCtr.text,
                                              // is_primary: "1"
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
                                  showCustomSnackBar("Please Enter your Delivery type");
                                }
                          //     } else {
                          //       showCustomSnackBar("Please Select Thana");
                          //     }
                          //   } else {
                          //     showCustomSnackBar("Please Select District");
                          //   }
                          // } else {
                          //   showCustomSnackBar("Please Select Division");
                          // }
                        },
                        myfontweight: FontWeight.bold,
                        buttonText: "UPDATE ADDRESS"),
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
