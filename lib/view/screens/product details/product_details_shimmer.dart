import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/styles.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                color: Colors.grey.shade300,
                height: Get.height / 3,
                child: Center(child: Text("Isle", style: railway.copyWith( color: Colors.white54 ,fontSize: 40, fontWeight: FontWeight.w900, letterSpacing: 3),)),
              ),
              SizedBox(height: 15),
              Container(width: 140, color: Colors.grey.shade300, height: 35,),
              SizedBox(height: 15),
              Container(color: Colors.grey.shade300, height: 20,),
              SizedBox(height: 10),
              Container(color: Colors.grey.shade300, height: 20,),
              SizedBox(height: 10),
              Container(color: Colors.grey.shade300, height: 20,),
              SizedBox(height: 80),
              Container( width: 280 ,color: Colors.grey.shade300, height: 45,),


            ],
          ),
        )
    );
  }
}
