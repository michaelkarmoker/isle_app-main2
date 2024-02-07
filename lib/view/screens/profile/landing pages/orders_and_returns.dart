import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/orders%20refunds/orders_and_retunds_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/helper/date_converter.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/all_popup/wardrobe_choose_popup.dart';
import 'package:isletestapp/view/screens/all_popup/wishlist_size_or_color_popup.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import 'package:isletestapp/view/screens/brand_page/brand_page_previous.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/product%20page/brand_view_page.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/design%20backup/categories_tab.dart';
import 'package:isletestapp/view/screens/dashboard/widgets/bottom_nav_item.dart';
import 'package:isletestapp/view/screens/discover/discover_page_previous.dart';
import 'package:isletestapp/view/screens/home/home_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/all_popup/shop_the_look_popup.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wardrob/choose_wardrob_page.dart';
import 'package:isletestapp/view/screens/wardrob/wardrob_name.dart';
import 'package:isletestapp/view/screens/wardrob/wardrob_name_create.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';
import 'package:isletestapp/view/auth/login-register.dart';


class OrdersReturns extends StatefulWidget {
  // final int pageIndex;
  // final int? page;
  OrdersReturns({Key? key,
    // required this.pageIndex,
    // this.page
  }) : super(key: key);
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;

  @override
  State<OrdersReturns> createState() => _WishListPageState();
}

class _WishListPageState extends State<OrdersReturns> {
  late TabController _tabController;

  PageController? _pageController;
  bool isOpen=false;

/*  @override
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
  }*/
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get.find<ProductListController>().getGeneralSettingData();
      Get.find<OrdersReturnsController>().dataInitialize();
      // Get.find<OrdersReturnsController>().getPendingOrdersReturnData();
      // Get.find<OrdersReturnsController>().getConfirmOrdersReturnData();
      // Get.find<OrdersReturnsController>().getRejectOrdersReturnData();
    });
    super.initState();
  }
  @override
  void dispose() {
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
    return GetBuilder<OrdersReturnsController>(
        builder: (controller) {
          return DefaultTabController(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 20,bottom: 15),
                    child: Text("Orders and Returns", style: railwaybold.copyWith(fontSize: 20),),
                  ),
                  SizedBox(height: 5),
                  /// Tab Bar Part
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        color: Colors.white, // Background color for the Container
                      ),
                      child: TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          border: Border.all(color: gold, ),
                          // borderRadius: BorderRadius.circular(20), // Same as Container's borderRadius
                          color: tabColor, // Use the tabColor variable
                        ),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
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
                            child: Text(
                              'My Orders',
                              style: railwaybold.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Returns & Exchange',
                              style: railwaybold.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*         SizedBox(height: 5),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Color(0xffF2F6F9),
                  // color: Colors.pink,
                ),*/
                  Expanded(
                    child: TabBarView(
                        children: [
                          /// 1 st TAB
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5),
                                        Text("My Orders", style: railwaybold.copyWith(fontSize: 17)),
                                        SizedBox(height: 15),
                                        Text("View your orders to see what you've purchased or track their delivery", style: railway.copyWith(fontSize: 12)),
                                        SizedBox(height: 10),
                                        Text("If your purchase isn't quite what you're looking for, you've got 28 days from when you received your order to have your items sent back to us for a refund or exchange.",
                                            style: railway.copyWith(fontSize: 12)),
                                        SizedBox(height: 15),
                                        /// recent
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded1=! widget.isExpanded1;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Recent Orders",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded1? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded1?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                              child: Text(
                                                "Last 5 Orders",
                                                style: robotoRegular.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade800
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      /*      const SizedBox(
                                                    height: 10.0,
                                                  ),*/
                                                      /*      Row(
                                                    children: [
                                                      Container(
                                                        height: 30,
                                                        width: 2,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                          child: Center(
                                                              child: Text(
                                                                'Order Number',
                                                                style: railwaybold.copyWith(
                                                                  fontSize: 12
                                                                ),
                                                              ))),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Center(
                                                              child: Text(
                                                                'Order Date',
                                                                style: railwaybold.copyWith(
                                                                    fontSize: 12
                                                                ),
                                                              ))),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                      Expanded(
                                                          flex: 3,
                                                          child: Center(
                                                              child: Text(
                                                                'Name',
                                                                style: railwaybold.copyWith(
                                                                    fontSize: 12
                                                                ),
                                                              ))),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Center(
                                                              child: Text(
                                                                'Payment\nMethod	',
                                                                style: railwaybold.copyWith(
                                                                    fontSize: 12
                                                                ),
                                                              ))),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                          child: Text(
                                                            'Payment Status',
                                                            style: railwaybold.copyWith(
                                                                fontSize: 12
                                                            ),
                                                          )),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Center(
                                                              child: Text(
                                                                'Total Price (BDT)',
                                                                  style: railwaybold.copyWith(
                                                                      fontSize: 12
                                                                  ),
                                                              ))),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                          child: Center(
                                                              child: Text(
                                                                'Status',
                                                                style: railwaybold.copyWith(
                                                                    fontSize: 12
                                                                ),
                                                              ))),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                          child: Center(
                                                              child: Text(
                                                                'Details',
                                                                style: railwaybold.copyWith(
                                                                    fontSize: 12
                                                                ),
                                                              ))),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: gold,
                                                        child: Text(""),
                                                      ),
                                                    ],
                                                  ),*/
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        color: gold,
                                                      ),
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          // scrollDirection: Axis.vertical,
                                                          itemCount: 1,
                                                          // itemCount: controller.jobCardResponse!.cardDetails!.length,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                                                child: Row(
                                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${tabletitle[index]}',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                            style: railwaybold.copyWith(
                                                                                color: Colors.black,
                                                                                fontSize: 11),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Name',
                                                                            // textAlign: TextAlign.left,
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 11
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nMethod',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        child: Center(
                                                                          child: Text(
                                                                            "Status",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        color: gold,
                                                      ),
                                                      SizedBox(height: 4),

                                                      controller.recentOrdersReturnsListResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.recentOrdersReturnsListResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xffF2F0EB),
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          '${controller.recentOrdersReturnsListResponse!.data![index]!.orderNo??""}',
                                                                          // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                          style: poppins.copyWith(
                                                                              color: Colors.black,
                                                                              // color: textPurpale,
                                                                              fontSize: 9),
                                                                        )),

                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${DateConverter.stringToLocalDateOnly(controller.recentOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                            // '12/29/2023',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.recentOrdersReturnsListResponse!.data![index]!.firstName??""}${controller.recentOrdersReturnsListResponse!.data![index]!.lastName??""}',
                                                                            textAlign: TextAlign.left,
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.recentOrdersReturnsListResponse!.data![index]!.paymentMethod??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.recentOrdersReturnsListResponse!.data![index]!.paymentStatus??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.recentOrdersReturnsListResponse!.data![index]!.price??""}',
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "${controller.recentOrdersReturnsListResponse!.data![index]!.orderStatus??""}",
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'see',
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.black,
                                                                              fontSize: 9,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          : SizedBox(height: 45,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 150, top: 8),
                                                          child: Text('Data Empty'),
                                                        ),),
                                                      SizedBox(height: 0,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*   Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        /// pending
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6,bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded2=! widget.isExpanded2;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),

                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Pending Orders",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded2? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded2?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            /*                  Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                          child: Text(
                                            "Last 5 Orders",
                                            style: robotoRegular.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade800
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),*/
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        color: gold,
                                                      ),
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          // scrollDirection: Axis.vertical,
                                                          itemCount: 1,
                                                          // itemCount: controller.jobCardResponse!.cardDetails!.length,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                                                child: Row(
                                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${tabletitle[index]}',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                            style: railwaybold.copyWith(
                                                                                color: Colors.black,
                                                                                fontSize: 11),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Name',
                                                                            // textAlign: TextAlign.left,
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 11
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nMethod',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        child: Center(
                                                                          child: Text(
                                                                            "Status",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        color: gold,
                                                      ),
                                                      SizedBox(height: 4),
                                                      controller.pendingOrdersReturnsListResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.pendingOrdersReturnsListResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xffFCFAEE),
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          '${controller.pendingOrdersReturnsListResponse!.data![index]!.orderNo??""}',
                                                                          // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                          style: poppins.copyWith(
                                                                              color: Colors.black,
                                                                              // color: textPurpale,
                                                                              fontSize: 9),
                                                                        )),

                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${DateConverter.stringToLocalDateOnly(controller.pendingOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                            // '12/29/2023',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.pendingOrdersReturnsListResponse!.data![index]!.firstName??""}${controller.pendingOrdersReturnsListResponse!.data![index]!.lastName??""}',
                                                                            textAlign: TextAlign.left,
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.pendingOrdersReturnsListResponse!.data![index]!.paymentMethod??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.pendingOrdersReturnsListResponse!.data![index]!.paymentStatus??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.pendingOrdersReturnsListResponse!.data![index]!.price??""}',
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "${controller.pendingOrdersReturnsListResponse!.data![index]!.orderStatus??""}",
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'see',
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.black,
                                                                              fontSize: 9,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          : SizedBox(height: 45,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 150, top: 8),
                                                          child: Text('Data Empty'),
                                                        ),),
                                                      SizedBox(height: 0,),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*       Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/
                                        /// complete orders
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded3=! widget.isExpanded3;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),

                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Complete Orders",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded3? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded3?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        color: gold,
                                                      ),
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          // scrollDirection: Axis.vertical,
                                                          itemCount: 1,
                                                          // itemCount: controller.jobCardResponse!.cardDetails!.length,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                                                child: Row(
                                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${tabletitle[index]}',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                            style: railwaybold.copyWith(
                                                                                color: Colors.black,
                                                                                fontSize: 11),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Name',
                                                                            // textAlign: TextAlign.left,
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 11
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nMethod',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        child: Center(
                                                                          child: Text(
                                                                            "Status",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        color: gold,
                                                      ),
                                                      SizedBox(height: 4),
                                                      controller.confirmOrdersReturnsListResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.confirmOrdersReturnsListResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xffF4FFF0),
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          '${controller.confirmOrdersReturnsListResponse!.data![index]!.orderNo??""}',
                                                                          // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                          style: poppins.copyWith(
                                                                              color: Colors.black,
                                                                              // color: textPurpale,
                                                                              fontSize: 9),
                                                                        )),

                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${DateConverter.stringToLocalDateOnly(controller.confirmOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                            // '12/29/2023',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.confirmOrdersReturnsListResponse!.data![index]!.firstName??""}${controller.confirmOrdersReturnsListResponse!.data![index]!.lastName??""}',
                                                                            textAlign: TextAlign.left,
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.confirmOrdersReturnsListResponse!.data![index]!.paymentMethod??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.confirmOrdersReturnsListResponse!.data![index]!.paymentStatus??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.confirmOrdersReturnsListResponse!.data![index]!.price??""}',
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "${controller.confirmOrdersReturnsListResponse!.data![index]!.orderStatus??""}",
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'see',
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.black,
                                                                              fontSize: 9,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          : SizedBox(height: 45,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 150, top: 8),
                                                          child: Text('Data Empty'),
                                                        ),),
                                                      SizedBox(height: 0,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*   Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        /// reject orders
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6,bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded4=! widget.isExpanded4;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),

                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Rejected Orders",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded4? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded4?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        color: gold,
                                                      ),
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          // scrollDirection: Axis.vertical,
                                                          itemCount: 1,
                                                          // itemCount: controller.jobCardResponse!.cardDetails!.length,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                                                child: Row(
                                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${tabletitle[index]}',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                            style: railwaybold.copyWith(
                                                                                color: Colors.black,
                                                                                fontSize: 11),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Name',
                                                                            // textAlign: TextAlign.left,
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 11
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nMethod',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "Status",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      height: 40,
                                                                      width: 1,
                                                                      color: gold,
                                                                      child: Text(""),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                      Divider(
                                                        height: 1,
                                                        thickness: 1,
                                                        color: gold,
                                                      ),
                                                      SizedBox(height: 4),
                                                      controller.rejectOrdersReturnsListResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.rejectOrdersReturnsListResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xffffeeed),
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          '${controller.rejectOrdersReturnsListResponse!.data![index]!.orderNo??""}',
                                                                          style: poppins.copyWith(
                                                                              color: Colors.black,
                                                                              // color: textPurpale,
                                                                              fontSize: 9),
                                                                        )),

                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${DateConverter.stringToLocalDateOnly(controller.rejectOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.rejectOrdersReturnsListResponse!.data![index]!.firstName??""}${controller.rejectOrdersReturnsListResponse!.data![index]!.lastName??""}',
                                                                            textAlign: TextAlign.left,
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.rejectOrdersReturnsListResponse!.data![index]!.paymentMethod??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.rejectOrdersReturnsListResponse!.data![index]!.paymentStatus??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.rejectOrdersReturnsListResponse!.data![index]!.price??""}',
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "${controller.rejectOrdersReturnsListResponse!.data![index]!.orderStatus??""}",
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            'see',
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.black,
                                                                              fontSize: 9,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          : SizedBox(height: 60,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 150, top: 8),
                                                          child: Text('Data Empty'),
                                                        ),),
                                                      SizedBox(height: 20,),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*       Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        SizedBox(height: 80),
                                      ],
                                    ),
                                  )
                              )
                          ),

                          /// 2nd TAB
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8, top: 12, bottom: 15, right: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Returns", style: railwaybold.copyWith(fontSize: 18),),
                                        SizedBox(height: 15),
                                        Text("Check the progress of your returns, reschedule collection and print your return documents",
                                          style: railway.copyWith(fontSize: 12),),

                                        SizedBox(height: 50),

                                        Text("Exchange", style: railwaybold.copyWith(fontSize: 18),),
                                        SizedBox(height: 15),
                                        Text("Check the progress of your returns, reschedule collection and print your return documents",
                                          style: railway.copyWith(fontSize: 12),),
                                      ],
                                    ),
                                  )
                              )
                          ),

                        ]),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

















}
