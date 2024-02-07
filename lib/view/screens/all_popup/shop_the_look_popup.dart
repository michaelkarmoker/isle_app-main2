import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import 'package:isletestapp/view/screens/all_popup/size_guide_popup.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';


class PopupShopTheLokSize extends StatefulWidget {
  @override
  State<PopupShopTheLokSize> createState() => _SimilarPopupState();
}

class _SimilarPopupState extends State<PopupShopTheLokSize> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // You can customize the content of the bottom sheet here
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          SizedBox(height: 15),
          Container(
            // color: Colors.yellow,
            height: 42,
            child: ListTile(

         title:   Text.rich(
                  TextSpan(
                      text: 'Select Size',
                      style: railway.copyWith(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.w600),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '',
                          style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w500),
                        )
                      ]
                  )
              ),

             // title: Text('Select Size', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.w600),),
              trailing: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Text("Done".toUpperCase(), style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
              onTap: () {
                // Add functionality for sharing
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 0),
          Container(
            // color: Colors.pinkAccent,
            height: 42,
            child: ListTile(
              title:   Text.rich(
                  TextSpan(
                      text: 'Size: '.toUpperCase(),
                      style: railway.copyWith(color: Colors.grey.shade600 ,fontSize: 12, fontWeight: FontWeight.w600),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'EU',
                          style: railway.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
                        )
                      ]
                  )
              ),

              // title: Text('Select Size', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.w600),),
              trailing: InkWell(
                  onTap: () {
                    Get.to(
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return FractionallySizedBox(
                              // heightFactor: 0.5,
                              child: PopupSizeGuide(sizedimage: '',),
                            );
                          },
                        ),
                        fullscreenDialog: true
                    );

                  },
                  child: Text("Size Guide".toUpperCase(), style: railway.copyWith(fontSize: 12, color: gold, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
              onTap: () {
                // Add functionality for sharing
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              // color: Colors.pinkAccent,
              height: 50,
              child:
              Row(
mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // itemCount: brandlist.length,
                      itemCount: sizelist.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Container(
                                width: 50,
                                height: 42,
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                child: Center(
                                    child: Text(
                                      '${sizelist[index]}',
                                      style: robotoMedium.copyWith(fontSize: 11),
                                    )),
                                decoration: BoxDecoration(
                                  // color: Colors.yellow[100],
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.4,
                                    )),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: CustomButton(
                height: 35,
                width: Get.width,
                buttoncolor: gold,
                color: Colors.white,
                buttontextcolor: Colors.white,
                radius: 0,
                fontSize: 12,
                onPressed: () {
                  Get.to(BagPage());
                },
                buttonText: "Add to Bag".toUpperCase()),
          ),
          SizedBox(height:15),

          Padding(
            padding: const EdgeInsets.only(left: 25, right: 8),
            child: Row(
              children: [
                Image.asset(Images.car2, color: Colors.black, height: 25, width: 25,),
                SizedBox(width: 15),
                Text.rich(
                    TextSpan(
                        text: 'Shipping from UAE. ',
                        style: railway.copyWith(color: Colors.black ,fontSize: 11, fontWeight: FontWeight.w600),
                        children: <InlineSpan>[
                          TextSpan(
                            text: '2- hour and same-day delivery to ',
                            style: railway.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'BD.',
                            style: railway.copyWith(fontSize: 11, color: gold, decoration: TextDecoration.underline, fontWeight: FontWeight.w500),
                          )
                        ]
                    )
                )
              ],
            ),
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }
}
