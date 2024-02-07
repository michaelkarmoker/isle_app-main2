import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';


class IsLoginPopUp extends StatelessWidget {
     final Function() btnfn;
  const IsLoginPopUp({super.key, required this.btnfn,});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
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
            Text('Messages',style: robotoBlack.copyWith(fontSize: 20)),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Image.asset(Images.notification,
                height: 60,
                width: 60,
              ),
            ),
            SizedBox(height: 15
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 10,bottom: 12),
                  child: Text('Login First and Try Again?',
                    textAlign: TextAlign.center,
                    style: robotoMedium.copyWith(fontSize: 14),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8,bottom: 12),
                  child: Container(
                    height: 25,
                    // width: 100,
                    child: ElevatedButton(
                        onPressed: btnfn,
                        child: Text('Signin', style: acme.copyWith(color: Colors.white, fontSize: 11.5),)
                    ),),
                ),
              ],
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
