import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
import '../../../controller/category/category_page_controller.dart';
import '../../../util/app_constants.dart';
import '../../../util/text_SIZE.dart';
import '../../base/custom_Image_cached.dart';
import '../../base/custom_shimmer.dart';
import '../all_popup/similar_product_popup.dart';
import '../product details/product_details_page.dart';
import '../product page/product_page.dart';


class SearchScreen extends StatefulWidget {
  // final String? pageId;
  const SearchScreen({
    super.key,
    // this.pageId
  });

  @override
  State<SearchScreen> createState() => _IsleDrawerState();
}

class _IsleDrawerState extends State<SearchScreen> {

  String pageId = '1';
  TextEditingController searchCtr = TextEditingController();
  FocusNode searchFcs = FocusNode();

  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<MainPageController>().dataInitializeForHome();
      Get.find<CategoryPageController>().dataInitialize();
      Get.find<CategoryPageController>().getNestedSectionData(pageId);
      Get.find<CategoryPageController>().getNestedBrandsData(pageId);
      Get.find<ProductListController>().getSearchCategoryProductData(pageId: pageId);
      Get.find<ProductListController>().getSearchBrandProductData(pageId: pageId);

      Get.find<ProductListController>().getSectionNewInData(id: '1', limit: '50', pageId: 1);
      Get.find<ProductListController>().getSectionNewInFilter(id: '1', pageId: 1);
    });
  }
  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
        duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  // Update pageId based on nestedCategoryResponse
  void updatePageId(String? newPageId) {
    setState(() {
      pageId = newPageId ?? '1';
    });
  }

  bool indicatorcolor = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (mainController) {
      return GetBuilder<ProductListController>(
          builder: (productController) {
            return GetBuilder<CategoryPageController>(builder: (controller) {
              return Scaffold(
                bottomNavigationBar: const UniversalBottomNav(),
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
                          Get.to(WishListPage());
                        },
                        child: Image.asset(Images.wish, height: 22,
                            width: 22,
                            color: const Color(0xff000000)
                        )
                    ),
                    const SizedBox(width: 10),
                  ],
                  leadingWidth: Get.width / 3.5,
                  title: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(MainScreen());
                        },
                        child: Container(
                          // margin: EdgeInsets.all(15),
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            // color: Colors.red,
                            height: 55, width: 75,
                            child: Image.asset(Images.logo, height: 55,
                              width: 70,
                              fit: BoxFit.fill,)),
                      ),
                    ],
                  ),
                ),

                backgroundColor: const Color(0xffFFFFFF),
                body: Column(
                  children: [
                    ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: CustomOnlyTextFieldWithBorder(
                                    height: 40,
                                    prefixIcon: Images.search,
                                    controller: searchCtr,
                                    focusNode: searchFcs,
                                    hintText: "Search",
                                    color: Colors.grey,
                                    onChanged: (text) {
                                      updatePageId(controller.nestedCategoryResponse?.data?[index].pageId.toString());
                                      if (text.isEmpty) {
                                        // Text field is empty, reset the list data to its initial state
                                        productController.getSearchBrandProductData(pageId: pageId);
                                        productController.getSearchCategoryProductData(pageId: pageId);
                                      } else {
                                        // Text field has some text, update the list data based on the search term
                                        productController.getSearchBrandProductData(searchTerm: text.trim() ?? '', pageId: pageId);
                                        productController.getSearchCategoryProductData(searchTerm: text.trim() ?? '', pageId: pageId);
                                      }
                                      // Ensure to update the UI after changing the text
                                      setState(() {});
                                    },
                                    // onChanged: (text) {
                                    //   pageId = controller.nestedCategoryResponse?.data?[index].pageId.toString();
                                    //   if (text.isEmpty) {
                                    //     // Text field is empty, reset the list data to its initial state
                                    //     productController.getSearchBrandProductData(pageId: pageId);
                                    //     productController.getSearchCategoryProductData(pageId: pageId);
                                    //   } else {
                                    //     // Text field has some text, update the list data based on the search term
                                    //     productController.getSearchBrandProductData(searchTerm: text.trim() ?? '', pageId: pageId);
                                    //     productController.getSearchCategoryProductData(searchTerm: text.trim() ?? '', pageId: pageId);
                                    //   }
                                    //   // Ensure to update the UI after changing the text
                                    //   setState(() {});
                                    // },
                                  ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: ElevatedButton(
                                      style: TextButton.styleFrom(
                                        // primary: Color(0xff2D2D2D)
                                        //   primary: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero
                                        ),
                                        primary: const Color(0xff2D2D2D),
                                        minimumSize: const Size.fromHeight(40),
                                        backgroundColor: Colors.black87,
                                        // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                                      ),
                                      onPressed: () {
                                        Get.to(() =>
                                            ProductPage(
                                              page: AppConstants.search,
                                              searchCon: searchCtr.text
                                                  .trim() ?? '',
                                            ));
                                      },
                                      child: Text(
                                        'Search', style: robotoRegular.copyWith(
                                          color: Colors.white, fontSize: 9),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),


                    const SizedBox(height: 4),

                    /// Tab Bar Part
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: SizedBox(
                        // color: Colors.tealAccent,
                        height: 55,
                        child: Center(
                            child: controller.alldata!.isEmpty ?
                            const MyShimmer(hight: 40) :
                            ListView.builder(
                                itemCount: controller.alldata!.length,
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: InkWell(
                                        onTap: () {
                                          controller.getNestedSectionData(controller.alldata![index].id.toString());
                                          controller.getNestedCatSubCatData(controller.alldata![index].id.toString());
                                          controller.getNestedBrandsData(controller.alldata![index].id.toString());
                                          productController.getSearchCategoryProductData(pageId: controller.alldata![index].id.toString());
                                          productController.getSearchBrandProductData(pageId: controller.alldata![index].id.toString());
                                          mainController.getHomePageAllData(controller.alldata![index].id.toString());

                                          Get.find<ProductListController>().getSectionNewInData(id: controller.alldata![index].id.toString(), limit: '50', pageId: controller.alldata![index].id);
                                          Get.find<ProductListController>().getSectionNewInFilter(id: controller.alldata![index].id.toString(), pageId: controller.alldata![index].id);
                                          selectedIndex = index;
                                          setState(() {});
                                          log('Gender Id 1: ${controller
                                              .alldata![index].id}');
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [

                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 35),
                                              child: Text(
                                                controller.alldata?[index]
                                                    ?.title ?? "",
                                                style: selectedIndex == index
                                                    ? railway.copyWith(
                                                    height: 1.5,
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold)
                                                    : railway.copyWith(
                                                    height: 1.5,
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight
                                                        .bold),),
                                            ),
                                            const SizedBox(height: 5),
                                            selectedIndex == index ?
                                            Container(
                                              color: gold,
                                              height: 2, width: 70,

                                            ) : Container()
                                          ],
                                        )),
                                  );
                                })
                        ),
                      ),
                    ),

                    Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (ctx2, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 250,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          productController.searchCategoryList!.isNotEmpty ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 15),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                child: Text(
                                                  "Category".toUpperCase(),
                                                  style: railway.copyWith(
                                                      color: Colors.black54,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600),),
                                              ),
                                              ListView.builder(
                                                  itemCount: productController
                                                      .searchCategoryList?.length ?? 0,
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemBuilder: (ctx, categoryIndex) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Get.to(() =>
                                                            ProductPage(
                                                              image: '${AppConstants.BASE_URL}${controller.nestedCategoryResponse?.data?[index]?.banner ?? ""}',
                                                              title: productController.searchCategoryList?[categoryIndex].title ?? "",
                                                              details: controller.nestedCategoryResponse?.data?[index]?.details ?? "",
                                                              page: AppConstants.CATEGORY,
                                                              id: productController.searchCategoryList?[categoryIndex].id.toString() ?? '',
                                                              pageId: controller.nestedCategoryResponse?.data?[index].pageId ?? 1,
                                                            ));
                                                        log(
                                                            'Category Id: ${productController.searchCategoryList?[categoryIndex].id ?? ''}');
                                                        log('Page Id: ${controller.nestedCategoryResponse?.data?[index].pageId ?? 1}');
                                                      },
                                                      child: SizedBox(
                                                        height: 40,
                                                        child: ListTile(
                                                          leading: Image.asset(
                                                            Images.search, height: 20,
                                                            width: 20,),
                                                          title: Text((productController.searchCategoryList?[categoryIndex].title ?? '').toUpperCase(),
                                                            style: railway.copyWith(
                                                                color: Colors.black54,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight
                                                                    .w600),),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              ),

                                            ],
                                          ) : const SizedBox.shrink(),
                                          productController.searchBrandList!.isNotEmpty
                                              ? Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              const SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                child: Text(
                                                  "Brand".toUpperCase(),
                                                  style: railway.copyWith(
                                                      color: Colors.black54,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600),),
                                              ),
                                              ListView.builder(
                                                  itemCount: productController
                                                      .searchBrandList?.length ?? 0,
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemBuilder: (ctx, brandIndex) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Get.to(() =>
                                                            ProductPage(
                                                              image: '${AppConstants.BASE_URL}${controller.nestedBrandsResponse?.data?[index]?.banner ?? ""}',
                                                              title: productController.searchBrandList?[brandIndex].name ?? "",
                                                              details: controller.nestedBrandsResponse?.data?[index]?.details ?? "",
                                                              page: AppConstants.BRAND,
                                                              id: productController.searchBrandList?[brandIndex].id.toString() ?? '',
                                                              pageId: controller.nestedBrandsResponse?.data?[index].pageId ?? 1,
                                                            ));
                                                        log('Category Id: ${productController.searchBrandList?[brandIndex].id ?? ''}');
                                                        log('Page Id: ${controller.nestedBrandsResponse?.data?[index].pageId ?? 1}');
                                                      },
                                                      child: SizedBox(
                                                        height: 40,
                                                        child: ListTile(
                                                          leading: Image.asset(
                                                            Images.search, height: 20,
                                                            width: 20,),
                                                          title: Text((productController.searchBrandList?[brandIndex].name ?? '').toUpperCase(),
                                                            style: railway.copyWith(
                                                                color: Colors.black54,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w600),),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              ),
                                            ],
                                          )
                                              : const SizedBox.shrink(),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 6, right: 8, top: 5, bottom: 5),
                                    child: Column(
                                      children: [
                                        mainController.homePageAllDataResponse != null && mainController.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                        SizedBox(
                                          height: 32,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text("New In", style: railway.copyWith(fontSize: titlesize ,) ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: InkWell(
                                                    onTap: (){
                                                      // Get.to(()=> ProductPage(
                                                      //   page: AppConstants.SECTION,
                                                      //   id: mainController.genderPageResponse?.data?[mainController.selectedGenderIndex]?.id.toString() ?? '',
                                                      //   pageId: mainController.homePageAllDataResponse?.data?[index].pageId,
                                                      //   indexId: 2,
                                                      // ));
                                                      Get.to(()=> ProductPage(
                                                        page: AppConstants.newIn,
                                                        title: "Category",
                                                        id: controller.nestedSectionResponse?.data?[index].pageId.toString() ?? '',
                                                        pageId: controller.nestedSectionResponse?.data?[index].pageId,
                                                        indexId: 2,
                                                      ));
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 8),
                                                      child: Text("Shop All".toUpperCase(),
                                                        textAlign: TextAlign.end,
                                                        style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),),
                                                    ),
                                                  )),
                                            ],
                                          ),) : const SizedBox(),
                                        SizedBox(
                                          // color: Colors.red,
                                          height: Get.height/2.1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 2, right: 0),
                                            child: GridView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: productController?.sectionNewInList.length ?? 0,
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio: 1.85,
                                                crossAxisCount: 1, // Set the number of items in a row
                                              ),
                                              itemBuilder: (BuildContext context, int index2) {
                                                return Padding(
                                                  padding: const EdgeInsets.only(left: 2, right: 6),
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap : () {
                                                          Get.to(ProductDetailsPage(
                                                            productId: productController!.sectionNewInList[index2].id.toString(),
                                                            brandId: productController.sectionNewInList[index2]?.brandId?.toString(),
                                                            pageId: productController.sectionNewInList[index2]?.pages?[productController.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                          ));
                                                        },
                                                        child: Container(
                                                          // color:  Color(0xff424242),
                                                          // color:  Colors.blue,
                                                          child: Stack(
                                                              alignment: Alignment.topCenter,
                                                              children: [
                                                                CustomImageCached(
                                                                  placeholder: Images.placeholder,
                                                                  image: '${AppConstants.BASE_URL}${productController?.sectionNewInList[index2].productColorVariants?[productController.sectedColorVAriantIndex].frontPhoto}',
                                                                  // height: Get.height/3,
                                                                  height: Get.height/3,
                                                                  isRound: false,
                                                                  fit: BoxFit.fill,
                                                                ),
                                                                Positioned(
                                                                    bottom: 0,
                                                                    child: Align(
                                                                      alignment: Alignment.bottomCenter,
                                                                      child: Container(
                                                                        /// orginal color
                                                                        // color: Color(0xffF2F2F2),
                                                                        color: Colors.grey.shade300,
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                                                                          child: Text((productController?.sectionNewInList[index2].season?.seasonName ?? "").toUpperCase(),
                                                                            style: poppins.copyWith(
                                                                                color: Colors.black,
                                                                                fontSize: 9
                                                                            ),
                                                                          )
                                                                        ),
                                                                      ),
                                                                    )

                                                                )
                                                              ]
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 25),
                                                        child: Text(
                                                          (productController?.sectionNewInList[index2].brand?.brandName ?? "").toUpperCase(),
                                                          maxLines: 1,
                                                          style: railway.copyWith(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: Text(
                                                          productController?.sectionNewInList[index2].name ?? "",
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 1,
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight.w200,
                                                              fontSize: 12,
                                                              color: Colors.black
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),

                                                      /// main
                                                      productController?.sectionNewInList[index2].discount == null || productController?.sectionNewInList[index2].discount == 0
                                                          ? Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: Text(
                                                          "${productController?.sectionNewInList[index2].price ?? ''} BDT",
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight.w600,
                                                              color: gold,
                                                              fontSize: 12
                                                          ),
                                                        ),
                                                      )
                                                          : Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "${productController?.sectionNewInList[index2].discountedPrice ?? ''} BDT",
                                                              style: poppins.copyWith(
                                                                  fontWeight: FontWeight.w600,
                                                                  color: gold,
                                                                  fontSize: 12
                                                              ),
                                                            ),
                                                            const SizedBox(height: 4),
                                                            Text(
                                                              "${productController?.sectionNewInList[index2].price ?? ''} BDT",
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
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: Get.height/2.1,
                                        //   child: Padding(
                                        //       padding: const EdgeInsets.only(left: 12, right: 12),
                                        //       child: GridView.builder(
                                        //         physics: const NeverScrollableScrollPhysics(),
                                        //         shrinkWrap: true,
                                        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        //           crossAxisCount: 2,
                                        //           mainAxisSpacing: 15,
                                        //           crossAxisSpacing: 10,
                                        //           childAspectRatio: 0.52,
                                        //         ),
                                        //         scrollDirection: Axis.horizontal,
                                        //         itemCount: productController?.sectionNewInList.length ?? 0,
                                        //         // Since you want only one item per GridView, set itemCount to 1
                                        //         itemBuilder: (BuildContext context, int index) {
                                        //           return Container(
                                        //             // color: Colors.deepPurpleAccent,
                                        //             color: const Color(0xffFAFBFB),
                                        //             child: InkWell(
                                        //               onTap: () {
                                        //                 Get.to(ProductDetailsPage(
                                        //                   productId: productController!.sectionNewInList[index].id.toString(),
                                        //                   brandId: productController.sectionNewInList[index]?.brandId?.toString(),
                                        //                   pageId: productController.sectionNewInList[index]?.pages?[productController.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                        //                 ));
                                        //               },
                                        //               child: Column(
                                        //                 mainAxisAlignment: MainAxisAlignment.center,
                                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                                        //                 children: [
                                        //                   SizedBox(
                                        //                     height: Get.height / 3.2,
                                        //                     child: Stack(
                                        //                       alignment: Alignment.topCenter,
                                        //                       children: [
                                        //                         CustomImageCached(
                                        //                           placeholder: Images.placeholder,
                                        //                           image: '${AppConstants.BASE_URL}${productController?.sectionNewInList[index].productColorVariants?[productController.sectedColorVAriantIndex].frontPhoto}',
                                        //                           // height: Get.height/3,
                                        //                           height: Get.height/3,
                                        //                           isRound: false,
                                        //                           fit: BoxFit.fill,
                                        //                         ),
                                        //                         // Positioned(
                                        //                         //   bottom: 20,
                                        //                         //   child: Row(
                                        //                         //     mainAxisAlignment: MainAxisAlignment.center,
                                        //                         //     children: [
                                        //                         //       for (int i = 0; i < currentIndex; i++)
                                        //                         //         TabPageSelectorIndicator(
                                        //                         //           backgroundColor: i == currentIndex ? silvercolor : gold,
                                        //                         //           borderColor: i == currentIndex ? silvercolor : gold,
                                        //                         //           size: 7,
                                        //                         //         ),
                                        //                         //     ],
                                        //                         //   ),
                                        //                         // ),
                                        //                         Positioned(
                                        //                           bottom: 0,
                                        //                           child: Align(
                                        //                             alignment: Alignment.bottomCenter,
                                        //                             child: Container(
                                        //                               color: Colors.grey.shade300,
                                        //                               child: Padding(
                                        //                                 padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                        //                                 child: productController?.sectionNewInList[index].season != null ?
                                        //                                 Text((productController?.sectionNewInList[index].season?.seasonName ?? "").toUpperCase(),
                                        //                                   style: poppins.copyWith(
                                        //                                       color: Colors.black,
                                        //                                       fontSize: 9
                                        //                                   ),
                                        //                                 ) : const SizedBox(),
                                        //                               ),
                                        //                             ),
                                        //                           ),
                                        //                         ),
                                        //                         // Positioned(
                                        //                         //   top: 10,
                                        //                         //   right: 10,
                                        //                         //   child: buildProductWishButton(
                                        //                         //       productController?.sectionNewInList[index].id?.toString()),
                                        //                         // ),
                                        //                         Positioned(
                                        //                           top: 10,
                                        //                           left: 10,
                                        //                           child: InkWell(
                                        //                             onTap: () {
                                        //                               showModalBottomSheet(
                                        //                                 context: context,
                                        //                                 builder: (
                                        //                                     BuildContext context) {
                                        //                                   return SimilarPopup(id: productController?.sectionNewInList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                        //                                 },
                                        //                               );
                                        //                             },
                                        //                             child: SizedBox(
                                        //                               height: 30,
                                        //                               width: 30,
                                        //                               child: Padding(
                                        //                                 padding: const EdgeInsets.all(5),
                                        //                                 child: Image.asset(Images.similar,
                                        //                                     color: silvercolor,
                                        //                                     height: 20,
                                        //                                     width: 20),
                                        //                               ),
                                        //                             ),
                                        //                           ),
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                   ),
                                        //                   const SizedBox(height: 8),
                                        //                   Padding(
                                        //                     padding: const EdgeInsets.symmetric(horizontal: 25),
                                        //                     child: Text(
                                        //                       (productController?.sectionNewInList[index].brand?.brandName ?? "").toUpperCase(),
                                        //                       maxLines: 1,
                                        //                       style: railway.copyWith(
                                        //                           fontSize: 16,
                                        //                           fontWeight: FontWeight.w600),
                                        //                     ),
                                        //                   ),
                                        //                   const SizedBox(height: 5),
                                        //                   Padding(
                                        //                     padding: const EdgeInsets.symmetric(horizontal: 4),
                                        //                     child: Text(
                                        //                       productController?.sectionNewInList[index].name ?? "",
                                        //                       overflow: TextOverflow.ellipsis,
                                        //                       maxLines: 1,
                                        //                       style: poppins.copyWith(
                                        //                           fontWeight: FontWeight.w200,
                                        //                           fontSize: 12,
                                        //                           color: Colors.black
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                   const SizedBox(height: 5),
                                        //
                                        //                   /// main
                                        //                   productController?.sectionNewInList[index].discount == null || productController?.sectionNewInList[index].discount == 0
                                        //                       ? Padding(
                                        //                     padding: const EdgeInsets.symmetric(horizontal: 4),
                                        //                     child: Text(
                                        //                       "${productController?.sectionNewInList[index].price ?? ''} BDT",
                                        //                       style: poppins.copyWith(
                                        //                           fontWeight: FontWeight.w600,
                                        //                           color: gold,
                                        //                           fontSize: 12
                                        //                       ),
                                        //                     ),
                                        //                   )
                                        //                       : Padding(
                                        //                     padding: const EdgeInsets.symmetric(horizontal: 4),
                                        //                     child: Column(
                                        //                       children: [
                                        //                         Text(
                                        //                           "${productController?.sectionNewInList[index].discountedPrice ?? ''} BDT",
                                        //                           style: poppins.copyWith(
                                        //                               fontWeight: FontWeight.w600,
                                        //                               color: gold,
                                        //                               fontSize: 12
                                        //                           ),
                                        //                         ),
                                        //                         const SizedBox(height: 4),
                                        //                         Text(
                                        //                           "${productController?.sectionNewInList[index].price ?? ''} BDT",
                                        //                           style: poppins.copyWith(
                                        //                               fontWeight: FontWeight.w600,
                                        //                               decoration: TextDecoration.lineThrough,
                                        //                               color: Colors.red,
                                        //                               fontSize: 12),
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                   )
                                        //                 ],
                                        //               ),
                                        //             ),
                                        //           );
                                        //         },
                                        //       )
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }
                        ),
                      ),
                    ),

                  ],
                ),
              );
            });
          });
    });
  }
}


// class SearchScreen extends StatefulWidget {
//   bool isExpanded1=false;
//   bool isExpanded2=false;
//   bool isExpanded3=false;
//   bool isExpanded4=false;
//   bool isExpanded5=false;
//   bool isExpanded6=false;
//   bool isExpanded7=false;
//
//
//   bool childexp1=false;
//   bool childexp2=false;
//   bool childexp3=false;
//   bool childexp4=false;
//   bool childexp5=false;
//   bool childexp6=false;
//
//
//   @override
//   State<SearchScreen> createState() => _IsleDrawerState();
// }
//
// class _IsleDrawerState extends State<SearchScreen> {
//   TextEditingController searchCtr = TextEditingController();
//   FocusNode searchFcs=FocusNode();
//
//
//   Color tabColor= gold;
//
//   Color button1Color = gold;
//   Color button2Color = gold;
//   Color button3Color = gold;
//
//   void changeColor(int buttonNumber) {
//     setState(() {
//       switch (buttonNumber) {
//         case 1:
//           button1Color = gold;
//           button2Color = gold;
//           button3Color = gold;
//           break;
//         case 2:
//           button1Color = gold;
//           button2Color = gold;
//           button3Color = gold;
//           break;
//         case 3:
//           button1Color = gold;
//           button2Color = gold;
//           button3Color = gold;
//           break;
//       }
//     });
//   }
//
//   bool indicatorcolor= true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       // width: Get.width/1.18,
//       child: DefaultTabController(
//         length: 3,
//         child: SafeArea(
//           child: Scaffold(
//             bottomNavigationBar: UniversalBottomNav(),
//             appBar: AppBar(
//               iconTheme: IconThemeData(color: Color(0xff000000)),
//               titleSpacing: 0,
//               backgroundColor: Color(0xffFFFFFF),
//               centerTitle: true,
//               elevation: 0,
//               toolbarHeight: 62,
//
//               actions: [
//             /*    InkWell(
//                     onTap: (){
//                       Get.to(SearchScreen());
//                     },
//                     // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
//                     child: Image.asset(Images.search, height: 22, width: 22,)),
//                 SizedBox(width: 15),*/
//                 InkWell(
//                   onTap: () {
//                     Get.to(WishListPage());
//                   },
//                     child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)),
//
//
//                 SizedBox(width: 10),
//               ],
//               leadingWidth: Get.width/3.5,
//               title: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.to(MainScreen());
//                     },
//                     child: Container(
//                       // margin: EdgeInsets.all(15),
//                         padding: EdgeInsets.only(left: 5, right: 5, top: 5,bottom: 5),
//                         // color: Colors.red,
//                         height: 55, width: 75,
//                         child: Image.asset(Images.logo, height: 55, width: 70, fit: BoxFit.fill,)),
//                   ),
//                 ],
//               ),
//              /* title: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.to(MainScreen());
//                     },
//                     child:  Container(
//                       alignment: Alignment.topCenter,
//                       padding: EdgeInsets.zero,
//                       height: 65,
//                       width: 80,
//                       // color: Colors.deepPurpleAccent,
//                       child: Column(
//                         children: [
//                           SizedBox(height: 6),
//                           CustomImageCached(image: '${AppConstants.BASE_URL}${controller.generalSettingResponse?.data?.logo?? ""}',
//                             // fit: BoxFit.fitHeight,
//                             isRound: false,
//                             height: 45, width: 75, fit: BoxFit.fill,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 1.5),
//                             child: Container(
//                                 width: 80,
//                                 // color: Colors.white,
//                                 child: Center(child: Text("${controller.generalSettingResponse?.data?.tagLine??""}", style: railway.copyWith(fontSize: 9,  color: Colors.black),))),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),*/
//             ),
//             // backgroundColor: Color(0xffEBEFF3),
//             backgroundColor: Color(0xffFFFFFF),
//             body:  Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 7,
//                         child: CustomOnlyTextFieldWithBorder(
//                           height: 40,
//                           prefixIcon: Images.search,
//                           controller: searchCtr,
//                           focusNode: searchFcs,
//                           hintText: "Search",
//                           color: Colors.grey,
//
//                         ),
//                       ),
//
//                       Expanded(
//                         flex: 2,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 12),
//                           child: ElevatedButton(
//                             style: TextButton.styleFrom(
//                               // primary: Color(0xff2D2D2D)
//                               //   primary: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.zero
//                               ),
//                               primary: Color(0xff2D2D2D),
//                               minimumSize: const Size.fromHeight(40),
//                               backgroundColor: Colors.black87,
//                               // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
//                             ),
//                             onPressed: () {
//                             },
//                             child: Text('Search', style: robotoRegular.copyWith(color: Colors.white,fontSize: 9),),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: 4),
//
//                 /// Tab Bar Part
//                 Container(
//                   // color: Color(0xffFFFFFF),
//                   height: 40,
//                   child: Container(
//                     // color: tabColor,
//                     // color: Color(0xffFFFFFF),
//                     child: TabBar(
//                       indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
//                         onTap: (index) {
//                           setState(() {
//
//                             if(index==0) { tabColor = gold;}
//                             if(index==1) {tabColor = gold;}
//                             if(index==2) {tabColor = gold;}
//                           });
//                           print(index);
//                         },
//                         // indicator: BoxDecoration(color: tabColor,borderRadius: BorderRadius.circular(8)),
//                         // dividerColor: Colors.black,
//
//                         /* indicator: BoxDecoration(
//                             borderRadius: BorderRadius.only(topLeft:
//                             Radius.circular(10),topRight: Radius.circular(10)),
//                             color: tabColor
//                         ),*/
//                         // indicatorColor: Color(0xffb89600),
//                         indicatorColor: tabColor,
//                         indicatorWeight: 2.5,
//                         tabs: [
//                           Tab(
//                               child: Text(
//                                 'Men',
//                                 style: railway.copyWith(
//                                     color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                               )),
//                           Tab(
//                               child: Text(
//                                 'Women',
//                                 style: railway.copyWith(
//                                     color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                               )),
//                           Tab(
//                               child: Text(
//                                 'Kids',
//                                 style: railway.copyWith(
//                                     color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                               )),
//                         ]),
//                   ),
//                 ),
//
//                 Expanded(
//                   child: TabBarView(
//                       children: [
//                         /// 1 st TAB
//                         RefreshIndicator(
//                             onRefresh: () async{
//                               // showCustomSnackBar("2");
//                             },
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 20),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                                     child: Text("Popular Designers".toUpperCase(),  style: railway.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w600),),
//                                   ),
//                                   SizedBox(height: 8),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Aigner".toUpperCase(),  style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Doice & Gabbana",  style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Burbeny",   style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Emporini Armani",   style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: SizedBox(),
//                                           title: Text("See All Designers".toUpperCase(),  style: railway.copyWith(decoration: TextDecoration.underline,color: gold, fontSize: 12.5, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//
//
//                                       SizedBox(height: 20),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(horizontal: 15),
//                                         child: Text("New In",  style: railway.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w600),),
//                                       ),
//                                       SizedBox(height: 10),
//
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 12, right: 12),
//                                         child: GridView.builder(
//                                           physics: NeverScrollableScrollPhysics(),
//                                           shrinkWrap: true, // Set to true to make the GridView scrollable within SingleChildScrollView
//                                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                               crossAxisCount: 2, // Number of columns
//                                               mainAxisSpacing: 15, // Spacing between rows
//                                               crossAxisSpacing: 10,
//                                               childAspectRatio: 0.6// Spacing between columns
//                                           ),
//                                           itemCount: catagorysliderimage.length, // Number of items in the GridView
//                                           itemBuilder: (context, index) {
//                                             return Container(
//                                               // color: Colors.blue,
//                                               // height: Get.height/2,
//                                               // width: Get.width/3,
//                                               child: InkWell(
//                                                 highlightColor: Colors.grey,
//                                                 splashColor: Colors.grey,
//                                                 // focusColor: Colors.green,
//                                                 // hoverColor: Colors.blue,
//                                                 onTap: (){
//                                                   Get.to(ProductDetailsPage( cartdetailsimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75', productId: '',));
//                                                   // showCustomSnackBar("Click Shop Cart");
//                                                 },
//                                                 child: Column(
//
//                                                     children: [
//
//                                                       Container(
//                                                         // color: Colors.red,
//                                                         height: Get.height/3.5,
//                                                         child: Stack(
//                                                           alignment: Alignment.topCenter,
//                                                           children: [
//                                                             CarouselSlider.builder(
//                                                               options: CarouselOptions(
//                                                                 autoPlay: false,
//                                                                 disableCenter: true,
//                                                                 viewportFraction: 1,
//
//                                                                 autoPlayInterval: Duration(seconds: 7),
//                                                                 height: Get.height/2.4,
//                                                                 scrollDirection: Axis.horizontal,
//                                                                 onPageChanged: (index, reason) {
//                                                                   setState((){
//                                                                     // currentIndex=index;
//                                                                   });
//                                                                 },
//                                                               ),
//                                                               // itemCount: controller.productImage!.length,
//                                                               itemCount: 5,
//                                                               itemBuilder: (context, index, _) {
//
//                                                                 return   Padding(
//                                                                   padding: const EdgeInsets.only(bottom: 10),
//                                                                   child: CustomImageCached(
//                                                                     // image: '${Images.carusalimage}}',
//                                                                     image: '${catagorysliderimage[index]}',
//                                                                     height: Get.height/3.7,
//                                                                     isRound: false,
//                                                                     fit: BoxFit.fill,
//                                                                   ),
//                                                                 );
//
//                                                               },
//                                                             ),
//                                                             Positioned(
//                                                               bottom: 20,
//                                                               // right: 10,
//                                                               child:  Row(
//                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                 children: [
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                 ],
//                                                               ),),
//                                                             Positioned(
//                                                                 bottom: 0,
//                                                                 child: Align(
//                                                                   alignment: Alignment.bottomCenter,
//                                                                   child: Container(
//                                                                     /// orginal color
//                                                                     // color: Color(0xffF2F2F2),
//                                                                     color: Colors.grey.shade300,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
//                                                                       child: Text("New Season".toUpperCase(),
//                                                                         style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                                                                     ),
//                                                                   ),
//                                                                 )
//                                                             ),
//                                                             Positioned(
//                                                               top: 10,
//                                                               right: 10,
//                                                               child: InkWell(
//                                                                 onTap: (){
//                                                                   Get.to(WishListPage());
//                                                                 },
//
//                                                                 child: Container(
//                                                                   // color: Colors.black,
//                                                                   height: 30,
//                                                                   width: 30,
//                                                                   child: Padding(
//                                                                     padding: const EdgeInsets.all(5),
//                                                                     child: Image.asset(Images.wish, color: silvercolor, height: 20, width: 20,),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Positioned(
//                                                               top: 10,
//                                                               left: 10,
//                                                               child: InkWell(
//                                                                 onTap: () {
//                                                                   // Get.to(
//                                                                   //   showModalBottomSheet(
//                                                                   //     context: context,
//                                                                   //     builder: (BuildContext context) {
//                                                                   //       return SimilarPopup();
//                                                                   //     },
//                                                                   //   ),
//                                                                   // );
//                                                                 },
//
//                                                                 child: Container(
//                                                                   // color: Colors.black,
//                                                                   height: 30,
//                                                                   width: 30,
//                                                                   child: Padding(
//                                                                     padding: const EdgeInsets.all(5),
//                                                                     child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//
//                                                       SizedBox(height: 6),
//                                                       Text("${categorysliderName[index]}",
//                                                         style: railway.copyWith( fontSize: 12, fontWeight: FontWeight.w600),),
//                                                       SizedBox(height: 4),
//                                                       Padding(
//                                                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                                                         child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                           overflow: TextOverflow.ellipsis,
//                                                           maxLines: 1,
//                                                           style: poppins.copyWith( fontWeight: FontWeight.w100, fontSize: 10.5),),
//                                                       ),
//                                                       SizedBox(height: 4),
//                                                       Text("100 BDT",
//                                                         style: railway.copyWith(fontWeight: FontWeight.w600, color: gold, fontSize: 10.5),),
//
//                                                     ]
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//
//
//
//
//
//                                     ],
//                                   ),
//                                 ],
//                               ),
//
//                             )
//
//                         ),
//
//                         /// 2nd TAB
//                         RefreshIndicator(
//                             onRefresh: () async{
//                               // showCustomSnackBar("2");
//                             },
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 20),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                                     child: Text("Popular Designers".toUpperCase(),  style: railway.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w600),),
//                                   ),
//                                   SizedBox(height: 8),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Aigner".toUpperCase(),  style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Doice & Gabbana",  style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Burbeny",   style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Emporini Armani",   style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: SizedBox(),
//                                           title: Text("See All Designers".toUpperCase(),  style: railway.copyWith(decoration: TextDecoration.underline,color: gold, fontSize: 12.5, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//
//
//                                       SizedBox(height: 20),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(horizontal: 15),
//                                         child: Text("New In",  style: railway.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w600),),
//                                       ),
//                                       SizedBox(height: 10),
//
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 12, right: 12),
//                                         child: GridView.builder(
//                                           physics: NeverScrollableScrollPhysics(),
//                                           shrinkWrap: true, // Set to true to make the GridView scrollable within SingleChildScrollView
//                                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                               crossAxisCount: 2, // Number of columns
//                                               mainAxisSpacing: 15, // Spacing between rows
//                                               crossAxisSpacing: 10,
//                                               childAspectRatio: 0.6// Spacing between columns
//                                           ),
//                                           itemCount: catagorysliderimage.length, // Number of items in the GridView
//                                           itemBuilder: (context, index) {
//                                             return Container(
//                                               // color: Colors.blue,
//                                               // height: Get.height/2,
//                                               // width: Get.width/3,
//                                               child: InkWell(
//                                                 highlightColor: Colors.grey,
//                                                 splashColor: Colors.grey,
//                                                 // focusColor: Colors.green,
//                                                 // hoverColor: Colors.blue,
//                                                 onTap: (){
//                                                   Get.to(ProductDetailsPage( cartdetailsimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75', productId: '',));
//                                                   // showCustomSnackBar("Click Shop Cart");
//                                                 },
//                                                 child: Column(
//
//                                                     children: [
//
//                                                       Container(
//                                                         // color: Colors.red,
//                                                         height: Get.height/3.5,
//                                                         child: Stack(
//                                                           alignment: Alignment.topCenter,
//                                                           children: [
//                                                             CarouselSlider.builder(
//                                                               options: CarouselOptions(
//                                                                 autoPlay: false,
//                                                                 disableCenter: true,
//                                                                 viewportFraction: 1,
//
//                                                                 autoPlayInterval: Duration(seconds: 7),
//                                                                 height: Get.height/2.4,
//                                                                 scrollDirection: Axis.horizontal,
//                                                                 onPageChanged: (index, reason) {
//                                                                   setState((){
//                                                                     // currentIndex=index;
//                                                                   });
//                                                                 },
//                                                               ),
//                                                               // itemCount: controller.productImage!.length,
//                                                               itemCount: 5,
//                                                               itemBuilder: (context, index, _) {
//
//                                                                 return   Padding(
//                                                                   padding: const EdgeInsets.only(bottom: 10),
//                                                                   child: CustomImageCached(
//                                                                     // image: '${Images.carusalimage}}',
//                                                                     image: '${catagorysliderimage[index]}',
//                                                                     height: Get.height/3.7,
//                                                                     isRound: false,
//                                                                     fit: BoxFit.fill,
//                                                                   ),
//                                                                 );
//
//                                                               },
//                                                             ),
//                                                             Positioned(
//                                                               bottom: 20,
//                                                               // right: 10,
//                                                               child:  Row(
//                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                 children: [
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                 ],
//                                                               ),),
//                                                             Positioned(
//                                                                 bottom: 0,
//                                                                 child: Align(
//                                                                   alignment: Alignment.bottomCenter,
//                                                                   child: Container(
//                                                                     /// orginal color
//                                                                     // color: Color(0xffF2F2F2),
//                                                                     color: Colors.grey.shade300,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
//                                                                       child: Text("New Season".toUpperCase(),
//                                                                         style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                                                                     ),
//                                                                   ),
//                                                                 )
//                                                             ),
//                                                             Positioned(
//                                                               top: 10,
//                                                               right: 10,
//                                                               child: InkWell(
//                                                                 onTap: (){
//                                                                   Get.to( WishListPage());
//                                                                 },
//
//                                                                 child: Container(
//                                                                   // color: Colors.black,
//                                                                   height: 30,
//                                                                   width: 30,
//                                                                   child: Padding(
//                                                                     padding: const EdgeInsets.all(5),
//                                                                     child: Image.asset(Images.wish, color: silvercolor, height: 20, width: 20,),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Positioned(
//                                                               top: 10,
//                                                               left: 10,
//                                                               child: InkWell(
//                                                                 onTap: () {
//                                                                   // Get.to(
//                                                                   //   showModalBottomSheet(
//                                                                   //     context: context,
//                                                                   //     builder: (BuildContext context) {
//                                                                   //       return SimilarPopup();
//                                                                   //     },
//                                                                   //   ),
//                                                                   // );
//                                                                 },
//
//                                                                 child: Container(
//                                                                   // color: Colors.black,
//                                                                   height: 30,
//                                                                   width: 30,
//                                                                   child: Padding(
//                                                                     padding: const EdgeInsets.all(5),
//                                                                     child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//
//                                                       SizedBox(height: 6),
//                                                       Text("${categorysliderName[index]}",
//                                                         style: railway.copyWith( fontSize: 12, fontWeight: FontWeight.w600),),
//                                                       SizedBox(height: 4),
//                                                       Padding(
//                                                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                                                         child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                           overflow: TextOverflow.ellipsis,
//                                                           maxLines: 1,
//                                                           style: poppins.copyWith( fontWeight: FontWeight.w100, fontSize: 10.5),),
//                                                       ),
//                                                       SizedBox(height: 4),
//                                                       Text("100 BDT",
//                                                         style: railway.copyWith(fontWeight: FontWeight.w600, color: gold, fontSize: 10.5),),
//
//                                                     ]
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//
//
//
//
//
//                                     ],
//                                   ),
//                                 ],
//                               ),
//
//                             )
//
//                         ),
//
//                         /// 3rd TAB
//                         RefreshIndicator(
//                             onRefresh: () async{
//                               // showCustomSnackBar("2");
//                             },
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 20),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                                     child: Text("Popular Designers".toUpperCase(),  style: railway.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w600),),
//                                   ),
//                                   SizedBox(height: 8),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Aigner".toUpperCase(),  style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Doice & Gabbana",  style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Burbeny",   style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: Image.asset(Images.search, height: 20, width: 20,),
//                                           title: Text("Emporini Armani",   style: railway.copyWith(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 40,
//                                         child: ListTile(
//                                           leading: SizedBox(),
//                                           title: Text("See All Designers".toUpperCase(),  style: railway.copyWith(decoration: TextDecoration.underline,color: gold, fontSize: 12.5, fontWeight: FontWeight.w600),),
//                                         ),
//                                       ),
//
//
//                                       SizedBox(height: 20),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(horizontal: 15),
//                                         child: Text("New In",  style: railway.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w600),),
//                                       ),
//                                       SizedBox(height: 10),
//
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 12, right: 12),
//                                         child: GridView.builder(
//                                           physics: NeverScrollableScrollPhysics(),
//                                           shrinkWrap: true, // Set to true to make the GridView scrollable within SingleChildScrollView
//                                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                               crossAxisCount: 2, // Number of columns
//                                               mainAxisSpacing: 15, // Spacing between rows
//                                               crossAxisSpacing: 10,
//                                               childAspectRatio: 0.6// Spacing between columns
//                                           ),
//                                           itemCount: catagorysliderimage.length, // Number of items in the GridView
//                                           itemBuilder: (context, index) {
//                                             return Container(
//                                               // color: Colors.blue,
//                                               // height: Get.height/2,
//                                               // width: Get.width/3,
//                                               child: InkWell(
//                                                 highlightColor: Colors.grey,
//                                                 splashColor: Colors.grey,
//                                                 // focusColor: Colors.green,
//                                                 // hoverColor: Colors.blue,
//                                                 onTap: (){
//                                                   Get.to(ProductDetailsPage( cartdetailsimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75', productId: '',));
//                                                   // showCustomSnackBar("Click Shop Cart");
//                                                 },
//                                                 child: Column(
//
//                                                     children: [
//
//                                                       Container(
//                                                         // color: Colors.red,
//                                                         height: Get.height/3.5,
//                                                         child: Stack(
//                                                           alignment: Alignment.topCenter,
//                                                           children: [
//                                                             CarouselSlider.builder(
//                                                               options: CarouselOptions(
//                                                                 autoPlay: false,
//                                                                 disableCenter: true,
//                                                                 viewportFraction: 1,
//
//                                                                 autoPlayInterval: Duration(seconds: 7),
//                                                                 height: Get.height/2.4,
//                                                                 scrollDirection: Axis.horizontal,
//                                                                 onPageChanged: (index, reason) {
//                                                                   setState((){
//                                                                     // currentIndex=index;
//                                                                   });
//                                                                 },
//                                                               ),
//                                                               // itemCount: controller.productImage!.length,
//                                                               itemCount: 5,
//                                                               itemBuilder: (context, index, _) {
//
//                                                                 return   Padding(
//                                                                   padding: const EdgeInsets.only(bottom: 10),
//                                                                   child: CustomImageCached(
//                                                                     // image: '${Images.carusalimage}}',
//                                                                     image: '${catagorysliderimage[index]}',
//                                                                     height: Get.height/3.7,
//                                                                     isRound: false,
//                                                                     fit: BoxFit.fill,
//                                                                   ),
//                                                                 );
//
//                                                               },
//                                                             ),
//                                                             Positioned(
//                                                               bottom: 20,
//                                                               // right: 10,
//                                                               child:  Row(
//                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                 children: [
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                   TabPageSelectorIndicator(
//                                                                     // backgroundColor: index == currentIndex ? greenColor : Colors.white,
//                                                                     backgroundColor: indicatorcolor ? gold : silvercolor,
//                                                                     borderColor: gold,
//                                                                     // size: index == currentIndex ? 7 : 7,
//                                                                     size: 7,
//                                                                   ),
//                                                                 ],
//                                                               ),),
//                                                             Positioned(
//                                                                 bottom: 0,
//                                                                 child: Align(
//                                                                   alignment: Alignment.bottomCenter,
//                                                                   child: Container(
//                                                                     /// orginal color
//                                                                     // color: Color(0xffF2F2F2),
//                                                                     color: Colors.grey.shade300,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
//                                                                       child: Text("New Season".toUpperCase(),
//                                                                         style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                                                                     ),
//                                                                   ),
//                                                                 )
//                                                             ),
//                                                             Positioned(
//                                                               top: 10,
//                                                               right: 10,
//                                                               child: InkWell(
//                                                                 onTap: (){
//                                                                   Get.to( WishListPage());
//                                                                 },
//
//                                                                 child: Container(
//                                                                   // color: Colors.black,
//                                                                   height: 30,
//                                                                   width: 30,
//                                                                   child: Padding(
//                                                                     padding: const EdgeInsets.all(5),
//                                                                     child: Image.asset(Images.wish, color: silvercolor, height: 20, width: 20,),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Positioned(
//                                                               top: 10,
//                                                               left: 10,
//                                                               child: InkWell(
//                                                                 onTap: () {
//                                                                   // Get.to(
//                                                                   //   showModalBottomSheet(
//                                                                   //     context: context,
//                                                                   //     builder: (BuildContext context) {
//                                                                   //       return SimilarPopup();
//                                                                   //     },
//                                                                   //   ),
//                                                                   // );
//                                                                 },
//
//                                                                 child: Container(
//                                                                   // color: Colors.black,
//                                                                   height: 30,
//                                                                   width: 30,
//                                                                   child: Padding(
//                                                                     padding: const EdgeInsets.all(5),
//                                                                     child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//
//                                                       SizedBox(height: 6),
//                                                       Text("${categorysliderName[index]}",
//                                                         style: railway.copyWith( fontSize: 12, fontWeight: FontWeight.w600),),
//                                                       SizedBox(height: 4),
//                                                       Padding(
//                                                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                                                         child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                           overflow: TextOverflow.ellipsis,
//                                                           maxLines: 1,
//                                                           style: poppins.copyWith( fontWeight: FontWeight.w100, fontSize: 10.5),),
//                                                       ),
//                                                       SizedBox(height: 4),
//                                                       Text("100 BDT",
//                                                         style: railway.copyWith(fontWeight: FontWeight.w600, color: gold, fontSize: 10.5),),
//
//                                                     ]
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//
//
//
//
//
//                                     ],
//                                   ),
//                                 ],
//                               ),
//
//                             )
//
//                         ),
//
//                       ]),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
