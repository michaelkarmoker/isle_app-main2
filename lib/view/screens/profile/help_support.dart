
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/screens/FAQ/faq_page.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/screens/contact%20us/contact_us.dart';
import 'package:isletestapp/view/screens/profile/shipping_delivery.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpNSupport extends StatefulWidget {
  const HelpNSupport({Key? key}) : super(key: key);

  @override
  State<HelpNSupport> createState() => _UserInfoState();
}

class _UserInfoState extends State<HelpNSupport> {

/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=> Get.find<UserInfoController>().dataInitialize());

  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6F9),
      appBar: AppBar(
        title: Text("Help & Support", style: railway.copyWith(fontSize: 18, color: Colors.black),),
        iconTheme: IconThemeData(color: Color(0xff000000)),
        titleSpacing: 0,
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        elevation: 0,
        leadingWidth: Get.width / 3.5,
        /*   title: Container(
            // color: Colors.red,
              height: 35, width: 100,
              child: Image.asset(Images.logo, height: 35, width: 100)),*/
      ),

      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 0),
            Divider(
              thickness: 5,
              color: Color(0xffF2F6F9),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: (){
                  Get.to(Contactus());
                },
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,30,8,30),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                              Image.asset(Images.whatsapp, height: 30, width: 30, color: Colors.black,),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Contact us", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                  // SizedBox(height: 8),
                                  // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                ],
                              )
                            ],),
                            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                          ],
                        )
                      ],
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: (){
                  // Get.to(FAQ());
                  Get.to(FAQPage());
                },
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,30,8,30),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                              Image.asset(Images.info, height: 30, width: 30, color: Colors.black,),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Frequently asked Questions", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                  // SizedBox(height: 8),
                                  // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                ],
                              )
                            ],),
                            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                          ],
                        )
                      ],
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: (){
                  Get.to(ShippingNDelivery());
                },
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,30,8,30),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                              Image.asset(Images.car, height: 30, width: 30, color: Colors.black,),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Shipping and Delivery", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                  // SizedBox(height: 8),
                                  // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                ],
                              )
                            ],),
                            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                          ],
                        )
                      ],
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: (){
                  // Get.to(LoginRegisterPage());
                },
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,30,8,30),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                              Image.asset(Images.load, height: 30, width: 30, color: Colors.black,),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Online Returns", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                  // SizedBox(height: 8),
                                  // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                ],
                              )
                            ],),
                            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                          ],
                        )
                      ],
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: (){
                  // Get.to(LoginRegisterPage());
                },
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,30,8,30),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                              Image.asset(Images.card, height: 30, width: 30, color: Colors.black,),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Payment", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                  // SizedBox(height: 8),
                                  // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                ],
                              )
                            ],),
                            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                          ],
                        )
                      ],
                    ),
                  ),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}