import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/Thank_you_controller/thank_you_controller.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/all_popup/feedback_popup.dart';
import 'package:isletestapp/view/screens/all_popup/product_feedback_popup.dart';
import 'package:isletestapp/view/screens/checkout/track/place_order_track.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/feedback/feedback_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/order%20track/order_track_page.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';

class ThankYou extends StatefulWidget {
  final String? orderNumber;
  // final String? phone;
  // final String? email;
  const ThankYou({Key? key, this.orderNumber,
    // this.phone,
    // this.email
  }) : super(key: key);
  @override
  State<ThankYou> createState() => _WardrobNameState();
}
class _WardrobNameState extends State<ThankYou> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ThankYouController>().getOrderTrackData(id: widget.orderNumber!).then((value) => Get.find<ThankYouController>().getGeneralSettingData());
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThankYouController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: UniversalBottomNav(),
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xff000000)),
            titleSpacing: 0,
            backgroundColor: Color(0xffFFFFFF),
            centerTitle: true,
            elevation: 0,
            leadingWidth: Get.width / 3.5,
            toolbarHeight: 62,
            title: CustomLogo(),
          ),
          body: SingleChildScrollView(
              child:
              // controller.orderTrackresponse==""?
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.green,
                      child: Image.asset(Images.thank, height: 200,)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Your Order Number is: ",
                                    textAlign: TextAlign.center,
                                    style: railwaybold.copyWith(fontSize: 14,  fontWeight: FontWeight.w400,),),
                                  Text("${widget.orderNumber}",
                                    textAlign: TextAlign.center,
                                    style: poppins.copyWith(fontSize: 13,  color: gold, fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("Your order Delivery Type",
                                textAlign: TextAlign.center,
                                style: railwaybold.copyWith(fontSize: 14,),),
                              SizedBox(height: 8),
                              ListView.builder(
                                  itemCount: controller.placeOrderTrackResponse?.data?.length??0,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // Text("Seller Name: ",
                                        Text("Seller Name: ${controller.placeOrderTrackResponse?.data?[index]?.vendor?.name??""}",
                                          textAlign: TextAlign.center,
                                          style: railwaybold.copyWith(fontSize: 11,  ),),
                                        SizedBox(height: 4),
                                        // Text("Delivery Type: ",
                                        Text("Delivery Type: ${controller.placeOrderTrackResponse?.data?[index]?.deliveryType?.name??""}",
                                          textAlign: TextAlign.center,
                                          style: railwaybold.copyWith(fontSize: 11,  ),),
                                        SizedBox(height: 5),
                                      ],
                                    );
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                    child: Text("We'll get started your order right away",
                      textAlign: TextAlign.center,
                      style: railway.copyWith(fontSize: 14,  fontWeight: FontWeight.w400,),),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                    child: Text("You should be receiving an order confirmation Email/SMS shortly.",
                      textAlign: TextAlign.center,
                      style: railway.copyWith(fontSize: 14,  fontWeight: FontWeight.w400,),),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                    child: Text("If you have any question call us at ${controller.generalSettingResponse?.data?.phone??""}",
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(fontSize: 13,  fontWeight: FontWeight.w300, color: Colors.black87),),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                    child: Text("Email: ${controller.generalSettingResponse?.data?.email??""}",
                      textAlign: TextAlign.center,
                      style: railway.copyWith(fontSize: 14,  fontWeight: FontWeight.w400,),),
                  ),

                  SizedBox(height: 40),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButton(
                        height: 45,
                        width: Get.width / 1,
                        buttoncolor: gold,
                        color: Colors.white,
                        buttontextcolor: Colors.white,
                        radius: 0,
                        fontSize: 12.5,
                        onPressed: () {
                          Get.to(PlaceOrderTrack(orderNumber: widget.orderNumber!,));
                        },
                        buttonText: "Track your Order".toUpperCase()),
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButton(
                        height: 45,
                        width: Get.width / 1,
                        buttoncolor: gold,
                        color: Colors.white,
                        buttontextcolor: Colors.white,
                        radius: 0,
                        fontSize: 12.5,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (
                                BuildContext context) {
                              return ProductFeedbackPopup();
                              // return FeedbackPopup(id: controller.productDetailsResponse!.data!.id!,);
                            },
                          );
                          /*        Get.to(
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FeedbackScreen();
                                  },
                                ),
                                fullscreenDialog: true
                            );*/
                        },
                        buttonText: "Share Your Feedback".toUpperCase()),
                  ),

                  SizedBox(height: 50),

                ],
              )
            // : SizedBox(),
          ),
        );
      }
    );
  }
}
