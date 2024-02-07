import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';


class CustomAlerDialogForPermission extends StatelessWidget {
  final String title;
  final String? iconString;
  final String description;
  final String yesBtnText;
  final String noBtnText;
  final bool isError;
  final Function() yesBtntap;
  final Function() noBtntap;
  const CustomAlerDialogForPermission({Key? key, required this.title,
    required this.yesBtntap, required this.yesBtnText,
    required this.noBtnText, this.description=" ",
    this.isError=false, required this.noBtntap,  this.iconString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20,),
            iconString!=null?Image.asset(iconString!,height: 35,width: 35,):
            Image.asset(isError?Images.error:Images.confirmicon,height: 40,width: 40,),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('${title}',textAlign:TextAlign.center,style: railway.copyWith(color:isError?Colors.black:Colors.black,fontSize: Dimensions.fontSizeLarge))),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text('${description}',textAlign:TextAlign.center,style: railway.copyWith(fontSize: Dimensions.fontSizeLarge))),

                ],
              ),
            ),
            SizedBox(height: 10,),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                  decoration: BoxDecoration(
                    color: gold,
                    border: Border(
                      top: BorderSide( //
                        color: Colors.black12,
                        width: 1.5,
                      ),
                    ),
                  ),
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: yesBtntap,
                      child: Container(
                        padding: EdgeInsets.all(5),
                          width: Get.width,
                          child: Text("${yesBtnText}",textAlign:TextAlign.center,
                            style: railwaybold.copyWith(fontSize: 13,
                                color: Colors.white),)),),
                  ),
                ),
SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: Container(

                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                     border: Border(
                        left: BorderSide( //                   <--- right side
                          color: Colors.black12,
                          width: 1.5,
                        ),
                       top: BorderSide( //                   <--- right side
                         color: Colors.black12,
                         width: 1.5,
                       ),
                    ),
                    ),
                    child: InkWell(
                       onTap: noBtntap,
                      /*onTap:(){
                        noBtntap;
                        Get.back();
                      }*/
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: Get.width,
                          child: Text("${noBtnText}",textAlign:TextAlign.center,
                            style: railwaybold.copyWith(fontSize: 13,
                                color: Colors.white,),)),),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
