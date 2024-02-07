import 'dart:convert';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/newin%20most%20popular/newin_most_popular_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:isletestapp/view/screens/product%20page/product_shimmer.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewinLandingPage extends StatefulWidget {
  final String? page;
  final int id;
  NewinLandingPage({
    Key? key, required this.id,  this.page,
  }) : super(key: key);

  @override
  State<NewinLandingPage> createState() => _NewinLandingPageState();
}

class _NewinLandingPageState extends State<NewinLandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.page == AppConstants.NEWIN) {
        Get.find<NewinMostPopularController>().getNewinLandingData(widget.id.toString(), "500");
      }
      else if (widget.page == AppConstants.MOSTPOPULAR) {
        Get.find<NewinMostPopularController>().getMostPopularData(widget.id.toString(), "500");
      }
      retrieveButtonState(); // Retrieve the stored state of the button when the page loads
      // Load the stored wish statuses when the page loads
      retrieveWishStatus();
    });
  }

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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<NewinMostPopularController>().discloseData();
  }
  TextEditingController searchCtr = TextEditingController();
  int currentIndex = 1; // Add this variable to track the current index

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewinMostPopularController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: const UniversalBottomNav(),
        // backgroundColor: Color(0xffFAFBFB),
        backgroundColor: const Color(0xffFAFAFA),
        // drawer: IsleDrawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Color(0xff000000)),
          titleSpacing: 0,
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 62,
          actions: [
            InkWell(
                onTap: () {
                  Get.to(SearchScreen());
                },
                // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                child: Image.asset(
                  Images.search,
                  height: 22,
                  width: 22,
                )),
            const SizedBox(width: 2),
            const WishButtonWidget(),
            const SizedBox(width: 4),
          ],
          leadingWidth: Get.width / 3.5,
          title: const CustomLogo(),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.page == AppConstants.NEWIN) ...{
                controller.newInLandingProductResponse != null ? controller
                    .newInLandingProductResponse!.data!.result!.length > 0 ?
                Column(
                  children: [
                    Text(
                      "Showing ${controller?.newInLandingProductResponse?.data
                          ?.result?.length ?? 0} results",
                      style: poppins.copyWith(
                          fontSize: 10, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 12, right: 12),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.52,
                          ),
                          itemCount: controller?.newInLandingProductResponse!
                              .data!.result!.length ?? 0,
                          // Since you want only one item per GridView, set itemCount to 1
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Container(
                              // color: Colors.deepPurpleAccent,
                              color: const Color(0xffFAFBFB),
                              child: InkWell(
                                onTap: () {
                                  Get.to(ProductDetailsPage(
                                    productId: controller
                                        .newInLandingProductResponse!.data!
                                        .result![index].id.toString(),
                                  ));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: Get.height / 3.2,
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          CarouselSlider(
                                            items: [
                                              controller
                                                  .newInLandingProductResponse!
                                                  .data!.result![index]
                                                  .productColorVariants?[controller
                                                  .sectedColorVAriantIndex]
                                                  .frontPhoto,
                                              controller
                                                  .newInLandingProductResponse!
                                                  .data!.result![index]
                                                  .productColorVariants?[controller
                                                  .sectedColorVAriantIndex]
                                                  .backsidePhoto,
                                              controller
                                                  ?.newInLandingProductResponse!
                                                  .data!
                                                  .result![index]
                                                  .productColorVariants?[
                                              controller
                                                  .sectedColorVAriantIndex]
                                                  .details1Photo,
                                              controller
                                                  ?.newInLandingProductResponse!
                                                  .data!
                                                  .result![index]
                                                  .productColorVariants?[
                                              controller
                                                  .sectedColorVAriantIndex]
                                                  .details2Photo,
                                              controller
                                                  ?.newInLandingProductResponse!
                                                  .data!
                                                  .result![index]
                                                  .productColorVariants?[
                                              controller
                                                  .sectedColorVAriantIndex]
                                                  .outfitPhoto,
                                            ].map((i) {
                                              return Builder(
                                                builder:
                                                    (BuildContextcontext) {
                                                  return Container(
                                                    decoration:
                                                    const BoxDecoration(
                                                      color: Color(
                                                          0xffFBFBFB),
                                                    ),
                                                    child: ClipRRect(
                                                      child:
                                                      CustomImageCached(
                                                        image:
                                                        '${AppConstants
                                                            .BASE_URL}$i',
                                                        fit:
                                                        BoxFit.fill,
                                                        isRound: false,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                            options: CarouselOptions(
                                              disableCenter: true,
                                              viewportFraction: 1,
                                              autoPlayInterval:
                                              const Duration(
                                                  seconds: 7),
                                              height: Get.height / 2.4,
                                              scrollDirection:
                                              Axis.horizontal,
                                              onPageChanged:
                                                  (index, reason) {
                                                setState(() {
                                                  currentIndex =
                                                      index; // If you want to track carousel index separately
                                                });
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                for (int i = 0;
                                                i < currentIndex;
                                                i++)
                                                  TabPageSelectorIndicator(
                                                    backgroundColor: i ==
                                                        currentIndex
                                                        ? silvercolor
                                                        : gold,
                                                    borderColor: i ==
                                                        currentIndex
                                                        ? silvercolor
                                                        : gold,
                                                    size: 7,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Align(
                                              alignment: Alignment
                                                  .bottomCenter,
                                              child: Container(
                                                color: Colors
                                                    .grey.shade300,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 12,
                                                      right: 12,
                                                      top: 3,
                                                      bottom: 3),
                                                  child: controller
                                                      ?.newInLandingProductResponse!
                                                      .data!
                                                      .result![
                                                  index]
                                                      .season !=
                                                      null
                                                      ? Text(
                                                    (controller
                                                        ?.newInLandingProductResponse!
                                                        .data!
                                                        .result![index]
                                                        .season
                                                        ?.seasonName ??
                                                        "")
                                                        .toUpperCase(),
                                                    style: poppins.copyWith(
                                                        color: Colors
                                                            .black,
                                                        fontSize:
                                                        9),
                                                  )
                                                      : const SizedBox(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: buildProductWishButton(
                                                controller
                                                    .newInLandingProductResponse!
                                                    .data!.result![index].id
                                                    ?.toString()),
                                          ),
                                          Positioned(
                                            top: 10,
                                            left: 10,
                                            child: InkWell(
                                              onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (BuildContext
                                                    context) {
                                                          return SimilarPopup(id: controller.newInLandingProductResponse!.data!.result![index]!.childCategories![0].childCategoryProduct!.childCategoryId!);
                                                    },
                                                );
                                              },
                                              child: SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(5),
                                                  child: Image.asset(
                                                      Images.similar,
                                                      color:
                                                      silvercolor,
                                                      height: 20,
                                                      width: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: Text(
                                        (controller
                                            ?.newInLandingProductResponse!
                                            .data!
                                            .result![index]
                                            .brand
                                            ?.brandName ??
                                            "")
                                            .toUpperCase(),
                                        maxLines: 1,
                                        style: railway.copyWith(
                                            fontSize: 16,
                                            fontWeight:
                                            FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Text(
                                        controller
                                            ?.newInLandingProductResponse!
                                            .data!
                                            .result![index]
                                            .name ??
                                            "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: poppins.copyWith(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 5),

                                    /// main
                                    controller
                                        ?.newInLandingProductResponse!
                                        .data!
                                        .result![index]
                                        .discount ==
                                        null ||
                                        controller
                                            ?.newInLandingProductResponse!
                                            .data!
                                            .result![index]
                                            .discount ==
                                            0
                                        ? Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 4),
                                      child: Text(
                                        "${controller
                                            ?.newInLandingProductResponse!.data!
                                            .result![index].price ?? ''} BDT",
                                        style: poppins.copyWith(
                                            fontWeight:
                                            FontWeight.w600,
                                            color: gold,
                                            fontSize: 12),
                                      ),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 4),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${controller
                                                ?.newInLandingProductResponse!
                                                .data!.result![index]
                                                .discountedPrice ?? ''} BDT",
                                            style:
                                            poppins.copyWith(
                                                fontWeight:
                                                FontWeight
                                                    .w600,
                                                color: gold,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                              height: 4),
                                          Text(
                                            "${controller
                                                ?.newInLandingProductResponse!
                                                .data!.result![index].price ??
                                                ''} BDT",
                                            style: poppins.copyWith(
                                                fontWeight:
                                                FontWeight
                                                    .w600,
                                                decoration:
                                                TextDecoration
                                                    .lineThrough,
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
                        )),
                  ],
                )
                    : ProductShimmer()
                    : ProductShimmer()
              }

              else if (widget.page == AppConstants.MOSTPOPULAR) ...{
                controller.newInLandingProductResponse != null ? controller
                    .newInLandingProductResponse!.data!.result!.length > 0 ?
                Column(
                  children: [
                    Text(
                      "Showing ${controller?.newInLandingProductResponse?.data
                          ?.result?.length ?? 0} results",
                      style: poppins.copyWith(
                          fontSize: 10, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                        padding:
                        const EdgeInsets.only(left: 12, right: 12),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.52,
                          ),
                          itemCount: controller?.newInLandingProductResponse!
                              .data!.result!.length ?? 0,
                          // Since you want only one item per GridView, set itemCount to 1
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Container(
                              // color: Colors.deepPurpleAccent,
                              color: const Color(0xffFAFBFB),
                              child: InkWell(
                                onTap: () {
                                  Get.to(ProductDetailsPage(
                                    productId: controller.newInLandingProductResponse!.data!.result![index].id.toString(),
                                  ));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: Get.height / 3.2,
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          CarouselSlider(
                                            items: [
                                              controller.newInLandingProductResponse!.data!.result![index].productColorVariants?[controller.sectedColorVAriantIndex].frontPhoto,
                                              controller.newInLandingProductResponse!
                                                  .data!.result![index]
                                                  .productColorVariants?[controller
                                                  .sectedColorVAriantIndex]
                                                  .backsidePhoto,
                                              controller
                                                  ?.newInLandingProductResponse!
                                                  .data!
                                                  .result![index]
                                                  .productColorVariants?[
                                              controller
                                                  .sectedColorVAriantIndex]
                                                  .details1Photo,
                                              controller
                                                  ?.newInLandingProductResponse!
                                                  .data!
                                                  .result![index]
                                                  .productColorVariants?[
                                              controller
                                                  .sectedColorVAriantIndex]
                                                  .details2Photo,
                                              controller
                                                  ?.newInLandingProductResponse!
                                                  .data!
                                                  .result![index]
                                                  .productColorVariants?[
                                              controller
                                                  .sectedColorVAriantIndex]
                                                  .outfitPhoto,
                                            ].map((i) {
                                              return Builder(
                                                builder:
                                                    (BuildContextcontext) {
                                                  return Container(
                                                    decoration:
                                                    const BoxDecoration(
                                                      color: Color(
                                                          0xffFBFBFB),
                                                    ),
                                                    child: ClipRRect(
                                                      child:
                                                      CustomImageCached(
                                                        image:
                                                        '${AppConstants
                                                            .BASE_URL}$i',
                                                        fit:
                                                        BoxFit.fill,
                                                        isRound: false,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                            options: CarouselOptions(
                                              disableCenter: true,
                                              viewportFraction: 1,
                                              autoPlayInterval:
                                              const Duration(
                                                  seconds: 7),
                                              height: Get.height / 2.4,
                                              scrollDirection:
                                              Axis.horizontal,
                                              onPageChanged:
                                                  (index, reason) {
                                                setState(() {
                                                  currentIndex =
                                                      index; // If you want to track carousel index separately
                                                });
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                for (int i = 0;
                                                i < currentIndex;
                                                i++)
                                                  TabPageSelectorIndicator(
                                                    backgroundColor: i ==
                                                        currentIndex
                                                        ? silvercolor
                                                        : gold,
                                                    borderColor: i ==
                                                        currentIndex
                                                        ? silvercolor
                                                        : gold,
                                                    size: 7,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Align(
                                              alignment: Alignment
                                                  .bottomCenter,
                                              child: Container(
                                                color: Colors
                                                    .grey.shade300,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 12,
                                                      right: 12,
                                                      top: 3,
                                                      bottom: 3),
                                                  child: controller
                                                      ?.newInLandingProductResponse!
                                                      .data!
                                                      .result![
                                                  index]
                                                      .season !=
                                                      null
                                                      ? Text(
                                                    (controller
                                                        ?.newInLandingProductResponse!
                                                        .data!
                                                        .result![index]
                                                        .season
                                                        ?.seasonName ??
                                                        "")
                                                        .toUpperCase(),
                                                    style: poppins.copyWith(
                                                        color: Colors
                                                            .black,
                                                        fontSize:
                                                        9),
                                                  )
                                                      : const SizedBox(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: buildProductWishButton(
                                                controller
                                                    .newInLandingProductResponse!
                                                    .data!.result![index].id
                                                    ?.toString()),
                                          ),
                                          Positioned(
                                            top: 10,
                                            left: 10,
                                            child: InkWell(
                                              onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (BuildContext
                                                    context) {
                                                          return SimilarPopup(id: controller.newInLandingProductResponse!.data!.result![index]!.childCategories![0].childCategoryProduct!.childCategoryId!,);
                                                    },
                                                );
                                              },
                                              child: SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(5),
                                                  child: Image.asset(
                                                      Images.similar,
                                                      color:
                                                      silvercolor,
                                                      height: 20,
                                                      width: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: Text(
                                        (controller
                                            ?.newInLandingProductResponse!
                                            .data!
                                            .result![index]
                                            .brand
                                            ?.brandName ??
                                            "")
                                            .toUpperCase(),
                                        maxLines: 1,
                                        style: railway.copyWith(
                                            fontSize: 16,
                                            fontWeight:
                                            FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: Text(
                                        controller
                                            ?.newInLandingProductResponse!
                                            .data!
                                            .result![index]
                                            .name ??
                                            "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: poppins.copyWith(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(height: 5),

                                    /// main
                                    controller
                                        ?.newInLandingProductResponse!
                                        .data!
                                        .result![index]
                                        .discount ==
                                        null ||
                                        controller
                                            ?.newInLandingProductResponse!
                                            .data!
                                            .result![index]
                                            .discount ==
                                            0
                                        ? Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 4),
                                      child: Text(
                                        "${controller
                                            ?.newInLandingProductResponse!.data!
                                            .result![index].price ?? ''} BDT",
                                        style: poppins.copyWith(
                                            fontWeight:
                                            FontWeight.w600,
                                            color: gold,
                                            fontSize: 12),
                                      ),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 4),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${controller
                                                ?.newInLandingProductResponse!
                                                .data!.result![index]
                                                .discountedPrice ?? ''} BDT",
                                            style:
                                            poppins.copyWith(
                                                fontWeight:
                                                FontWeight
                                                    .w600,
                                                color: gold,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                              height: 4),
                                          Text(
                                            "${controller
                                                ?.newInLandingProductResponse!
                                                .data!.result![index].price ??
                                                ''} BDT",
                                            style: poppins.copyWith(
                                                fontWeight:
                                                FontWeight
                                                    .w600,
                                                decoration:
                                                TextDecoration
                                                    .lineThrough,
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
                        )),
                  ],
                )
                    : ProductShimmer()
                    : ProductShimmer()
              }
            ],
          ),
        ),
      );
    });

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
