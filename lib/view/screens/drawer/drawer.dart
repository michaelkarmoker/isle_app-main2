import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/auth/login-register.dart';


class IsleDrawer extends StatefulWidget {
  bool isExpanded1=false;
  bool isExpanded2=false;
  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;
  bool isExpanded6=false;
  bool isExpanded7=false;


  @override
  State<IsleDrawer> createState() => _IsleDrawerState();
}

class _IsleDrawerState extends State<IsleDrawer> {
  Color tabColor= Color(0xff0b1d6f);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width/1.18,
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            // backgroundColor: Color(0xffEBEFF3),
            backgroundColor: Color(0xffFFFFFF),
            body:  Column(
              children: [
  /// Profile Part
                InkWell(
            onTap: (){
              Get.to(LoginRegisterPage(isFromCart: false,));
            },
                  child: Container(
                  color: Color(0xffFFFFFF),
            child: ListTile(
              leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.person, color: Colors.black54, height: 29,width: 29,),
                  ],
              ),
              title: Text("Log in / Register", style: robotoMedium.copyWith(fontSize: 15, color: Colors.black87),),
              subtitle: Text("For faster checkout", style: robotoRegular.copyWith(fontSize: 12.5, color: Colors.black87),),
              trailing: Icon(Icons.arrow_forward_ios_sharp, size: 30,),
            ),
          ),
                ),
                Divider(
                  thickness: 15,
                    color: Color(0xffF2F6F9),
                ),

  /// Tab Bar Part
      /*          Container(
                  // color: Color(0xffFFFFFF),
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(4, 8), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    color: tabColor,
                    // color: Color(0xffFFFFFF),
                    child: TabBar(

                        onTap: (index) {
                          setState(() {

                            if(index==0) { tabColor = Color(0xff0b1d6f);}
                            if(index==1) {tabColor = Color(0xff410f57);}
                            if(index==2) {tabColor = Color(0xff25d55f);}
                          });
                          print(index);
                        },
                      // indicator: BoxDecoration(color: tabColor,borderRadius: BorderRadius.circular(8)),
                      // dividerColor: Colors.black,

                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft:
                            Radius.circular(10),topRight: Radius.circular(10)),
                            color: tabColor
                        ),
                      indicatorColor: Color(0xffb89600),
                        indicatorWeight: 2.5,
                        tabs: [
                          Tab(
                              child: Text(
                                'Men'.toUpperCase(),
                                style: robotoMedium.copyWith(
                                    color: Colors.white, fontSize: 17),
                              )),
                          Tab(
                              child: Text(
                                'Women'.toUpperCase(),
                                style: robotoMedium.copyWith(
                                    color: Colors.white, fontSize: 17),
                              )),
                          Tab(
                              child: Text(
                                'Kids'.toUpperCase(),
                                style: robotoMedium.copyWith(
                                    color: Colors.white, fontSize: 17),
                              )),
                        ]),
                  ),
                ),

                Expanded(
                  child: TabBarView(
                      children: [
/// 1 st TAB
                        RefreshIndicator(
                            onRefresh: () async{
                              showCustomSnackBar("1");
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      showCustomSnackBar("Click Women HomePage");
                                    },
                                    child: Container(
                                      height: 130,
                                      // color: Colors.green,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Row(
                                                  children: [
                                                    Text("HomePage", style: titl.copyWith( fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                    SizedBox(width: 5),
                                                    Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 18,)
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(height: 2, thickness: 2, color: Color(0xffF2F6F9),),

                                  Column(
                                    children: [
                                      /// New In
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded1=! widget.isExpanded1;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("New In", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FMW_App_Cat_New_In_WK32.4ed05868.webp&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded1? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),

                                      /// Brands
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded2=! widget.isExpanded2;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Brands", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FMW_App_Cat_New_In_WK32.4ed05868.webp&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded2? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),


                                      /// Clothing
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded3=! widget.isExpanded3;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Clothing", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FMW_App_Cat_New_In_WK32.4ed05868.webp&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded3? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),


                                      /// Shoes
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded1=! widget.isExpanded1;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Shoes", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FMW_App_Cat_New_In_WK32.4ed05868.webp&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded4? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),

                                      /// Watchs
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded5=! widget.isExpanded5;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Watchs", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FMW_App_Cat_New_In_WK32.4ed05868.webp&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded5? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),

                                      /// Gift
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded6=! widget.isExpanded6;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Gift", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FMW_App_Cat_New_In_WK32.4ed05868.webp&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded6? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),


                                      /// Bags
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded7=! widget.isExpanded7;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Bags", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FMW_App_Cat_New_In_WK32.4ed05868.webp&w=640&q=75",
                                                          fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded7? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),

                                    ],
                                  ),


                                  Divider(
                                    height: 12,
                                    thickness: 12,
                                    color: Color(0xffF2F6F9),
                                    // color: Colors.pink,
                                  ),

                                  /// My Orders Part
                                  Container(
                                    color: Color(0xffFFFFFF),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 15),
                                                  child: Image.asset(Images.box, height: 22, width: 22,),
                                                ),
                                              ],
                                            )
                                        ),

                                        Expanded(
                                          flex: 9,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("My Orders", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                                  SizedBox(height: 4),
                                                  Text("Track or Return", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 10),),

                                                ],
                                              ),
                                            )
                                        ),

                                        Expanded(
                                          flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                            )
                                        )
                                      ],
                                    )
                                  ),

                                  Divider(
                                    thickness: 12,
                                    color: Color(0xffF2F6F9),
                                  ),

                                  /// Shipping Part
                                  Container(
                                      color: Color(0xffFFFFFF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Image.asset(Images.bd, height: 25, width: 25,),
                                                  ),
                                                ],
                                              )
                                          ),

                                          Expanded(
                                              flex: 9,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Shipping to", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                                    SizedBox(height: 4),
                                                    Text("BD", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 12),),

                                                  ],
                                                ),
                                              )
                                          ),

                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Image.asset(Images.drop, height: 22, color: Colors.black,),
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                  Divider(
                                    thickness: 30,
                                    height: 30,
                                    color: Color(0xffF2F6F9),
                                  ),


                                  Container(
                                      color: Color(0xffFFFFFF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Image.asset(Images.language, height: 22, width: 22,),
                                                  ),
                                                ],
                                              )
                                          ),

                                          Expanded(
                                              flex: 9,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Change language", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                                    SizedBox(height: 4),
                                                    Text("Bangla", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 10),),

                                                  ],
                                                ),
                                              )
                                          ),

                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                  Divider(
                                    height: 15,
                                    thickness: 15,
                                    color: Color(0xffF2F6F9),
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Image.asset(Images.info, color: Colors.black87, height: 25, width: 25,),
                                              ),
                                            ],
                                          )
                                      ),

                                      Expanded(
                                          flex: 11,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10),
                                                Text("Need Help?", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 18),),
                                                SizedBox(height: 6),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8),
                                                  child: Text("If you need to speak to one of our customer care representative,kindly reach out to us on 01631375174 or send an email to mdyiaz@gmail.com  we are availavle between 10am - 10pm",
                                                    // textAlign: TextAlign.justify,
                                                    style: robotoRegular.copyWith(color: Colors.black54, fontSize: 12.5),),
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      children: [

                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Container(
                                                height: Get.height/10.5,
                                                // width: 120,
                                                decoration:  BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xff20243D),
                                                    ),
                                                    // color: Colors.pink,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),

                                                child: Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      // Image.asset(Images.facebook),
                                                      Icon(Icons.call, color: Colors.black87, size: 25, ),
                                                      SizedBox(height: 5),
                                                      Text("Call us", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 10),)
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Container(
                                                height: Get.height/10.5,
                                                // width: 120,
                                                decoration:  BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xff20243D),
                                                    ),
                                                    borderRadius: BorderRadius.circular(8)
                                                ),

                                                child: Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(Images.whatsapp, height: 25, width: 25, color:  Colors.black87,),
                                                      // Icon(Icons.call, color: Colors.white, size: 35,),
                                                      SizedBox(height: 5),
                                                      Text("WhatsApps", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 10),)
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Container(
                                                height: Get.height/10.5,
                                                // width: 120,
                                                decoration:  BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xff20243D),
                                                    ),
                                                    // color: Color(0xff20243D),
                                                    // color: Colors.pink,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),

                                                child: Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(Images.email, height: 25, width: 25, color: Colors.black87,),
                                                      // Icon(Icons.call, color: Colors.white, size: 35,),
                                                      SizedBox(height: 5),
                                                      Text("E-mail", style: robotoRegular.copyWith(color: Colors.black87, fontSize: 10),)
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text("Frequently Asked Question", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                            ),
                                          )
                                      ),

                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 25),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text("Shipping Policy", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                            ),
                                          )
                                      ),

                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 25),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text("Returns & Refunds", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                            ),
                                          )
                                      ),

                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  ),




                                  SizedBox(height: 30,)
                                ],
                              ),


                            )

                        ),

/// 2nd TAB
                        RefreshIndicator(
                            onRefresh: () async{
                              showCustomSnackBar("2");
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      showCustomSnackBar("Click Women HomePage");
                                    },
                                    child: Container(
                                      height: 130,
                                      // color: Colors.green,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Row(
                                                  children: [
                                                    Text("HomePage", style: titl.copyWith( fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                    SizedBox(width: 5),
                                                    Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 18,)
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(height: 2, thickness: 2, color: Color(0xffF2F6F9),),

                                  Column(
                                    children: [

                                      /// New In
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded1=! widget.isExpanded1;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("New In", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded1? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),

                                      /// Brands
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded2=! widget.isExpanded2;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Brands", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded2? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),


                                      /// Clothing
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded3=! widget.isExpanded3;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Clothing", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded3? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),


                                      /// Shoes
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded1=! widget.isExpanded1;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Shoes", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded4? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),


                                      /// Watchs
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded5=! widget.isExpanded5;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Watchs", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded5? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),

                                      /// Gift
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded6=! widget.isExpanded6;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Gift", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded6? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),


                                      /// Bags
                                      InkWell(
                                        onTap: (){
                                          widget.isExpanded7=! widget.isExpanded7;
                                          setState(() {
                                          });
                                        },
                                        child: Container(
                                          height: 130,
                                          // color: Colors.green,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text("Bags", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                                        SizedBox(width: 5),
                                                        Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                                        // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                      color: Color(0xffFFFFFF),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                                      ))
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 3,
                                        thickness: 3,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      widget.isExpanded7? Container(
                                        // color: Colors.red,
                                        // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: drawerdrop.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                physics: ClampingScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index){
                                                  return  InkWell(
                                                    onTap: (){
                                                      // Get.to(AssesmentForm(grade: "1"));
                                                      // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                                      showCustomSnackBar('Sunny');
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      color: Color(0xffF2F6F9),
                                                      height: 50,
                                                      width: Get.width,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(
                                                          "${drawerdrop[index]}",
                                                          style: TextStyle(
                                                              fontSize: 15.5,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                            ),
                                            // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                          ],
                                        ),
                                      ):Container(),



                                    ],
                                  ),


                                  Divider(
                                    height: 12,
                                    thickness: 12,
                                    color: Color(0xffF2F6F9),
                                    // color: Colors.pink,
                                  ),



                                  /// My Orders Part
                                  Container(
                                      color: Color(0xffFFFFFF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Image.asset(Images.box, height: 22, width: 22,),
                                                  ),
                                                ],
                                              )
                                          ),

                                          Expanded(
                                              flex: 9,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("My Orders", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                                    SizedBox(height: 4),
                                                    Text("Track or Return", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 10),),

                                                  ],
                                                ),
                                              )
                                          ),

                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                              )
                                          )
                                        ],
                                      )
                                  ),

                                  Divider(
                                    thickness: 12,
                                    color: Color(0xffF2F6F9),
                                  ),

                                  /// Shipping Part
                                  Container(
                                      color: Color(0xffFFFFFF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Image.asset(Images.bd, height: 25, width: 25,),
                                                  ),
                                                ],
                                              )
                                          ),

                                          Expanded(
                                              flex: 9,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Shipping to", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                                    SizedBox(height: 4),
                                                    Text("BD", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 12),),

                                                  ],
                                                ),
                                              )
                                          ),

                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Image.asset(Images.drop, height: 22, color: Colors.black,),
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                  Divider(
                                    thickness: 30,
                                    height: 30,
                                    color: Color(0xffF2F6F9),
                                  ),


                                  Container(
                                      color: Color(0xffFFFFFF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child: Image.asset(Images.language, height: 22, width: 22,),
                                                  ),
                                                ],
                                              )
                                          ),

                                          Expanded(
                                              flex: 9,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Change language", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                                    SizedBox(height: 4),
                                                    Text("Bangla", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 10),),

                                                  ],
                                                ),
                                              )
                                          ),

                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                  Divider(
                                    height: 15,
                                    thickness: 15,
                                    color: Color(0xffF2F6F9),
                                  ),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Image.asset(Images.info, color: Colors.black87, height: 25, width: 25,),
                                              ),
                                            ],
                                          )
                                      ),

                                      Expanded(
                                          flex: 11,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10),
                                                Text("Need Help?", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 18),),
                                                SizedBox(height: 6),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8),
                                                  child: Text("If you need to speak to one of our customer care representative,kindly reach out to us on 01631375174 or send an email to mdyiaz@gmail.com  we are availavle between 10am - 10pm",
                                                    // textAlign: TextAlign.justify,
                                                    style: robotoRegular.copyWith(color: Colors.black54, fontSize: 12.5),),
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      children: [

                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Container(
                                                height: Get.height/10.5,
                                                // width: 120,
                                                decoration:  BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xff20243D),
                                                    ),
                                                    // color: Colors.pink,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),

                                                child: Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      // Image.asset(Images.facebook),
                                                      Icon(Icons.call, color: Colors.black87, size: 25, ),
                                                      SizedBox(height: 5),
                                                      Text("Call us", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 10),)
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Container(
                                                height: Get.height/10.5,
                                                // width: 120,
                                                decoration:  BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xff20243D),
                                                    ),
                                                    borderRadius: BorderRadius.circular(8)
                                                ),

                                                child: Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(Images.whatsapp, height: 25, width: 25, color:  Colors.black87,),
                                                      // Icon(Icons.call, color: Colors.white, size: 35,),
                                                      SizedBox(height: 5),
                                                      Text("WhatsApps", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 10),)
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Container(
                                                height: Get.height/10.5,
                                                // width: 120,
                                                decoration:  BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xff20243D),
                                                    ),
                                                    // color: Color(0xff20243D),
                                                    // color: Colors.pink,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),

                                                child: Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(Images.email, height: 25, width: 25, color: Colors.black87,),
                                                      // Icon(Icons.call, color: Colors.white, size: 35,),
                                                      SizedBox(height: 5),
                                                      Text("E-mail", style: robotoRegular.copyWith(color: Colors.black87, fontSize: 10),)
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text("Frequently Asked Question", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                            ),
                                          )
                                      ),

                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 25),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text("Shipping Policy", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                            ),
                                          )
                                      ),

                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 25),

                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text("Returns & Refunds", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                            ),
                                          )
                                      ),

                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  ),




                                  SizedBox(height: 30,)
                                ],
                              ),


                            )

                        ),

 /// 3rd TAB
                        RefreshIndicator(
                onRefresh: () async{
                  showCustomSnackBar("1");
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          showCustomSnackBar("Click Women HomePage");
                        },
                        child: Container(
                          height: 130,
                          // color: Colors.green,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Text("HomePage", style: titl.copyWith( fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                        SizedBox(width: 5),
                                        Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 18,)
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 2, thickness: 2, color: Color(0xffF2F6F9),),

                      Column(
                        children: [
                          /// New In
                          InkWell(
                            onTap: (){
                              widget.isExpanded1=! widget.isExpanded1;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: 130,
                              // color: Colors.green,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text("New In", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                            SizedBox(width: 5),
                                            Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                            // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          color: Color(0xffFFFFFF),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                          ))
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 3,
                            thickness: 3,
                            color: Color(0xffF2F6F9),
                            // color: Colors.pink,
                          ),
                          widget.isExpanded1? Container(
                            // color: Colors.red,
                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: drawerdrop.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index){
                                      return  InkWell(
                                        onTap: (){
                                          // Get.to(AssesmentForm(grade: "1"));
                                          // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                          showCustomSnackBar('Sunny');
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          color: Color(0xffF2F6F9),
                                          height: 50,
                                          width: Get.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "${drawerdrop[index]}",
                                              style: TextStyle(
                                                  fontSize: 15.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                ),
                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),

                          /// Brands
                          InkWell(
                            onTap: (){
                              widget.isExpanded2=! widget.isExpanded2;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: 130,
                              // color: Colors.green,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text("Brands", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                            SizedBox(width: 5),
                                            Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                            // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          color: Color(0xffFFFFFF),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                          ))
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 3,
                            thickness: 3,
                            color: Color(0xffF2F6F9),
                            // color: Colors.pink,
                          ),
                          widget.isExpanded2? Container(
                            // color: Colors.red,
                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: drawerdrop.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index){
                                      return  InkWell(
                                        onTap: (){
                                          // Get.to(AssesmentForm(grade: "1"));
                                          // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                          showCustomSnackBar('Sunny');
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          color: Color(0xffF2F6F9),
                                          height: 50,
                                          width: Get.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "${drawerdrop[index]}",
                                              style: TextStyle(
                                                  fontSize: 15.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                ),
                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),


                          /// Clothing
                          InkWell(
                            onTap: (){
                              widget.isExpanded3=! widget.isExpanded3;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: 130,
                              // color: Colors.green,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text("Clothing", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                            SizedBox(width: 5),
                                            Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                            // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          color: Color(0xffFFFFFF),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                          ))
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 3,
                            thickness: 3,
                            color: Color(0xffF2F6F9),
                            // color: Colors.pink,
                          ),
                          widget.isExpanded3? Container(
                            // color: Colors.red,
                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: drawerdrop.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index){
                                      return  InkWell(
                                        onTap: (){
                                          // Get.to(AssesmentForm(grade: "1"));
                                          // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                          showCustomSnackBar('Sunny');
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          color: Color(0xffF2F6F9),
                                          height: 50,
                                          width: Get.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "${drawerdrop[index]}",
                                              style: TextStyle(
                                                  fontSize: 15.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                ),
                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),


                          /// Shoes
                          InkWell(
                            onTap: (){
                              widget.isExpanded1=! widget.isExpanded1;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: 130,
                              // color: Colors.green,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text("Shoes", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                            SizedBox(width: 5),
                                            Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                            // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          color: Color(0xffFFFFFF),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                          ))
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 3,
                            thickness: 3,
                            color: Color(0xffF2F6F9),
                            // color: Colors.pink,
                          ),
                          widget.isExpanded4? Container(
                            // color: Colors.red,
                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: drawerdrop.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index){
                                      return  InkWell(
                                        onTap: (){
                                          // Get.to(AssesmentForm(grade: "1"));
                                          // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                          showCustomSnackBar('Sunny');
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          color: Color(0xffF2F6F9),
                                          height: 50,
                                          width: Get.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "${drawerdrop[index]}",
                                              style: TextStyle(
                                                  fontSize: 15.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                ),
                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),

                          /// Watchs
                          InkWell(
                            onTap: (){
                              widget.isExpanded5=! widget.isExpanded5;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: 130,
                              // color: Colors.green,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text("Watchs", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                            SizedBox(width: 5),
                                            Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                            // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          color: Color(0xffFFFFFF),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                          ))
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 3,
                            thickness: 3,
                            color: Color(0xffF2F6F9),
                            // color: Colors.pink,
                          ),
                          widget.isExpanded5? Container(
                            // color: Colors.red,
                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: drawerdrop.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index){
                                      return  InkWell(
                                        onTap: (){
                                          // Get.to(AssesmentForm(grade: "1"));
                                          // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                          showCustomSnackBar('Sunny');
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          color: Color(0xffF2F6F9),
                                          height: 50,
                                          width: Get.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "${drawerdrop[index]}",
                                              style: TextStyle(
                                                  fontSize: 15.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                ),
                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),

                          /// Gift
                          InkWell(
                            onTap: (){
                              widget.isExpanded6=! widget.isExpanded6;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: 130,
                              // color: Colors.green,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text("Gift", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                            SizedBox(width: 5),
                                            Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                            // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          color: Color(0xffFFFFFF),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                          ))
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 3,
                            thickness: 3,
                            color: Color(0xffF2F6F9),
                            // color: Colors.pink,
                          ),
                          widget.isExpanded6? Container(
                            // color: Colors.red,
                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: drawerdrop.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index){
                                      return  InkWell(
                                        onTap: (){
                                          // Get.to(AssesmentForm(grade: "1"));
                                          // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                          showCustomSnackBar('Sunny');
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          color: Color(0xffF2F6F9),
                                          height: 50,
                                          width: Get.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "${drawerdrop[index]}",
                                              style: TextStyle(
                                                  fontSize: 15.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                ),
                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),


                          /// Bags
                          InkWell(
                            onTap: (){
                              widget.isExpanded7=! widget.isExpanded7;
                              setState(() {
                              });
                            },
                            child: Container(
                              height: 130,
                              // color: Colors.green,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            Text("Bags", style: titl.copyWith(fontWeight: FontWeight.w100,color: Colors.black54, fontSize: 20),),
                                            SizedBox(width: 5),
                                            Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,),
                                            // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                          ],
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                          color: Color(0xffFFFFFF),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
                                          ))
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 3,
                            thickness: 3,
                            color: Color(0xffF2F6F9),
                            // color: Colors.pink,
                          ),
                          widget.isExpanded7? Container(
                            // color: Colors.red,
                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: drawerdrop.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index){
                                      return  InkWell(
                                        onTap: (){
                                          // Get.to(AssesmentForm(grade: "1"));
                                          // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
                                          showCustomSnackBar('Sunny');
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          color: Color(0xffF2F6F9),
                                          height: 50,
                                          width: Get.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: Text(
                                              "${drawerdrop[index]}",
                                              style: TextStyle(
                                                  fontSize: 15.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                ),
                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),








                        ],
                      ),


                      Divider(
                        height: 12,
                        thickness: 12,
                        color: Color(0xffF2F6F9),
                        // color: Colors.pink,
                      ),

                      /// My Orders Part
                      Container(
                          color: Color(0xffFFFFFF),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Image.asset(Images.box, height: 22, width: 22,),
                                      ),
                                    ],
                                  )
                              ),

                              Expanded(
                                  flex: 9,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("My Orders", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                        SizedBox(height: 4),
                                        Text("Track or Return", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 10),),

                                      ],
                                    ),
                                  )
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                  )
                              )
                            ],
                          )
                      ),

                      Divider(
                        thickness: 12,
                        color: Color(0xffF2F6F9),
                      ),

                      /// Shipping Part
                      Container(
                          color: Color(0xffFFFFFF),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Image.asset(Images.bd, height: 25, width: 25,),
                                      ),
                                    ],
                                  )
                              ),

                              Expanded(
                                  flex: 9,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Shipping to", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                        SizedBox(height: 4),
                                        Text("BD", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 12),),

                                      ],
                                    ),
                                  )
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Image.asset(Images.drop, height: 22, color: Colors.black,),
                                  )
                              )
                            ],
                          )
                      ),
                      Divider(
                        thickness: 30,
                        height: 30,
                        color: Color(0xffF2F6F9),
                      ),


                      Container(
                          color: Color(0xffFFFFFF),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Image.asset(Images.language, height: 22, width: 22,),
                                      ),
                                    ],
                                  )
                              ),

                              Expanded(
                                  flex: 9,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Change language", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 14.5),),
                                        SizedBox(height: 4),
                                        Text("Bangla", style: robotoRegular.copyWith( fontWeight: FontWeight.w200, fontSize: 10),),

                                      ],
                                    ),
                                  )
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                                  )
                              )
                            ],
                          )
                      ),
                      Divider(
                        height: 15,
                        thickness: 15,
                        color: Color(0xffF2F6F9),
                      ),

                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Image.asset(Images.info, color: Colors.black87, height: 25, width: 25,),
                                  ),
                                ],
                              )
                          ),

                          Expanded(
                              flex: 11,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text("Need Help?", style: robotoMedium.copyWith( fontWeight: FontWeight.w400, fontSize: 18),),
                                    SizedBox(height: 6),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text("If you need to speak to one of our customer care representative,kindly reach out to us on 01631375174 or send an email to mdyiaz@gmail.com  we are availavle between 10am - 10pm",
                                        // textAlign: TextAlign.justify,
                                        style: robotoRegular.copyWith(color: Colors.black54, fontSize: 12.5),),
                                    ),

                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                    height: Get.height/10.5,
                                    // width: 120,
                                    decoration:  BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xff20243D),
                                        ),
                                        // color: Colors.pink,
                                        borderRadius: BorderRadius.circular(8)
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          // Image.asset(Images.facebook),
                                          Icon(Icons.call, color: Colors.black87, size: 25, ),
                                          SizedBox(height: 5),
                                          Text("Call us", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 10),)
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                    height: Get.height/10.5,
                                    // width: 120,
                                    decoration:  BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xff20243D),
                                        ),
                                        borderRadius: BorderRadius.circular(8)
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Image.asset(Images.whatsapp, height: 25, width: 25, color:  Colors.black87,),
                                          // Icon(Icons.call, color: Colors.white, size: 35,),
                                          SizedBox(height: 5),
                                          Text("WhatsApps", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 10),)
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                    height: Get.height/10.5,
                                    // width: 120,
                                    decoration:  BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xff20243D),
                                        ),
                                        // color: Color(0xff20243D),
                                        // color: Colors.pink,
                                        borderRadius: BorderRadius.circular(8)
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Image.asset(Images.email, height: 25, width: 25, color: Colors.black87,),
                                          // Icon(Icons.call, color: Colors.white, size: 35,),
                                          SizedBox(height: 5),
                                          Text("E-mail", style: robotoRegular.copyWith(color: Colors.black87, fontSize: 10),)
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("Frequently Asked Question", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                ),
                              )
                          ),

                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("Shipping Policy", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                ),
                              )
                          ),

                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                              flex: 9,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("Returns & Refunds", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 15),),
                                ),
                              )
                          ),

                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(Icons.arrow_forward_ios, size: 22, color: Colors.black54,),
                              )
                          )
                        ],
                      ),




                      SizedBox(height: 30,)
                    ],
                  ),


                )

            ),
                      ]),
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
