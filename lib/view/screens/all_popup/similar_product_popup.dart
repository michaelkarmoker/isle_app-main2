import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimilarPopup extends StatefulWidget {
  final int id;
  SimilarPopup({
    Key? key, required this.id,
  }) : super(key: key);
  @override
  State<SimilarPopup> createState() => _SimilarPopupState();
}
class _SimilarPopupState extends State<SimilarPopup> {
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductListController>().getChildCategoryProductData(childCategoryId: widget.id.toString());
      retrieveButtonState(); // Retrieve the stored state of the button when the page loads
      // Load the stored wish statuses when the page loads
      retrieveWishStatus();
    }
    );

  }
  @override
  void dispose() {
    Get.find<ProductListController>().dataClear();
    super.dispose();
  }
  int currentIndex = 1;

  bool isHeartRed = false; // Initially, assuming the heart icon is not red
  Future<void> retrieveButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isHeartRed = prefs.getBool('isHeartRed') ??
          false; // Get the saved value, defaulting to false
    });
  }

  Map<String, bool> productWishStatus = {
  }; // Map to store product IDs and wish status
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
    return GetBuilder<ProductListController>(
        builder: (controller) {
          return Container(
            // You can customize the content of the bottom sheet here
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Similar products', style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),),
                    trailing: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                    onTap: () {
                      // Add functionality for sharing
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 0),
                  Container(
                    // color: Colors.red,
                    height: Get.height/2.3,
                    // width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child:
                      controller.childCategoryList!.length>0?
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.childCategoryList.length??0,
                        itemBuilder:  (BuildContext context, int index) {
                          return Container(
                            // color: Colors.deepPurpleAccent,
                            // color: const Color(0xffFAFBFB),
                            child: InkWell(
                              onTap: () {
                                Get.to(ProductDetailsPage(productId: controller.childCategoryList[index].id!.toString(),
                                ));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2, right: 2),
                                    child: SizedBox(
                                      height: Get.height / 3.5,
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Container(
                                            // color: Colors.red,
                                            height: Get.height / 3.5,
                                            width: Get.width/2.5,
                                            child: CustomImageCached(
                                              image: "${AppConstants.BASE_URL}${controller.childCategoryList[index]!.productColorVariants![controller.sectedColorVAriantIndex]!.frontPhoto??""}",
                                              fit: BoxFit.fill,
                                              isRound: false,
                                            ),
                                          ),

                                          Positioned(
                                            bottom: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                for (int i = 0; i < currentIndex; i++)
                                                  TabPageSelectorIndicator(
                                                    backgroundColor: i == currentIndex ? silvercolor : gold,
                                                    borderColor: i == currentIndex ? silvercolor : gold,
                                                    size: 7,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                color: Colors.grey.shade300,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                  child: controller.childCategoryList[index].season != null ?
                                                  Text((
                                                      controller.childCategoryList[index].season!.seasonName ?? ""
                                                  ).toUpperCase(),
                                                    style: poppins.copyWith(color: Colors.black, fontSize: 9),
                                                  )
                                                      : const SizedBox(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child :  buildProductWishButton(controller.childCategoryList![index]!.id!.toString()),
                                            /*    child: InkWell(
                                              onTap: () {
                                                Get.to(
                                                    WishListPage());
                                              },
                                              child: SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .all(5),
                                                  child: Image
                                                      .asset(
                                                      Images.wish,
                                                      color: silvercolor,
                                                      height: 20,
                                                      width: 20),
                                                ),
                                              ),
                                            ),*/
                                          ),
                                          /*    Positioned(
                                            top: 10,
                                            right: 10,
                                            child: buildProductWishButton(controller.childCategoryList[index].id!.toString()),
                                          ),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(horizontal: 25),
                                    child: Text((
                                        controller.childCategoryList[index].brand?.brandName ?? "").toUpperCase(),
                                      maxLines: 1,
                                      style: railway.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(horizontal: 4),
                                    child: Text(
                                      controller.childCategoryList[index].name ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 12
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  /// main
                                  controller.childCategoryList[index].discount == null || controller.childCategoryList[index].discount == 0 ?
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      "${controller.childCategoryList[index].price} BDT",
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: gold,
                                          fontSize: 12
                                      ),
                                    ),
                                  )
                                      :
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${controller.childCategoryList[index].discountedPrice} BDT",
                                          style: poppins.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: gold,
                                              fontSize: 12
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${controller.childCategoryList[index].price} BDT",
                                          style: poppins.copyWith(
                                              fontWeight: FontWeight.w600,
                                              decoration: TextDecoration.lineThrough,
                                              color: Colors.red,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                          :SizedBox(),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget buildProductWishButton(String? productId,) {
    bool isWished = productWishStatus.containsKey(productId)
        ? productWishStatus[productId]!
        : false;
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
                  log('Product delete:$productId');
                  await controller.deleteWish(Get
                      .find<WishlistController>()
                      .getWishlistResponse!
                      .data![controller.sectedColorVAriantIndex].id!
                      .toString() ?? "");
                  setState(() {
                    productWishStatus[productId ?? ''] = false;
                  });
                } else {
                  // Perform add action
                  if (Get.find<AuthController>().isLoggedIn() == false) {
                    log('Product idugiu:$productId');
                    await controller.AddtoWishlistWithout(
                      product_id: productId!,
                      // customer_id: customerID,
                      corelation_id: deviceID,
                    );
                  } else {
                    log('Product id:$productId');
                    await controller.AddtoWishlist(
                      product_id: productId!,
                      customer_id: customerID,
                      corelation_id: deviceID,
                    );
                  }

                  setState(() {
                    productWishStatus[productId ?? ''] = true;
                  });
                }
                saveWishStatus(); // Save the updated wish status
              } catch (e) {
                // Handle any errors that might occur during the asynchronous operation
                print("Error: $e");
              }
            },

            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                isWished ? Images.unwished : Images.wish,
                height: 20,
                color: isWished ? gold : silvercolor,
              ),
            ),
          );
        }
    );
  }





}
