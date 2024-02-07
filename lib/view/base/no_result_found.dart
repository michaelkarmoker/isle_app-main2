import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';


class NoResultFound extends StatelessWidget {
  final String title;
  final String description;
  const NoResultFound({Key? key,  this.title="No Result Found",  this.description=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Images.result_not_found,height: 100,),
          SizedBox(height: 20,),
          Text("${title}",style: robotoMedium.copyWith(color: Colors.black,fontSize: Dimensions.fontSizeExtraLarge),),
          Text("${description}",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
        ],
      ),
    );
  }
}
