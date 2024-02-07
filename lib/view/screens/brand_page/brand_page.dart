
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/category/category_page_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/custom_shimmer.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import '../../../data/model/response/filter/brand/all_brand_category_model.dart';
import '../../../data/model/response/product/search_brand_type_model.dart';
import '../../../util/app_constants.dart';
import '../../../util/constants.dart';
import '../product page/product_page.dart';
import '../universal_bottom_nav/universal_bottom_nav.dart';

class BrandScreen extends StatefulWidget {
  final int? pageId;
  final int? selectIndex;
  final bool? buttonBar;
  final bool? tabBar;
  const BrandScreen({
    Key? key,
    this.pageId,
    this.selectIndex,
    this.buttonBar,
    this.tabBar,
  }) : super(key: key);

  @override
  State<BrandScreen> createState() => _BrandState();
}

class _BrandState extends State<BrandScreen> {


  TextEditingController searchByBrandTypeCon = TextEditingController();
  TextEditingController searchByBrandNameCon = TextEditingController();
  FocusNode searchFcs = FocusNode();

  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductListController>().getAllBrandData(pageId: widget.pageId);
      Get.find<ProductListController>().getSearchBrandType(pageId: widget.pageId ?? 1);
      if(widget.tabBar == true){
        Get.find<CategoryPageController>().dataInitialize();
      } else{

      }
      log('Init Gender Id: ${widget.pageId}');
      selectedIndex = widget.selectIndex ?? 0;
      // Get.find<ProductListController>().getBrandProductData(id: '19');
    });
  }


  @override
  void dispose() {
    super.dispose();
    Get.find<CategoryPageController>().disclose();
    // Get.find<CategoryPageController>().dataInitialize();
  }


// Add a helper function to get the first letter of a brand's name
  String getFirstLetter(String name) {
    List<String> words = name.split(' ');
    return words.isNotEmpty && words[0].isNotEmpty ? words[0][0] : '';
  }

// Helper function to group brands based on the first letter in a sorted order
  Map<String, List<AllBrandData>> groupBrandsByFirstLetter(List<AllBrandData>? brands) {
    Map<String, List<AllBrandData>> groupedBrands = {};

    // Sort the keys alphabetically
    List<String> sortedKeys = [];

    for (AllBrandData brand in brands ?? []) {
      String firstLetter = getFirstLetter(brand.name?.toUpperCase() ?? '');

      if (!groupedBrands.containsKey(firstLetter)) {
        sortedKeys.add(firstLetter);
        groupedBrands[firstLetter] = [];
      }
      groupedBrands[firstLetter]!.add(brand);
    }

    // Sort the keys alphabetically
    sortedKeys.sort();

    // Create a new map with sorted keys
    Map<String, List<AllBrandData>> sortedGroupedBrands = {};
    for (String key in sortedKeys) {
      sortedGroupedBrands[key] = groupedBrands[key]!;
    }

    return sortedGroupedBrands;
  }

  int menuSelect = 0;
  List<MenuBrModel> menuList = [
    MenuBrModel(img: Images.menuBr, text: 'A-Z BRANDS'),
    MenuBrModel(text: 'Categories'),
    MenuBrModel(img: Images.searchBr, text: 'Search By Brand Type'),
    MenuBrModel(img: Images.searchBr, text: 'Search By Name')
  ];


  // String getFirstLetter(String name) {
  //   return name.isNotEmpty ? name[0] : '';
  // }

  // Helper function to group brands based on the first letter
  // Map<String, List<AllBrandData>> groupBrandsByFirstLetter(List<AllBrandData>? brands) {
  //   Map<String, List<AllBrandData>> groupedBrands = {};
  //   for (AllBrandData brand in brands ?? []) {
  //     String firstLetter = getFirstLetter(brand.name ?? '');
  //     if (!groupedBrands.containsKey(firstLetter)) {
  //       groupedBrands[firstLetter] = [];
  //     }
  //     groupedBrands[firstLetter]!.add(brand);
  //   }
  //   return groupedBrands;
  // }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryPageController>(
        builder: (controller) {
          return GetBuilder<ProductListController>(builder: (productController) {
            productController.allBrandsList?.sort((a, b) => a.name!.compareTo(b.name!));

            List<AllBrandData> searchByBrandName = productController.allBrandsList
                ?.where((item) => item.name!.toLowerCase().contains(searchByBrandNameCon.text.trim().toLowerCase())).toList() ?? [];

            List<SearchBrandTypeBrands> searchByBrandType = productController.searchBrandTypeModel?.data?.brands
                ?.where((item) => item.name!.toLowerCase().contains(searchByBrandTypeCon.text.trim().toLowerCase())).toList() ?? [];

            return Scaffold(
              bottomNavigationBar: widget.buttonBar == true ? const UniversalBottomNav() : const SizedBox.shrink(),
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
                leadingWidth: Get.width / 3.5,
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
                                      Get.find<ProductListController>().getSearchBrandType(pageId: item.value.id);
                                      Get.find<ProductListController>().getAllBrandData(pageId: item.value.id ?? 1);
                                      selectedIndex = item.key;
                                      log('Gender Id: ${item.value.id}');
                                      setState(() {});
                                    },
                                    child: SizedBox(
                                      // color: Colors.red,
                                      width: 90,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.value.title ?? "",
                                            style: selectedIndex == item.key ? railway.copyWith(
                                                height: 1.5,
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold) : railway.copyWith(
                                                height: 1.5,
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),),
                                          const SizedBox(height: 5),
                                          selectedIndex == item.key ?
                                          Container(
                                            color: gold,
                                            height: 2, width: 70,
                                          ) : const SizedBox.shrink()
                                        ],
                                      ),
                                    )),
                              );
                            }).toList() ?? [],
                          )
                      ),
                      const SizedBox(height: 0,),

                      /// =================/@ View Screen @/===================
                      Expanded(
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (ctx, cateIndex){
                                return Column(
                                  children: [
                                    const SizedBox(height: 10),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: menuList.asMap().entries.map((item){
                                            return GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  menuSelect = item.key;
                                                });
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                                margin: const EdgeInsets.only(right: 10),
                                                decoration: BoxDecoration(
                                                  color: menuSelect == item.key ? Colors.black : Colors.white,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.grey
                                                    )
                                                ),
                                                child: Center(
                                                    child: Row(
                                                      children: [
                                                        item.value.img != null ? Image.asset('${item.value.img}', height: 20, width: 20, color: menuSelect == item.key ? Colors.white : Colors.black) : const SizedBox(height: 20),
                                                        const SizedBox(width: 5),
                                                        Text('${item.value.text}',
                                                            style: robotoRegular.copyWith(
                                                                color: menuSelect == item.key ? Colors.white : Colors.black,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 11
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),

                                    menuSelect == 0 ?  const SizedBox(height: 10) : const SizedBox.shrink(),

                                    menuSelect == 0 ?
                                    SizedBox(
                                      height: 40,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: alphabet.length,
                                        padding: const EdgeInsets.only(left: 5, right: 5),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 3, right: 3),
                                            child: SizedBox(
                                              height: 40,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12,
                                                    right: 12,
                                                    top: 6,
                                                    bottom: 6),
                                                child: Center(child: Text(
                                                  alphabet[index],
                                                  style: robotoRegular.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 15),)),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ) : const SizedBox.shrink(),

                                    menuSelect == 2
                                        ? Padding(
                                      padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                                      child: CustomOnlyTextFieldWithBorder(
                                        height: 35,
                                        prefixIcon: Images.search,
                                        controller: searchByBrandTypeCon,
                                        focusNode: searchFcs,
                                        hintText: "Search by brand types..",
                                        hintStyle: railway.copyWith(fontSize: 10),
                                        color: Colors.grey,
                                        onChanged: (val){
                                          setState(() {
                                            searchByBrandType = productController.searchBrandTypeModel?.data?.brands
                                                ?.where((item) => item.name!.toLowerCase().contains(searchByBrandTypeCon.text.trim().toLowerCase())).toList() ?? [];
                                            // Get.find<ProductListController>().getSearchBrandType(
                                            //     pageId: widget.pageId ?? controller.nestedSectionResponse?.data?[cateIndex].pageId,
                                            //     searchQuery: val);
                                          });
                                        },
                                      ),
                                    ) : const SizedBox.shrink(),

                                    menuSelect == 3
                                        ? Padding(
                                      padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                                      child: CustomOnlyTextFieldWithBorder(
                                        height: 35,
                                        prefixIcon: Images.search,
                                        controller: searchByBrandNameCon,
                                        focusNode: searchFcs,
                                        hintText: "Search by Name..",
                                        hintStyle: railway.copyWith(fontSize: 10),
                                        color: Colors.grey,
                                        onChanged: (val){
                                          setState(() {
                                            searchByBrandName = productController.allBrandsList
                                                ?.where((item) => item.name!.toLowerCase().contains(searchByBrandNameCon.text.trim().toLowerCase())).toList() ?? [];
                                          });
                                        },
                                        // onSubmit: (){
                                        //   setState(() {
                                        //     searchByBrandName = productController.allBrandsList
                                        //         ?.where((item) => item.name!.toLowerCase().contains(searchByBrandNameCon.text.trim())).toList() ?? [];
                                        //   });
                                        // },
                                      ),
                                    ) : const SizedBox.shrink(),

                                    menuSelect == 0 ? const SizedBox.shrink() : const SizedBox(height: 15),

                                    menuSelect == 2 ? searchByBrandTypeCon.text.trim().isNotEmpty ?
                                    GridView.builder(
                                        itemCount: searchByBrandType.length,
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        physics: const NeverScrollableScrollPhysics(),
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            mainAxisExtent: 170
                                        ),
                                        itemBuilder: (ctx, brandIndex){
                                          return GestureDetector(
                                            onTap: (){
                                              Get.to(() =>
                                                  ProductPage(
                                                    page: AppConstants.BRAND,
                                                    id: searchByBrandType[brandIndex].id!.toString(),
                                                    pageId: controller.nestedSectionResponse?.data?[cateIndex].pageId,
                                                  ));
                                            },
                                            child: Container(
                                              width: Get.width,
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey
                                                  )
                                              ),
                                              child: Column(
                                                children: [
                                                  Image.network("${AppConstants.BASE_URL}${searchByBrandType[brandIndex].banner ?? ''}",
                                                    height: 120,
                                                    width: Get.width,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Text(searchByBrandType[brandIndex].name ?? '',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: poppins.copyWith(fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                    ) : const SizedBox.shrink() : const SizedBox.shrink(),
                                    // GridView.builder(
                                    //     itemCount: productController.searchBrandTypeModel?.data?.brands?.length ?? 0,
                                    //     shrinkWrap: true,
                                    //     padding: const EdgeInsets.symmetric(horizontal: 10),
                                    //     physics: const NeverScrollableScrollPhysics(),
                                    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    //         crossAxisCount: 2,
                                    //         mainAxisSpacing: 10,
                                    //         crossAxisSpacing: 10,
                                    //         mainAxisExtent: 170
                                    //     ),
                                    //     itemBuilder: (ctx, brandIndex){
                                    //       return GestureDetector(
                                    //         onTap: (){
                                    //           Get.to(() =>
                                    //               ProductPage(
                                    //                 // image: '${AppConstants.BASE_URL}${productController.searchBrandTypeModel?.data?.brands?[brandIndex].banner ?? ""}',
                                    //                 // title: productController.searchBrandTypeModel?.data?.brands?[brandIndex].name ?? "",
                                    //                 // details: brand.details ?? "",
                                    //                 page: AppConstants.BRAND,
                                    //                 id: productController.searchBrandTypeModel?.data?.brands?[brandIndex].id!.toString(),
                                    //                 pageId: controller.nestedSectionResponse?.data?[cateIndex].pageId,
                                    //               ));
                                    //         },
                                    //         child: Container(
                                    //           width: Get.width,
                                    //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    //           decoration: BoxDecoration(
                                    //               border: Border.all(
                                    //                   width: 0.5,
                                    //                   color: Colors.grey
                                    //               )
                                    //           ),
                                    //           child: Column(
                                    //             children: [
                                    //               Image.network("${AppConstants.BASE_URL}${productController.searchBrandTypeModel?.data?.brands?[brandIndex].banner ?? ''}",
                                    //                 height: 120,
                                    //                 width: Get.width,
                                    //                 fit: BoxFit.cover,
                                    //               ),
                                    //               Text(productController.searchBrandTypeModel?.data?.brands?[brandIndex].name ?? '',
                                    //                 overflow: TextOverflow.ellipsis,
                                    //                 style: poppins.copyWith(fontSize: 13),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }
                                    // ) : const SizedBox.shrink() : const SizedBox.shrink(),
                                    // ListView.builder(
                                    //     itemCount: 0,
                                    //     shrinkWrap: true,
                                    //     itemBuilder: (ctx, index){
                                    //       return GridView.builder(
                                    //           itemCount: productController.searchBrandTypeModel?.data?.brands?.length ?? 0,
                                    //           shrinkWrap: true,
                                    //           padding: const EdgeInsets.symmetric(horizontal: 10),
                                    //           physics: const NeverScrollableScrollPhysics(),
                                    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    //               crossAxisCount: 2,
                                    //               mainAxisSpacing: 10,
                                    //               crossAxisSpacing: 10,
                                    //               mainAxisExtent: 170
                                    //           ),
                                    //           itemBuilder: (ctx, brandIndex){
                                    //             return Container(
                                    //               width: Get.width,
                                    //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    //               decoration: BoxDecoration(
                                    //                   border: Border.all(
                                    //                       width: 0.5,
                                    //                       color: Colors.grey
                                    //                   )
                                    //               ),
                                    //               child: Column(
                                    //                 children: [
                                    //                   Image.network("${AppConstants.BASE_URL}${productController.searchBrandTypeModel?.data?.brands?[brandIndex].banner ?? ''}",
                                    //                     height: 120,
                                    //                     width: Get.width,
                                    //                     fit: BoxFit.cover,
                                    //                   ),
                                    //                   Text(productController.searchBrandTypeModel?.data?.brands?[brandIndex].name ?? '',
                                    //                     overflow: TextOverflow.ellipsis,
                                    //                     style: poppins.copyWith(fontSize: 13),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             );
                                    //           }
                                    //       );
                                    //     }
                                    // ),

                                    const SizedBox(height: 15),
                                    Column(
                                      children: [
                                        for (var entry in groupBrandsByFirstLetter(searchByBrandName).entries)
                                          Column(
                                            children: [

                                              Container(
                                                color: Colors.grey.shade200,
                                                height: 40,
                                                width: Get.width,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 15, right: 15),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        entry.key,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: railway.copyWith(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              // Display brands under each letter group
                                              ...entry.value.map((brand) {
                                                return GestureDetector(
                                                  onTap: (){
                                                    Get.to(() =>
                                                        ProductPage(
                                                          image: '${AppConstants.BASE_URL}${brand.banner ?? ""}',
                                                          title: brand.name ?? "",
                                                          details: brand.details ?? "",
                                                          page: AppConstants.BRAND,
                                                          id: brand.id!.toString(),
                                                          pageId: controller.nestedSectionResponse?.data?[cateIndex].pageId,
                                                        ));
                                                    log('Brands Id: ${brand.id!.toString()}');
                                                    log('Brands Id: ${widget.pageId}');
                                                  },
                                                  child: SizedBox(
                                                    height: 30,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 15, right: 15),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            brand.name ?? '',
                                                            overflow: TextOverflow.ellipsis,
                                                            style: poppins.copyWith(fontSize: 12),
                                                          ),
                                                          const SizedBox(width: 8),
                                                          Icon(
                                                            Icons.star_border,
                                                            color: gold,
                                                            size: 20,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ],
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),

                                  ],
                                );
                              }
                          )
                      ),

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

class MenuBrModel{
  String? img;
  String? text;

  MenuBrModel({this.img, required this.text});
}