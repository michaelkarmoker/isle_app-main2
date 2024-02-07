import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/discover/discover_controller.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_shimmer.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/product%20page/brand_view_page.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';

class Discover extends StatefulWidget {
  final int selectedCatIndex;

  const Discover({Key? key, required this.selectedCatIndex,}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Discover Controller Call");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DiscoverController>().dataInitialize();
      print("Discover Controller Call");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<DiscoverController>().dataClear();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (mainPageController) {
      return GetBuilder<DiscoverController>(
          builder: (controller) {
            return Scaffold(
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
                        Get.to(const SearchScreen());
                      },
                      // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                      child: Image.asset(
                        Images.search, height: 22, width: 22,)),
                  const SizedBox(width: 2),
                  const WishButtonWidget(),
                  const SizedBox(width: 4),
                ],
                leadingWidth: Get.width / 3,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: SizedBox(
                    // color: Colors.pinkAccent,
                    height: 200,
                    child: Center(
                        child:
                        controller.genderList!.isEmpty ?
                        const MyShimmer(hight: 40) :
                        ListView.builder(
                            itemCount: controller.genderList!.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: InkWell(
                                    onTap: () {
                                      controller.getPromotionBannerData(
                                          controller.genderList![index].id
                                              .toString());
                                      controller.getBrandPromotionData(
                                          controller.genderList![index].id
                                              .toString());
                                      controller.selectedGenderIndex = index;
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 3),
                                            child: Text(
                                              "${controller.genderList?[index]
                                                  ?.title ?? ""}",
                                              style: controller
                                                  .selectedGenderIndex == index
                                                  ? railway.copyWith(
                                                  height: 1.5,
                                                  color: Colors.black,
                                                  fontSize: Dimensions.fontSizeExtraSmall,
                                                  fontWeight: FontWeight.bold)
                                                  : railway.copyWith(
                                                  height: 1.5,
                                                  color: Colors.black,
                                                  fontSize: Dimensions.fontSizeExtraSmall,
                                                  fontWeight: FontWeight.bold),),
                                          ),
                                          const SizedBox(height: 2),
                                          controller.selectedGenderIndex == index
                                              ?
                                          Padding(
                                            padding: const EdgeInsets.only(left: 3),
                                            child: Container(
                                              color: gold,
                                              height: 2, width: 22,
                                            ),
                                          )
                                              : Container()
                                        ],
                                      ),
                                    )
                                ),
                              );
                            })
                    ),
                  ),
                ),
                title: const CustomLogo(),
              ),
              // backgroundColor: Color(0xffEBEFF3),
              backgroundColor: const Color(0xffFFFFFF),
              body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async{
                   await Get.find<DiscoverController>().dataInitialize();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 4),
                          controller.promotionBannerResponse != null && controller.promotionBannerResponse!.data!.length > 0 ?
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CarouselSlider.builder(
                              itemCount: controller.promotionBannerResponse?.data?.length,
                              itemBuilder: (BuildContext context, int index, _){
                                return  GestureDetector(
                                  onTap: () {
                                    AppConstants.launchUrls(
                                        urls: controller.promotionBannerResponse?.data?[index].bannerUrl ?? ""
                                    );
                                  },
                                  child:
                                  controller.promotionBannerResponse!.data![index]!.banner== null?
                                  SizedBox.shrink() :
                                  CustomImageCached(
                                    placeholder: "",
                                    image: '${AppConstants.BASE_URL}${controller.promotionBannerResponse?.data?[index]?.banner ?? ""}',
                                    fit: BoxFit.cover,
                                    height: controller.promotionBannerResponse!.data!.length== 0?0 : 200,
                                    isRound: false,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,  // Enable auto-sliding
                                autoPlayInterval: const Duration(seconds: 5),  // Set the auto-sliding interval
                                enableInfiniteScroll: true,
                                height: 200,
                                // enlargeCenterPage: true,
                                reverse: false,
                                aspectRatio: 10 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                                viewportFraction: 1,
                              ),
                            ),
                          ) : const SizedBox(),

               /*           controller.promotionBannerResponse != null && controller.promotionBannerResponse!.data!.length > 0 ?
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: InkWell(
                              onTap: () {
                                AppConstants.launchUrls(
                                    urls: controller.promotionBannerResponse?.data?[0].bannerUrl ?? ""
                                );
                              },
                              child:
                              controller.promotionBannerResponse!.data![0]!.banner== null?
                                  SizedBox.shrink() :
                              CustomImageCached(
                                placeholder: "",
                                image: '${AppConstants.BASE_URL}${controller.promotionBannerResponse?.data?[0]?.banner ?? ""}',
                                fit: BoxFit.cover,
                                height: controller.promotionBannerResponse!.data!.length== 0?0 : 200,
                                isRound: false,
                              )
                            ),
                          )
                              : const SizedBox.shrink(),*/


                          controller.promotionBannerResponse!=null?   SizedBox(height: 8) : SizedBox(),
                          controller.brandPromotionResponse != null ? controller
                              .brandPromotionResponse!.data!.length > 0 ?
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.brandPromotionResponse!.data!
                                  .length ?? 0,
                              // itemCount: 10,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 6,
                                  childAspectRatio: 1.5
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print("skfjsod");
                                    print(controller.brandPromotionResponse
                                        ?.data?[index]?.brand?.id.toString() ?? '');
                                    print("Bal");
                                    // Get.to(()=> Container(height: 200, width: 100, color: Colors.red,));
                                    controller.brandPromotionResponse!.data![index]!
                                        .brandId == null ?
                                    showCustomSnackBar("Brand id getting null") :
                                    // Get.to(() =>
                                    //     ProductPage(
                                    //       page: AppConstants.BRAND,
                                    //       image: '${AppConstants.BASE_URL}${controller.brandPromotionResponse?.data?[index]?.brand?.banner}',
                                    //       title: controller.brandPromotionResponse?.data?[index]?.title,
                                    //       details: controller.brandPromotionResponse?.data?[index]?.brand?.details,
                                    //       id: controller.brandPromotionResponse?.data?[index]?.brand?.id.toString() ?? '',
                                    //     ));
                                    Get.to(()=> ProductPage(
                                      image: '${AppConstants.BASE_URL}${controller.topBrandResponse!.data![index].brand!.banner?? ""}',
                                      title: controller.topBrandResponse!.data![index].brand!.name??"",
                                      details: controller.topBrandResponse!.data![index].brand!.details??"",
                                      page: AppConstants.BRAND,
                                      id: controller.topBrandResponse!.data![index].brand!.id!.toString(),
                                      pageId: mainPageController.homePageAllDataResponse?.data?[index].pageId,
                                    ));
                                  },
                                  child: IgnorePointer(
                                    ignoring: false,
                                    child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            color: const Color(0xff424242),
                                            // color:  Colors.green,
                                            // width: Get.width/3.2,
                                            child: CustomImageCached(
                                              image: '${AppConstants
                                                  .BASE_URL}${controller
                                                  .brandPromotionResponse!
                                                  .data![index]!.logo}',
                                              // image: '${catagoryimage[index]}',
                                              // height: 500,
                                              isRound: false,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 20,
                                              left: 10,
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text("${controller
                                                    .brandPromotionResponse!
                                                    .data![index]!.title ?? ""}",
                                                  style: railwaybold.copyWith(
                                                    // color: Color(0xffDBDCE2),
                                                      color: Colors.white,
                                                      // fontWeight: FontWeight.bold,
                                                      fontSize: 16),),
                                              )
                                          )
                                        ]
                                    ),
                                  ),
                                );
                              }, // Number of items in the grid
                            ),
                          )
                              : const SizedBox() : const SizedBox(),

                          const SizedBox(height: 15),

                          /// Top brands
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 8, top: 0, bottom: 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text("Top Brands".toUpperCase(),
                                        style: poppins.copyWith(fontSize: 20),),
                                    ),
                                    // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                controller.topBrandResponse != null ?
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(left: 8, right: 8),
                                        child: GridView.builder(
                                          itemCount: controller.topBrandResponse!.data!.length ?? 0,
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true, // Important to make it work inside a SingleChildScrollView
                                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5, // Number of columns
                                              childAspectRatio: 1.3,
                                              mainAxisSpacing: 1,
                                              crossAxisSpacing: 1
                                          ),
                                          itemBuilder: (context, index) {

                                            return GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    ProductPage(
                                                      image: '${AppConstants.BASE_URL}${controller.topBrandResponse!.data![index].brand!.banner ?? ""}',
                                                      title: controller.topBrandResponse!.data![index].brand!.name ?? "",
                                                      details: controller.topBrandResponse!.data![index].brand!.details ?? "",
                                                      page: AppConstants.BRAND,
                                                      id: controller.topBrandResponse!.data![index].brand!.id!.toString(),
                                                      pageId: mainPageController.homePageAllDataResponse?.data?[index].pageId,
                                                    ));
                                                // Get.to(()=>
                                                //     ProductPage(
                                                //       image: '${AppConstants.BASE_URL}${controller.topBrandResponse!.data![index].brand!.banner}',
                                                //       title: controller.topBrandResponse!.data![index].brand!.name??"",
                                                //       details: controller.topBrandResponse!.data![index].brand!.details??"",
                                                //       page: AppConstants.BRAND,
                                                //       id: controller.topBrandResponse!.data![index].brand!.id!.toString(),
                                                //     ));
                                              },
                                              child: Card(
                                                margin: const EdgeInsets.all(2),
                                                elevation: 0,
                                                child: Container(
                                                  // color: Colors.green,
                                                  height: 70, width: 130,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(0),
                                                    child: CustomImageCached(
                                                      isRound: false,
                                                      image: '${AppConstants.BASE_URL}${controller.topBrandResponse?.data?[index]?.brand?.logo??""}',
                                                      // fit: BoxFit.fitHeight,
                                                      height: 70,
                                                      width: 110,
                                                      fit: BoxFit.fill,
                                                      // height: Get.height/5.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }, // Total number of items
                                        ),
                                      ),


                                      /// previous
                                    /*  Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, right: 4),
                                        child: SizedBox(
                                          // color: Colors.pinkAccent,
                                          // height: 120,
                                          height: 55,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .topBrandResponse!.data!.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(() =>
                                                        ProductPage(
                                                          image: '${AppConstants.BASE_URL}${controller.topBrandResponse!.data![index].brand!.banner ?? ""}',
                                                          title: controller.topBrandResponse!.data![index].brand!.name ?? "",
                                                          details: controller.topBrandResponse!.data![index].brand!.details ?? "",
                                                          page: AppConstants.BRAND,
                                                          id: controller.topBrandResponse!.data![index].brand!.id!.toString(),
                                                          pageId: mainPageController.homePageAllDataResponse?.data?[index].pageId,
                                                        ));
                                                    // Get.to(()=>
                                                    //     ProductPage(
                                                    //       image: '${AppConstants.BASE_URL}${controller.topBrandResponse!.data![index].brand!.banner}',
                                                    //       title: controller.topBrandResponse!.data![index].brand!.name??"",
                                                    //       details: controller.topBrandResponse!.data![index].brand!.details??"",
                                                    //       page: AppConstants.BRAND,
                                                    //       id: controller.topBrandResponse!.data![index].brand!.id!.toString(),
                                                    //     ));
                                                  },
                                                  child: Container(
                                                    // color: Color(0xffF8F7F2),
                                                    color: const Color(0xffFFFFFF),
                                                    height: 55, width: 75,
                                                    child: CustomImageCached(
                                                      image: '${AppConstants.BASE_URL}${controller.topBrandResponse?.data?[index]?.brand?.logo??""}',
                                                      isRound: false,
                                                      height: 55,
                                                      width: 75,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),*/
                                    ],
                                  ),
                                )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      );
    });
  }


}
