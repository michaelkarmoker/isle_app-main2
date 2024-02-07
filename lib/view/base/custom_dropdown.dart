import 'package:flutter/material.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';

class CustomDropDown extends StatelessWidget {
  final String text;
  final String? title;
  final bool isRequired;
  final double? titlesize;
  final double? selectfontsize;
  final Color? hinttextcolor;
  final FontWeight? myfontWeight;
  CustomDropDown({Key? key,
    required this.text,
     this.title,
    this.isRequired=false,
    this.titlesize,
    this.hinttextcolor= null,
    this.myfontWeight=null,
    this.selectfontsize,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    /*    Row(
          children: [
            Text(title,style: railway.copyWith(fontSize: 13),),

          ],
        ),*/
        Container(
          child: isRequired?Text.rich(
            TextSpan(
              children: [
                TextSpan(text: title!,style: railway.copyWith(fontSize: titlesize, color: Colors.black87)),
                TextSpan(
                  text: '*',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                ),

              ],
            ),
          ) : SizedBox()),
              // :Text(title!,textAlign:TextAlign.left,style: robotoMedium.copyWith(color: hinttextcolor ,fontSize: titlesize, fontWeight: myfontWeight),),),
        SizedBox(height: 0,),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              border: Border.all(width: 1,color: Colors.grey)
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 8,
                  child: Text(text??" ", style: railway.copyWith(color: Colors.black87, fontSize: selectfontsize),)),
              Expanded(
                  flex: 1,
                  child: Icon(Icons.arrow_drop_down_outlined,size: 20, color: gold,))
            ],
          ),
        ),
      ],
    );
  }
}
