import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';


class CustomView extends StatelessWidget {
  final String title;
  final String? shortDesc;
  final String desc;
  // final String? image;
  const CustomView({
    super.key, required this.title, required this.desc,  this.shortDesc,
    // this.image,

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
/*          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(300)),
                  border: Border.all(width: 8,color: Colors.white)
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: CustomImageCached(image: "${image}",fit: BoxFit.fill,),
              ),
            ),
          ),
          SizedBox(height: 30),*/

          SizedBox(height: 20),
          Center(
              child: Column(
                children: [
                  title!=null?
                  Text('${title}'.toUpperCase(), style: railwaybold.copyWith(fontSize: 15),)
                  : SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Divider(
                      thickness: 3,
                      color: gold,
                    ),
                  )
                ],
              )),

         shortDesc!=null? SizedBox(height: 20): SizedBox(),
          shortDesc!=null?
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text('${shortDesc}', style: railwaybold.copyWith(fontSize: 13),),
              ),
            ],
          )
          : SizedBox(),
          SizedBox(height: 0),
          desc!=null?
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
                alignment: Alignment.topLeft,
                child: HtmlWidget("${desc}",textStyle: railway.copyWith(fontSize: 12))),)
          : SizedBox(),
        ],
      ),
    );
  }
}
