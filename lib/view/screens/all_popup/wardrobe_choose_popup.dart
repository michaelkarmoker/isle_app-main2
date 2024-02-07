import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';
import 'package:isletestapp/view/screens/all_popup/wishlist_size_or_color_popup.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import 'package:isletestapp/view/screens/design%20backup/test3.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WardrobeChoosePopup extends StatefulWidget {
  final int wardrobeIndex;
  final String wardrobeName;

  const WardrobeChoosePopup({super.key, required this.wardrobeIndex, required this.wardrobeName});
  @override
  State<WardrobeChoosePopup> createState() => _InfoPopupState();
}
class _InfoPopupState extends State<WardrobeChoosePopup> {

  bool isSuccessful = false; // Initially set to false


/*  /// wishbutton
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
  }*/


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
          Get.find<WishlistController>().getWishlistData();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
      return GetBuilder<WishlistController>(
          builder: (controller) {
            return SingleChildScrollView(
              child:
              controller.getWishlistResponse!=null? controller.getWishlistResponse!.data!.length>0?
              Column(
                children: [
                  ListTile(
                    title: Text('${widget.wardrobeName}', style: railway.copyWith(fontSize: 14, fontWeight: FontWeight.bold),),
                    trailing: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.85, // Set height to 90% of screen height
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.getWishlistResponse!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              // height:  Get.height / 3.4 ,
                              // color: Colors.deepPurpleAccent,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  // color: Color(0xffFFFFFF),
                                                    color: Color(0xffFAFAFA),
                                                  //   color: Colors.pink,
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(bottom: 0, left: 0, right: 0 ),
                                                      child : CarouselSlider(
                                                        // options: CarouselOptions(height: 400.0),
                                                        items: [
                                                          controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].profilePhoto??"",
                                                          controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].frontPhoto??"",
                                                          controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].backsidePhoto??"",
                                                          controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].details1Photo??"",
                                                          controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].details2Photo??"",
                                                          controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].outfitPhoto??"",
                                                        ].map((i) {
                                                          return Builder(
                                                            builder: (BuildContext context) {
                                                              return Container(
                                                                decoration: BoxDecoration(
                                                                  // color: Theme.of(context).cardColor,
                                                                  color: Color(0xffFBFBFB),
                                                                  // color: Colors.tealAccent,
                                                                ),
                                                                child: ClipRRect(
                                                                    child: CustomImageCached(
                                                                      placeholder: "assets/image/placeholder.png",
                                                                      image: '${AppConstants.BASE_URL}$i',
                                                                      // image: widget.cartdetailsimage,
                                                                      fit: BoxFit.cover,
                                                                      isRound: false,
                                                                      height: Get.height / 4.5,
                                                                      width: Get.width,
                                                                    )
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }).toList(),

                                                        options: CarouselOptions(
                                                          autoPlay: false,
                                                          disableCenter: true,
                                                          viewportFraction: 1,
                                                          autoPlayInterval: Duration(seconds: 7),
                                                          height: Get.height / 7.5,
                                                          scrollDirection: Axis.horizontal,
                                                          onPageChanged: (index, reason) {
                                                            setState((){
                                                              // currentIndex=index;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      /*  child: CustomImageCached(
                                                                        placeholder: "assets/image/placeholder.png",
                                                                        image: '${AppConstants.BASE_URL}${controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[controller.sectedColorVAriantIndex].profilePhoto??""}',
                                                                        fit: BoxFit.fill,
                                                                        isRound: false,
                                                                        height: Get.height / 4.5,
                                                                        width: Get.width,
                                                                      ),*/

                                                    )),
                                            /*    Positioned(
                                                  bottom: 0,
                                                  // left: 15,
                                                  child: Column(
                                                    // mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        /// orginal color
                                                        // color: Color(0xffF2F2F2),
                                                        color: Colors.grey.shade300,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                                                          child: Text(
                                                            "${controller.getWishlistResponse?.data?[index]?.product?.season?.name??""}".toUpperCase(),
                                                            style: railway.copyWith(color: Colors.black, fontSize: 8.5),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),*/
                                              ]),
                                        ],
                                      )),
                                  Expanded(
                                    flex: 5,
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            // color: Colors.cyan,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 12),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 12),
                                                  controller.getWishlistResponse?.data?[index]?.product?.brand == null ?
                                                      SizedBox(child: Text(""),) :
                                                  Text(
                                                    "${controller.getWishlistResponse?.data?[index]?.product?.brand!.name??""}",
                                                    maxLines: 1,
                                                    style: railway.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black87,
                                                        fontSize: 16
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    "${controller.getWishlistResponse!.data![index]!.product!.name??""}",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: railway.copyWith(
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black54,
                                                        fontSize: 14
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  controller.getWishlistResponse?.data?[index]?.product?.discount == null || controller.getWishlistResponse?.data?[index]?.product?.discount == 0   ?
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${controller.getWishlistResponse?.data?[index]?.product?.price!.toStringAsFixed(0)} BDT",
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                            color: gold,
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                      :
                                                  Row(  mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${controller.getWishlistResponse?.data?[index]?.product?.price!.toStringAsFixed(0)} BDT",
                                                        style: poppins.copyWith(
                                                            decoration: TextDecoration.lineThrough,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.red,
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "${controller.getWishlistResponse?.data?[index]?.product?.discountedPrice!.toStringAsFixed(0)} BDT",
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                            color: gold,
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 12),

                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            // left: 15,
                                            child: InkWell(
                                              onTap : () {
                                                controller.createWardrobeProduct(
                                                  wardrobe_id: controller.wardrobeResponse?.data?[widget.wardrobeIndex]?.id?.toString()??"0",
                                                  wishlist_id: controller.getWishlistResponse?.data?[index]?.id?.toString()??"0",
                                                );
                                                setState(() {
                                                  controller?.getWishlistResponse?.data?[index]?.isSelect=true;

                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                                                child: Icon(
                                                  Icons.check_circle_rounded,
                                                  color: controller.getWishlistResponse!.data![index]!.isSelect? gold : silvercolor,
                                                ),
                                              ),
                                            ),
                                            /// other process
                                            /*child:  buildProductWardrobeButton(controller.wardrobeResponse!.data![index].id!.toString()),*/
                                          ),
                                        ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(height: 8, thickness: 8, color: Color(0xffF2F6F9),),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              )
                  : SizedBox() : SizedBox(),
            );
          }
      );
  }


/*  Widget buildProductWardrobeButton(String productId) {
    bool isWished = productWishStatus.containsKey(productId)
        ? productWishStatus[productId]!
        : false;

    return GetBuilder<WishlistController>(
        builder: (controller) {
          return InkWell(
            onTap: () async {
              try {
                // var deviceID = await Get.find<AuthController>().getDeviceID();
                // Check if the product is already wishlisted
                // bool isProductWishlisted = // Perform logic to check if the product is wishlisted

                if (isWished) {
                  // Perform delete action
                  await  Get.find<WishlistController>().deleteWardrobeProduct(
                      // controller.wardrobeResponse?.data?[controller.sectedColorVAriantIndex].id?.toString()??""
                    controller.wardrobeResponse?.data?[0]?.wardrobeProducts?[0]?.id?.toString()??"",
                  );
                  setState(() {
                    productWishStatus[productId] = false;
                  });
                } else {
                  // Perform add action
                  await controller.createWardrobeProduct(
                    wardrobe_id: controller?.wardrobeResponse?.data?[controller.sectedWishIndex]?.id?.toString()??"0",
                    wishlist_id: controller.getWishlistResponse?.data?[controller.sectedWishIndex]?.id?.toString()??"0",
                    // wardrobe_id: controller.productDetailsResponse!.data!.id!.toString(),
                    // wishlist_id: controller.productDetailsResponse!.data!.id!.toString(),
                  );
                  setState(() {
                    productWishStatus[productId] = true;
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
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: isWished? gold : silvercolor,
                ),
              ),
            ),
          );
        }
    );
  }*/


}
