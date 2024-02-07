import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:share_plus/share_plus.dart';

class ReferFriend extends StatefulWidget {
  @override
  _trackparcelState createState() => _trackparcelState();
}

class _trackparcelState extends State<ReferFriend> {
TextEditingController referCtr = TextEditingController();
FocusNode referFcs = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserProfileController>().getReferCodeData();
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
    return GetBuilder<UserProfileController>(
      builder: (controller) {
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
          body: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: gold,
                      width: 0.5,
                      // style: BorderStyle.solid,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 0, right: 6,bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Refer A Friend", style: railwaybold.copyWith(fontSize: 16)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text("My Refer Code: ", style: railwaybold.copyWith(fontSize: 13)),
                            controller.referCodeResponse?.data?.isNotEmpty == true
                                ? Text("${controller.referCodeResponse!.data![0]?.referCode ?? ""}", style: poppins.copyWith(fontSize: 13))
                                : Text("No Refer Code available"),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            controller.referCodeResponse!=null? controller.referCodeResponse!.data!.length>0?
                        InkWell(
                            onTap: () async {
                  if (controller.referCodeResponse?.data?.isNotEmpty == true) {
                  await Share.share("Refer Code is: ${controller.referCodeResponse!.data![0]!.referCode!}");
                  // showCustomSnackBar("Share Completed", isPosition: true, isError: false);
                  } else {
                  // Handle the case when refer code is not available
                  }
                  },
                    child: Container(
                      color: gold,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text("Share Refer Code", style: railwaybold.copyWith(fontSize: 14)),
                      ),
                    ),
                  )
                            : SizedBox() : SizedBox(),
                          ],
                        ),

                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: gold,
                      width: 0.5,
                      // style: BorderStyle.solid,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 8, right: 8,bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15),
             /*           Row(
                          children: [
                            Text("Enter refer code", style: railwaybold.copyWith(fontSize: 16)),
                          ],
                        ),
                        SizedBox(height: 8),*/

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                           Expanded(
                             child: MyTextField(
                                 controller: referCtr,
                                 focusNode: referFcs,
                                 title: "Enter refer code",
                               hintText: "Enter refer code",
                               titlesize: 16,
                               myfontWeight: FontWeight.bold,
                             ),
                           ),
                            SizedBox(width: 8),
                            CustomButton(
                              height: 40,
                              width: 100,
                              radius: 0,
                              onPressed: () async{
                                print("objectttttttttttttttttttt");
                                String customerID = await Get.find<AuthController>().getUserId();
                                controller.applyReferCode(customer_id: customerID, refer_code: referCtr.text.trim());
                                print("objectttttttttttttttttttt");
                              },
                              buttonText: "SUBMIT",
                              buttoncolor: Colors.black,
                              buttontextcolor: Colors.white,
                              fontSize: 13,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        );
      }
    );
  }

}
