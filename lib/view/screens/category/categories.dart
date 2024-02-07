import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/category/category_page_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_shimmer.dart';
import 'package:isletestapp/view/screens/brand_page/brand_page.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';

import '../../../controller/product/product_controller.dart';

class CategoryScreen extends StatefulWidget {
  bool isClickBrands = false;
  bool isClickBrands2 = false;
  final int selectedCatIndex;
  final bool isfromDash;
  int? selectedIndex;

  CategoryScreen(
      {Key? key, required this.selectedCatIndex, required this.isfromDash, this.selectedIndex})
      : super(key: key);

  @override
  State<CategoryScreen> createState() => _ProductListState();
}

class _ProductListState extends State<CategoryScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      Get.find<CategoryPageController>().dataInitialize();
      // selectedIndex=widget.selectedCatIndex;
      print(Get.find<AuthController>().getUserId());
      CategoryPageController categoryPageController = Get.find<CategoryPageController>();
      categoryPageController.selectedIndex = widget.selectedIndex ?? 0;
      // print(Get.find<AuthController>().getUserEmail());
      print("dkfkdsf");
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<CategoryPageController>().disclose();
  }

  String extractDiscount(String title){
    String removeDiscount = title.replaceAll(RegExp(r'[^0-9]'), '');
    log('Remove: $removeDiscount');
    return removeDiscount;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryPageController>(
      autoRemove: false,
        builder: (controller) {
          return GetBuilder<ProductListController>(builder: (pageController) {
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
                leadingWidth: Get.width / 2.7,
                title: const CustomLogo(),
              ),
              // backgroundColor: Color(0xffEBEFF3),
              backgroundColor: const Color(0xffFFFFFF),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Center(
                          child: controller.alldata!.isEmpty ?
                          const MyShimmer(hight: 40) :
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: controller.alldata?.asMap().entries.map((item){
                                  return Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: GestureDetector(
                                        onTap: () {
                                          controller.getNestedSectionData(item.value.id.toString());
                                          controller.getNestedCatSubCatData(item.value.id.toString());
                                          controller.getNestedBrandsData(item.value.id.toString());
                                          controller.selectedIndex = item.key;
                                          setState(() {});
                                          log('Gender Id 1: ${item.value.id}');
                                        },
                                        child: Container(
                                          // color: Colors.red,
                                          width: 90,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                item.value.title ?? "",
                                                style: controller.selectedIndex == item.key ? railway.copyWith(
                                                    height: 1.5,
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold) : railway.copyWith(
                                                    height: 1.5,
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),),
                                              const SizedBox(height: 5),
                                              controller.selectedIndex == item.key ?
                                              Container(
                                                color: gold,
                                                height: 2, width: 70,

                                              ) : Container()
                                            ],
                                          ),
                                        )),
                                  );
                                }).toList() ?? [],
                              )
                          // ListView.builder(
                          //     itemCount: controller.alldata!.length,
                          //     physics: const AlwaysScrollableScrollPhysics(),
                          //     scrollDirection: Axis.horizontal,
                          //     shrinkWrap: true,
                          //     itemBuilder: (context, index) {
                          //       return Padding(
                          //         padding: const EdgeInsets.all(8),
                          //         child: InkWell(
                          //             onTap: () {
                          //               controller.getNestedSectionData(controller.alldata![index].id.toString());
                          //               controller.getNestedCatSubCatData(controller.alldata![index].id.toString());
                          //               controller.getNestedBrandsData(controller.alldata![index].id.toString());
                          //               controller.selectedIndex = index;
                          //               setState(() {});
                          //               log('Gender Id 1: ${controller.alldata![index].id}');
                          //             },
                          //             child: Column(
                          //               mainAxisAlignment: MainAxisAlignment.center,
                          //               children: [
                          //
                          //                 Padding(
                          //                   padding: const EdgeInsets.symmetric(horizontal: 35),
                          //                   child: Text(
                          //                     controller.alldata?[index]?.title ?? "",
                          //                     style: controller.selectedIndex == index ? railway.copyWith(
                          //                         height: 1.5,
                          //                         color: Colors.black,
                          //                         fontSize: 18,
                          //                         fontWeight: FontWeight.bold) : railway.copyWith(
                          //                         height: 1.5,
                          //                         color: Colors.black,
                          //                         fontSize: 18,
                          //                         fontWeight: FontWeight.bold),),
                          //                 ),
                          //                 const SizedBox(height: 5),
                          //                 controller.selectedIndex == index ?
                          //                 Container(
                          //                   color: gold,
                          //                   height: 2, width: 70,
                          //
                          //                 ) : Container()
                          //               ],
                          //             )),
                          //       );
                          //     })
                      ),
                      const SizedBox(height: 0,),

                      /// view

                      controller.nestedSectionResponse != null &&
                          controller.nestedSectionResponse!.data != null &&
                          controller.nestedSectionResponse!.data!.isNotEmpty
                          ? Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                /// ====/@ Nested Section Index- 1, 2, 3 Response @/====
                                ListView.builder(
                                    itemCount: controller.nestedSectionResponse!.data!.length >= 3 ? 3 : controller.nestedSectionResponse!.data!.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      log('====/@ Image Issue: ${'${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].hoverBanner ?? ""}'}');
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(() =>
                                                  ProductPage(
                                                    image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data![index].banner ?? ""}',
                                                    title: controller.nestedSectionResponse?.data?[index]?.title ?? "",
                                                    details: controller.nestedSectionResponse?.data?[index]?.details ?? "",
                                                    page: AppConstants.SECTION,
                                                    id: controller.nestedSectionResponse?.data![index].id!.toString() ?? '',
                                                    parentId: controller.nestedSectionResponse?.data?[index]?.id ?? 0,
                                                    pageId: controller.nestedSectionResponse?.data?[index].pageId,
                                                  ));
                                              // if (index == 2) {
                                              //   log('============================================ Index2: $index');
                                              //   // Get.to(() =>
                                              //   //     ProductPage(
                                              //   //       image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].banner ?? ""}',
                                              //   //       title: controller.nestedSectionResponse?.data?[index]?.title ?? "",
                                              //   //       details: controller.nestedSectionResponse?.data?[index]?.details ?? "",
                                              //   //       page: AppConstants.SECTION,
                                              //   //       id: '1',
                                              //   //       indexId: index,
                                              //   //     ));
                                              //   Get.to(()=> ProductPage(
                                              //     image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data![index].banner ?? ""}',
                                              //     title: controller.nestedSectionResponse?.data?[index]?.title ?? "",
                                              //     details: controller.nestedSectionResponse?.data?[index]?.shortDescription ?? "",
                                              //     page: AppConstants.SECTION,
                                              //     id: controller.nestedSectionResponse?.data![index].id!.toString() ?? '',
                                              //     pageId: controller.nestedSectionResponse?.data?[index].pageId,
                                              //     indexId: index,
                                              //   ));
                                              // } else{
                                              //   Get.to(() =>
                                              //       ProductPage(
                                              //         image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data![index].banner ?? ""}',
                                              //         title: controller.nestedSectionResponse?.data?[index]?.title ?? "",
                                              //         details: controller.nestedSectionResponse?.data?[index]?.details ?? "",
                                              //         page: AppConstants.SECTION,
                                              //         id: controller.nestedSectionResponse?.data![index].id!.toString() ?? '',
                                              //         parentId: controller.nestedSectionResponse?.data?[index]?.id ?? 0,
                                              //         pageId: controller.nestedSectionResponse?.data?[index].pageId,
                                              //       ));
                                              // }
                                              log('==============@ GenderId: ${controller.nestedSectionResponse!.data![index].id!.toString() ?? ''}');
                                            },
                                            child: SizedBox(
                                              height: 110,
                                              // color: Colors.green,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 5,
                                                      child: SizedBox(
                                                        height: 40,
                                                        // color: Colors.pinkAccent,
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .only(left: 15),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.nestedSectionResponse!.data![index].isDrop =
                                                                  !controller.nestedSectionResponse!.data![index].isDrop;
                                                                  setState(() {});
                                                                },
                                                                child: SizedBox(
                                                                  height: 40,
                                                                  child: Center(
                                                                    child: Text(
                                                                      controller.nestedSectionResponse!.data![index].title ?? "",
                                                                      style: railway.copyWith(
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                          fontSize: 16),),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    controller.nestedSectionResponse!.data![index].isDrop =
                                                                    !controller.nestedSectionResponse!.data![index].isDrop;
                                                                    setState(() {});
                                                                  },
                                                                  child: const SizedBox(
                                                                    // color: Colors.purple,
                                                                      height: 40,
                                                                      width: 5)),

                                                              // widget.isExpanded1?
                                                              controller.nestedSectionResponse!.data![index].isDrop ?
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.nestedSectionResponse!.data![index].isDrop =
                                                                  !controller.nestedSectionResponse!.data![index].isDrop;
                                                                  setState(() {});
                                                                },
                                                                child: SizedBox(
                                                                  height: 40,
                                                                  // color: Colors. blue,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 3),
                                                                    child: Image.asset(
                                                                      Images.up,
                                                                      color: Colors.black,
                                                                      height: 22,
                                                                      width: 17,),
                                                                  ),
                                                                ),
                                                              ) :
                                                              InkWell(
                                                                  onTap: () {
                                                                    controller.nestedSectionResponse!.data![index].isDrop =
                                                                    !controller.nestedSectionResponse!.data![index].isDrop;
                                                                    setState(() {});
                                                                  },
                                                                  child: SizedBox(
                                                                      height: 40,
                                                                      // color: Colors. blue,
                                                                      child: Image.asset(
                                                                        Images.drop,
                                                                        color: Colors.black,
                                                                        height: 22,
                                                                        width: 22,))),
                                                              // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                          color: const Color(0xffFFFFFF),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 0),
                                                            child: CustomImageCached(
                                                              image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].hoverBanner ?? ""}',
                                                              fit: BoxFit.cover,
                                                              isRound: false,
                                                            ),
                                                            // child: Image.network("https://ounass-qa.atgcdn.ae/small_light(of=webp)/pub/media/catalog/category/MW_App_Cat_New_In_WK32.jpg",fit: BoxFit.fill,),
                                                          ))
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            height: 3,
                                            thickness: 3,
                                            color: Color(0xffF2F6F9),
                                            // color: Colors.pink,
                                          ),
                                          // widget.isExpanded1?
                                          controller.nestedSectionResponse!.data![index].isDrop ?
                                          Column(
                                            children: [
                                              ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  // itemCount: drawerdrop.length,
                                                  itemCount: controller.nestedSectionResponse!.data![index].children!.length,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.vertical,
                                                  physics: const ClampingScrollPhysics(),
                                                  itemBuilder: (
                                                      BuildContext context,
                                                      int index2) {
                                                    return Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                // if (index == 2) {
                                                                //   log('============================================ Index2: $index');
                                                                //   Get.to(()=> ProductPage(
                                                                //     image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].children![index2].banner ?? ""}',
                                                                //     title: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.title ?? "",
                                                                //     details: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.details ?? "",
                                                                //     page: AppConstants.SECTION,
                                                                //     id: controller.nestedSectionResponse!.data![index].children![index2].id!.toString(),
                                                                //     parentId: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.parentSectionId ?? 0,
                                                                //     pageId: controller.nestedSectionResponse?.data?[index].pageId,
                                                                //     indexId: index,
                                                                //   ));
                                                                // } else{
                                                                //   Get.to(() =>
                                                                //       ProductPage(
                                                                //         image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].children![index2].banner ?? ""}',
                                                                //         title: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.title ?? "",
                                                                //         details: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.details ?? "",
                                                                //         page: AppConstants.SECTION,
                                                                //         id: controller.nestedSectionResponse!.data![index].children![index2].id!.toString(),
                                                                //         parentId: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.parentSectionId ?? 0,
                                                                //         pageId: controller.nestedSectionResponse?.data?[index].pageId,
                                                                //       ));
                                                                // }

                                                                Get.to(() =>
                                                                    ProductPage(
                                                                      image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].children![index2].banner ?? ""}',
                                                                      title: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.title ?? "",
                                                                      details: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.details ?? "",
                                                                      page: AppConstants.SECTION,
                                                                      id: controller.nestedSectionResponse!.data![index].children![index2].id!.toString(),
                                                                      parentId: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.parentSectionId ?? 0,
                                                                      pageId: controller.nestedSectionResponse?.data?[index].pageId,
                                                                    ));
                                                                log('===============================================================@ ${controller.nestedSectionResponse?.data?[index]?.children?[index2]?.parentSectionId ?? ''}');
                                                              },
                                                              child: Container(
                                                                alignment: Alignment.centerLeft,
                                                                color: const Color(
                                                                    0xffF2F6F9),
                                                                // color: Colors.purpleAccent,
                                                                height: 50,
                                                                width: Get.width,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 30),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        controller.nestedSectionResponse!.data![index].children![index2].title ?? "",
                                                                        style: poppins
                                                                            .copyWith(
                                                                            fontSize: 12,
                                                                            fontWeight: FontWeight.w200,
                                                                            color: Colors.black87
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          width: 5),
                                                                      InkWell(
                                                                        onTap: () {
                                                                          controller.nestedSectionResponse!.data![index].children![index2].isDrop2 =
                                                                          !controller.nestedSectionResponse!.data![index].children![index2].isDrop2;
                                                                          setState(() {});
                                                                        },
                                                                        child: SizedBox(
                                                                          height: 50,
                                                                          width: 100,
                                                                          // color: Colors.green,
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                            children: [
                                                                              const SizedBox(width: 5),
                                                                              // widget.childexp1?
                                                                              controller.nestedSectionResponse!.data![index].children![index2].isDrop2 ?
                                                                              Padding(padding: const EdgeInsets.only(right: 12),
                                                                                child: controller.nestedSectionResponse!.data![index].children![index2].children!.isNotEmpty
                                                                                    ? Image.asset(Images.up,
                                                                                  color: Colors.black,
                                                                                  height: 22,
                                                                                  width: 15,)
                                                                                    : const SizedBox())
                                                                                  : controller.nestedSectionResponse!.data![index].children![index2].children!.isNotEmpty
                                                                                  ? Padding(padding: const EdgeInsets.only(right: 12),
                                                                                child: Image.asset(Images.drop,
                                                                                  color: Colors.black,
                                                                                  height: 22,
                                                                                  width: 20,),
                                                                              ) : const SizedBox(),
                                                                              // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            // widget.childexp1?
                                                            controller.nestedSectionResponse!.data![index].children![index2].isDrop2 ?
                                                            Container(
                                                              // color: Colors.red,
                                                              // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                                              child: Column(
                                                                children: [
                                                                  ListView.builder(
                                                                      padding: EdgeInsets.zero,
                                                                      // itemCount: drawerdrop.length,
                                                                      itemCount: controller.nestedSectionResponse!.data![index].children![index2].children!.length,
                                                                      shrinkWrap: true,
                                                                      scrollDirection: Axis.vertical,
                                                                      physics: const ClampingScrollPhysics(),
                                                                      itemBuilder: (BuildContext context, int index3) {
                                                                        return
                                                                          Column(
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.to(() =>
                                                                                      ProductPage(
                                                                                        image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.banner ?? ""}',
                                                                                        title: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.title ?? "",
                                                                                        details: controller.nestedSectionResponse?.data?[index]?.children?[index2].children?[index3]?.details ?? "",
                                                                                        page: AppConstants.CHILDSECTION,
                                                                                        id: controller.nestedSectionResponse!.data![index].children![index2].children![index3].id!.toString(),
                                                                                        pageId: controller.nestedSectionResponse?.data?[index].pageId,
                                                                                        parentId: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.parentSectionId ?? 0,
                                                                                      ));
                                                                                },
                                                                                child: Container(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  color: const Color(0xffFAFAFA),
                                                                                  height: 50,
                                                                                  width: Get.width,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 50,
                                                                                        right: 12),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [

                                                                                        Text(
                                                                                          controller.nestedSectionResponse!.data![index].children![index2].children![index3].title ?? "",
                                                                                          style: poppins.copyWith(
                                                                                              fontSize: 12,
                                                                                              fontWeight: FontWeight.w200,
                                                                                              color: Colors.black87
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                      }

                                                                  ),
                                                                  // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                                                ],
                                                              ),
                                                            ) : Container(),

                                                          ],
                                                        ),

                                                      ],
                                                    );
                                                  }
                                              ),
                                              // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                            ],
                                          ) : Container(),
                                        ],
                                      );
                                    }
                                ),

                                /// ====/@ Brand Response @/====
                                controller.nestedBrandsResponse != null && controller.nestedBrandsResponse!.data != null && controller.nestedBrandsResponse!.data!.isNotEmpty
                                    ? ListView.builder(
                                    itemCount: 1,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(()=>
                                                  BrandScreen(
                                                      pageId: controller.nestedBrandsResponse!.data![index].pageId,
                                                      selectIndex: controller.selectedIndex,
                                                      buttonBar: true,
                                                  ));
                                              log('Gender Id: ${controller.alldata![index].id}');
                                            },
                                            child: SizedBox(
                                              height: 110,
                                              // color: Colors.green,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 5,
                                                      child: SizedBox(
                                                        height: 40,
                                                        // color: Colors.pinkAccent,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 15),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              SizedBox(
                                                                height: 40,
                                                                child: Center(
                                                                  child: Text("BRANDS",
                                                                    style: railway.copyWith(
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Colors.black87,
                                                                        fontSize: 16
                                                                    )),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    widget.isClickBrands = !widget.isClickBrands;
                                                                    setState(() {});
                                                                  },
                                                                  child: const SizedBox(
                                                                    // color: Colors.purple,
                                                                      height: 40,
                                                                      width: 5)),

                                                              widget.isClickBrands
                                                                  ? InkWell(
                                                                onTap: () {
                                                                  widget.isClickBrands = !widget.isClickBrands;
                                                                  setState(() {});
                                                                },
                                                                child: SizedBox(
                                                                  height: 40,
                                                                  // color: Colors. blue,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 3),
                                                                    child: Image.asset(Images.up,
                                                                      color: Colors.black,
                                                                      height: 22,
                                                                      width: 17,),
                                                                  ),
                                                                ),
                                                              ) : InkWell(
                                                                  onTap: () {
                                                                    widget.isClickBrands = !widget.isClickBrands;
                                                                    setState(() {});
                                                                  },
                                                                  child: SizedBox(
                                                                      height: 40,
                                                                      // color: Colors. blue,
                                                                      child: Image.asset(
                                                                        Images.drop,
                                                                        color: Colors.black,
                                                                        height: 22,
                                                                        width: 22,))),
                                                              // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                          color: const Color(0xffFFFFFF),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 0),
                                                            child: CustomImageCached(
                                                              placeholder: "assets/image/placeholder.png",
                                                              image: '${AppConstants.BASE_URL}${""}',
                                                              fit: BoxFit.cover,
                                                              isRound: false,
                                                            ),
                                                            // child: Image.network("https://ounass-qa.atgcdn.ae/small_light(of=webp)/pub/media/catalog/category/MW_App_Cat_New_In_WK32.jpg",fit: BoxFit.fill,),
                                                          ))
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            height: 3,
                                            thickness: 3,
                                            color: Color(0xffF2F6F9),
                                            // color: Colors.pink,
                                          ),
                                          // widget.isExpanded1?
                                          widget.isClickBrands ?
                                          Column(
                                            children: [
                                              ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  itemCount: controller.nestedBrandsResponse?.data?.length ?? 0,
                                                  // itemCount: controller.nestedBrandsResponse!.data!.length??0,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.vertical,
                                                  physics: const ClampingScrollPhysics(),
                                                  itemBuilder: (BuildContext context, int index2) {
                                                    return Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Get.to(()=> ProductPage(
                                                                  image: '${AppConstants.BASE_URL}${controller.nestedBrandsResponse!.data![index2].banner ?? ""}',
                                                                  title: controller.nestedBrandsResponse?.data?[index2].name ?? "",
                                                                  details: controller.nestedSectionResponse?.data?[index2].shortDescription ?? "",
                                                                  page: AppConstants.brandType,
                                                                  id: controller.nestedBrandsResponse?.data?[index2].id?.toString(),
                                                                  pageId: controller.nestedBrandsResponse?.data?[index2].pageId
                                                                ));
                                                              },
                                                              child: Container(
                                                                alignment: Alignment.centerLeft,
                                                                color: const Color(
                                                                    0xffF2F6F9),
                                                                // color: Colors.purpleAccent,
                                                                height: 50,
                                                                width: Get.width,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 30),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Text(controller.nestedBrandsResponse!.data![index2].name ?? "",
                                                                        style: poppins.copyWith(
                                                                            fontSize: 12,
                                                                            fontWeight: FontWeight.w200,
                                                                            color: Colors.black87
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          width: 5),
                                                                      InkWell(
                                                                        onTap: () {
                                                                          controller.nestedBrandsResponse!.data![index].brands![index2].isDrop =
                                                                          !controller.nestedBrandsResponse!.data![index].brands![index2].isDrop;
                                                                          setState(() {});
                                                                        },
                                                                        child: SizedBox(
                                                                          height: 50,
                                                                          width: 100,
                                                                          // color: Colors.green,
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                            children: [
                                                                              const SizedBox(width: 5),
                                                                              controller.nestedBrandsResponse!.data![index].brands![index2].isDrop
                                                                                  ? Padding(
                                                                                padding: const EdgeInsets.only(right: 12),
                                                                                child: controller.nestedSectionResponse!.data!.isNotEmpty
                                                                                    ? Image.asset(Images.up,
                                                                                  color: Colors.black,
                                                                                  height: 22,
                                                                                  width: 15,)
                                                                                    : const SizedBox())
                                                                                  : controller.nestedSectionResponse!.data!.isNotEmpty
                                                                                  ? Padding(padding: const EdgeInsets.only(right: 12),
                                                                                child: Image.asset(Images.drop,
                                                                                  color: Colors.black,
                                                                                  height: 22,
                                                                                  width: 20),
                                                                              ) : const SizedBox(),
                                                                              // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            controller.nestedBrandsResponse!.data![index].brands![index2].isDrop ?
                                                            Container(
                                                              // color: Colors.red,
                                                              // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                                              child: Column(
                                                                children: [
                                                                  ListView.builder(
                                                                      padding: EdgeInsets.zero,
                                                                      itemCount: controller.nestedBrandsResponse!.data![index].brands!.length,
                                                                      shrinkWrap: true,
                                                                      scrollDirection: Axis.vertical,
                                                                      physics: const ClampingScrollPhysics(),
                                                                      itemBuilder: (
                                                                          BuildContext context,
                                                                          int index3) {
                                                                        return
                                                                          Column(
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.to(() =>
                                                                                      ProductPage(
                                                                                        image: '${AppConstants.BASE_URL}${controller.nestedBrandsResponse?.data?[index2].banner ?? ""}',
                                                                                        title: controller.nestedBrandsResponse?.data?[index2].brands?[index3].name ?? "",
                                                                                        details: controller.nestedBrandsResponse?.data?[index2].details ?? "",
                                                                                        page: AppConstants.BRAND,
                                                                                        id: controller.nestedBrandsResponse?.data?[index2].brands?[index3].id?.toString(),
                                                                                        pageId: controller.nestedBrandsResponse?.data?[index2].pageId
                                                                                      ));
                                                                                  // log('===============/@ Page Id: ${controller.nestedBrandsResponse!.data![index].brands![index3]!.megaMenuBrands?[index3].pageId}');
                                                                                },
                                                                                child: Container(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  color: const Color(0xffFAFAFA),
                                                                                  height: 50,
                                                                                  width: Get.width,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 50,
                                                                                        right: 12),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          controller.nestedBrandsResponse!.data![index].brands![index3].name ?? "",
                                                                                          style: poppins.copyWith(
                                                                                              fontSize: 12,
                                                                                              fontWeight: FontWeight.w200,
                                                                                              color: Colors.black87
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                      }

                                                                  ),
                                                                  // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                                                ],
                                                              ),
                                                            ) : Container(),

                                                          ],
                                                        ),

                                                      ],
                                                    );
                                                  }
                                              ),
                                              // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                            ],
                                          ) : Container(),
                                        ],
                                      );
                                    }
                                ) : const SizedBox(),

                                /// ====/@ Nested Category Response @/====
                                ListView.builder(
                                    itemCount: controller.nestedCategoryResponse?.data?.length ?? 0,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(() =>
                                                  ProductPage(
                                                    image: '${AppConstants.BASE_URL}${controller.nestedCategoryResponse!.data![index].banner ?? ""}',
                                                    title: controller.nestedCategoryResponse?.data?[index]?.title ?? "",
                                                    details: controller.nestedCategoryResponse?.data?[index]?.details ?? "",
                                                    id: controller.nestedCategoryResponse!.data![index].id!.toString(),
                                                    page: AppConstants.CATEGORY,
                                                    parentId: controller.nestedCategoryResponse?.data?[index]?.id ?? 0,
                                                  ));
                                            },
                                            child: SizedBox(
                                              height: 110,
                                              // color: Colors.green,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 5,
                                                      child: SizedBox(
                                                        height: 40,
                                                        // color: Colors.pinkAccent,
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .only(left: 15),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .start,
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.nestedCategoryResponse!.data![index].isDrop =
                                                                  !controller.nestedCategoryResponse!.data![index].isDrop;
                                                                  setState(() {});
                                                                },
                                                                child: SizedBox(
                                                                  height: 40,
                                                                  child: Center(
                                                                    child: Text(
                                                                      controller.nestedCategoryResponse!.data![index].title ?? "",
                                                                      style: railway.copyWith(
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                          fontSize: 16),),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    controller.nestedCategoryResponse!.data![index].isDrop =
                                                                    !controller.nestedCategoryResponse!.data![index].isDrop;
                                                                    setState(() {});
                                                                  },
                                                                  child: const SizedBox(
                                                                    // color: Colors.purple,
                                                                      height: 40,
                                                                      width: 5)),

                                                              // widget.isExpanded1?
                                                              controller.nestedCategoryResponse!.data![index].isDrop ?
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.nestedCategoryResponse!.data![index].isDrop =
                                                                  !controller.nestedCategoryResponse!.data![index].isDrop;
                                                                  setState(() {});
                                                                },
                                                                child: SizedBox(
                                                                  height: 40,
                                                                  // color: Colors. blue,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left: 3),
                                                                    child: Image
                                                                        .asset(
                                                                      Images.up,
                                                                      color: Colors
                                                                          .black,
                                                                      height: 22,
                                                                      width: 17,),
                                                                  ),
                                                                ),
                                                              ) :
                                                              InkWell(
                                                                  onTap: () {
                                                                    controller.nestedCategoryResponse!.data![index].isDrop =
                                                                    !controller.nestedCategoryResponse!.data![index].isDrop;
                                                                    setState(() {});
                                                                  },
                                                                  child: SizedBox(
                                                                      height: 40,
                                                                      // color: Colors. blue,
                                                                      child: Image.asset(
                                                                        Images.drop,
                                                                        color: Colors.black,
                                                                        height: 22,
                                                                        width: 22,))),
                                                              // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                          color: const Color(
                                                              0xffFFFFFF),
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .only(left: 0),
                                                            child: CustomImageCached(
                                                              image: '${AppConstants.BASE_URL}${controller.nestedCategoryResponse!.data![index].hoverBanner ?? ""}',
                                                              fit: BoxFit.cover,
                                                              isRound: false,
                                                            ),
                                                            // child: Image.network("https://ounass-qa.atgcdn.ae/small_light(of=webp)/pub/media/catalog/category/MW_App_Cat_New_In_WK32.jpg",fit: BoxFit.fill,),
                                                          ))
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            height: 3,
                                            thickness: 3,
                                            color: Color(0xffF2F6F9),
                                            // color: Colors.pink,
                                          ),
                                          // widget.isExpanded1?
                                          controller.nestedCategoryResponse!
                                              .data![index].isDrop ?
                                          Container(
                                            // color: Colors.red,
                                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    // itemCount: drawerdrop.length,
                                                    itemCount: controller.nestedCategoryResponse!.data![index].subCategories!.length,
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis
                                                        .vertical,
                                                    physics: const ClampingScrollPhysics(),
                                                    itemBuilder: (
                                                        BuildContext context,
                                                        int index2) {
                                                      return Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  // Get.to(  ProductPage(
                                                                  //   image: '${AppConstants.BASE_URL}${controller.nestedCategoryResponse!.data![index].subCategories![index2]!.banner?? ""}',
                                                                  //   title: controller.nestedSectionResponse?.data?[index]?.title??"",
                                                                  //   details: controller.nestedSectionResponse?.data?[index]?.details??"",
                                                                  //   page: AppConstants.SUBCATEGORY,
                                                                  //   id: controller.nestedCategoryResponse!.data![index].subCategories![index2].id!.toString(),
                                                                  // ));

                                                                  Get.to(() =>
                                                                      ProductPage(
                                                                        image: '${AppConstants.BASE_URL}${controller.nestedCategoryResponse!.data![index].subCategories![index2].banner ?? ""}',
                                                                        title: controller.nestedCategoryResponse!.data![index].subCategories![index2]?.title ?? "",
                                                                        details: controller.nestedCategoryResponse!.data![index].subCategories![index2]?.details ?? "",
                                                                        page: AppConstants.SUBCATEGORY,
                                                                        id: controller.nestedCategoryResponse!.data![index].subCategories![index2].id!.toString(),
                                                                        parentId: controller.nestedCategoryResponse?.data?[index]?.subCategories?[index2]?.id ?? 0,
                                                                      ));
                                                                  log('===============================================================@ ${controller.nestedSectionResponse?.data?[index]?.children?[index2]?.parentSectionId ?? ''}');
                                                                },
                                                                child: Container(
                                                                  alignment: Alignment
                                                                      .centerLeft,
                                                                  color: const Color(
                                                                      0xffF2F6F9),
                                                                  // color: Colors.purpleAccent,
                                                                  height: 50,
                                                                  width: Get
                                                                      .width,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left: 30),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment
                                                                          .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          // "${drawerdrop[index]}",
                                                                          controller.nestedCategoryResponse!.data![index].subCategories![index2].title ?? "",
                                                                          style: poppins.copyWith(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w200,
                                                                              color: Colors.black87
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width: 5),
                                                                        InkWell(
                                                                          onTap: () {
                                                                            controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2 =
                                                                            !controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2;
                                                                            setState(() {});
                                                                          },
                                                                          child: SizedBox(
                                                                            height: 50,
                                                                            width: 100,
                                                                            // color: Colors.green,
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                const SizedBox(
                                                                                    width: 5),
                                                                                // widget.childexp1?
                                                                                controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2 ?
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(right: 12),
                                                                                  child: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.isNotEmpty
                                                                                      ? Image.asset(Images.up,
                                                                                    color: Colors.black,
                                                                                    height: 22,
                                                                                    width: 15,) : const SizedBox(),
                                                                                ) :
                                                                                controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.isNotEmpty ?
                                                                                Padding(
                                                                                  padding: const EdgeInsets
                                                                                      .only(
                                                                                      right: 12),
                                                                                  child: Image
                                                                                      .asset(
                                                                                    Images
                                                                                        .drop,
                                                                                    color: Colors
                                                                                        .black,
                                                                                    height: 22,
                                                                                    width: 20,),
                                                                                )
                                                                                    : const SizedBox(),
                                                                                // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // widget.childexp1?
                                                              controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2 ?
                                                              Container(
                                                                // color: Colors.red,
                                                                // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                                                child: Column(
                                                                  children: [
                                                                    ListView.builder(
                                                                        padding: EdgeInsets.zero,
                                                                        // itemCount: drawerdrop.length,
                                                                        itemCount: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.length,
                                                                        shrinkWrap: true,
                                                                        scrollDirection: Axis.vertical,
                                                                        physics: const ClampingScrollPhysics(),
                                                                        itemBuilder: (
                                                                            BuildContext context,
                                                                            int index3) {
                                                                          return
                                                                            Column(
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    Get.to(() =>
                                                                                        ProductPage(
                                                                                          image: '${AppConstants.BASE_URL}${controller.nestedCategoryResponse?.data?[index]?.subCategories?[index2]?.childCategories?[index3]?.banner ?? ""}',
                                                                                          title: controller.nestedCategoryResponse?.data?[index]?.subCategories?[index2]?.childCategories?[index3]?.title ?? "",
                                                                                          details: controller.nestedCategoryResponse?.data?[index]?.subCategories?[index2]?.childCategories?[index3]?.details ?? "",
                                                                                          page: AppConstants.CHILDCATEGORY,
                                                                                          id: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories![index3].id!.toString(),
                                                                                          parentId: controller.nestedCategoryResponse?.data?[index]?.subCategories?[index2]?.categoryId ?? 0,
                                                                                        ));
                                                                                  },
                                                                                  child: Container(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    color: const Color(
                                                                                        0xffFAFAFA),
                                                                                    height: 50,
                                                                                    width: Get.width,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.only(
                                                                                          left: 50,
                                                                                          right: 12),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [

                                                                                          Text(
                                                                                            // "${drawerdrop[index]}",
                                                                                            controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories![index3].title ?? "",
                                                                                            style: poppins.copyWith(
                                                                                                fontSize: 12,
                                                                                                fontWeight: FontWeight.w200,
                                                                                                color: Colors.black87
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                        }

                                                                    ),
                                                                    // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                                                  ],
                                                                ),
                                                              ) : Container(),

                                                            ],
                                                          ),

                                                        ],
                                                      );
                                                    }
                                                ),
                                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                              ],
                                            ),
                                          ) : Container(),
                                        ],
                                      );
                                    }
                                ),

                                /// ====/@ Nested Section Index- 4, 5, 6 Response @/====
                                controller.nestedSectionResponse!.data!.length > 3
                                    ? ListView.builder(
                                    itemCount: controller.nestedSectionResponse!
                                        .data!.length - 3,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context,
                                        int indexm) {
                                      int index = indexm + 3;
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              // if (index == 4) {
                                              //   Get.to(() =>
                                              //       ProductPage(
                                              //         image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].banner ?? ""}',
                                              //         title: controller.nestedSectionResponse?.data?[index]?.title ?? "",
                                              //         details: controller.nestedSectionResponse?.data?[index]?.details ?? "",
                                              //         page: AppConstants.SECTION,
                                              //         id: controller.nestedSectionResponse!.data![index].id!.toString(),
                                              //         indexId: index,
                                              //         pageId: controller.nestedSectionResponse?.data?[index].pageId! ?? 0,
                                              //         parentId: controller.nestedSectionResponse?.data?[index]?.id ?? 0,
                                              //       ));
                                              // } else {
                                              //   Get.to(() =>
                                              //       ProductPage(
                                              //         image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data?[index].banner ?? ""}',
                                              //         title: controller.nestedSectionResponse?.data?[index].title ?? "",
                                              //         details: controller.nestedSectionResponse?.data?[index].details ?? "",
                                              //         page: AppConstants.SECTION,
                                              //         id: controller.nestedSectionResponse!.data![index].id!.toString(),
                                              //         parentId: controller.nestedSectionResponse?.data?[index].id ?? 0,
                                              //       ));
                                              // }
                                              Get.to(() =>
                                                  ProductPage(
                                                    image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data?[index].banner ?? ""}',
                                                    title: controller.nestedSectionResponse?.data?[index].title ?? "",
                                                    details: controller.nestedSectionResponse?.data?[index].details ?? "",
                                                    page: AppConstants.SECTION,
                                                    id: controller.nestedSectionResponse!.data![index].id!.toString(),
                                                    pageId: controller.nestedSectionResponse?.data?[index].pageId! ?? 0,
                                                    parentId: controller.nestedSectionResponse?.data?[index].id ?? 0,
                                                  ));
                                              log('====/@ ${controller.nestedSectionResponse?.data?[index].parentSectionId ?? ''}');
                                              // Get.to(
                                              //     ProductPage(
                                              //       image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].banner?? ""}',
                                              //       title: controller.nestedSectionResponse?.data?[index]?.title??"",
                                              //       details: controller.nestedSectionResponse?.data?[index]?.details??"",
                                              //       page: AppConstants.SECTION,
                                              //       id: controller.nestedSectionResponse!.data![index].id!.toString(),
                                              //     ));
                                            },
                                            child: SizedBox(
                                              height: 110,
                                              // color: Colors.green,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 5,
                                                      child: SizedBox(
                                                        height: 40,
                                                        // color: Colors.pinkAccent,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 15),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.nestedSectionResponse!.data![index].isDrop =
                                                                  !controller.nestedSectionResponse!.data![index].isDrop;
                                                                  setState(() {});
                                                                },
                                                                child: SizedBox(
                                                                  height: 40,
                                                                  child: Center(
                                                                    child: Text(
                                                                      controller.nestedSectionResponse!.data![index].title ?? "",
                                                                      style: railway.copyWith(
                                                                          fontWeight: FontWeight.w500,
                                                                          color: controller.nestedSectionResponse!.data![index]!.title == "SALE" ?
                                                                          Colors.red : Colors.black87,
                                                                          fontSize: 16),),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    controller.nestedSectionResponse!.data![index].isDrop =
                                                                    !controller.nestedSectionResponse!.data![index].isDrop;
                                                                    setState(() {});
                                                                  },
                                                                  child: const SizedBox(
                                                                    // color: Colors.purple,
                                                                      height: 40,
                                                                      width: 5)),

                                                              // widget.isExpanded1?
                                                              controller.nestedSectionResponse!.data![index].isDrop ?
                                                              InkWell(
                                                                onTap: () {
                                                                  controller.nestedSectionResponse!.data![index].isDrop =
                                                                  !controller.nestedSectionResponse!.data![index].isDrop;
                                                                  setState(() {});
                                                                },
                                                                child: SizedBox(
                                                                  height: 40,
                                                                  // color: Colors. blue,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 3),
                                                                    child: Image.asset(
                                                                      Images.up,
                                                                      color: Colors.black,
                                                                      height: 22,
                                                                      width: 17,),
                                                                  ),
                                                                ),
                                                              ) :
                                                              InkWell(
                                                                  onTap: () {
                                                                    controller.nestedSectionResponse!.data![index].isDrop =
                                                                    !controller.nestedSectionResponse!.data![index].isDrop;
                                                                    setState(() {});
                                                                  },
                                                                  child: SizedBox(
                                                                      height: 40,
                                                                      // color: Colors. blue,
                                                                      child: Image.asset(Images.drop,
                                                                        color: Colors.black,
                                                                        height: 22,
                                                                        width: 22,))),
                                                              // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                          color: const Color(0xffFFFFFF),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 0),
                                                            child: CustomImageCached(
                                                              image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].hoverBanner ?? ""}',
                                                              fit: BoxFit.fitWidth,
                                                              isRound: false,
                                                            ),
                                                            // child: Image.network("https://ounass-qa.atgcdn.ae/small_light(of=webp)/pub/media/catalog/category/MW_App_Cat_New_In_WK32.jpg",fit: BoxFit.fill,),
                                                          ))
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            height: 3,
                                            thickness: 3,
                                            color: Color(0xffF2F6F9),
                                            // color: Colors.pink,
                                          ),
                                          // widget.isExpanded1?
                                          controller.nestedSectionResponse!.data![index].isDrop
                                              ? Container(
                                            // color: Colors.red,
                                            // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    // itemCount: drawerdrop.length,
                                                    itemCount: controller.nestedSectionResponse!.data![index].children!.length,
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.vertical,
                                                    physics: const ClampingScrollPhysics(),
                                                    itemBuilder: (
                                                        BuildContext context,
                                                        int index2) {
                                                      return Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  // if (index == 4) {}
                                                                  // else {
                                                                  //   Get.to(
                                                                  //       ProductPage(
                                                                  //         image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].children![index2].banner ?? ""}',
                                                                  //         title: controller.nestedSectionResponse!.data![index].children![index2].title ?? "",
                                                                  //         details: controller.nestedSectionResponse!.data![index].children![index2].details ?? "",
                                                                  //         page: AppConstants.SUBSECTION,
                                                                  //         id: controller.nestedSectionResponse!.data![index].children![index2].id!.toString(),
                                                                  //
                                                                  //       ));
                                                                  // }
                                                                  Get.to(
                                                                      ProductPage(
                                                                        image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].children![index2].banner ?? ""}',
                                                                        title: controller.nestedSectionResponse!.data![index].children![index2].title ?? "",
                                                                        details: controller.nestedSectionResponse!.data![index].children![index2].details ?? "",
                                                                        page: AppConstants.SECTION,
                                                                        id: controller.nestedSectionResponse!.data![index].children![index2].id!.toString(),
                                                                        pageId: controller.nestedSectionResponse?.data?[index].pageId ?? 0,
                                                                        parentId: controller.nestedSectionResponse?.data?[index].id ?? 0,
                                                                      ));
                                                                },
                                                                child: Container(
                                                                  alignment: Alignment
                                                                      .centerLeft,
                                                                  color: const Color(
                                                                      0xffF2F6F9),
                                                                  // color: Colors.purpleAccent,
                                                                  height: 50,
                                                                  width: Get
                                                                      .width,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left: 30),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment
                                                                          .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          // "${drawerdrop[index]}",
                                                                          controller.nestedSectionResponse!.data![index].children![index2].title ?? "",
                                                                          style: poppins
                                                                              .copyWith(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight
                                                                                  .w200,
                                                                              color: Colors
                                                                                  .black87
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width: 5),
                                                                        InkWell(
                                                                          onTap: () {
                                                                            controller.nestedSectionResponse!.data![index].children![index2].isDrop2 =
                                                                            !controller.nestedSectionResponse!.data![index].children![index2].isDrop2;
                                                                            setState(() {});
                                                                          },
                                                                          child: SizedBox(
                                                                            height: 50,
                                                                            width: 100,
                                                                            // color: Colors.green,
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                const SizedBox(width: 5),
                                                                                // widget.childexp1?
                                                                                controller.nestedSectionResponse!.data![index].children![index2].isDrop2 ?
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(right: 12),
                                                                                  child: controller.nestedSectionResponse!.data![index].children![index2].children!.isNotEmpty
                                                                                      ? Image.asset(Images.up,
                                                                                    color: Colors.black,
                                                                                    height: 22,
                                                                                    width: 15,)
                                                                                      : const SizedBox(),
                                                                                ) :
                                                                                controller.nestedSectionResponse!.data![index].children![index2].children!.isNotEmpty ?
                                                                                Padding(
                                                                                  padding: const EdgeInsets
                                                                                      .only(
                                                                                      right: 12),
                                                                                  child: Image.asset(
                                                                                    Images.drop,
                                                                                    color: Colors.black,
                                                                                    height: 22,
                                                                                    width: 20,),
                                                                                )
                                                                                    : const SizedBox(),
                                                                                // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // widget.childexp1?
                                                              controller.nestedSectionResponse!.data![index].children![index2].isDrop2 ?
                                                              Container(
                                                                // color: Colors.red,
                                                                // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                                                child: Column(
                                                                  children: [
                                                                    ListView.builder(
                                                                        padding: EdgeInsets.zero,
                                                                        // itemCount: drawerdrop.length,
                                                                        itemCount: controller.nestedSectionResponse!.data![index].children![index2].children!.length,
                                                                        shrinkWrap: true,
                                                                        scrollDirection: Axis.vertical,
                                                                        physics: const ClampingScrollPhysics(),
                                                                        itemBuilder: (BuildContext context, int index3) {

                                                                          return Column(
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    if(index2 == 0){
                                                                                      Get.to(() =>
                                                                                          ProductPage(
                                                                                            image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.banner ?? ""}',
                                                                                            title: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.title ?? "",
                                                                                            details: controller.nestedSectionResponse?.data?[index]?.children?[index2].children?[index3]?.details ?? "",
                                                                                            page: AppConstants.CHILDSECTION,
                                                                                            id: controller.nestedSectionResponse!.data![index].children![index2].children![index3].id!.toString(),
                                                                                            indexId: index,
                                                                                            pageId: controller.nestedSectionResponse!.data![index].children![index2].children![index3].pageId,
                                                                                            discountText: extractDiscount(controller.nestedSectionResponse!.data![index].children![index2].children![index3].title ?? ""),
                                                                                          ));
                                                                                    } else if(index2 == 1){
                                                                                      Get.to(() =>
                                                                                          ProductPage(
                                                                                            image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.banner ?? ""}',
                                                                                            title: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.title ?? "",
                                                                                            details: controller.nestedSectionResponse?.data?[index]?.children?[index2].children?[index3]?.details ?? "",
                                                                                            page: AppConstants.CHILDSECTION,
                                                                                            id: controller.nestedSectionResponse!.data![index].children![index2].children![index3].id!.toString(),
                                                                                            indexId: index,
                                                                                            pageId: controller.nestedSectionResponse!.data![index].children![index2].children![index3].pageId,
                                                                                            brandText: controller.nestedSectionResponse!.data![index].children![index2].children![index3].title?.toLowerCase() ?? "",
                                                                                          ));
                                                                                    } else if(index2 == 2){
                                                                                      Get.to(() =>
                                                                                          ProductPage(
                                                                                            image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.banner ?? ""}',
                                                                                            title: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.title ?? "",
                                                                                            details: controller.nestedSectionResponse?.data?[index]?.children?[index2].children?[index3]?.details ?? "",
                                                                                            page: AppConstants.CHILDSECTION,
                                                                                            id: controller.nestedSectionResponse!.data![index].children![index2].children![index3].id!.toString(),
                                                                                            indexId: index,
                                                                                            pageId: controller.nestedSectionResponse!.data![index].children![index2].children![index3].pageId,
                                                                                            sizeText: controller.nestedSectionResponse!.data![index].children![index2].children![index3].title?.toLowerCase() ?? "",
                                                                                          ));
                                                                                    } else if(index2 == 3){
                                                                                      Get.to(() =>
                                                                                          ProductPage(
                                                                                            image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.banner ?? ""}',
                                                                                            title: controller.nestedSectionResponse?.data?[index]?.children?[index2]?.children?[index3]?.title ?? "",
                                                                                            details: controller.nestedSectionResponse?.data?[index]?.children?[index2].children?[index3]?.details ?? "",
                                                                                            page: AppConstants.CHILDSECTION,
                                                                                            id: controller.nestedSectionResponse!.data![index].children![index2].children![index3].id!.toString(),
                                                                                            indexId: index,
                                                                                            pageId: controller.nestedSectionResponse!.data![index].children![index2].children![index3].pageId,
                                                                                            categoryText: controller.nestedSectionResponse!.data![index].children![index2].children![index3].title?.toLowerCase() ?? "",
                                                                                          ));
                                                                                    }

                                                                                    log('===============/@ Discount: ${controller.nestedSectionResponse!.data![index].children![index2].children![index3].title ?? ""}');
                                                                                    log('===============/@ Lower: ${controller.nestedSectionResponse!.data![index].children![index2].children![index3].title?.toLowerCase() ?? ""}');
                                                                                    log('===============/@ Index: $index2');
                                                                                  },
                                                                                  child: Container(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    color: const Color(0xffFAFAFA),
                                                                                    height: 50,
                                                                                    width: Get.width,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.only(left: 50, right: 12),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Text(
                                                                                            // "${drawerdrop[index]}",
                                                                                            controller.nestedSectionResponse!.data![index].children![index2].children![index3].title ?? "",
                                                                                            style: poppins
                                                                                                .copyWith(
                                                                                                fontSize: 12,
                                                                                                fontWeight: FontWeight
                                                                                                    .w200,
                                                                                                color: Colors
                                                                                                    .black87
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                        }

                                                                    ),
                                                                    // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                                                  ],
                                                                ),
                                                              ) : Container(),

                                                            ],
                                                          ),

                                                        ],
                                                      );
                                                    }
                                                ),
                                                // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                              ],
                                            ),
                                          )
                                              : Container(),
                                        ],
                                      );
                                    }
                                ) : const SizedBox(),
                              ],
                            ),
                          )
                      )
                          : Expanded(
                        child: ListView.builder(
                            itemCount: 6,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return const Padding(
                                padding: EdgeInsets.all(8),
                                child: MyShimmer(hight: 120),
                              );
                            }
                        ),
                      )

                    ],
                  ),
                ),
              ),
            );
          });
        }
    );
  }
}
