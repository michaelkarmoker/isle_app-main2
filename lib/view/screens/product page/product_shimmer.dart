import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/styles.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: 10,
          // Since you want only one item per GridView, set itemCount to 1
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.grey.shade300,
              height: Get.height / 5,
              child: Center(child: Text("Isle", style: railway.copyWith( color: Colors.white54 ,fontSize: 40, fontWeight: FontWeight.w900, letterSpacing: 3),)),
            );
          },
        )
    );
  }
}
