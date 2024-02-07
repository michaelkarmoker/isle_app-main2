import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/FAQ/faq_page.dart';
import 'package:isletestapp/view/screens/multi%20screen/multi_screen_design.dart';
import 'package:isletestapp/view/screens/profile/faq.dart';
import 'package:url_launcher/url_launcher.dart';


class InfoPopup extends StatefulWidget {
  @override
  State<InfoPopup> createState() => _InfoPopupState();
}

class _InfoPopupState extends State<InfoPopup> {
  @override
  Widget build(BuildContext context) {
      return GetBuilder<MainPageController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
            // You can customize the content of the bottom sheet here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 8),
                ListTile(
                  title: Text('Need Help?', style: railway.copyWith(fontSize: 22, fontWeight: FontWeight.bold),),
                  trailing: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("If you need to speak to one of our customer care representative,kindly reach out to us on ${Get.find<MainPageController>().generalSettingResponse?.data?.phone??""} or send an email to ${Get.find<MainPageController>().generalSettingResponse?.data?.email??""}  we are availavle between 10am - 10pm",
   // textAlign: TextAlign.center,
    style: poppins.copyWith(height: 1.5,color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              print(controller.generalSettingResponse?.data?.phone??"");
                              launchUrl(Uri.parse("tel:${controller.generalSettingResponse?.data?.phone??""}"));
                            },
                            child: Container(
                                height: Get.height/10,
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
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Image.asset(Images.facebook),
                                      Icon(Icons.call, color: Colors.black87, size: 30, ),
                                      SizedBox(height: 5),
                                      Text("Call".toUpperCase(), style: robotoRegular.copyWith(color: Colors.black87,fontSize: 10),)
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              AppConstants.launchUrls(urls: "https://api.whatsapp.com/send?phone="+"${controller.generalSettingResponse?.data?.phone??""}");
                              // AppConstants.launchUrls(urls: "${Get.find<MainPageController>().generalSettingResponse?.data?.phone??""}" );
                              // AppConstants.launchUrls(urls: "https://web.whatsapp.com/" );
                            },
                            child: Container(
                                height: Get.height/10,
                                // width: 120,
                                decoration:  BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff20243D),
                                    ),
                                    borderRadius: BorderRadius.circular(8)
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(Images.whatsapp, height: 30, width: 30, color:  Colors.black87,),
                                      // Icon(Icons.call, color: Colors.white, size: 35,),
                                      SizedBox(height: 5),
                                      Text("WhatsApps", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 10),)
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              AppConstants.launchUrlsemail(urls: "${controller.generalSettingResponse?.data?.email??""}");
                            },
                            child: Container(
                                height: Get.height/10,
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
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(Images.email, height: 30, width: 30, color: Colors.black87,),
                                      // Icon(Icons.call, color: Colors.white, size: 35,),
                                      SizedBox(height: 5),
                                      Text("E-mail", style: robotoRegular.copyWith(color: Colors.black87, fontSize: 10),)
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                InkWell(
                  onTap: () {
                    Get.to(FAQPage());
                  },
                  child: Row(
                    children: [
                      Expanded(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Frequently Asked Question", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 13),),
                            ),
                          )
                      ),

                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54,),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),

                InkWell(
                  onTap: (){
                    Get.to(MultiScreen(title: "Privacy & Cookies Policy", page: AppConstants.PRIVECY));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Privacy & Cookies Policy", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 13),),
                            ),
                          )
                      ),

                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54,),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),

                InkWell(
                  onTap: (){
                    Get.to(MultiScreen(title: "Returns & Refunds", page: AppConstants.RETURN));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Returns & Refunds", style: robotoMedium.copyWith( fontWeight: FontWeight.w600, fontSize: 13),),
                            ),
                          )
                      ),

                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54,),
                          )
                      )
                    ],
                  ),
                ),


                SizedBox(height: 30,)
              ],
            ),
    ),
          );
        }
      );
  }
}
