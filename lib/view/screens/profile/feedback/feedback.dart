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
class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}
class _FeedBackState extends State<FeedBack> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserProfileController>().getFeedBackData();
    } );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<UserProfileController>().dataClearForFeedback();
  }

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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                        itemCount: controller.accountFeedbackResponse?.data?.length??0,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context , int index) {
                          return     Padding(
                            padding: const EdgeInsets.only( bottom: 8),
                            child: Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text("Rating: ", style: railwaybold.copyWith(fontSize: 14)),
                                        SizedBox(width: 0),
                                        controller.accountFeedbackResponse?.data?[index]?.rating == 5 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 5,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.accountFeedbackResponse?.data?[index]?.rating??"0"})")
                                          ],
                                        )
                                            : SizedBox(),
                                        controller.accountFeedbackResponse?.data?[index]?.rating == 4 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 4,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.accountFeedbackResponse?.data?[index]?.rating??"0"})")
                                          ],
                                        )  : SizedBox(),
                                        controller.accountFeedbackResponse?.data?[index]?.rating == 3 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 3,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.accountFeedbackResponse?.data?[index]?.rating??"0"})")
                                          ],
                                        )  : SizedBox(),
                                        controller.accountFeedbackResponse?.data?[index]?.rating == 2 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 2,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.accountFeedbackResponse?.data?[index]?.rating??"0"})")
                                          ],
                                        )  : SizedBox(),
                                        controller.accountFeedbackResponse?.data?[index]?.rating == 1 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 1,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.accountFeedbackResponse?.data?[index]?.rating??"0"})")
                                          ],
                                        )
                                            : SizedBox(),

                                      ],
                                    ),
                                    SizedBox(height: 0),
                                    Text("Your Feedback :", style: railwaybold.copyWith(fontSize: 13)),
                                    SizedBox(height: 4),
                                    Text("${controller.accountFeedbackResponse?.data?[index]?.message??""}", style: railway.copyWith(fontSize: 11)),
                                    SizedBox(height: 8),
                                    controller.accountFeedbackResponse?.data?[index]?.feedbackAdminReplies?.length!=""?
                                    // Inner ListView for admin replies
                                    ListView.builder(
                                      itemCount: controller.accountFeedbackResponse?.data?[index]?.feedbackAdminReplies?.length ?? 0,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context, int index2) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 12, top: 0, right: 6, bottom: 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Admin reply :", style: railwaybold.copyWith(fontSize: 13)),
                                              SizedBox(height: 4),
                                              Text(
                                                "${controller.accountFeedbackResponse?.data?[index]?.feedbackAdminReplies?[index2]?.message ?? ""}",
                                                style: railway.copyWith(fontSize: 11),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ):
                                    SizedBox(height: 4),
                                  ],
                                ),
                              )
                            ),
                          );
                        }

                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

}
