
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/html_tag_remover.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String desc;

  const CustomDialog({super.key, required this.title, required this.desc,});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2)),
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text( title,style: railwaybold.copyWith(fontSize: 20)),
            ),
            // SizedBox(height: 20),
        /*    Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Image.asset(Images.notification,
              height: 60,
                width: 60,
              ),
            ),
            SizedBox(height: 15
            ),*/
        /*    Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,bottom: 12),
                    child: Text('${title}',
                        textAlign: TextAlign.center,
                      style: railway.copyWith(fontSize: 14),),
                  ),
                ),
              ],
            ),*/

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 12,bottom: 8),
                    child:   Text('${
                        HtmlTags.removeTag(
                          htmlString: "${desc}",
                        )
                    }',
                      style: poppins.copyWith(fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
