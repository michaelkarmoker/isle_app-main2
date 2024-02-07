import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';


class CustomPopUp extends StatelessWidget {
 final String title;
  const CustomPopUp({super.key, required this.title,});
  // const CustomPopUp({super.key,  this.title="Exam Time is Over.",});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)),
      insetPadding: EdgeInsets.all(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10,top: 10),
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () {
                    Get.back();
                    // Get.back();
                  },
                  child: Image.asset(Images.error,height: 20,width: 20,)),
            ) ,
            // SizedBox(height: 10),
            Text('Messages',style: robotoBlack.copyWith(fontSize: 20)),
            SizedBox(height: 0),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Image.asset(Images.nodata,
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 10,bottom: 12),
                  child: Text('${title}',
                    textAlign: TextAlign.center,
                    style: robotoMedium.copyWith(fontSize: 15, color: Colors.red),),
                ),
              ],
            ),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
