import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/cart/cart_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';


class CartWidget extends StatelessWidget {
  final Color color;
  final double size;


  CartWidget({required this.color, required this.size,});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Image.asset(Images.cart,color:color, height:size),
      /*Icon(
        Icons.shopping_cart, size: size,
        color: color,
      ),*/
      GetBuilder<CartController>(builder: (cartController) {
     /*   return cartController.cartList.length > 0 ? Positioned(
          top: -5, right: -10,
          child: Container(
            height: size < 25 ? 18 : size/2, width: size < 25 ? 18 : size/2, alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle, color:Colors.red,
              border: Border.all(width: size < 25 ? 0.7 : 1, color: Theme.of(context).cardColor),
            ),
            child: Center(
              child: Text(
                cartController.cartList.length.toString(),
                style: robotoRegular.copyWith(
                  fontSize: size < 25 ? size/2.5 : size/3.8,
                  fontWeight: FontWeight.bold,
                  color:  Colors.white,
                ),
              ),
            ),
          ),
        ) : SizedBox();*/

        return  Positioned(
          top: -5, right: -10,
          child: Container(
            height: size < 25 ? 18 : size/2, width: size < 25 ? 18 : size/2, alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: gold,
              border: Border.all(width: size < 25 ? 0.7 : 1, color: Theme.of(context).cardColor),
            ),
            child: Center(
              child: Text(
                // cartController.cartList.length.toString(),
                cartController.cartLength.toString(),
                style: robotoRegular.copyWith(
                  fontSize: size < 25 ? size/2.5 : size/3.8,
                  fontWeight: FontWeight.bold,
                  color:  Colors.white,
                ),
              ),
            ),
          ),
        );

      }),
    ]);
  }
}
