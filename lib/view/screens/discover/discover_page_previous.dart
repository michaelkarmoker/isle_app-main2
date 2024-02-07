import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/product%20page/brand_view_page.dart';
import 'package:isletestapp/view/screens/home/home_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
import 'package:isletestapp/view/auth/login-register.dart';



class DiscoverPage extends StatefulWidget {
  bool isExpanded1=false;
  bool isExpanded2=false;
  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;
  bool isExpanded6=false;
  bool isExpanded7=false;


  @override
  State<DiscoverPage> createState() => _IsleDrawerState();
}

class _IsleDrawerState extends State<DiscoverPage> {
  Color tabColor= gold;

  Color button1Color = gold;
  Color button2Color = Colors.transparent;
  Color button3Color = Colors.transparent;

  void changeColor(int buttonNumber) {
    setState(() {
      switch (buttonNumber) {
        case 1:
          button1Color = gold;
          button2Color = Colors.transparent;
          button3Color = Colors.transparent;
          break;
        case 2:
          button1Color = Colors.transparent;
          button2Color = gold;
          button3Color = Colors.transparent;
          break;
        case 3:
          button1Color = Colors.transparent;
          button2Color = Colors.transparent;
          button3Color = gold;
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xff000000)),
            titleSpacing: 0,
            backgroundColor: Color(0xffFFFFFF),
            centerTitle: true,
            elevation: 0,

            actions: [
             InkWell(
                  onTap: (){
                      Get.to(SearchScreen());
                  },
                  // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                  child: Image.asset(Images.search, height: 22, width: 22,)),
              SizedBox(width: 15),
            InkWell(
                onTap: () {
                  Get.to(WishListPage());
                },
                child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)),


              SizedBox(width: 10),
              /* Padding(
          padding: const EdgeInsets.only(right: 12,top: 12,bottom: 12, left: 0),
          child: InkWell(
              onTap: (){
                // Get.dialog(PopUpMessage());
              },
              child: Image.asset("${Get.find<LocalizationController>().selectedLanguage==AppConstants.bn?Images.bd:Images.en}")),
        )*/
            ],
            leadingWidth: Get.width/2.7,
            leading: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                // color: Colors.pinkAccent,
                height: 200,
                child:
                TabBar(
                  // controller: _tabController,
                    padding: EdgeInsets.zero,
                    onTap: (index) {
                      setState(() {

                        if(index==0) { tabColor = gold;}
                        if(index==1) {tabColor = gold;}
                        if(index==2) {tabColor = gold;}
                      });
                      print(index);
                    },
                    // indicator: BoxDecoration(color: tabColor,borderRadius: BorderRadius.circular(8)),
                    // dividerColor: Colors.black,

                    /* indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft:
                            Radius.circular(10),topRight: Radius.circular(10)),
                            color: tabColor
                        ),*/
                    // indicatorColor: Color(0xffb89600),
                    indicatorColor: tabColor,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
                    indicatorWeight: 2,
                    labelPadding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),

                    tabs: [
                      Container(
                        height: 50,
                        width: 100,
                        // color: Colors.cyanAccent,
                        child: Tab(
                          child: Text(
                            'Men',
                            style: railwaybold.copyWith(
                                color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ),
                      Tab(
                          child: Text(
                            'Women',
                            style: railwaybold.copyWith(
                                color: Colors.black, fontSize: 12),
                          )),
                      Tab(
                          child: Text(
                            'Kids',
                            style: railwaybold.copyWith(
                                color: Colors.black, fontSize: 12),
                          )),
                    ]),

              ),
            ),
            title: Column(
              children: [
                InkWell(
                  onTap: (){
                    Get.to(MainScreen());
                  },
                  child: Container(
                    // margin: EdgeInsets.all(15),
                      padding: EdgeInsets.only(left: 5, right: 5, top: 5,bottom: 5),
                      // color: Colors.red,
                      height: 55, width: 75,
                      child: Image.asset(Images.logo, height: 55, width: 70, fit: BoxFit.fill,)),
                ),
              ],
            ),
          ),
          // backgroundColor: Color(0xffEBEFF3),
          backgroundColor: Color(0xffFFFFFF),

          body:  Column(
            children: [
              Expanded(
                child: TabBarView(
                    children: [
                      /// 1 st TAB
                      RefreshIndicator(
                          onRefresh: () async{
                            // showCustomSnackBar("2");
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(BrandViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg1.webp&w=256&q=75',));
                                    },
                                    child: Container(
                                      color: Colors.grey,
                                      height: 200,
                                      width: Get.width,
                                      child: Center(child: Image.asset("assets/image/promo.jpg",

                                      ),),
                                      /*    child: Center(
                        child: Text("Promotions".toUpperCase(), style: railway.copyWith(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                      ),*/
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only( top: 8, left: 8, right: 8 ),
                                  child: Container(
                                    height: Get.height/1.9,
                                    // color: Colors.purple,
                                    child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: catagoryimage.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 6,
                                          mainAxisSpacing: 6,
                                          childAspectRatio: 1.5
                                      ),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: (){
                                            Get.to(BrandViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg1.webp&w=256&q=75',));
                                          },
                                          child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Container(
                                                  color:  Color(0xff424242),
                                                  // color:  Colors.green,
                                                  // width: Get.width/3.2,
                                                  child: CustomImageCached(
                                                    // image: '${Images.carusalimage}}',
                                                    image: '${catagoryimage[index]}',
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
                                                      child: Text("${brandNames[index]}",
                                                        style: railwaybold.copyWith(
                                                          // color: Color(0xffDBDCE2),
                                                            color: Colors.white,
                                                            // fontWeight: FontWeight.bold,
                                                            fontSize: 16),),
                                                    )

                                                )


                                              ]
                                          ),
                                        );
                                      }, // Number of items in the grid
                                    ),
                                  ),
                                ),

                                /// Top brands
                                Padding(
                                  padding: const EdgeInsets.only(left: 4, right: 8, top: 0, bottom: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: Text("Top Brands".toUpperCase(), style: poppins.copyWith(fontSize: 20),),
                                          ),
                                          // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
                                        ],

                                      ),

                                      SizedBox(height: 10),

                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 4, right: 4),
                                              child: Container(
                                                // color: Colors.pinkAccent,
                                                // height: 120,
                                                height: 80,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: 8,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.only(left: 4),
                                                      child: Container(
                                                        // color: Color(0xffF8F7F2),
                                                        color: Color(0xffFFFFFF),
                                                        height: 60, width: 95,
                                                        /*   child: Image.asset(Images.logo,  height: 50, width: 130,
                                        fit: BoxFit.fitWidth,
                                        ),*/
                                                        child: Center(child: Image.asset("",
                                                          height: 70, width: 80,),),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),

                              ],
                            ),
                          )

                      ),

                      /// 2nd TAB
                      RefreshIndicator(
                          onRefresh: () async{
                            // showCustomSnackBar("2");
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(BrandViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg1.webp&w=256&q=75',));
                                    },
                                    child: Container(
                                      color: Colors.grey,
                                      height: 200,
                                      width: Get.width,
                                      child: Center(child: Image.asset("assets/image/promo.jpg",

                                      ),),
                                      /*    child: Center(
                        child: Text("Promotions".toUpperCase(), style: railway.copyWith(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                      ),*/
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only( top: 8, left: 8, right: 8 ),
                                  child: Container(
                                    height: Get.height/1.9,
                                    // color: Colors.purple,
                                    child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: catagoryimage.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 6,
                                          mainAxisSpacing: 6,
                                          childAspectRatio: 1.5
                                      ),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: (){
                                            Get.to(BrandViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg1.webp&w=256&q=75',));
                                          },
                                          child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Container(
                                                  color:  Color(0xff424242),
                                                  // color:  Colors.green,
                                                  // width: Get.width/3.2,
                                                  child: CustomImageCached(
                                                    // image: '${Images.carusalimage}}',
                                                    image: '${catagoryimage[index]}',
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
                                                      child: Text("${brandNames[index]}",
                                                        style: railwaybold.copyWith(
                                                          // color: Color(0xffDBDCE2),
                                                            color: Colors.white,
                                                            // fontWeight: FontWeight.bold,
                                                            fontSize: 16),),
                                                    )

                                                )


                                              ]
                                          ),
                                        );
                                      }, // Number of items in the grid
                                    ),
                                  ),
                                ),

                                /// Top brands
                                Padding(
                                  padding: const EdgeInsets.only(left: 4, right: 8, top: 0, bottom: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: Text("Top Brands".toUpperCase(), style: poppins.copyWith(fontSize: 20),),
                                          ),
                                          // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
                                        ],

                                      ),

                                      SizedBox(height: 10),

                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 4, right: 4),
                                              child: Container(
                                                // color: Colors.pinkAccent,
                                                // height: 120,
                                                height: 80,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: 8,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.only(left: 4),
                                                      child: Container(
                                                        // color: Color(0xffF8F7F2),
                                                        color: Color(0xffFFFFFF),
                                                        height: 60, width: 95,
                                                        /*   child: Image.asset(Images.logo,  height: 50, width: 130,
                                        fit: BoxFit.fitWidth,
                                        ),*/
                                                        child: Center(child: Image.asset("",
                                                          height: 70, width: 80,),),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),

                              ],
                            ),
                          )

                      ),

                      /// 3rd TAB
                      RefreshIndicator(
                          onRefresh: () async{
                            // showCustomSnackBar("2");
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(BrandViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg1.webp&w=256&q=75',));
                                    },
                                    child: Container(
                                      color: Colors.grey,
                                      height: 200,
                                      width: Get.width,
                                      child: Center(child: Image.asset("assets/image/promo.jpg",

                                      ),),
                                      /*    child: Center(
                        child: Text("Promotions".toUpperCase(), style: railway.copyWith(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                      ),*/
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only( top: 8, left: 8, right: 8 ),
                                  child: Container(
                                    height: Get.height/1.9,
                                    // color: Colors.purple,
                                    child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: catagoryimage.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 6,
                                          mainAxisSpacing: 6,
                                          childAspectRatio: 1.5
                                      ),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: (){
                                            Get.to(BrandViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg1.webp&w=256&q=75',));
                                          },
                                          child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Container(
                                                  color:  Color(0xff424242),
                                                  // color:  Colors.green,
                                                  // width: Get.width/3.2,
                                                  child: CustomImageCached(
                                                    // image: '${Images.carusalimage}}',
                                                    image: '${catagoryimage[index]}',
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
                                                      child: Text("${brandNames[index]}",
                                                        style: railwaybold.copyWith(
                                                          // color: Color(0xffDBDCE2),
                                                            color: Colors.white,
                                                            // fontWeight: FontWeight.bold,
                                                            fontSize: 16),),
                                                    )

                                                )


                                              ]
                                          ),
                                        );
                                      }, // Number of items in the grid
                                    ),
                                  ),
                                ),

                                /// Top brands
                                Padding(
                                  padding: const EdgeInsets.only(left: 4, right: 8, top: 0, bottom: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: Text("Top Brands".toUpperCase(), style: poppins.copyWith(fontSize: 20),),
                                          ),
                                          // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
                                        ],

                                      ),

                                      SizedBox(height: 10),

                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 4, right: 4),
                                              child: Container(
                                                // color: Colors.pinkAccent,
                                                // height: 120,
                                                height: 80,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: 8,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.only(left: 4),
                                                      child: Container(
                                                        // color: Color(0xffF8F7F2),
                                                        color: Color(0xffFFFFFF),
                                                        height: 60, width: 95,
                                                        /*   child: Image.asset(Images.logo,  height: 50, width: 130,
                                        fit: BoxFit.fitWidth,
                                        ),*/
                                                        child: Center(child: Image.asset("",
                                                          height: 70, width: 80,),),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),

                              ],
                            ),
                          )

                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
