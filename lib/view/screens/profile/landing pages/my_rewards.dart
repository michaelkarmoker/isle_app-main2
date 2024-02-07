import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/my%20reward/my_reward_controller.dart';
import 'package:isletestapp/controller/profile/orders%20refunds/orders_and_retunds_controller.dart';
import 'package:isletestapp/helper/date_converter.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';


class MyRewards extends StatefulWidget {
  // final int pageIndex;
  // final int? page;
  MyRewards({Key? key,
    // required this.pageIndex,
    // this.page
  }) : super(key: key);
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;

  @override
  State<MyRewards> createState() => _WishListPageState();
}

class _WishListPageState extends State<MyRewards> {
  late TabController _tabController;
  PageController? _pageController;
  bool isOpen=false;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.find<MyRewardController>().dataInitialize();
        }
    );
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
    return GetBuilder<MyRewardController>(
        builder: (controller) {
          return DefaultTabController(
            length: 3,
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
                    padding: const EdgeInsets.only(left: 8, top: 20,bottom: 0),
                    child: Text("My Reward", style: railwaybold.copyWith(fontSize: 20),),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 0,bottom: 0),
                    child: Text("Your Current ISLE Reward Point-2000", style: railway.copyWith(fontSize: 14),),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 0,bottom: 0),
                    child: Text("Tier Status- TREND SETTER", style: railway.copyWith(fontSize: 14),),
                  ),
                  SizedBox(height: 15),
                  /// Tab Bar Part
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
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
                              'REWARD HISTORY',
                              style: railwaybold.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'REDEEM HISTORY',
                              style: railwaybold.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'MY OFFERS',
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
                                    Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
                                    child: Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: Colors.white,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          width: Get.width,
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
                                                                flex: 2,
                                                                child: Center(
                                                                  child: Text(
                                                                    'Date',
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
                                                                flex: 2,
                                                                child: Center(
                                                                  child: Text(
                                                                    'Order ID /\nInvoice ID	',
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
                                                                flex: 3,
                                                                child: Center(
                                                                  child: Text(
                                                                    'Credit (Total amount\nof this specific order)',
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

                                              controller.rewardHistoryResponse!=null?
                                              ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:  NeverScrollableScrollPhysics(),
                                                  scrollDirection: Axis.vertical,
                                                  itemCount: controller.rewardHistoryResponse!.data!.length??0,
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
                                                                flex: 2,
                                                                child: Text(
                                                                  '${DateConverter.stringToLocalDateOnly(controller.rewardHistoryResponse!.data![index]!.createdAt??"")}',
                                                                  style: poppins.copyWith(
                                                                      color: Colors.black,
                                                                      // color: textPurpale,
                                                                      fontSize: 10),
                                                                )),
                                                            Expanded(
                                                                flex: 2,
                                                                child: Center(
                                                                  child: Text(
                                                                    '${controller.rewardHistoryResponse!.data![index]!.order!.orderNo??""}',
                                                                    style: poppins.copyWith(
                                                                        fontSize: 10
                                                                    ),
                                                                  ),
                                                                )),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Center(
                                                                  child: Text(
                                                                    '${controller.rewardHistoryResponse!.data![index]!.point??""}',
                                                                    textAlign: TextAlign.left,
                                                                    style: poppins.copyWith(
                                                                      // color: Colors.yellow,
                                                                        fontSize: 10
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
                                    ),
                                  ),

                                /*  Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
                                          child: Container(
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: Colors.white,
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Container(
                                                width: Get.width,
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
                                                                      flex: 2,
                                                                      child: Center(
                                                                        child: Text(
                                                                          'Date',
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
                                                                      flex: 2,
                                                                      child: Center(
                                                                        child: Text(
                                                                          'Order ID /\nInvoice ID	',
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
                                                                      flex: 3,
                                                                      child: Center(
                                                                        child: Text(
                                                                          'Point (Total\nredeemed point)',
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
                                                    controller.reedeemHistoryResponse!=null?
                                                    ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        physics:  NeverScrollableScrollPhysics(),
                                                        scrollDirection: Axis.vertical,
                                                        itemCount: controller.reedeemHistoryResponse!.data!.length??0,
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
                                                                      flex: 2,
                                                                      child: Text(
                                                                        '${DateConverter.stringToLocalDateOnly(controller.reedeemHistoryResponse!.data![index]!.createdAt??"")}',
                                                                        style: poppins.copyWith(
                                                                            color: Colors.black,
                                                                            // color: textPurpale,
                                                                            fontSize: 10),
                                                                      )),
                                                                  Expanded(
                                                                      flex: 2,
                                                                      child: Center(
                                                                        child: Text(
                                                                          '${controller.reedeemHistoryResponse!.data![index]!.order!.orderNo??""}',
                                                                          style: poppins.copyWith(
                                                                              fontSize: 10
                                                                          ),
                                                                        ),
                                                                      )),
                                                                  Expanded(
                                                                      flex: 3,
                                                                      child: Center(
                                                                        child: Text(
                                                                          '${controller.reedeemHistoryResponse!.data![index]!.point??""}',
                                                                          textAlign: TextAlign.left,
                                                                          style: poppins.copyWith(
                                                                            // color: Colors.yellow,
                                                                              fontSize: 10
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        /*  Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        SizedBox(height: 80),
                                      ],
                                    ),
                                  )
                              )
                          ),

                          /// 3rd
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
                                        SizedBox(height: 30),
                                        Text("My Offers (4)", style: railwaybold.copyWith(fontSize: 17)),
                                        SizedBox(height: 15),
                                        Container(
                                          child: GridView.builder(
                                            itemCount: 8,
                                            // itemCount: controller.lovingBrandResponse?.data?.length,
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true, // Important to make it work inside a SingleChildScrollView
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2, // Number of columns
                                                childAspectRatio: 0.7,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5
                                            ),
                                            itemBuilder: (context, index) {
                                              return Stack(
                                                  children: [
                                                    InkWell(
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
                                                          // height: Get.height/1.5,
                                                          // height: 380,
                                                          // width: 130,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(0),
                                                            child: Column(
                                                      /*        mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.center,*/
                                                              children: [
                                                                CustomImageCached(
                                                                  isRound: false,
                                                                  placeholder: Images.placeholder,
                                                                  image: '',
                                                                  // image: '${AppConstants.BASE_URL}${controller.lovingBrandResponse!.data![index].logo ?? ""}',
                                                                  // fit: BoxFit.fitHeight,
                                                                  height: Get.height/4,
                                                                  // width: 130,
                                                                  fit: BoxFit.fill,
                                                                  // height: Get.height/5.5,
                                                                ),
                                                                SizedBox(height: 8),
                                                                Center(child: Text("Product Name", style: railwaybold.copyWith(fontSize: 16),),),
                                                                SizedBox(height: 6),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text("3000 BDT", style: poppins.copyWith(fontSize: 13, color: Colors.red, decoration: TextDecoration.lineThrough),),
                                                                    SizedBox(width: 8),
                                                                    Text("2000 BDT", style: poppins.copyWith(fontSize: 13, color: gold),),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ),
                                                    ),

                                                    Positioned(
                                                        top : 10,
                                                        left: 2,
                                                        child: Container(
                                                          color: gold,
                                                          height: 30,
                                                          width: 55,
                                                          child: Center(
                                                            child: Text("-60%"),
                                                          ),
                                                        )

                                                    )

                                                  ]
                                              );
                                            }, // Total number of items
                                          ),
                                        ),

                                        SizedBox(height: 80),
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
