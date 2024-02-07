
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';

class CustomProgramDialog extends StatelessWidget {
  final String title;
  final String desc;

  const CustomProgramDialog({super.key, required this.title, required this.desc,});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
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
                  },
                  child: Image.asset(Images.error,height: 20,width: 20,)),
            ) ,
            // SizedBox(height: 10),
            Text('Notifications',style: railwaybold.copyWith(fontSize: 22)),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Image.asset(Images.notification,
              height: 40,
                width: 40,
              ),
            ),
            SizedBox(height: 15
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,bottom: 12),
                    child: Text('${title}',
                        textAlign: TextAlign.center,
                      style: railwaybold.copyWith(fontSize: 16),),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                    child: Text('${desc}',
                        textAlign: TextAlign.center,
                        style: robotoRegular.copyWith(fontSize:12,color: Colors.black),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
