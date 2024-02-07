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
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackPopup extends StatefulWidget {
  FeedbackPopup({
    Key? key,
  }) : super(key: key);
  @override
  State<FeedbackPopup> createState() => _ProductReviewPopupState();
}
class _ProductReviewPopupState extends State<FeedbackPopup> {
TextEditingController smsCtr = TextEditingController();
FocusNode smsFcs = FocusNode();
int selectedRating = 0;

/*  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductListController>().ProductDetailsReview(widget.id.toString());
    }
    );
  }*/
/*
  @override
  void dispose() {
    Get.find<ProductDetailsController>().dataClearForRating();
    super.dispose();
  }
*/

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
                    trailing: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                  ),
                  SizedBox(height: 0),
                  Text("We would love to hear your thoughts",style: railwaybold.copyWith(fontWeight: FontWeight.bold, fontSize: 15),),
                  SizedBox(height: 8),
                  Text("How is your experience with ISLE",style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 11),),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedRating = index + 1;
                            });
                          },
                          child: Icon(
                            Icons.star,
                            color: index < selectedRating ? gold : Colors.grey, // Change color based on selection
                            size: 30,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("We value your honest feedback, Tell us more below:",style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 11),),
                  SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      controller: smsCtr,
                      focusNode: smsFcs,
                      title: "",
                    minLines: 4,
                    maxLines: 4,
                    height: 120,
                      hintText: "Please Add your Feedback here",
                    ),
                  ),

                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        if (selectedRating > 0) {
                          String customerID = await Get.find<AuthController>().getUserId();
                          controller.createFeedback(
                            message: smsCtr.text,
                            customer_id: customerID,
                            rating: selectedRating.toString(),
                          );
                        } else {
                         showCustomSnackBar("Enter Your Valuable text", isError: false, isPosition:  false);
                        }
                      },
                      buttonText: "Submit".toUpperCase(),
                      buttoncolor: Colors.black,
                      buttontextcolor: Colors.white,
                      fontSize: 12,
                      radius: 0,
                    ),
                  ),
                  SizedBox(height: 8),

                ]
            ),
          );
        }
    );
  }







}
