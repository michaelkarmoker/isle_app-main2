import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/profile/landing%20pages/communications_preferences.dart';
import 'package:isletestapp/view/screens/profile/profile%20edit/profile_edit.dart';



class UserProfileDtails extends StatefulWidget {
  UserProfileDtails({Key? key}) : super(key: key);

  @override
  State<UserProfileDtails> createState() => _UserProfileDtailsState();
}

class _UserProfileDtailsState extends State<UserProfileDtails> {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
       Get.find<UserProfileController>().dataInitialize();
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          title: Text("View Profile Details", style: railway.copyWith(fontSize: 18, color: Colors.black),),
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
        // backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child:
          controller.userProfileResponse!=null?
          Container(
            // color: Color(0xffF2F3F9),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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

                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: gold,
                        width: 1,
                        // style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("YOUR DETAILS", style: railwaybold.copyWith(fontSize: 14)),
                              InkWell(
                                onTap: () {
                                  Get.to(UserProfileEdit());
                                },
                                child: Text("Edit",
                                    style: railwaybold.copyWith(fontSize: 14,
                                    color: gold,
                                    decoration: TextDecoration.underline
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(300)),
                                  border: Border.all(width: 1, color: gold)),
                              alignment: Alignment.center,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child:  CustomImageCached(
                                    placeholder: Images.profile,
                                    image: '${AppConstants.BASE_URL}${controller.userProfileResponse!.data!.photo??""}',
                                    fit: BoxFit.fill,
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text("First Name: ", style: railwaybold.copyWith(fontSize: 11)),
                              Text("${controller.userProfileResponse!.data!.firstName??""}", style: railway.copyWith(fontSize: 11)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("Last Name: ", style: railwaybold.copyWith(fontSize: 11)),
                              Text("${controller.userProfileResponse!.data!.lastName??""}", style: railway.copyWith(fontSize: 11)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("Phone: ", style: railwaybold.copyWith(fontSize: 11)),
                              Text("${controller.userProfileResponse!.data!.phone??""}", style: railway.copyWith(fontSize: 11)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("Email: ", style: railwaybold.copyWith(fontSize: 11)),
                              Text("${controller.userProfileResponse!.data!.email??""}", style: railway.copyWith(fontSize: 11)),
                            ],
                          ),
                          SizedBox(height: 8),

                          Row(
                            children: [
                              Text("Date of Birth: ", style: railwaybold.copyWith(fontSize: 11)),
                              controller.userProfileResponse!.data!.dateOfBirth!=null?
                              Text("${controller.userProfileResponse!.data!.dateOfBirth??""}".substring(0,10), style: poppins.copyWith(fontSize: 10.5))
                              : SizedBox(),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Gender: ", style: railwaybold.copyWith(fontSize: 11)),
                              Text("${controller.userProfileResponse!.data!.gender??""}", style: railway.copyWith(fontSize: 11)),
                            ],
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: gold,
                        width: 1,
                        // style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("YOUR ADDRESS", style: railwaybold.copyWith(fontSize: 14)),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text("Edit Address",
                                    style: railwaybold.copyWith(fontSize: 12,
                                        color: gold,
                                        decoration: TextDecoration.underline
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          controller.userAddressBookResponse != null
                              ? controller.userAddressBookResponse!.data!.length > 0
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery Address",
                                style: railway.copyWith(fontSize: 12, color: Colors.black54),
                              ),
                              SizedBox(height: 8),
                              ListView.builder(
                                itemCount: controller.userAddressBookResponse!.data!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  if (controller.userAddressBookResponse!.data![index]!.isPrimary!) {
                                    return Text(
                                      "${controller.userAddressBookResponse!.data![index]!.address ?? ""}",
                                      style: railwaybold.copyWith(fontSize: 12),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          )
                              : Text(
                            "No address found. Please add a delivery address.",
                            style: railway.copyWith(fontSize: 11),
                          )
                              : SizedBox(),

                          SizedBox(height: 20),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  /// payment method
             /*     Container(
                    width: Get.width,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: gold,
                        width: 1,
                        // style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("YOUR PREFERRED\nPAYMENT METHOD", style: railwaybold.copyWith(fontSize: 14, height: 1.5)),
                              InkWell(
                                onTap: () {
                                  // Get.to(UserProfileEdit());
                                },
                                child: Text("Edit payment Details",
                                    style: railwaybold.copyWith(fontSize: 14,
                                        color: gold,
                                        decoration: TextDecoration.underline
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Text("Payment Method", style: railway.copyWith(fontSize: 11, color: silvercolor)),
                          SizedBox(height: 6),
                          Text("Bkash Payment", style: railway.copyWith(fontSize: 11)),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),*/
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: gold,
                        width: 1,
                        // style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("COMMUNICATION\nPREFERENCES", style: railwaybold.copyWith(fontSize: 14, height: 1.5)),
                              InkWell(
                                onTap: () {
                                  Get.to(CommunicationPreferences());
                                },
                                child: Text("Edit Communication\nPreferences",
                                    style: railwaybold.copyWith(fontSize: 12,
                                        color: gold,
                                        decoration: TextDecoration.underline
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          controller.userProfileResponse!= null? controller.userProfileResponse!.data!.id!=null?
                          Row(
                            children: [
                              controller.userProfileResponse!.data!.isEmail!?
                              Container(
                                color: gold,
                                  height: 30, width: 60,
                                  child: Center(child: Text("Email", style: railwaybold.copyWith(fontSize: 11)))) : SizedBox(),
                              controller.userProfileResponse!.data!.isEmail!? SizedBox(width: 15): SizedBox(),
                              controller.userProfileResponse!.data!.isSms!?
                              Container(
                                  color: gold,
                                  height: 30, width: 60,
                                  child: Center(child: Text("SMS", style: railwaybold.copyWith(fontSize: 11)))): SizedBox(),
                            ],
                          ) : SizedBox()

                          :Text("Edit Communication Preferences", style: railway.copyWith(fontSize: 11)),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),


                  /*           CustomButton(
                      onPressed: () {
                        // validationEdit(controller);
                      },
                      buttoncolor: gold,
                       fontSize: 15,
                       myfontweight: FontWeight.bold,
                      buttonText: "SUBMIT"),*/
                  SizedBox(height: 50),
                ],
              ),
            ),
          )
          : SizedBox(),
        ),
      );
    });
  }


}
