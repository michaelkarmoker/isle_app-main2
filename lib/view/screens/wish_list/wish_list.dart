import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/all_popup/wardrobe_choose_popup.dart';
import 'package:isletestapp/view/screens/all_popup/wishlist_size_or_color_popup.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wardrob/wardrob_name_create.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';

class WishListPage extends StatefulWidget {
   final int? page;
   WishListPage({Key? key,
     this.page
   }) : super(key: key);
  @override
  State<WishListPage> createState() => _WishListPageState();
}
class _WishListPageState extends State<WishListPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  bool isOpen=false;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    WidgetsBinding.instance.addPostFrameCallback((_) {
          // Get.find<ProductDetailsController>().getBagPageCartData(widget.corelationId);
          Get.find<WishlistController>().getWishlistData();
          if (Get.find<AuthController>().isLoggedIn()){
            Get.find<WishlistController>().getWardrobeData();
          } else {
          }
        }
    );
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color tabColor = gold;
  Color button1Color = gold;
  Color button2Color = gold;
  // Color button3Color = gold;
  // Color button3Color = Colors.grey;

  void changeColor(int buttonNumber) {
    setState(() {
      switch (buttonNumber) {
        case 1:
          button1Color = gold;
          button2Color = gold;
          break;
        case 2:
          button1Color = gold;
          button2Color = gold;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      builder: (controller) {
        return Container(
          // width: Get.width/1.18,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
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
                      onTap: () {
                        Get.to(SearchScreen());
                      },
                      // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                      child: Image.asset(
                        Images.search,
                        height: 22,
                        width: 22,
                      )),
                /*  SizedBox(width: 15),
                  InkWell(
                    onTap: (){
                      Get.to(WishListPage(pageIndex: 0));
                    },
                    child: Image.asset(
                      Images.wish,
                      height: 22,
                      width: 22,
                      color: Color(0xff000000),
                    ),
                  ),*/
                  SizedBox(width: 10),
                ],
                leadingWidth: Get.width / 3.5,
                title: CustomLogo(),
              ),
              // backgroundColor: Color(0xffEBEFF3),
              backgroundColor: Color(0xffFFFFFF),
              body: Column(
                children: [
                  /// Tab Bar Part
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      // color: Color(0xffFFFFFF),
                      height: 40,
                      child: Container(
                        // color: tabColor,
                        // color: Color(0xffFFFFFF),
                        child: TabBar(
                            controller: _tabController,
                            indicatorPadding: EdgeInsets.symmetric(horizontal: 35),
                            onTap: (index) {
                              setState(() {
                                if (index == 0) {
                                  tabColor = gold;
                                }
                                if (index == 1) {
                                  tabColor = gold;
                                }
                              });
                              print(index);
                            },
                            indicatorColor: tabColor,
                            indicatorWeight: 2.5,
                            tabs: [
                              Tab(
                                  child:
                       controller.getWishlistResponse!=null?
                                  Text(
                                    'My WishList ( ${controller.getWishlistResponse!.data!.length??"0"} )',
                                    style: railway.copyWith(
                                        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                  )
                              :  Text(
                          'My WishList ( 0 )',
                          style: railway.copyWith(
                              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                        )
                              ),
                              Tab(
                                  child:
                                  controller.wardrobeResponse!=null?
                                  Text(
                                    'My Wardrobe ( ${controller.wardrobeResponse!.data!.length??"0"} )',
                                    style: railway.copyWith(
                                        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold ),
                                  )
                              : Text(
                                    'My Wardrobe ( 0 )',
                                    style: railway.copyWith(
                                        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                                  )
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 10,
                    color: Color(0xffF2F6F9),
                    // color: Colors.pink,
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                      /// 1 st TAB
                      RefreshIndicator(
                          onRefresh: () async {
                            await Get.find<WishlistController>().getWishlistData();
                          },
                          child: SingleChildScrollView(
                            child:
                            controller.getWishlistResponse!=null? controller.getWishlistResponse!.data!.length>0?
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.getWishlistResponse!.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                      height:  Get.height / 3.5 ,
                                      // color: Colors.deepPurpleAccent,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: Column(
                                                children: [
                                                  Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (){
                                                            Get.to(()=>ProductDetailsPage(
                                                              productId: controller.getWishlistResponse?.data?[index]?.productId?.toString()??"",
                                                            ));
                                                          },
                                                          child: Container(
                                                            // color: Color(0xffFFFFFF),
                                                              color: Color(0xffFAFAFA),
                                                            //   color: Colors.pink,
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsets.only(bottom: 0, left: 8, right: 0 ),
                                                                child : CarouselSlider(
                                                                  // options: CarouselOptions(height: 400.0),
                                                                  items: [
                                                                    // controller.productDetailsResponse!.data!.productColorVariants![controller.sectedColorVAriantIndex].profilePhoto,
                                                                    controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].frontPhoto??"",
                                                                    controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].backsidePhoto??"",
                                                                    controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].details1Photo??"",
                                                                    controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].details2Photo??"",
                                                                    controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[0].outfitPhoto??"",
                                                                  ].map((i) {
                                                                    return Builder(
                                                                      builder: (BuildContext context) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets.only(bottom: 45),
                                                                          child: Stack(
                                                                            alignment: Alignment.center,
                                                                            children: [
                                                                              Container(
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
                                                                                    fit: BoxFit.fill,
                                                                                    isRound: false,
                                                                                    height: Get.height / 3.5,
                                                                                    width: Get.width,
                                                                                  )
                                                                              ),
                                                                            ),
                                                                              Positioned(
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
                                                                              ),
                                                                            ]
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
                                                                    height: Get.height / 3.5,
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
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Container(
                                                            width: 150,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 15, right: 8),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  // Get.to(
                                                                  //   showModalBottomSheet(
                                                                  //     context: context,
                                                                  //     builder: (BuildContext context) {
                                                                  //       return SimilarPopup(id: controller.getWishlistResponse!.data![index]!.product!.childCategories![0].childCategoryProduct!.childCategoryId!.toString(),);
                                                                  //     },
                                                                  //   ),
                                                                  // );
                                                                },
                                                                child: Container(
                                                                  width: Get.width,
                                                                  height: 35,
                                                                  // margin: EdgeInsets.all(10),
                                                                  // padding: EdgeInsets.all(5),
                                                                  child: Padding(
                                                                    padding:
                                                                    const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
                                                                    child: Center(
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Container(
                                                                              // color: Colors.blue,
                                                                                height: 22,
                                                                                width: 22,
                                                                                child: Image.asset(Images.similar)),
                                                                            // SizedBox(width: 4),
                                                                            Center(
                                                                                child: Text(
                                                                                  'See Similar'.toUpperCase(),
                                                                                  style: poppins.copyWith(
                                                                                      color: Colors.black,
                                                                                      fontSize: 9.5,
                                                                                      fontWeight: FontWeight.w600),
                                                                                )),
                                                                            // Text('${brandlist[index]}'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black, fontSize: 10),),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                    // color: Colors.greenAccent,
                                                                      borderRadius: BorderRadius.circular(3),
                                                                      // color: Colors.black87,
                                                                      border: Border.all(
                                                                        color: Colors.grey,
                                                                        width: 0.2,
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                      ]),
                                       /*           SizedBox(height: 8),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.to(
                                                          showModalBottomSheet(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return SimilarPopup();
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        width: Get.width,
                                                        height: 35,
                                                        // margin: EdgeInsets.all(10),
                                                        // padding: EdgeInsets.all(5),
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
                                                          child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    // color: Colors.blue,
                                                                      height: 22,
                                                                      width: 22,
                                                                      child: Image.asset(Images.similar)),
                                                                  // SizedBox(width: 4),
                                                                  Center(
                                                                      child: Text(
                                                                        'See Similar'.toUpperCase(),
                                                                        style: poppins.copyWith(
                                                                            color: Colors.black,
                                                                            fontSize: 9.5,
                                                                            fontWeight: FontWeight.w600),
                                                                      )),
                                                                  // Text('${brandlist[index]}'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black, fontSize: 10),),
                                                                ],
                                                              )),
                                                        ),
                                                        decoration: BoxDecoration(
                                                          // color: Colors.greenAccent,
                                                            borderRadius: BorderRadius.circular(3),
                                                            // color: Colors.black87,
                                                            border: Border.all(
                                                              color: Colors.grey,
                                                              width: 0.2,
                                                            )),
                                                      ),
                                                    ),
                                                  ),*/
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
                                                          SizedBox(height: 4),
                                                          controller.getWishlistResponse!.data![index]!.product!.brand== null?
                                                          SizedBox():
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 8),
                                                                child: Text(
                                                                  "${controller.getWishlistResponse!.data![index]!.product!.brand!.name??""}",
                                                                  maxLines: 1,
                                                                  style: railway.copyWith(
                                                                      fontWeight: FontWeight.bold,
                                                                      color: Colors.black87,
                                                                      fontSize: 16
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(top: 0, right: 5),
                                                                    child: InkWell(
                                                                        onTap: (){
                                                                          Get.dialog( CustomAlerDialogForPermission(
                                                                            iconString: Images.delete,
                                                                            title: 'Remove Item',
                                                                            description: 'Do you really want to remove from wishlist?',
                                                                            yesBtntap: () {
                                                                              Get.back();
                                                                            },
                                                                            noBtntap: (){
                                                                              Get.back();
                                                                              controller.deleteWish(controller.getWishlistResponse?.data?[index]?.id?.toString()??"");
                                                                            },
                                                                            noBtnText: "YES",
                                                                            yesBtnText: "NO",
                                                                          ));
                                                                          // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());

                                                                        },
                                                                        child: Image.asset(Images.delete, color: silvercolor, height: 28, width: 28,)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
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
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 8),
                                                            child: Container(
                                                              // color: Colors.deepPurple,
                                                              // width: Get.width ,
                                                              height: 40 ,
                                                              decoration: BoxDecoration(
                                                                // color: Colors.yellowAccent.shade100,
                                                                  borderRadius: BorderRadius.circular(0),
                                                                  border: Border.all(color: Colors.grey,
                                                                    width: 0.1,
                                                                  )),
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 0),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Row(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Get.to(
                                                                                      showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        context: context,
                                                                                        builder: (BuildContext context) {
                                                                                          return  WishlistPopupSizeOrColor(productIndex: index,);
                                                                                        },
                                                                                      ),
                                                                                      fullscreenDialog: true
                                                                                  );
                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  // color: Colors.blue.shade50,
                                                                                  height: 35,
                                                                                  width: 120,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          // color: Colors.white,
                                                                                          // height: 20,
                                                                                          padding: const EdgeInsets.only(left: 0, top: 5),
                                                                                          child: Text(
                                                                                            textAlign: TextAlign.center,
                                                                                            "Size".toUpperCase(),
                                                                                            style: railway.copyWith(
                                                                                              fontSize: 10,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              color: Colors.black54,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(height: 1),
                                                                                        Container(
                                                                                          // height: 20,
                                                                                          // color: Colors.yellow,
                                                                                          child: Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                "select",
                                                                                                style: railway.copyWith(
                                                                                                  fontSize: 11,
                                                                                                  fontWeight: FontWeight.w700,
                                                                                                  color: Colors.black54,
                                                                                                ),
                                                                                              ),
                                                                                              SizedBox(width: 2),
                                                                                              Image.asset(Images.drop, height: 13, width: 13, color: Colors.black54,),
                                                                                              // Icon(Icons.arrow_drop_down_sharp, color: Colors.black54, size: 13),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: InkWell(
                                                                            onTap: () {
                                                                              // Get.back();
                                                                            },
                                                                            child:
                                                                            Container(
                                                                                alignment: Alignment.centerRight,
                                                                                // color: Colors.teal,
                                                                                width: 25,
                                                                                height: 28,
                                                                                // child: Icon(Icons.close, color: gold, size: 16,)
                                                                                child: SizedBox()
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      bottom: 0,
                                                      left: 12,
                                                      right: 8,

                                                      child:  CustomButton(
                                                          height: 35,
                                                          width: Get.width,
                                                          buttoncolor: gold,
                                                          color: Colors.white,
                                                          buttontextcolor: Colors.white,
                                                          myfontweight: FontWeight.bold,
                                                          radius: 0,
                                                          fontSize: 11,
                                                          onPressed: () {
                                                            Get.to(
                                                                showModalBottomSheet(
                                                                  isScrollControlled: true,
                                                                  context: context,
                                                                  builder: (BuildContext context) {
                                                                    return  WishlistPopupSizeOrColor(productIndex: index,);
                                                                  },
                                                                ),
                                                                fullscreenDialog: true
                                                            );
                                                          },
                                                          buttonText: "Add to Bag".toUpperCase())
                                                  )
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
                            )
                                : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 120,),
                                // Image.asset(Images.emptybag,),
                                Icon(Icons.favorite_outlined, color: gold, size: 80,),
                                SizedBox(height: 20,),
                                Text("All your favorites\nwill be saved here",style: railwaybold.copyWith(fontSize: 25, height: 1.2),),
                                SizedBox(height: 20),
                                Text("Start adding items to your wishlist by clicking on the heart",style: railway.copyWith(fontSize: 13),),
                                SizedBox(height: 30),
                                CustomButton(
                                  radius: 0,
                                  height: 45,
                                  width: 180,
                                  buttoncolor: Colors.black,
                                  buttontextcolor: Colors.white,
                                  myfontweight: FontWeight.bold,
                                  onPressed: () {
                                    Get.to(MainScreen());
                                  },
                                  buttonText: 'Start Shopping'.toUpperCase(),
                                  fontSize: 13,
                                ),

                                SizedBox(height: 30),

                              ],
                            )
                                : SizedBox(),
                          )
                      ),

                      /// 2nd TAB
                          Get.find<AuthController>().isLoggedIn()?
                          RefreshIndicator(
                              onRefresh: () async {
                                await Get.find<WishlistController>().getWardrobeData();
                              },
                              child: SingleChildScrollView(
                                  child:

                                  Column(
                                    children: [
                                      Divider(
                                        height: 5,
                                        thickness: 5,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(CreateWardrobe());
                                        },
                                        child: Container(
                                            color: Color(0xffFFFFFF),
                                            child: Row(
                                              children: [

                                                Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Image.asset(Images.addnew, height: 22, width: 22, color: Colors.black54,),
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 9,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
                                                      child: Text("Create new wardrobe",  style: railway.copyWith(
                                                        fontSize: 11,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),),
                                                    )
                                                ),

                                                Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 8),
                                                      child: Icon(Icons.add, size: 22,  color: gold,),
                                                      // child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                                    )
                                                )
                                              ],
                                            )
                                        ),
                                      ),
                                      Divider(
                                        thickness: 15,
                                        height: 15,
                                        color: Color(0xffF2F6F9),
                                      ),

                                      controller.wardrobeResponse!=null? controller.wardrobeResponse!.data!.length>0?
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: controller.wardrobeResponse?.data?.length??0,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Column(
                                            children: [
                                              Container(
                                                  color: Color(0xffFFFFFF),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [

                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 9,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left:20, top: 10),
                                                              child: Text("${controller.wardrobeResponse?.data?[index]?.name??""} ( ${controller.wardrobeResponse?.data?[index]?.wardrobeProducts?.length??0} )",  style: railway.copyWith(
                                                                fontSize: 13,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black,
                                                              ),),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 0, top: 10, right: 8),
                                                              child: Image.asset(Images.sharepeople, height: 22, width: 22, color: Colors.black54,),
                                                              // child: Icon(Icons.share, size: 22,  color: Colors.black54,),
                                                              // child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: InkWell(
                                                              onTap: (){
                                                                Get.dialog( CustomAlerDialogForPermission(
                                                                  iconString: Images.delete,
                                                                  title: 'Remove Item',
                                                                  description: 'Do you really want to remove wardrobe?',
                                                                  yesBtntap: () {
                                                                    Get.back();
                                                                  },
                                                                  noBtntap: (){
                                                                    controller.deleteWardrobe(controller.wardrobeResponse?.data?[index]?.id?.toString()??"");
                                                                    Get.back();
                                                                  },
                                                                  noBtnText: "YES",
                                                                  yesBtnText: "NO",
                                                                ));
                                                                // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());

                                                              },
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 0, top: 10, right: 15 ),
                                                                // child: Image.asset(Images.sharepeople, height: 22, width: 22, color: Colors.black54,),
                                                                child: Icon(Icons.delete_outline_outlined, size: 22,  color: silvercolor),
                                                                // child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      /*   InkWell(
                                                      onTap: () {
                                                        Get.to((ChooseWardrobe()));
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 20),
                                                        child: Container(
                                                            color: Color(0xffFFFFFF),
                                                            child: Row(
                                                              children: [

                                                         *//*       Expanded(
                                                                    flex: 2,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.only(left: 0),
                                                                      child: Image.asset(Images.wish, height: 25, width: 25, color: Colors.black,),
                                                                    )
                                                                ),*//*
                                                                Expanded(
                                                                    flex: 9,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 10),
                                                                      child: Text("Add New Items From Wishlist",  style: railway.copyWith(
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.bold,
                                                                        color: Colors.black,
                                                                      ),),
                                                                    )
                                                                ),

                                                                Expanded(
                                                                    flex: 2,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.only(left: 16),
                                                                      child: Icon(Icons.add, size: 22,  color: gold),
                                                                      // child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                                                    )
                                                                )
                                                              ],
                                                            )
                                                        ),
                                                      ),
                                                    ),*/

                                                      SizedBox(height: 12),
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
                                                                    height: 100,
                                                                    // color: Colors.pink,
                                                                    child:
                                                                    controller.wardrobeResponse!.data![index]!.wardrobeProducts!.length>0?
                                                                    ListView.builder(
                                                                      scrollDirection: Axis.horizontal,
                                                                      shrinkWrap: true,
                                                                      physics: BouncingScrollPhysics(),
                                                                      itemCount: controller.wardrobeResponse?.data?[index]?.wardrobeProducts?.length??0,
                                                                      itemBuilder: (BuildContext context, int index2) {
                                                                        return Stack(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(top: 7),
                                                                              child: Container(
                                                                                // color: Color(0xffF2F6F9),
                                                                                // color: Colors.purpleAccent,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(right: 8),
                                                                                  child:
                                                                                  CustomImageCached(
                                                                                    placeholder: "assets/image/placeholder.png",
                                                                                    image: '${AppConstants.BASE_URL}${controller.wardrobeResponse?.data?[index]?.wardrobeProducts![index2]?.wishlist?.product?.productColorVariants?[controller.sectedColorVAriantIndex]?.profilePhoto??0}',
                                                                                    height: 90,
                                                                                    width: 70,
                                                                                    fit: BoxFit.fill,
                                                                                    isRound: false,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Positioned(
                                                                                top: -0,
                                                                                right: 2,
                                                                                child: InkWell(
                                                                                    onTap: (){
                                                                                      Get.dialog( CustomAlerDialogForPermission(
                                                                                        iconString: Images.delete,
                                                                                        title: 'Remove Item',
                                                                                        description: 'Do you really want to remove from wardrobe product?',
                                                                                        yesBtntap: () {
                                                                                          Get.back();
                                                                                        },
                                                                                        noBtntap: (){
                                                                                          controller.deleteWardrobeProduct(
                                                                                            controller.wardrobeResponse?.data?[index]?.wardrobeProducts?[index2]?.id?.toString()??"",

                                                                                          );
                                                                                          Get.back();
                                                                                        },
                                                                                        noBtnText: "YES",
                                                                                        yesBtnText: "NO",
                                                                                      ));
                                                                                      // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());

                                                                                    },
                                                                                    child: Icon(Icons.delete_outline_outlined, size: 15, color: silvercolor,))
                                                                            )
                                                                          ],
                                                                        );
                                                                      },
                                                                    )
                                                                        :  Center(child: Text("No data has been added to the wish list", style: railway.copyWith(fontSize: 12),)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Container(
                                                                    // color: Colors.orange,
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                      children: [
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
                                                                          /*       onTap: () {
                                                                          _tabController.animateTo(0);
                                                                          Get.to((WishListPage(page: AppConstants.CLICKFROMWARDROBE)));
                                                                        },*/
                                                                          child: CircleAvatar(
                                                                            radius: 20,
                                                                            backgroundColor: Color(0xffF2F6F9),
                                                                            child: Icon(Icons.add, size: 22,  color: gold),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
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


                                              /*          Container(
                                                color: Color(0xffFFFFFF),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:20, top: 10),
                                                          child: Text("My friday program (3)",  style: railway.copyWith(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0, top: 10, right: 15),
                                                          child: Image.asset(Images.sharepeople, height: 22, width: 22, color: Colors.black54,),
                                                          // child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                                        )
                                                      ],
                                                    ),
                                                   *//* InkWell(
                                                      onTap: () {
                                                        Get.to((ChooseWardrobe()));
                                                      },
                                                      child: Container(
                                                          color: Color(0xffFFFFFF),
                                                          child: Row(
                                                            children: [

                                                              Expanded(
                                                                  flex: 2,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 0),
                                                                    child: Image.asset(Images.wish, height: 25, width: 25, color: Colors.black,),
                                                                  )
                                                              ),
                                                              Expanded(
                                                                  flex: 9,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 10),
                                                                    child: Text("Add New Items From Wishlist",  style: railway.copyWith(
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
                                                                    child: Icon(Icons.add, size: 22,  color: Colors.black54,),
                                                                    // child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                                                  )
                                                              )
                                                            ],
                                                          )
                                                      ),
                                                    ),*//*

                                                    SizedBox(height: 15),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [

                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Expanded(
                                                                child: Container(
                                                                  height: 90,
                                                                  // color: Colors.pink,
                                                                  child: ListView.builder(
                                                                    scrollDirection: Axis.horizontal,
                                                                    shrinkWrap: true,
                                                                    physics: BouncingScrollPhysics(),
                                                                    itemCount: 4,
                                                                    itemBuilder: (BuildContext context, int index) {
                                                                      return Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwishlist%2F216580908_gry_in.webp&w=640&q=75",
                                                                        height: 90,
                                                                        width: 70,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
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
                                            ),*/
                                            ],
                                          );
                                        },
                                      )
                                          : Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 100,),
                                            // Image.asset(Images.emptybag,),
                                            Icon(Icons.hourglass_empty, color: gold, size: 60,),
                                            SizedBox(height: 20,),
                                            Text("Lets Create Collection",style: railwaybold.copyWith(fontSize: 18),),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.check_circle_rounded, color: gold, size: 20),
                                                SizedBox(width: 8),
                                                Expanded(child: Text("Organize Your wishlisted items into meaningfull groups mcalled wardrobe",style: railway.copyWith(fontSize: 13),)),
                                              ],
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.check_circle_rounded, color: gold, size: 20),
                                                SizedBox(width: 8),
                                                Expanded(child: Text("Curate Item based on gifting, events, themes, and much more.",style: railway.copyWith(fontSize: 13),)),
                                              ],
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.check_circle_rounded, color: gold, size: 20),
                                                SizedBox(width: 8),
                                                Expanded(child: Text("Create Upto 10 collections with a maximum of 40 items per wardrobe",style: railway.copyWith(fontSize: 13),)),
                                              ],
                                            ),
                                            SizedBox(height: 12),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.check_circle_rounded, color: gold, size: 20),
                                                SizedBox(width: 8),
                                                Expanded(child: Text("Share Share your wardrobe with friends and family.",style: railway.copyWith(fontSize: 13),)),
                                              ],
                                            ),

                                            SizedBox(height: 30),

                                          ],
                                        ),
                                      )
                                          : SizedBox(),
                                    ],
                                  )

                              )
                          )
                          : LoginRegisterPage(isFromCart: false, ),

                    ]),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }



}
