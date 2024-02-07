import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/design%20backup/search_sunny.dart';
import 'package:isletestapp/view/screens/wardrob/wardrob_name.dart';

class ChooseWardrobe extends StatefulWidget {
  const ChooseWardrobe({Key? key}) : super(key: key);

  @override
  State<ChooseWardrobe> createState() => _WardrobNameState();
}

class _WardrobNameState extends State<ChooseWardrobe> {
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  bool isExpanded5 = false;
  bool isExpanded6 = false;
  bool isExpanded7 = false;
  bool isExpandedSize = false;

  bool childexp1 = false;
  bool childexp2 = false;
  bool childexp3 = false;
  bool childexp4 = false;
  bool childexp5 = false;
  bool childexp6 = false;



  TextEditingController wardrobCtr = TextEditingController();
  FocusNode wardrobFcs = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      builder: (controller) {
        return Scaffold(
          // backgroundColor: Color(0xffF2F6F9),
          backgroundColor: Color(0xffFFFFFF),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            elevation: 5,
            notchMargin: 5,
            shape: CircularNotchedRectangle(),

            // margin: EdgeInsets.zero,
            // elevation: 10,
            child: Container(
              // color: Colors.red,
              height: Get.height/7.5,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
             Text("0 items selected", style: poppins.copyWith(color: Colors.grey.shade600, fontSize: 10),),
                      SizedBox(height: 4),
                      CustomButton(
                          height: 45,
                          width: Get.width / 1.05,
                          buttoncolor: gold,
                          color: Colors.white,
                          buttontextcolor: Colors.white,
                          radius: 0,
                          fontSize: 12.5,
                          onPressed: () {
                            Get.to(WardrobNameList());
                          },
                          buttonText: "Add to Wardrobe".toUpperCase()),
                      SizedBox(height: 10),
             Text("I will do it lated".toUpperCase(), style: poppins.copyWith(decoration: TextDecoration.underline,color: Colors.black, fontSize: 9.5),),
                ]),
              ),
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xff000000)),
            titleSpacing: 0,
            backgroundColor: Color(0xffFFFFFF),
            centerTitle: true,
            elevation: 0,
            leadingWidth: Get.width / 3.5,
          title: Text("Add items My Wardrobe...",  style: railway.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height:  180,
                    // color: Colors.green,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(Icons.check_box_outline_blank, size: 25,  color: Colors.black54,),
                              // child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                            )
                        ),
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        // color: Color(0xffFFFFFF),
                                        // color: Colors.pink,
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                bottom: 8),
                                            child: Image.network(
                                              "https://ounass-qa.atgcdn.ae/small_light(dw=260,of=webp)/pub/media/catalog/product//2/1/216449461_wht_in.jpg?1695147570.8135",
                                              fit: BoxFit.fill,
                                              height:
                                              Get.height / 5.5,
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 0,
                                        // left: 15,
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              /// orginal color
                                              // color: Color(0xffF2F2F2),
                                              color: Colors.grey.shade300,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8, right: 8, top: 2.5, bottom: 2.5),
                                                child: Text(
                                                  "New Season".toUpperCase(),
                                                  style: robotoRegular.copyWith(color: Colors.black, fontSize: 8.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ],
                            )),

                        Expanded(
                            flex: 5,
                            child: Container(
                              // color: Colors.cyan,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 12),
                                  Text(
                                    "KITH",
                                    style: railway.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontSize: 14),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Novelty Gator Graphic T-shirt in Cott...",
                                    overflow: TextOverflow.ellipsis,
                                    style: railway.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                        fontSize: 12),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "570 BDT",
                                    style: railway.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: gold,
                                        fontSize: 12),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(padding: const EdgeInsets.only(right: 8),
                                    child:  MyTextField(
                                      controller: wardrobCtr,
                                      focusNode: wardrobFcs,
                                      title: "SIZE",
                                      hintText: "XXL",
                                      hinttextcolor: Colors.grey.shade600,
                                      titlesize: 12,
                                      // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                                      myfontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Divider(height: 8, thickness: 8, color: Color(0xffF2F6F9),),



                ],
              );
            },
          ),
        );
      }
    );
  }
}
