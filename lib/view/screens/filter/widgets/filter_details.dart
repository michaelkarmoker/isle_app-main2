
import 'package:flutter/material.dart';
import 'package:isletestapp/util/styles.dart';

class SubCategoryTitleWidget extends StatelessWidget {
  final String name;

//  final bool isSelect;

  const SubCategoryTitleWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        width: double.infinity,
        decoration: BoxDecoration(

          border: Border(

            bottom: BorderSide(width: 0.2, color: Colors.grey.shade400),
          ),
        ),
        padding: EdgeInsets.only(top:15,bottom: 15,right: 10,left: 10),
        child: Text(name!,
          textAlign:TextAlign.left,style: robotoRegular.copyWith(fontSize:14,),));
  }
}
