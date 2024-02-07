
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductWishButton extends StatefulWidget {
  final String productId;

  const ProductWishButton({required this.productId});

  @override
  _ProductWishButtonState createState() => _ProductWishButtonState();
}

class _ProductWishButtonState extends State<ProductWishButton> {
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get.find<ProductDetailsController>().getGeneralSettingData();
      Get.find<ProductDetailsController>().getProductDetailsData(widget.productId);
      // Get.find<ProductDetailsController>().getMoreFromBrandsData(widget.productId, "?page=1", "&brand=16");
      Get.find<ProductDetailsController>().dataInitialize();
      // Get.find<WishlistController>().getCheckWishlisted(widget.productId);
      print(widget.productId);
      // print(widget.pageId);
      // print(widget.brandId);
      print(Get.find<AuthController>().getUserId());
      // print(widget.brandId);
      print(Get.find<ProductDetailsController>().moreBrandDetailsPageResponse!.data!.length);
    }
    );
    super.initState();
    retrieveButtonState(); // Retrieve the stored state of the button when the page loads
    // Load the stored wish statuses when the page loads
    retrieveWishStatus();
  }
  bool isWished = false; // Initialize as per your logic
  int currentIndex=0;
  /// wishbutton
  bool isHeartRed = false; // Initially, assuming the heart icon is not red
  Future<void> retrieveButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isHeartRed = prefs.getBool('isHeartRed') ?? false; // Get the saved value, defaulting to false
    });
  }

  Map<String, bool> productWishStatus = {}; // Map to store product IDs and wish status
  Future<void> retrieveWishStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      productWishStatus = Map<String, bool>.from(
        prefs.getString('productWishStatus') != null
            ? json.decode(prefs.getString('productWishStatus')!)
            : {},
      );
    });
  }

  void saveWishStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('productWishStatus', json.encode(productWishStatus));
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (controller) {
        return InkWell(
          onTap: () async {
            try {
              var deviceID = await Get.find<AuthController>().getDeviceID();
              var customerID = await Get.find<AuthController>().getUserId();
              // Check if the product is already wishlisted
              // bool isProductWishlisted = // Perform logic to check if the product is wishlisted

              if (isWished) {
                // Perform delete action
                await  Get.find<WishlistController>().deleteWish(Get.find<WishlistController>().getWishlistResponse?.data?[controller.sectedColorVAriantIndex].id?.toString()??"");
                setState(() {
                  productWishStatus[widget.productId] = false;
                });
              } else {
                // Perform add action
                await controller.AddtoWishlist(
                  product_id: controller.productDetailsResponse!.data!.id!.toString(),
                  customer_id: customerID,
                  corelation_id: deviceID,
                );
                setState(() {
                  productWishStatus[widget.productId] = true;
                });
              }
              saveWishStatus(); // Save the updated wish status
            } catch (e) {
              // Handle any errors that might occur during the asynchronous operation
              print("Error: $e");
            }
          },
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.shade100,
            child: Image.asset(
              isWished ? Images.unwished : Images.wish,
              height: 26,
              color: isWished ? gold : silvercolor,
            ),
          ),
        );
      }
    );
  }

  // // Function to save wish status
  // void saveWishStatus(bool status) {
  //   // Implement your logic to save wish status here
  //   // This function can be customized based on your requirements
  //   // ...
  // }
}
