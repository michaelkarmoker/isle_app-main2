import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductReviewPopup extends StatefulWidget {
  final int id;
  ProductReviewPopup({
    Key? key, required this.id,
  }) : super(key: key);
  @override
  State<ProductReviewPopup> createState() => _ProductReviewPopupState();
}
class _ProductReviewPopupState extends State<ProductReviewPopup> {

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().ProductDetailsReview(widget.id.toString());
    }
    );
  }
  @override
  void dispose() {
    Get.find<ProductDetailsController>().dataClearForRating();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return Container(
            // You can customize the content of the bottom sheet here
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Ratings', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
                    trailing: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                    onTap: () {
                      // Add functionality for sharing
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 0),
                  controller.productDetailsFeedbackResponse == null?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("0.0",style: poppins.copyWith(fontWeight: FontWeight.bold, fontSize: 35),),
                      SizedBox(width: 2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Icon(Icons.star, color: gold, size: 30,),
                      )
                    ],
                  ) :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${controller.productDetailsFeedbackResponse!.data!.retingPercentage??"0.0"}",
                      style: poppins.copyWith(fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      SizedBox(width: 2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Icon(Icons.star, color: gold, size: 30,),
                      )
                    ],
                  ),
                  SizedBox(height: 0),
                  controller.productDetailsFeedbackResponse!=null?
                  Text("${controller.productDetailsFeedbackResponse!.data!.totalRatingCount??""} Total rating")
                      : Text("0 Total rating"),
                  SizedBox(height: 15),
                  Text("Average", style: railwaybold.copyWith(
                    fontSize: 16,
                  ),),
                  SizedBox(height: 0),

                  controller.productDetailsFeedbackResponse!=null? controller.productDetailsFeedbackResponse!.data!.feedback!.length>0?
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    itemCount: controller.productDetailsFeedbackResponse!.data!.feedback!.length??0,
                    itemBuilder:  (BuildContext context, int index) {
                      return Container(
                        // color: Colors.deepPurpleAccent,
                        // color: const Color(0xffFAFBFB),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating == 5 ?
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(
                                    // color: Colors.yellowAccent,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating??""}", style: railwaybold.copyWith(
                                            fontSize: 14,
                                          ),),
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          flex: 5,
                                          child: Divider(color: Colors.green, height: 5, thickness: 5,),
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          flex: 1,
                                          child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.ratingCount??""}", style: railwaybold.copyWith(
                                            fontSize: 14,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            :SizedBox(),
                            SizedBox(height: 8),
                            controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating == 4 ?
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                // color: Colors.yellowAccent,
                                height: 26,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating??"0"}", style: railwaybold.copyWith(
                                          fontSize: 16,
                                        ),),
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 6,
                                        child: Divider(color: Colors.green, height: 7, thickness: 7,)),
                                            Expanded(
                                                flex: 1,
                                                child: Divider(color: silvercolor, height: 7, thickness: 7,)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.ratingCount??"0"}", style: railwaybold.copyWith(
                                          fontSize: 16,
                                        ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                :SizedBox(),
                            SizedBox(height: 8),
                            controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating == 3 ?
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                // color: Colors.yellowAccent,
                                height: 26,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating??"0"}", style: railwaybold.copyWith(
                                          fontSize: 16,
                                        ),),
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Divider(color: Colors.green, height: 7, thickness: 7,)),
                                            Expanded(
                                                flex: 2,
                                                child: Divider(color: silvercolor, height: 7, thickness: 7,)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.ratingCount??"0"}", style: railwaybold.copyWith(
                                          fontSize: 16,
                                        ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                :SizedBox(),
                            SizedBox(height: 8),
                            controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating == 2 ?
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                // color: Colors.yellowAccent,
                                height: 26,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating??"0"}", style: railwaybold.copyWith(
                                          fontSize: 16,
                                        ),),
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: Divider(color: Colors.green, height: 7, thickness: 7,)),
                                            Expanded(
                                                flex: 3,
                                                child: Divider(color: silvercolor, height: 7, thickness: 7,)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.ratingCount??"0"}", style: railwaybold.copyWith(
                                          fontSize: 16,
                                        ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                :SizedBox(),
                            SizedBox(height: 8),
                            controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating == 1 ?
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                // color: Colors.yellowAccent,
                                height: 26,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.rating??"0"}", style: railwaybold.copyWith(
                                          fontSize: 16,
                                        ),),
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Divider(color: Colors.green, height: 7, thickness: 7,)),
                                            Expanded(
                                                flex: 4,
                                                child: Divider(color: silvercolor, height: 7, thickness: 7,)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text("${controller.productDetailsFeedbackResponse!.data!.feedback![index]!.ratingCount??"0"}", style: railwaybold.copyWith(
                                          fontSize: 16,
                                        ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                :SizedBox(),
                          ],
                        ),
                      );
                    },
                  )
                      : SizedBox() : SizedBox(),

                  SizedBox(height: 50),

     ]
            ),
          )
          );
        }
    );
  }







}
