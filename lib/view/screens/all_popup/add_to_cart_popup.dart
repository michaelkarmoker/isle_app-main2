import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';


class AddtoCartPopup extends StatelessWidget {
  final String? brand;
  final String? producttitle;
  final String? color;
  final String? size;
  final String? qty;
  final int? price;
  final String? discountedprice;
  final int? discount;
  final String? season;
  final String? image;
  final String? iconString;
  final String description;
  final String yesBtnText;
  final String noBtnText;
  final bool isError;
  final Function() yesBtntap;
  final Function() noBtntap;
  const AddtoCartPopup({Key? key,
    this.brand,
    this.color,
    this.size,
    this.qty,
    this.price,
    this.discountedprice,
    this.discount,
    this.producttitle,
    required this.yesBtntap,
    required this.yesBtnText,
    required this.noBtnText,
    this.description=" ",
    this.isError=false,
    required this.noBtntap,
    this.iconString,
    this.image,
    this.season,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: EdgeInsets.all(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(


        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close, color: gold,),
                  ),
                ],
              ),
              SizedBox(height: 8,),
     /*       iconString!=null?Image.asset(iconString!,height: 35,width: 35,):
              Image.asset(isError?Images.error:Images.confirmicon,height: 40,width: 40,),*/
              iconString!=null?
              CustomImageCached(image: "${AppConstants.BASE_URL}$image",
                isRound: false, height: 100, width: 100,): SizedBox(),
              SizedBox(height: 5),
              season!=null? Container(
                height: 25,
                width: 90,
                color: Colors.grey.shade200,
                child: Center(child: Text(season!, style: railwaybold.copyWith(fontSize: 9),)),
              ): SizedBox(),
              SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${brand}'.toUpperCase(),
                          textAlign:TextAlign.start,
                          style: railwaybold.copyWith(color: Colors.black,fontSize: 14)),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${producttitle}',
                          textAlign:TextAlign.start,
                          style: railway.copyWith(color: Colors.black,fontSize: 12)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Color: ',
                        textAlign:TextAlign.start,
                        style: railway.copyWith(color: Colors.black,fontSize: 12)),
                    Text('${color}',
                        textAlign:TextAlign.start,
                        style: railwaybold.copyWith(color: Colors.black,fontSize: 12)),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Size: ',
                        textAlign:TextAlign.start,
                        style: railway.copyWith(color: Colors.black,fontSize: 12)),
                    Text('${size}',
                        textAlign:TextAlign.start,
                        style: railwaybold.copyWith(color: Colors.black,fontSize: 12)),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Quantity: ',
                        textAlign:TextAlign.start,
                        style: railway.copyWith(color: Colors.black,fontSize: 12)),
                    Text('${qty}',
                        textAlign:TextAlign.start,
                        style: railwaybold.copyWith(color: Colors.black,fontSize: 12)),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price: ',
                        textAlign:TextAlign.start,
                        style: railway.copyWith(color: Colors.black,fontSize: 12)),
                    discount == 0 ||  discount == null  ?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "${price!.toStringAsFixed(0)} BDT",
                        style: poppins.copyWith(
                            fontWeight: FontWeight.w600,
                            color: gold,
                            fontSize: 12
                        ),
                      ),
                    )
                        :
                    Expanded(
                      // scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${discountedprice} BDT",
                                      style: poppins.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: gold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    TextSpan(text: '  '), // Add any additional spacing if needed
                                    TextSpan(
                                      text: "${price!.toStringAsFixed(0)} BDT",
                                      style: poppins.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w600,
                                        color: red,
                                        fontSize: 12,
                                      ),
                                    ),
                                    TextSpan(text: ' '), // Add any additional spacing if needed
                                    TextSpan(
                                      text: "( 100 BDT Off)",
                                      style: poppins.copyWith(
                                        fontWeight: FontWeight.w300,
                                        // color: gold,
                                        fontSize: 11,
                                      ),
                                    ),
                                    TextSpan(text: ' '), // Add any additional spacing if needed
                                    TextSpan(
                                      text: "(+ VAT)",
                                      style: poppins.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: silvercolor,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )

                ],
                ),
              ),

              
         /*     Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("dfkd"),
              ),*/
              
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
                      padding: EdgeInsets.all(6),
                      child: InkWell(
                        onTap: yesBtntap,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            width: Get.width,
                            child: Text("${yesBtnText}",textAlign:TextAlign.center,
                              style: railwaybold.copyWith(fontSize: 11,
                                  color: Colors.white),)),),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: Container(

                      padding: EdgeInsets.all(6),
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
                              style: railwaybold.copyWith(fontSize: 11,
                                color: Colors.white,),)),),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
