import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';

class CommunicationPreferences extends StatefulWidget {
  @override
  _trackparcelState createState() => _trackparcelState();
}
class _trackparcelState extends State<CommunicationPreferences> {
  bool click1 = false;
  bool click2 = false;
  // int selectedPayment=1;
  // int selectedPayment2=1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserProfileController>().getProfileData();
    } );
  }
/*  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<OrderHistoryController>().dataTrackingClear();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFBFB),
      bottomNavigationBar: UniversalBottomNav(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff000000)),
        titleSpacing: 0,
        // backgroundColor: Colors.green,
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 62,
/*        actions: [
          !isSearchClick?InkWell(
              onTap: (){
                Get.to(SearchScreen());
                *//*   isSearchClick=!isSearchClick;
                      setState(() {
                      });*//*
              },
              // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
              child: Image.asset(Images.search, height: 22, width: 22,)):SizedBox(),
          SizedBox(width: 15),

        ],*/
        title: CustomLogo(),
      ),
      body: GetBuilder<UserProfileController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(left: 15,right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Communication Preferences", style: railwaybold.copyWith(fontWeight: FontWeight.w700,fontSize: 18),),
                SizedBox(height: 12),
                Text("Subscribe to be the first with our new arrivals, exclusive collections, offers and more.", style: railway.copyWith(fontSize: 13),),
                SizedBox(height: 12),
                Text("Subscribe to ISLE newsletters.", style: railway.copyWith(fontSize: 13),),
                SizedBox(height: 12),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                            activeColor: gold,
                            checkColor: Colors.white,
                            value: controller.userProfileResponse!.data!.isEmail,
                            onChanged: (bool? value) {
                              setState(() {
                                controller.userProfileResponse!.data!.isEmail = value ?? false;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 4),
                        Text('Email'),
                      ],
                    ),
                    SizedBox(width: 12),
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                            activeColor: gold,
                            checkColor: Colors.white,
                            value: controller.userProfileResponse!.data!.isSms,
                            onChanged: (bool? value) {
                              setState(() {
                                controller.userProfileResponse!.data!.isSms = value ?? false;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 4),
                        Text('SMS'),
                      ],
                    )
                  ],
                ),
                // String customerID = await Get.find<AuthController>().getUserId();
                SizedBox(height: 12),
                CustomButton(
                  height: 45,
                  width: 90,
                  radius: 0,
                  onPressed: () {
                    // Ensure that userProfileResponse and data are not null
                    if (controller.userProfileResponse != null && controller.userProfileResponse!.data != null) {
                      bool isEmail = controller.userProfileResponse!.data!.isEmail ?? false;
                      bool isSms = controller.userProfileResponse!.data!.isSms ?? false;
                      controller.updateCommunicationPreference(is_email: isEmail!.toString(), is_sms: isSms!.toString());
                    }
                  },
                  buttonText: "SAVE",
                  buttoncolor: Colors.black,
                  buttontextcolor: Colors.white,
                  fontSize: 14,
                ),

                SizedBox(height: 12),
              ],
            ),
          );
        }
      ),
    );
  }

}
