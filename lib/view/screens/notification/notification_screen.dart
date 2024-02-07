import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/notification_controller.dart';
import 'package:isletestapp/helper/date_converter.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/Custom%20Popup%20Messages/islogin_popup.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/custom_shimmer.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/notification/custom_notification_dialog.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';



class NotificationScreen extends StatefulWidget {
  @override
  _trackparcelState createState() => _trackparcelState();
}

class _trackparcelState extends State<NotificationScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(Get.find<AuthController>().isLoggedIn()){
        Get.find<NotificationController>().getNotification();
      }else {
        Get.dialog(barrierDismissible: false,
            IsLoginPopUp(btnfn:  (){
          Get.back();
  /*        Get.to(LoginRegisterPage(exitFromApp: false,
            from: "cart",))!.then((value) {
            Get.find<NotificationController>().getNotification();

          });*/
                      Get.to(LoginRegisterPage(isFromCart: false,))!.then((value) {
            Get.find<NotificationController>().getNotification();

          });
        },));

      }
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
      body: ListView(
        children: [
          SizedBox(height: 3),
          Container(
            height: 45,
            color: Color(0xffF2F6F9),
            child: Center(child: Text("Notifications", style: railwaybold.copyWith(fontSize: 20),)),
          ),
          SizedBox(height: 6),
          /// Screen
        /*  controller.notificationResponse!=null?*/
          ListView.builder(
            // separatorBuilder: (BuildContext context, int index) => div,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // itemCount: controller.notificationResponse!.notifications!.length,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(left: 2,right: 2,top: 0,bottom: 2),
                  child: InkWell(
                      onTap: (){
                        Get.dialog(
                            CustomProgramDialog(
                              title: "Techmerino™ Sweatshirt in Wool",
                              desc: "Techmerino™ Sweatshirt in Wool Techmerino™ Sweatshirt in Wool Techmerino™ Sweatshirt in Wool",
                            )
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 4),
                                      child: Container(
                                        height: 35,
                                        // color: red,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex:6,
                                              child: Row(
                                                children: [
                                                  Image.asset(Images.notification, height: 25, width: 25, color: gold,),
                                                  SizedBox(width: 6),
                                                  Expanded(
                                                    child: Text('${"Techmerino™ Sweatshirt in Wool"}',
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: railwaybold.copyWith(fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Expanded(child: Text('${"Techmerino™ Sweatshirt in Wool Techmerino™ Sweatshirt in Wool Techmerino™ Sweatshirt in Wool Techmerino™ Sweatshirt in Wool"}', style: railway.copyWith(fontSize:12),))],),
                                    ),
                                    SizedBox(height: 4),
                                    Row(mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                                          child: Text('${DateConverter.stringToLocalDateOnly("2023-12-12")}', style: robotoRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: 8.5),),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),

                                  ],),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                );
              }
          ),
              // :  MyShimmer(hight: 40),
          SizedBox(height: 20),
        ],
      ),
    );
  }

}
