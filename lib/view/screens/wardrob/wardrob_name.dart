import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/all_popup/wardrobe_choose_popup.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import 'package:isletestapp/view/screens/brand_page/brand_page_previous.dart';
import 'package:isletestapp/view/screens/design%20backup/categories_tab.dart';
import 'package:isletestapp/view/screens/dashboard/widgets/bottom_nav_item.dart';
import 'package:isletestapp/view/screens/discover/discover_page_previous.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/design%20backup/search_sunny.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wardrob/choose_wardrob_page.dart';

class WardrobNameList extends StatefulWidget {
  const WardrobNameList({Key? key, }) : super(key: key);

  @override
  State<WardrobNameList> createState() => _WardrobNameState();
}

class _WardrobNameState extends State<WardrobNameList> {
  TextEditingController wardrobCtr = TextEditingController();
  FocusNode wardrobFcs = FocusNode();

  PageController? _pageController;
  bool isOpen=false;


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
          // Get.find<ProductDetailsController>().getBagPageCartData(widget.corelationId);
          Get.find<WishlistController>().getWishlistData();
          Get.find<WishlistController>().getWardrobeData();
        }
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xffF2F6F9),
          bottomNavigationBar: UniversalBottomNav(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xff000000)),
            titleSpacing: 0,
            backgroundColor: Color(0xffFFFFFF),
            centerTitle: true,
            elevation: 0,
            leadingWidth: Get.width / 3.5,
          title: Column(
            children: [
              Text("My Wardrobe",  style: railway.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
              SizedBox(height: 2),
        /*      Text("${Get.find<WishlistController>().wardrobeResponse?.data?[index]?.wardrobeProducts?.length}0 items",  style: railway.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),),*/
            ],
          ),
          ),

          body: SingleChildScrollView(
            child:
            controller.wardrobeResponse!=null? controller.wardrobeResponse!.data!.length>0?
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  // itemCount: controller.wardrobeResponse?.data?.length??0,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Divider(
                          height: 5,
                          thickness: 5,
                          color: Color(0xffF2F6F9),
                          // color: Colors.pink,
                        ),
                        InkWell(
                          onTap : () {
                            controller.getWishlistResponse!.data!.length>0?
                            Get.to(
                              showModalBottomSheet(
                                context: context,
                                isDismissible: false,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return WardrobeChoosePopup(wardrobeIndex: index,wardrobeName: controller.wardrobeResponse!.data![index].name??"",);
                                },
                              ),
                            )
                                : showCustomSnackBar("No data has been added to the wish list", isPosition: false, isError: false);
                          },
                          child: Container(
                              color: Color(0xffFFFFFF),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: SizedBox()
                                  ),
                                  Expanded(
                                      flex: 9,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
                                        child: Text("${controller.wardrobeResponse?.data?[0]?.name??""}",
                                          maxLines: 1,
                                          style: railway.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),),
                                      )
                                  ),

                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Icon(Icons.add, size: 22,  color: gold),
                                        // child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                      )
                                  )
                                ],
                              )
                          ),
                        ),
                        Divider(
                          thickness: 10,
                          height: 10,
                          color: Color(0xffF2F6F9),
                        ),
                        Container(
                            color: Color(0xffFFFFFF),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 8, top: 0, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 9,
                                            child: Container(
                                              height: 90,
                                              // color: Colors.pink,
                                              child:
                                              controller.wardrobeResponse!.data![index]!.wardrobeProducts!.length>0?
                                              ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                physics: BouncingScrollPhysics(),
                                                itemCount: controller.wardrobeResponse?.data?[index]?.wardrobeProducts?.length??0,
                                                itemBuilder: (BuildContext context, int index2) {
                                                  return Container(
                                                    // color: Color(0xffF2F6F9),
                                                    // color: Colors.purpleAccent,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 8),
                                                      child: CustomImageCached(
                                                        placeholder: "assets/image/placeholder.png",
                                                        image: '${AppConstants.BASE_URL}${controller.wardrobeResponse?.data?[index]?.wardrobeProducts![0]?.wishlist?.product?.productColorVariants?[controller.sectedColorVAriantIndex]?.profilePhoto??0}',
                                                        height: 90,
                                                        width: 70,
                                                        fit: BoxFit.fill,
                                                        isRound: false,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                                  :  Center(child: Text("No data has been added to the wish list", style: railway.copyWith(fontSize: 12),)),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        Divider(
                          thickness: 15,
                          height: 15,
                          color: Color(0xffF2F6F9),
                        ),
                      ],
                    );
                  },
                ),
              ],
            )
                : SizedBox() : SizedBox(),
          ),
        );
      }
    );
  }



}
