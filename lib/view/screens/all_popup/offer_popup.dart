import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';


class OfferPopup extends StatefulWidget {
  @override
  State<OfferPopup> createState() => _InfoPopupState();
}

class _InfoPopupState extends State<OfferPopup> {
  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Container(
        // You can customize the content of the bottom sheet here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      // color: Colors.pinkAccent,
                      height: 30,
                        width: 50,
                        alignment: Alignment.bottomRight,
                        child: Text("Close", style: railway.copyWith(decoration: TextDecoration.underline, fontSize: 12),)),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Image.asset(Images.tick,
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Our Price Match",
                // textAlign: TextAlign.center,
                style: railway.copyWith(height: 1.5,color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Your Best Buy Every Time".toUpperCase(),
                // textAlign: TextAlign.center,
                style: railway.copyWith(height: 1.5,color: gold, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                // textAlign: TextAlign.center,
                style: railway.copyWith(height: 1.5,color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Find out more",
                // textAlign: TextAlign.center,
                style: railway.copyWith(height: 1.5,color: Colors.black, fontSize: 11, fontWeight: FontWeight.w200, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 20),
Divider(color: Colors.grey,
height: 5,thickness: 0.5,),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Already Made your Purchase?",
                // textAlign: TextAlign.center,
                style: railway.copyWith(height: 1.5,color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                // textAlign: TextAlign.center,
                style: railway.copyWith(height: 1.5,color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("Contact Us",
                // textAlign: TextAlign.center,
                style: railway.copyWith(height: 1.5,color: Colors.black, fontSize: 11, fontWeight: FontWeight.w200, decoration: TextDecoration.underline),
              ),
            ),

            SizedBox(height: 30,),
          ],
        ),
    ),
      );
  }
}
