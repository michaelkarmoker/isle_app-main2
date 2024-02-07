import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/dimensions.dart';

void showCustomSnackBar(
    String message,
    {bool isError = true,
      bool isPosition= false,
      double? duration,
    }
    ) {
  Get.showSnackbar(GetBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    maxWidth: Dimensions.WEB_MAX_WIDTH,
    duration: duration != null ? Duration(seconds: duration.toInt()) : Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
    borderRadius: Dimensions.RADIUS_DEFAULT,
    isDismissible: true,

    snackPosition: isPosition?SnackPosition.BOTTOM:SnackPosition.TOP,


    // dismissDirection: SnackBar.HORIZONTAL,
  ));
}


/*

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(GetSnackBar(

    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    maxWidth: Dimensions.WEB_MAX_WIDTH,
    icon: Icon(isError?Icons.error:Icons.check_circle, color: Colors.white),
    duration: Duration(seconds: 2),
    snackStyle: SnackStyle.FLOATING,
    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
    margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
    borderRadius: Dimensions.RADIUS_EXTRA_LARGE,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
    // colorText: Colors.white,
    // action: SnackBarAction( textColor: Colors. red, label: 'Close', onPressed: () {}, ),
  ));
}*/
