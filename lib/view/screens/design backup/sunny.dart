// import 'dart:math';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/util/color.dart';
// import 'package:isletestapp/util/constants.dart';
// import 'package:isletestapp/util/images.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/view/base/custom_Image_cached.dart';
// import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
// import 'package:isletestapp/view/base/custom_snackbar.dart';
// import 'package:isletestapp/view/base/custom_top_search_field.dart';
// import 'package:isletestapp/view/screens/add%20to%20cart%20screen/product_details_page.dart';
// import 'package:isletestapp/view/screens/category/product_page.dart';
// import 'package:isletestapp/view/screens/dashboard/widgets/bottom_nav_item.dart';
// import 'package:isletestapp/view/screens/discover/discover_page_previous.dart';
// import 'package:isletestapp/view/screens/kids/kid_page.dart';
// import 'package:isletestapp/view/screens/login-register%20page/login-register.dart';
// import 'package:isletestapp/view/screens/category/categories_tab.dart';
// import 'package:isletestapp/view/screens/search/search_screen.dart';
// import 'package:isletestapp/view/screens/search/search_sunny.dart';
// import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
// import 'package:isletestapp/view/screens/women/women_page.dart';
//
// import '../main_page/main_screen.dart';
// import '../universal_bottom_nav/universal_bottom_nav.dart';
//
// class HomePage extends StatefulWidget {
//   final int pageIndex;
//   const HomePage({Key? key,  required this.pageIndex}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   PageController? _pageController;
//   bool isOpen=false;
//   int _pageIndex = 0;
//   List<Widget> _screens=[];
//   GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
//   final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
//   bool _canExit =  false;
//
//
//   Color tabColor= gold;
//
//   Color button1Color = gold;
//   Color button2Color = Colors.transparent;
//   Color button3Color = Colors.transparent;
//
//   void changeColor(int buttonNumber) {
//     setState(() {
//       switch (buttonNumber) {
//         case 1:
//           button1Color = gold;
//           button2Color = Colors.transparent;
//           button3Color = Colors.transparent;
//           break;
//         case 2:
//           button1Color = Colors.transparent;
//           button2Color = gold;
//           button3Color = Colors.transparent;
//           break;
//         case 3:
//           button1Color = Colors.transparent;
//           button2Color = Colors.transparent;
//           button3Color = gold;
//           break;
//       }
//     });
//   }
//
//
//
//   TextEditingController searchCtr = TextEditingController();
//   FocusNode searchFcs = FocusNode();
//   bool isSearchClick=false;
//   TextEditingController subscribeCtr = TextEditingController();
//   FocusNode subscribeFcs = FocusNode();
//   late ScrollController _scrollController;
//   Color _textColor = Colors.black;
//   // static const kExpandedHeight = 145.0;
//   static const kExpandedHeight = 145.0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//
//     _scrollController = ScrollController()
//       ..addListener(() {
//         setState(() {
//           _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
//         });
//       });
//   }
//
//   bool get _isSliverAppBarExpanded {
//     return _scrollController.hasClients &&
//         _scrollController.offset > kExpandedHeight - kToolbarHeight;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         key: _drawerscaffoldkey,
//         bottomNavigationBar: UniversalBottomNav(),
//         body: CustomScrollView(
//           controller: _scrollController,
//           slivers: <Widget>[
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               iconTheme: IconThemeData(color: Color(0xffFAFBFB)),
//               // automaticallyImplyLeading: false,
//
//               backgroundColor: Color(0xffFAFBFB),
//               // backgroundColor: Colors.teal,
//               // show and hide SliverAppBar Title
//               leadingWidth: Get.width/2.8,
//               actions: [
//                 _isSliverAppBarExpanded?   !isSearchClick?InkWell(
//                     onTap: (){
//                       isSearchClick=!isSearchClick;
//                       setState(() {
//                         Get.to(SearchScreen());
//                       });
//                     },
//                     // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
//                     child: Image.asset(Images.search, height: 22, width: 22,)):SizedBox(): SizedBox(),
//                 SizedBox(width: 15),
//                 _isSliverAppBarExpanded?   InkWell(
//                     onTap: () {
//                       Get.to(WishListPage(pageIndex: 0,));
//                     },
//                     child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)): SizedBox(),
//
//
//                 SizedBox(width: 10),
//                 /* Padding(
//               padding: const EdgeInsets.only(right: 12,top: 12,bottom: 12, left: 0),
//               child: InkWell(
//                   onTap: (){
//                     // Get.dialog(PopUpMessage());
//                   },
//                   child: Image.asset("${Get.find<LocalizationController>().selectedLanguage==AppConstants.bn?Images.bd:Images.en}")),
//             )*/
//               ],
//               centerTitle: !_isSliverAppBarExpanded,
//               leading: _isSliverAppBarExpanded
//                   ? Padding(
//                 padding: const EdgeInsets.only(left: 0),
//                 child: Container(
//                   // color: Colors.pinkAccent,
//                     height: 200,
//                     child:
//                     TabBar(
//                       padding: EdgeInsets.zero,
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
//                         indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
//                         indicatorWeight: 2,
//                         labelPadding: EdgeInsets.zero,
//                         physics: BouncingScrollPhysics(),
//
//                         tabs: [
//                           InkWell(
//                             onTap: () {
//                               Get.to(HomePage(pageIndex: 0));
//                             },
//                             child: Container(
//                               height: 50,
//                               width: 100,
//                               // color: Colors.cyanAccent,
//                               child: Tab(
//                                   child: Text(
//                                     'Men',
//                                     style: railway.copyWith(
//                                         color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
//                                   ),
//                               ),
//                             ),
//                           ),
//                            InkWell(
//                              onTap: () {
//                                Get.to(WomenPage(pageIndex: 0));
//                              },
//                              child: Tab(
//                                 child: Text(
//                                   'Women',
//                                   style: railway.copyWith(
//                                       color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
//                                 )),
//                            ),
//                           InkWell(
//                             onTap: () {
//                               Get.to(KidPage(pageIndex: 0));
//                             },
//                             child: Tab(
//                                 child: Text(
//                                   'Kids',
//                                   style: railway.copyWith(
//                                       color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
//                                 )),
//                           ),
//                         ]),
//
//                 ),
//               )
//                   : null,
//               // leading: null,
//               title: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//                     child: Container(
//                         alignment: Alignment.center,
//                         // color: Colors.red,
//                         height: 35,
//                         width: 80,
//                         child: Image.asset(Images.logo, height: 35, width: 100)),
//                   ),
//                 ],
//               ),
//               pinned: true,
//               // snap: false,
//               floating: false,
//               expandedHeight: kExpandedHeight,
//               // show and hide FlexibleSpaceBar title
//               flexibleSpace: _isSliverAppBarExpanded
//                   ? null
//                   : FlexibleSpaceBar(
//
//                 centerTitle: true,
//                 title: Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           Expanded(
//                             flex: 5,
//                             child: Container(
//                               height: Get.height/20,
//                               // color: Colors.tealAccent,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text("Good ${greeting()}!", style: railway.copyWith(color: Colors.black, fontSize: 12),),
//                                   SizedBox(height: 4),
//
//                                   Container(
//                                     height: 20,
//                                     width: Get.width/4.5,
//                                     // color: Colors.teal,
//                                     child: TabBar(
//                                         padding: EdgeInsets.zero,
//                                         onTap: (index) {
//                                           setState(() {
//
//                                             if(index==0) { tabColor = gold;}
//                                             if(index==1) {tabColor = gold;}
//                                             if(index==2) {tabColor = gold;}
//                                           });
//                                           print(index);
//                                         },
//                                         // indicator: BoxDecoration(color: tabColor,borderRadius: BorderRadius.circular(8)),
//                                         // dividerColor: Colors.black,
//
//                                         /* indicator: BoxDecoration(
//                             borderRadius: BorderRadius.only(topLeft:
//                             Radius.circular(10),topRight: Radius.circular(10)),
//                             color: tabColor
//                         ),*/
//                                         // indicatorColor: Color(0xffb89600),
//                                         indicatorColor: tabColor,
//                                         indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
//                                         indicatorWeight: 1,
//                                         labelPadding: EdgeInsets.zero,
//                                         physics: BouncingScrollPhysics(),
//                                         tabs: [
//                                           InkWell(
//                                             onTap: () {
//                                               Get.to(HomePage(pageIndex: 0));
//                                             },
//                                             child: Container(
//                                               height: 30,
//                                               width: 100,
//                                               // color: Colors.cyanAccent,
//                                               child: Tab(
//                                                   child: Text(
//                                                     'Men',
//                                                     style: railway.copyWith(
//                                                         color: Colors.black, fontSize: 7, fontWeight: FontWeight.w500),
//                                                   )),
//                                             ),
//                                           ),
//                                           InkWell(
//                                             onTap: () {
//                                               Get.to(WomenPage(pageIndex: 0));
//                                             },
//                                             child: Tab(
//                                                 child: Text(
//                                                   'Women',
//                                                   style: railway.copyWith(
//                                                       color: Colors.black, fontSize: 7, fontWeight: FontWeight.w500),
//                                                 )),
//                                           ),
//                                           InkWell(
//                                             onTap: () {
//                                               Get.to(KidPage(pageIndex: 0));
//                                             },
//                                             child: Tab(
//                                                 child: Text(
//                                                   'Kids',
//                                                   style: railway.copyWith(
//                                                       color: Colors.black, fontSize: 7, fontWeight: FontWeight.w500),
//                                                 )),
//                                           ),
//                                         ]),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: InkWell(
//                                 onTap: () {
//                                   Get.to(WishListPage(pageIndex : 0));
//                                 },
//                                 child: Container(
//                                     height: 28,
//                                     // color: Colors.blue,
//                                     alignment: Alignment.topRight,
//                                     child: CircleAvatar(
//                                         radius: 18,
//                                         backgroundColor: Colors.grey.shade100,
//                                         child: Image.asset(Images.wish, height: 17, width: 17, color: Color(0xffB87253),))),
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//
//                       SizedBox(height: 4),
//                       Container(
//                         // color: Colors.deepPurpleAccent,
//                         height: 30,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             Expanded(
//                               flex: 5,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 0),
//                                 child: SizedBox(
//                                     height: 30,
//                                     child: SearchTextField()),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 6,right: 8),
//                                 child: Container(
//                                   height: 30,
//                                   width: 30,
//                                   color: Colors.grey.shade200,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(6),
//                                     child: Image.asset(Images.notification,),
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 /*  background: Image.asset(
//                   'assets/images/newBeach.jpg',
//                   fit: BoxFit.fill,
//                 ),*/
//               ),
//             ),
//
//             /// BODY
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                     (_, int index) {
//                   return Column(
//                     // mainAxisSize: MainAxisSize.min,
//                     children: [
//
//
//
//
//
//
//
//
//
//                       /// Top BANNER
//                       Padding(
//                         padding: const EdgeInsets.only(top: 0, left: 6, right: 6, bottom: 0),
//                         child: Container(
//                           // color: Colors.teal,
//                           height: Get.height /15,
//                           child: CarouselSlider.builder(
//                             itemCount: 3,
//                             itemBuilder: (BuildContext context, int index, _){
//                               return   Card(
//                                 color:  Color(0xff424242),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Expanded(
//                                       flex: 4,
//                                       child: Container(
//                                         height: 30,
//                                         width: 30,
//                                         child: Column(
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(left: 8, top: 3, bottom: 0),
//                                               child : Image.asset(topbannericon[index], color: Color(0xff999999), height: 25, width: 25,),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 30,
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             '${title[index]}',
//                                             style: railway.copyWith(color: Color(0xffCCCCCC), fontSize: 10),
//                                             textAlign: TextAlign.left,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                             options: CarouselOptions(
//                               height: Get.height /2,
//                               // enlargeCenterPage: true,
//                               autoPlay: true,
//                               reverse: false,
//                               aspectRatio: 10 / 9,
//                               autoPlayCurve: Curves.fastOutSlowIn,
//                               enableInfiniteScroll: true,
//                               autoPlayAnimationDuration: Duration(milliseconds: 800),
//                               autoPlayInterval: Duration(seconds: 2),
//                               viewportFraction: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: 4),
//
//                       ///Top CARUSAL
//                       Padding(
//                         padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
//                         child: Container(
//                           // color: Colors.teal,
//                           height: Get.height /2,
//                           child: CarouselSlider.builder(
//                             itemCount: 2,
//                             itemBuilder: (BuildContext context, int index, _){
//                               return  InkWell(
//                                 onTap: () {
//                                   Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                 },
//                                 child: Container(
//                                   // decoration: BoxDecoration(
//                                   //   borderRadius: BorderRadius.circular(0),
//                                   // ),
//                                   child: CustomImageCached(
//                                     isRound: false,
//                                     image: '${topcurosalimage[index]}',fit: BoxFit.fill,),
//                                 ),
//                               );
//                             },
//                             options: CarouselOptions(
//                               height: Get.height /2,
//                               // enlargeCenterPage: true,
//                               autoPlay: true,
//                               reverse: false,
//                               aspectRatio: 10 / 9,
//                               autoPlayCurve: Curves.fastOutSlowIn,
//                               enableInfiniteScroll: true,
//                               autoPlayAnimationDuration: Duration(milliseconds: 800),
//                               viewportFraction: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       ///  BANNER IMAGE
//                       Padding(
//                         padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                         child: InkWell(
//                           onTap: (){
//                             Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                           },
//                           child: CustomImageCached(
//                             // image: '${Images.carusalimage}}',
//                             image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fhome%2F2_HP_Watch_Shop_App_En_WK35.jpg&w=750&q=75',
//                             height: Get.height/5,
//                             isRound: false,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       // SizedBox(height: 8),
//
//                       ///  4th image part
//                       InkWell(
//                         onTap: (){
//                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                         },
//                         child: Container(
//                           color: Color(0xffFAFBFB),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 8),
//                                 CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   image: 'https://ounass-ae.atgcdn.ae/contentful/b3xlytuyfm3e/4aj3EbIqxd14jjMa6H2fDo/6dbf0f5ddc65e8b1348fe3f7b6da590b/MW_Trending1_APP_WK37.jpg?q=70',
//                                   height: Get.height/3.5,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//                                 ),
//                                 SizedBox(height: 15),
//                                 Text("MOST WANTED".toUpperCase(), style:  robotoRegular.copyWith(fontSize: 17, color: Color(0xff000000) ),),
//                                 SizedBox(height: 12),
//                                 Text("Dive into a world of miniature must-haves for girl, boy and baby", style: robotoRegular.copyWith(fontSize: 10.5, color: Color(0xff000000)),),
//                                 SizedBox(height: 15),
//
//                                 ElevatedButton(
//                                   // style: raisedButtonStyle,
//                                   style: ElevatedButton.styleFrom(primary: Color(0xff0B1D65)),
//                                   onPressed: () {
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                                     child: Text('Shop Now'.toUpperCase(), style: robotoRegular.copyWith(fontSize: 12.5),),
//                                   ),
//                                 )
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//
//                       ///  Categories part
//                       SizedBox(
//                         height: 32,
//                         child: Text("Categories".toUpperCase(), style: caluna.copyWith(fontSize: 18 ,) ),),
//                       SizedBox(
//                         height: Get.height/3.5,
//                         // width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8, right: 8),
//                           child: ListView.builder(
//                             padding: EdgeInsets.zero,
//                             // physics: NeverScrollableScrollPhysics(),
//                             physics: ClampingScrollPhysics(),
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 4,
//                             itemBuilder:  (BuildContext context, int index) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                   },
//                                   child: Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Container(
//                                           color:  Color(0xff424242),
//                                           width: Get.width/3.2,
//                                           child: CustomImageCached(
//                                             // image: '${Images.carusalimage}}',
//                                             image: '${catagoryimage[index]}',
//                                             height: Get.height/2,
//                                             isRound: false,
//                                             fit: BoxFit.fill,
//
//                                           ),
//                                         ),
//
//                                         Positioned(
//                                             bottom: 5,
//                                             child: Align(
//                                               alignment: Alignment.bottomCenter,
//                                               child: Text("${categoryName[index]}",
//                                                 style: robotoRegular.copyWith(
//                                                     // color: Color(0xffDBDCE2),
//                                                   color: Colors.white,
//                                                     fontSize: 12),),
//                                             )
//
//                                         )
//
//
//                                       ]
//                                   ),
//                                 ),
//                               );
//                             },
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//
//                       ///  Brand part
//                       SizedBox(height: 12),
//                       SizedBox(
//                         height: 32,
//                         child: Text("Discover Brands".toUpperCase(), style: caluna.copyWith(fontSize: 18 ,)),),
//                       SizedBox(
//                         height: Get.height/3.2,
//                         // width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8, right: 8),
//                           child: ListView.builder(
//                             padding: EdgeInsets.zero,
//                             physics: BouncingScrollPhysics(),
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 6,
//                             itemBuilder:  (BuildContext context, int index) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                   },
//                                   child: Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Container(
//                                           color:  Color(0xff424242),
//                                           width: Get.width/2.7,
//                                           child: CustomImageCached(
//                                             // image: '${Images.carusalimage}}',
//                                             image: '${brandimage[index]}',
//                                             height: Get.height/2,
//                                             isRound: false,
//                                             fit: BoxFit.fill,
//
//                                           ),
//                                         ),
//
//                                         Positioned(
//                                             bottom: 0,
//                                             child: Container(
//                                               color: Color(0xffF2F2F2).withOpacity(0.5),
//                                               child: Padding(
//                                                 padding: EdgeInsets.only(left: Get.width, right: Get.width, top: 3, bottom: 3),
//                                                 child: Text("${brandName[index]}".toUpperCase(),
//                                                   style: robotoRegular.copyWith(
//                                                     // color: Color(0xffDBDCE2),
//                                                       color: Color(0xffB56D4D),
//                                                       // color: Colors.grey,
//                                                       fontSize: 11.5),),
//                                               ),
//                                             )
//
//                                         )
//
//
//                                       ]
//                                   ),
//                                 ),
//                               );
//                             },
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 25),
//
//                       /// SHOP slider part
//                       Padding(
//                         padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Expanded(
//                                   flex: 5,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 4),
//                                     child: Text("New In-Handpicked From The Best Brands", style: railway.copyWith(fontSize: 20 ),),
//                                   ),
//                                 ),
//                                  Expanded(
//                                      flex: 1,
//                                      child: InkWell(
//                                        onTap: (){
//                                          Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                        },
//                                        child: Text("Shop All".toUpperCase(),
//                                          textAlign: TextAlign.end,
//                                          style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                                      )),
//                               ],
//
//                             ),
//                             SizedBox(height: 15),
//                             Container(
//                               // color: Colors.red,
//                               height: Get.height/2.45,
//                               // width: Get.width,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 0, right: 0),
//                                 child: ListView.builder(
//                                   padding: EdgeInsets.zero,
//                                   physics: ClampingScrollPhysics(),
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: 9,
//                                   itemBuilder:  (BuildContext context, int index) {
//                                     return Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 6),
//                                       child: InkWell(
//                                         onTap: () {
//                                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                         },
//                                         child: Stack(
//                                             alignment: Alignment.topRight,
//                                             children: [
//                                               InkWell(
//                                                 highlightColor: Colors.grey,
//                                                 splashColor: Colors.grey,
//                                                 // focusColor: Colors.green,
//                                                 // hoverColor: Colors.blue,
//                                                 onTap: (){
//                                                   Get.to(Add2CartScreen(pageIndex: 0, cartdetailsimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                                   // showCustomSnackBar("Click Shop Cart");
//                                                 },
//                                                 child: Container(
//                                                   // color:  Colors.cyan,
//                                                   color: Color(0xffFAFAFC),
//                                                   width: Get.width/2.7,
//                                                   child: Column(
//
//                                                       children: [
//
//                                                         Container(
//                                                           // color:  Color(0xff424242),
//                                                           // color:  Colors.blue,
//                                                           width: Get.width/2.7,
//                                                           child: Stack(
//                                                               alignment: Alignment.topCenter,
//                                                               children: [
//                                                                 CustomImageCached(
//                                                                   // image: '${Images.carusalimage}}',
//                                                                   image: '${catagorysliderimage[index]}',
//                                                                   height: Get.height/3.2,
//                                                                   isRound: false,
//                                                                   fit: BoxFit.fill,
//
//                                                                 ),
//                                                                 Positioned(
//                                                                     bottom: 0,
//                                                                     child: Align(
//                                                                       alignment: Alignment.bottomCenter,
//                                                                       child: Container(
//                                                                         /// orginal color
//                                                                         // color: Color(0xffF2F2F2),
//                                                                         color: Colors.grey.shade400,
//                                                                         child: Padding(
//                                                                           padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
//                                                                           child: Text("New Season".toUpperCase(),
//                                                                             style: robotoRegular.copyWith(color: Colors.black, fontSize: 9),),
//                                                                         ),
//                                                                       ),
//                                                                     )
//
//                                                                 )
//                                                               ]
//                                                           ),
//                                                         ),
//                                                         SizedBox(height: 12),
//
//
//                                                         Text("${categorysliderName[index]}",
//                                                           style: railway.copyWith(
//                                                             fontWeight: FontWeight.bold,
//                                                               fontSize: 11
//                                                           ),),
//                                                         SizedBox(height: 7),
//
//                                                         Padding(
//                                                           padding: const EdgeInsets.symmetric(horizontal: 4),
//                                                           child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                             overflow: TextOverflow.ellipsis,
//                                                             maxLines: 1,
//                                                             style: caluna.copyWith(
//                                                                 // fontWeight: FontWeight.w100,
//                                                                 fontSize: 11),),
//                                                         ),
//                                                         SizedBox(height: 7),
//
//                                                         Text("100 BDT",
//                                                           style: caluna.copyWith( color: gold, fontSize: 12),),
//
//                                                       ]
//                                                   ),
//                                                 ),
//                                               ),
//                                               Positioned(
//                                                 top: 10,
//                                                 right: 10,
//                                                 child: InkWell(
//                                                   onTap: (){
//                                                     Get.to(WishListPage(pageIndex: 0,));
//                                                   },
//
//                                                   child: Align(
//                                                     alignment: Alignment.topRight,
//                                                     child: Icon(Icons.favorite_border, color: gold),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]
//                                         ),
//                                       ),
//                                     );
//                                   },
//
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 12),
//
//
//                       ///  Discover Trends
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 4),
//                               child: Text("Discover Trends", style: railway.copyWith(fontSize: 20 ),),
//                             ),
//                           ),
//                           Expanded(
//                               flex: 1,
//                               child: Text("".toUpperCase(),
//                                 textAlign: TextAlign.end,
//                                 style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),)),
//                         ],
//
//                       ),
//                       SizedBox(height: 2),
//                       InkWell(
//                         onTap: () {
//                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                         },
//                         child: Container(
//                           color: Color(0xffFAFBFB),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 5),
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 8),
//                                 CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2FTrending1.jpg&w=384&q=75',
//                                   height: Get.height/3.5,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//                                 ),
//                                 SizedBox(height: 15),
//                                 Text("Trending Now".toUpperCase(), style:  railway.copyWith(fontSize: 16, color: Color(0xff000000) ),),
//                                 SizedBox(height: 12),
//                                 Text("Dive into a world of miniature must-haves for girl, boy and baby",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: robotoRegular.copyWith(fontSize: 10.5, color: Color(0xff000000)),),
//                                 SizedBox(height: 15),
//
//                                 ElevatedButton(
//                                   // style: raisedButtonStyle,
//                                   style: ElevatedButton.styleFrom(primary: Color(0xff0B1D65)),
//                                   onPressed: () {
//                                       Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                                     child: Text('Shop Now'.toUpperCase(), style: robotoRegular.copyWith(fontSize: 12.5),),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12),
//
//
//                       ///  Discover Trends
//                       InkWell(
//                         onTap: () {
//                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                         },
//                         child: Container(
//                           color: Color(0xffFAFBFB),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 8),
//                                 CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2FTrending2.jpg&w=384&q=75',
//                                   height: Get.height/3.5,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//                                 ),
//                                 SizedBox(height: 15),
//                                 Text("Trending Now".toUpperCase(), style:  railway.copyWith(fontSize: 16, color: Color(0xff000000) ),),
//                                 SizedBox(height: 12),
//                                 Text("Dive into a world of miniature must-haves for girl, boy and baby",
//                                   overflow: TextOverflow.ellipsis,
//                                   style: robotoRegular.copyWith(fontSize: 10.5, color: Color(0xff000000)),),
//                                 SizedBox(height: 15),
//
//                                 ElevatedButton(
//                                   // style: raisedButtonStyle,
//                                   style: ElevatedButton.styleFrom(primary: Color(0xff0B1D65)),
//                                   onPressed: () {
//                                       Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                                     child: Text('Shop Now'.toUpperCase(), style: robotoRegular.copyWith(fontSize: 12.5),),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12),
//
//                       /// SHOP By Category slider part
//                       Padding(
//                         padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 4),
//                                   child: Text("Shop By Category",style: railway.copyWith(fontSize: 20 )),
//                                 ),
//                                 // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                               ],
//
//                             ),
//                             SizedBox(height: 8),
//                             Container(
//                               // color: Colors.red,
//                               height: Get.height/4.2,
//                               // width: Get.width,
//                               child: Padding(
//                                   padding: const EdgeInsets.only(left: 7, right: 0),
//                                   child:
//                                   GridView.builder(
//                                     itemCount: 3,
//                                     scrollDirection: Axis.horizontal,
//                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 1,
//                                         crossAxisSpacing: 0,
//                                         mainAxisSpacing: 10,
//                                         childAspectRatio: 1
//                                     ),
//                                     itemBuilder: (BuildContext context, int index){
//                                       return InkWell(
//                                         onTap: () {
//                                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                         },
//                                         child: Stack(
//                                             alignment: Alignment.center,
//                                             children: [
//                                               Container(
//                                                 color:  Color(0xff424242),
//                                                 // width: Get.width/3.2,
//                                                 child: CustomImageCached(
//                                                   // image: '${Images.carusalimage}}',
//                                                   image: '${catagoryimage[index]}',
//                                                   height: Get.height/4.2,
//                                                   isRound: false,
//                                                   fit: BoxFit.fill,
//
//                                                 ),
//                                               ),
//
//                                               Positioned(
//                                                   bottom: 15,
//                                                   child: Align(
//                                                     alignment: Alignment.bottomCenter,
//                                                     child: Text("Categories",
//                                                       style: caluna.copyWith(
//                                                         // color: Color(0xffDBDCE2),
//                                                           color: Colors.white,
//                                                           fontSize: 18),),
//                                                   )
//
//                                               )
//
//
//                                             ]
//                                         ),
//                                       );
//                                     },
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//
//                       /// SHOP By LuXURY ITEMS slider part
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 4),
//                                   child: Text("Luxury Items", style: railway.copyWith(fontSize: 20 ,)),
//                                 ),
//                                 // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Container(
//                               // color: Colors.red,
//                               height: Get.height/2.2,
//                               // width: Get.width,
//                               child: Padding(
//                                   padding: const EdgeInsets.only(left: 0, right: 0),
//                                   child:
//                                   GridView.builder(
//                                     itemCount: 3,
//                                     scrollDirection: Axis.horizontal,
//                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 1,
//                                         crossAxisSpacing: 0,
//                                         mainAxisSpacing: 10,
//                                         // childAspectRatio: 1,
//                                         mainAxisExtent: Get.width
//                                     ),
//                                     itemBuilder: (BuildContext context, int index){
//                                       return InkWell(
//                                         onTap: () {
//                                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                         },
//                                         child: Stack(
//                                             alignment: Alignment.center,
//                                             children: [
//                                               Container(
//                                                 color:  Color(0xff424242),
//                                                 // width: Get.width/3.2,
//                                                 child: CustomImageCached(
//                                                   // image: '${Images.carusalimage}}',
//                                                   image: '${catagoryimage[index]}',
//                                                   height: Get.height/2,
//                                                   width: Get.width,
//                                                   isRound: false,
//                                                   fit: BoxFit.fill,
//
//                                                 ),
//                                               ),
//
//                                               Positioned(
//                                                   bottom: 30,
//                                                   child: Align(
//                                                     alignment: Alignment.bottomCenter,
//                                                     child: Text("${categoryName[index]}",
//                                                       style: caluna.copyWith(
//                                                         // color: Color(0xffDBDCE2),
//                                                           color: Colors.white,
//                                                           fontSize: 20),),
//                                                   )
//
//                                               )
//
//
//                                             ]
//                                         ),
//                                       );
//                                     },
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 12),
//
//
//                       ///  Affordable Items By Category slider part
//                       Padding(
//                         padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 4),
//                                   child: Text("Affordable Items", style: railway.copyWith(fontSize: 20),),
//                                 ),
//                                 // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             Container(
//                               // color: Colors.red,
//                               height: Get.height/4.2,
//                               // width: Get.width,
//                               child: Padding(
//                                   padding: const EdgeInsets.only(left: 7, right: 0),
//                                   child:
//                                   GridView.builder(
//                                     itemCount: 3,
//                                     scrollDirection: Axis.horizontal,
//                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 1,
//                                         crossAxisSpacing: 0,
//                                         mainAxisSpacing: 10,
//                                         childAspectRatio: 1
//                                     ),
//                                     itemBuilder: (BuildContext context, int index){
//                                       return InkWell(
//                                         onTap: () {
//                                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                         },
//                                         child: Stack(
//                                             alignment: Alignment.center,
//                                             children: [
//                                               Container(
//                                                 color:  Color(0xff424242),
//                                                 // width: Get.width/3.2,
//                                                 child: CustomImageCached(
//                                                   // image: '${Images.carusalimage}}',
//                                                   image: '${brandimage[index]}',
//                                                   height: Get.height/4.2,
//                                                   isRound: false,
//                                                   fit: BoxFit.fill,
//
//                                                 ),
//                                               ),
//
//                                               Positioned(
//                                                   bottom: 15,
//                                                   child: Align(
//                                                     alignment: Alignment.bottomCenter,
//                                                     child: Text("${brandName[index]}",
//                                                       style: caluna.copyWith(
//                                                         // color: Color(0xffDBDCE2),
//                                                           color: Colors.white,
//                                                           fontSize: 18),),
//                                                   )
//
//                                               )
//
//
//                                             ]
//                                         ),
//                                       );
//                                     },
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//
//
//                       ///  DISCOVER LIFESTYLE
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 4),
//                               child: Text("Discover Lifestyle", style: railway.copyWith(fontSize: 20 ),),
//                             ),
//                           ),
//                           Expanded(
//                               flex: 1,
//                               child: Text("".toUpperCase(),
//                                 textAlign: TextAlign.end,
//                                 style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),)),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       InkWell(
//                         onTap: () {
//                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                         },
//                         child: Container(
//                           color: Color(0xffFAFBFB),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
//                             child: Column(
//                               children: [
//                                 CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2FWatchShop.jpg&w=1200&q=75',
//                                   height: Get.height/3.5,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       // SizedBox(height: 20),
//
//
//                       ///  13th image part
//                       InkWell(
//                         onTap: () {
//                           Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                         },
//                         child: Container(
//                           color: Color(0xffFAFBFB),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                             child: Column(
//                               children: [
//                                 CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2FGrooming_Desktop.jpg&w=1200&q=75',
//                                   height: Get.height/3.5,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//
//
//                       /// MoST POPULAR SHOP slider part
//                       Padding(
//                         padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 4),
//                                   child: Text("Most Popular", style: railway.copyWith(fontSize: 20),),
//                                 ),
//                                 InkWell(
//                                     onTap: (){
//                                       Get.to(CustomCategoryViewPage(pageIndex: 0, cardimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                     },
//                                     child: Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),)),
//                               ],
//
//                             ),
//                             SizedBox(height: 15),
//                             Container(
//                               // color: Colors.red,
//                               height: Get.height/2.45,
//                               // width: Get.width,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 0, right: 0),
//                                 child: ListView.builder(
//                                   padding: EdgeInsets.zero,
//                                   physics: ClampingScrollPhysics(),
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: 9,
//                                   itemBuilder:  (BuildContext context, int index) {
//                                     return Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 6),
//                                       child: Stack(
//                                           alignment: Alignment.topRight,
//                                           children: [
//                                             InkWell(
//                                               highlightColor: Colors.grey,
//                                               splashColor: Colors.grey,
//                                               // focusColor: Colors.green,
//                                               // hoverColor: Colors.blue,
//                                               onTap: (){
//                                                 Get.to(Add2CartScreen(pageIndex: 0, cartdetailsimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75',));
//                                                 // showCustomSnackBar("Click Shop Cart");
//                                               },
//                                               child: Container(
//                                                 // color:  Colors.cyan,
//                                                 color: Color(0xffFAFAFC),
//                                                 width: Get.width/2.7,
//                                                 child: Column(
//
//                                                     children: [
//
//                                                       Container(
//                                                         // color:  Color(0xff424242),
//                                                         // color:  Colors.blue,
//                                                         width: Get.width/2.7,
//                                                         child: Stack(
//                                                             alignment: Alignment.topCenter,
//                                                             children: [
//                                                               CustomImageCached(
//                                                                 // image: '${Images.carusalimage}}',
//                                                                 image: '${catagorysliderimage[index]}',
//                                                                 height: Get.height/3.2,
//                                                                 isRound: false,
//                                                                 fit: BoxFit.fill,
//
//                                                               ),
//                                                               Positioned(
//                                                                   bottom: 0,
//                                                                   child: Align(
//                                                                     alignment: Alignment.bottomCenter,
//                                                                     child: Container(
//                                                                       /// orginal color
//                                                                       // color: Color(0xffF2F2F2),
//                                                                       color: Colors.grey.shade400,
//                                                                       child: Padding(
//                                                                         padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
//                                                                         child: Text("New Season".toUpperCase(),
//                                                                           style: robotoRegular.copyWith(color: Colors.black, fontSize: 9),),
//                                                                       ),
//                                                                     ),
//                                                                   )
//
//                                                               )
//                                                             ]
//                                                         ),
//                                                       ),
//                                                       SizedBox(height: 12),
//
//
//                                                       Text("${categorysliderName[index]}",
//                                                         style: railway.copyWith(
//                                                             fontWeight: FontWeight.bold,
//                                                             fontSize: 11
//                                                         ),),
//                                                       SizedBox(height: 7),
//
//                                                       Padding(
//                                                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                                                         child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                           overflow: TextOverflow.ellipsis,
//                                                           maxLines: 1,
//                                                           style: caluna.copyWith(
//                                                             // fontWeight: FontWeight.w100,
//                                                               fontSize: 11),),
//                                                       ),
//                                                       SizedBox(height: 7),
//
//                                                       Text("100 BDT",
//                                                         style: caluna.copyWith( color: gold, fontSize: 12),),
//
//                                                     ]
//                                                 ),
//                                               ),
//                                             ),
//                                             Positioned(
//                                               top: 10,
//                                               right: 10,
//                                               child: InkWell(
//                                                 onTap: (){
//                                                   Get.to(WishListPage(pageIndex: 0,));
//                                                 },
//                                                 child: Align(
//                                                   alignment: Alignment.topRight,
//                                                   child: Icon(Icons.favorite_border, color: gold),
//                                                 ),
//                                               ),
//                                             ),
//                                           ]
//                                       ),
//                                     );
//                                   },
//
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 12),
//
//                       ///  Bottom Banner1 part
//                       InkWell(
//                         onTap: () {
//                           Get.to(WomenPage(pageIndex: 0,));
//                         },
//                         child: Container(
//                           color: Color(0xffFAFBFB),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                             child: Column(
//                               children: [
//                                 CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2Fshop-women.jpg&w=1200&q=75',
//                                   height: Get.height/9,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       // SizedBox(height: 20),
//
//                       ///  BOTTOM BANNER2 image part
//                       InkWell(
//                         onTap: () {
//                           Get.to(KidPage(pageIndex: 0,));
//                         },
//                         child: Container(
//                           color: Color(0xffFAFBFB),
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                             child: Column(
//                               children: [
//                                 CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2Fshop-man.jpg&w=1200&q=75',
//                                   height: Get.height/9,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//
//                       // SizedBox(height: 500)
//
//                     ],
//                   );
//                 },
//                 childCount: 1,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String greeting() {
//     var hour = DateTime.now().hour;
//     if (hour < 12) {
//       return 'Morning';
//     }
//     if (hour < 14) {
//       return 'Noon';
//     }
//     if (hour < 17) {
//       return 'Afternoon';
//     }
//     if (hour < 20) {
//       return 'Evening';
//     }
//     return 'Night';
//   }
//
//
//
//   void _setPage(int pageIndex) {
//     /*pageIndex==4?Get.to(CartPage()):*/
//     setState(() {
//       _pageController!.jumpToPage(pageIndex);
//       _pageIndex = pageIndex;
//     });
//   }
//
// }