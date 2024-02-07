import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/my%20favorite%20brands/my_favorite_brands_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_shimmer.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';

class FavoriteBrands extends StatefulWidget {
  bool isClickBrands=false;
  bool isClickBrands2=false;
  FavoriteBrands({Key? key, }) : super(key: key);
  @override
  State<FavoriteBrands> createState() => _ProductListState();
}
class _ProductListState extends State<FavoriteBrands> {
  int selectedIndex=-1;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<MyFavoriteBrandsController>().dataInitialize();
    }
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<MyFavoriteBrandsController>().dataClear();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteBrandsController>(
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: UniversalBottomNav(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xff000000)),
              titleSpacing: 0,
              backgroundColor: Color(0xffFFFFFF),
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 62,
              actions: [
                InkWell(
                    onTap: (){
                      Get.to(SearchScreen());
                    },
                    // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                    child: Image.asset(Images.search, height: 22, width: 22,)),
                SizedBox(width: 2),
                WishButtonWidget(),
                SizedBox(width: 4),
              ],
              leadingWidth: Get.width / 3.5,
              title: CustomLogo(),
            ),
            // backgroundColor: Color(0xffEBEFF3),
            backgroundColor: Color(0xffFFFFFF),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 0,right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 30,),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("My Favourite Brands", style: railwaybold.copyWith(fontSize: 17)),
                    ),
                    SizedBox(height: 10),
                    controller.alldata!.length==0?
                    MyShimmer(hight: 40)
                        :
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 8),
                      child: Container(
                        height: 55,
                        child: ListView.builder(
                          itemCount: controller.alldata!.length,
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool isSelected = selectedIndex == index;
                            return Padding(
                              padding: const EdgeInsets.all(3),
                              child: InkWell(
                                onTap: () {
                                  controller.getFavoriteBrandsGenderWiseData(controller.alldata![index].id.toString());
                                  selectedIndex = index;
                                  setState(() {});
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 25),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: isSelected ? gold : silvercolor, // Set border color
                                          width: 1, // Set border width
                                        ),
                                        borderRadius: BorderRadius.circular(3),
                                        color: isSelected ? Colors.transparent : Colors.white, // Set background color
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 2, bottom: 5),
                                        child: Text(
                                          "${controller.alldata?[index]?.title ?? ""}",
                                          style: isSelected
                                              ? railway.copyWith(
                                            height: 1.5,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )
                                              : railway.copyWith(
                                            height: 1.5,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 0,),
                    /// view
                    selectedIndex != -1 ?
                    controller.favoriteBrandsResponse!= null&&controller.favoriteBrandsResponse!.data!=null && controller.favoriteBrandsResponse!.data!.length>0 ?
                    Expanded(
                        child: SingleChildScrollView(
                          child: controller.favoriteBrandsResponse!=null?
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: GridView.builder(
                                    itemCount: controller.favoriteBrandsResponse?.data?.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true, // Important to make it work inside a SingleChildScrollView
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4, // Number of columns
                                        childAspectRatio: 1.6,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          /*            Get.to(
                                                ProductPage(
                                                  // image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].banner?? ""}',
                                                  // title: controller.nestedSectionResponse?.data?[index]?.title??"",
                                                  // details: controller.nestedSectionResponse?.data?[index]?.details??"",
                                                  page: AppConstants.BRAND,
                                                  id: controller.lovingBrandResponse!.data![index].brand!.id!.toString(),
                                                ));*/
                                        },
                                        child: Card(
                                          margin: EdgeInsets.all(2),
                                          elevation: 0.5,
                                          child: Container(
                                            // color: Colors.green,
                                            height: 120, width: 130,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    // width: 30,
                                                      child: Icon(Icons.star, color: gold, size: 16,)
                                                    // child: Icon(Icons.star_border_outlined, color: gold, size: 16,)
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: CustomImageCached(
                                                    isRound: false,
                                                    placeholder: Images.placeholder,
                                                    image: '${AppConstants.BASE_URL}${controller.favoriteBrandsResponse!.data![index].brand!.logo ?? ""}',
                                                    // fit: BoxFit.fitHeight,
                                                    height: Get.height,
                                                    width: Get.width,
                                                    fit: BoxFit.fill,
                                                    // height: Get.height/5.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }, // Total number of items
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text("Recommended For You", style: railwaybold.copyWith(fontSize: 17)),
                                SizedBox(height: 15),
                                controller.lovingBrandResponse!=null?
                                Container(
                                  height: Get.height/4.2,
                                  child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.lovingBrandResponse?.data?.length??0,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          Get.to(()=>
                                              ProductPage(
                                                image: '${AppConstants.BASE_URL}${controller.lovingBrandResponse!.data![index].brand!.banner?? ""}',
                                                title: controller.lovingBrandResponse!.data![index].brand!.name??"",
                                                details: controller.lovingBrandResponse!.data![index].brand!.details??"",
                                                page: AppConstants.BRAND,
                                                id: controller.lovingBrandResponse!.data![index].brand!.id!.toString(),
                                                // pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                              ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 2),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: gold, width: 1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 25, right: 25),
                                            child: CustomImageCached(
                                              isRound: false,
                                              image: '${AppConstants.BASE_URL}${controller.lovingBrandResponse!.data![index].logo ?? ""}',
                                              // fit: BoxFit.fitHeight,
                                              height: Get.height/4.2,
                                              width: Get.width,
                                              fit: BoxFit.contain,
                                              // height: Get.height/5.5,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                                : SizedBox(),
                                SizedBox(height: 80),
                              ],
                            ),
                          )
                              : SizedBox(),
                        )
                    )
                        : SizedBox(child: Center(child: CircularProgressIndicator()),)

                   : controller.allFavouriteBrandsResponse!= null&&controller.allFavouriteBrandsResponse!.data!=null && controller.allFavouriteBrandsResponse!.data!.length>0 ?
                    Expanded(
                        child: SingleChildScrollView(
                          child: controller.allFavouriteBrandsResponse!=null?
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: GridView.builder(
                                    itemCount: controller.allFavouriteBrandsResponse?.data?.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true, // Important to make it work inside a SingleChildScrollView
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4, // Number of columns
                                        childAspectRatio: 1.6,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          /*            Get.to(
                                                ProductPage(
                                                  // image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].banner?? ""}',
                                                  // title: controller.nestedSectionResponse?.data?[index]?.title??"",
                                                  // details: controller.nestedSectionResponse?.data?[index]?.details??"",
                                                  page: AppConstants.BRAND,
                                                  id: controller.lovingBrandResponse!.data![index].brand!.id!.toString(),
                                                ));*/
                                        },
                                        child: Card(
                                          margin: EdgeInsets.all(2),
                                          elevation: 0.5,
                                          child: Container(
                                            // color: Colors.green,
                                            height: 120, width: 130,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                    // width: 30,
                                                      child: Icon(Icons.star, color: gold, size: 16,)
                                                    // child: Icon(Icons.star_border_outlined, color: gold, size: 16,)
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: CustomImageCached(
                                                    isRound: false,
                                                    placeholder: Images.placeholder,
                                                    image: '${AppConstants.BASE_URL}${controller.allFavouriteBrandsResponse!.data![index].brand!.logo ?? ""}',
                                                    // fit: BoxFit.fitHeight,
                                                    height: Get.height,
                                                    width: Get.width,
                                                    fit: BoxFit.fill,
                                                    // height: Get.height/5.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }, // Total number of items
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text("Recommended For You", style: railwaybold.copyWith(fontSize: 17)),
                                SizedBox(height: 15),
                                controller.lovingBrandResponse!=null?
                                Container(
                                  height: Get.height/4.2,
                                  child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.lovingBrandResponse?.data?.length??0,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          Get.to(()=>
                                              ProductPage(
                                                image: '${AppConstants.BASE_URL}${controller.lovingBrandResponse!.data![index].brand!.banner?? ""}',
                                                title: controller.lovingBrandResponse!.data![index].brand!.name??"",
                                                details: controller.lovingBrandResponse!.data![index].brand!.details??"",
                                                page: AppConstants.BRAND,
                                                id: controller.lovingBrandResponse!.data![index].brand!.id!.toString(),
                                                // pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                              ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 2),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: gold, width: 1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 25, right: 25),
                                            child: CustomImageCached(
                                              isRound: false,
                                              image: '${AppConstants.BASE_URL}${controller.lovingBrandResponse!.data![index].logo ?? ""}',
                                              // fit: BoxFit.fitHeight,
                                              height: Get.height/4.2,
                                              width: Get.width,
                                              fit: BoxFit.contain,
                                              // height: Get.height/5.5,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                                    : SizedBox(),
                                SizedBox(height: 80),
                              ],
                            ),
                          )
                              : SizedBox(),
                        )
                    )
                        : SizedBox(child: Center(child: CircularProgressIndicator()),)


                        // : Container(height: 100, width: 100, color: Colors.red,)


                    /*  :  Expanded(
                      child: ListView.builder(
                          itemCount: 6,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return  Padding(
                              padding: const EdgeInsets.all(8),
                              child: MyShimmer(hight: 120),
                            );
                          }
                      ),
                    )*/
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}