


import 'package:flutter/material.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? myfontweight;
  final double radius;
  final Color? buttoncolor;
  final Color? buttontextcolor;
  final Color? color;
  final IconData? icon;

  CustomButton({
    required this.onPressed,
    this.color,
    required this.buttonText,
    this.margin,
    this.width,
    this.height,
    this.buttoncolor,
    this.buttontextcolor,
    this.fontSize,
    this.myfontweight,
    this.radius=5,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {


    return Center(child: SizedBox(width: width != null ? width : Dimensions.WEB_MAX_WIDTH,height: height!=null?height:Dimensions.BUTTON_HEIGHT,
        child:Container(
      decoration:  BoxDecoration(
          color:buttoncolor??Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(radius))
      ),
        child:Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onPressed,
              child: Center(
                child: Text(buttonText,style: railway.copyWith(color: buttontextcolor,fontWeight: myfontweight,fontSize: fontSize??Dimensions.fontSizeExtraLarge),)),
              )),
        )
    ));
  }
}
