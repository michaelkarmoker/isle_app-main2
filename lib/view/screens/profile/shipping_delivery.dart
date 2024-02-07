import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/my_text_field.dart';

class ShippingNDelivery extends StatefulWidget {
  ShippingNDelivery({Key? key}) : super(key: key);
  bool isExpanded1=false;
  bool isExpanded2=false;
  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;
  bool isExpanded6=false;
  bool isExpanded7=false;


  bool childexp1=false;
  bool childexp2=false;
  bool childexp3=false;
  bool childexp4=false;
  bool childexp5=false;
  bool childexp6=false;
  @override
  State<ShippingNDelivery> createState() => _FAQState();
}

class _FAQState extends State<ShippingNDelivery> {

  // int selectedLanguage=Get.find<LocalizationController>().selectedLanguage;

/*  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback(
            (_) => Get.find<FAQController>().dataInitialize());
    super.initState();
  }*/


  bool q1=false;
  bool q2=false;
  bool q3=false;
  bool q4=false;
  bool q5=false;
  bool q6=false;
  @override
  Widget build(BuildContext context) {
    // return GetBuilder<FAQController>(
    //   builder: (controller) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6F9),
      appBar: AppBar(
        title: Text("Shipping & Delivery", style: railway.copyWith(fontSize: 18, color: Colors.black),),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 10,
                color: Color(0xffF2F6F9),
              ),
              Text(
                "Order Delivery".toUpperCase(),
                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),

              Text(
               "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words,",
                style: railway.copyWith(fontSize: 13, height: 1.5),
              ),





              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
    //   }
    // );
  }
}
