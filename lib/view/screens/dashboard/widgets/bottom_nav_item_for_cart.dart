import 'package:flutter/material.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/styles.dart';

import 'cart_widget.dart';



class BottomNavItemForCart extends StatelessWidget {
 // final IconData iconData;
  final String iconData;
  final String? title;
  final Function() onTap;
  final bool isSelected;
  final double height;

  BottomNavItemForCart({required this.iconData,required this.onTap, this.isSelected = false,required this.height, this.title,});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            // height: height+20,
            height: height+15,
            child: IconButton(
              icon: CartWidget(color: isSelected?gold:Colors.grey,size:height, ),//
              // Icon(iconData, color: isSelected ?Color(0xFFDCDCDC):Colors.white, size:isSelected?32:25),
              onPressed: onTap,
            ),
          ),
          InkWell(
              onTap: onTap,
              child: Text(title!,style: railwaybold.copyWith(fontSize: 9),))

        ],
      ),
    );
  }
}
//0xFFDCDCDC
