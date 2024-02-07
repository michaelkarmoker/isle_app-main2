import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        period: Duration(seconds: 1),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child:  Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1st box
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child:  Container(
                  decoration: BoxDecoration( color: Colors.grey[300]!,borderRadius: BorderRadius.circular(4)),
                  height: Get.height/15,
                  width: Get.width,
                ),
              ),

SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child:  Container(
                  decoration: BoxDecoration( color: Colors.grey[300]!,borderRadius: BorderRadius.circular(4)),
                  height: Get.height/6,
                  width: Get.width,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child:  Container(
                  decoration: BoxDecoration( color: Colors.grey[300]!,borderRadius: BorderRadius.circular(4)),
                  height: Get.height/6,
                  width: Get.width,
                ),
              ),
              SizedBox(height: 8),


              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child:  Container(
                  decoration: BoxDecoration( color: Colors.grey[300]!,borderRadius: BorderRadius.circular(4)),
                  height: Get.height/6,
                  width: Get.width,
                ),
              ),

              SizedBox(height: 8),


              Padding(
                padding: const EdgeInsets.only(left: 8,top: 8,bottom: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration( color: Colors.grey[300]!,borderRadius: BorderRadius.circular(3)),
                  height: Get.height/30,
                  width: Get.width/1.8,
                ),
              ),

              SizedBox(height: 15),

              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: SizedBox(
                        // height: 120,
                        height: 80,
                        child:
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:  5,
                          itemBuilder: (context, index) {
                            return Container(
                              // color: Colors.green,
                              height: 80, width: 130,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                      color: Colors.grey[300]!,
                                      height: 70, width: 110,
                                      // height: Get.height/5.5,
                                    ),
                                  ),

                                ],
                              ),
                            );
                          },
                        )
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }}