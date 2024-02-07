import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/my_text_field.dart';


class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _InfoPopupState();
}

class _InfoPopupState extends State<FeedbackScreen> {
  TextEditingController feedbackCtr = TextEditingController();
  FocusNode feedbackFcs = FocusNode();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // You can customize the content of the bottom sheet here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0 , 0, 4, 0),
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      // color: Colors.yellow,
                      height: 40,
                      width: 40,
                      child: Icon(Icons.close, color: Colors.black54,),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text("We would love to hear your thoughts",
              // textAlign: TextAlign.center,
              style: railway.copyWith(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),
            Text("How is your experience with ISLE",
              // textAlign: TextAlign.center,
              style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: gold, size: 30,),
                SizedBox(width: 4),
                Icon(Icons.star, color: gold,size: 30,),
                SizedBox(width: 4),
                Icon(Icons.star, color: gold,size: 30,),
                SizedBox(width: 4),
                Icon(Icons.star_border, color: silvercolor,size: 30,),
                SizedBox(width: 4),
                Icon(Icons.star_border, color: silvercolor,size: 30,),
              ],
            ),
            SizedBox(height: 30),
            Text("We value your honest feedback, Tell us more below:",
              // textAlign: TextAlign.center,
              style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomOnlyTextFieldWithBorder(
                controller: feedbackCtr,
                focusNode: feedbackFcs,
                maxLines: 8,
                minLines: 5,
                height: 100,
                hintText: "Please add your feedback here",
              ),
            ),


            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20 , 0, 20, 0),
              child: CustomButton(
                  height: 45,
                  width: Get.width ,
                  buttoncolor: gold,
                  color: Colors.white,
                  buttontextcolor: Colors.white,
                  radius: 0,
                  fontSize: 11,
                  onPressed: () {
                    Get.back();
                  },
                  buttonText: "Submit".toUpperCase()),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
