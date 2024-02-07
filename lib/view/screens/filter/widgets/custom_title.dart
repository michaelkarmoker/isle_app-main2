
import 'package:flutter/material.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';

class CategoryTitleWidget extends StatelessWidget {
  final String name;
  final bool isSelect;

  const CategoryTitleWidget({Key? key, required this.name, required this.isSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color:isSelect?Color(0xffF2F6F9):Colors.white ,
        padding: EdgeInsets.only(top:35,bottom: 35,right: 5,left: 5),
        child: Center(child: Text(name!,
          textAlign:TextAlign.center,style: railway.copyWith(fontSize:12.5,color:isSelect?Colors.black: Colors.black54, fontWeight: FontWeight.w500),)));
  }
}
