import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/styles.dart';


class BottomNavItemForUniversal extends StatelessWidget {
 // final IconData iconData;
  final String? iconData;
  final String? title;
  final Function()? onTap;

  final double height;
  BottomNavItemForUniversal({ this.iconData, this.onTap,required this.height, this.title});

  @override
  Widget build(BuildContext context) {
    double heightp=height+2;
    return Expanded(
      child: Container(
        // height: 60,
        // color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
           Container(
             height: 35,
             // color: Colors.yellow,
             child: IconButton(
                icon: Image.asset(iconData!, height:height,color:Colors.grey,),//
                // Icon(iconData, color: isSelected ?Color(0xFFDCDCDC):Colors.white, size:isSelected?32:25),
                onPressed: onTap,
              ),
           ),
           Container(
             // color: Colors.teal,
               height: 20,
               child: Text(title!,style: robotoMedium.copyWith(fontSize: 9),))
          ],
        ),
      ),
    );
  }
}
//0xFFDCDCDC