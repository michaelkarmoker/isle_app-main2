// import 'dart:math';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
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
// import 'package:isletestapp/view/screens/design%20backup/kid.dart';
// import 'package:isletestapp/view/screens/design%20backup/men.dart';
// import 'package:isletestapp/view/screens/design%20backup/women.dart';
// import 'package:isletestapp/view/screens/kids/kid_page.dart';
// import 'package:isletestapp/view/auth/login-register.dart';
// import 'package:isletestapp/view/screens/design%20backup/categories_tab.dart';
// import 'package:isletestapp/view/screens/main_page/main_screen.dart';
// import 'package:isletestapp/view/screens/search/search_screen.dart';
// import 'package:isletestapp/view/screens/design%20backup/search_sunny.dart';
// import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
// import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
//
//
// class WomenPage extends StatefulWidget {
//   final int selectedCatIndex;
//
//   const WomenPage({Key? key, required this.selectedCatIndex, }) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<WomenPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController = TabController(
//     length: 3, // The number of tabs
//     initialIndex: 1, vsync: this, // Set the initial tab index (0 for the first tab, 1 for the second, etc.)
//   );
//
//
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
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Get.find<MainPageController>().dataInitialize();
//
//     }
//     );
//
//     _scrollController = ScrollController()
//       ..addListener(() {
//         setState(() {
//           _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
//         });
//       });
//
//
//   }
//
//   bool get _isSliverAppBarExpanded {
//     return _scrollController.hasClients &&
//         _scrollController.offset > kExpandedHeight - kToolbarHeight;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<MainPageController>(
//       builder: (controller) {
//         return DefaultTabController(
//           length: 3,
//           child: Scaffold(
//             key: _drawerscaffoldkey,
//             bottomNavigationBar: UniversalBottomNav(),
//             body: CustomScrollView(
//               controller: _scrollController,
//               slivers: <Widget>[
//                 SliverAppBar(
//                   automaticallyImplyLeading: false,
//                   iconTheme: IconThemeData(color: Color(0xffFAFBFB)),
//                   // automaticallyImplyLeading: false,
//
//                   backgroundColor: Color(0xffFAFBFB),
//                   // backgroundColor: Colors.teal,
//                   // show and hide SliverAppBar Title
//                   leadingWidth: Get.width/2.7,
//                   actions: [
//                     _isSliverAppBarExpanded?   !isSearchClick?InkWell(
//                         onTap: (){
//                           isSearchClick=!isSearchClick;
//                           setState(() {
//                             Get.to(SearchScreen());
//                           });
//                         },
//                         // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
//                         child: Image.asset(Images.search, height: 22, width: 22,)):SizedBox(): SizedBox(),
//                     SizedBox(width: 15),
//                     _isSliverAppBarExpanded?   InkWell(
//                         onTap: () {
//                           Get.to(WishListPage(pageIndex: 0,));
//                         },
//                         child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)): SizedBox(),
//
//
//                     SizedBox(width: 10),
//                     /* Padding(
//                   padding: const EdgeInsets.only(right: 12,top: 12,bottom: 12, left: 0),
//                   child: InkWell(
//                       onTap: (){
//                         // Get.dialog(PopUpMessage());
//                       },
//                       child: Image.asset("${Get.find<LocalizationController>().selectedLanguage==AppConstants.bn?Images.bd:Images.en}")),
//                 )*/
//                   ],
//                   centerTitle: !_isSliverAppBarExpanded,
//                   leading: _isSliverAppBarExpanded
//                       ? Padding(
//                     padding: const EdgeInsets.only(left: 0),
//                     child: Container(
//                       // color: Colors.pinkAccent,
//                       height: 200,
//                       child:
//                       TabBar(
//                         controller: _tabController,
//                           padding: EdgeInsets.zero,
//                           onTap: (index) {
//                             setState(() {
//
//                               if(index==0) { tabColor = gold;}
//                               if(index==1) {tabColor = gold;}
//                               if(index==2) {tabColor = gold;}
//                             });
//                             print(index);
//                           },
//                           // indicator: BoxDecoration(color: tabColor,borderRadius: BorderRadius.circular(8)),
//                           // dividerColor: Colors.black,
//
//                           /* indicator: BoxDecoration(
//                                 borderRadius: BorderRadius.only(topLeft:
//                                 Radius.circular(10),topRight: Radius.circular(10)),
//                                 color: tabColor
//                             ),*/
//                           // indicatorColor: Color(0xffb89600),
//                           indicatorColor: tabColor,
//                           indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
//                           indicatorWeight: 2,
//                           labelPadding: EdgeInsets.zero,
//                           physics: BouncingScrollPhysics(),
//
//                           tabs: [
//                             Container(
//                               height: 50,
//                               width: 100,
//                               // color: Colors.cyanAccent,
//                               child: Tab(
//                                 child: Text(
//                                   'Men',
//                                   style: railwaybold.copyWith(
//                                       color: Colors.black, fontSize: 12),
//                                 ),
//                               ),
//                             ),
//                             Tab(
//                                 child: Text(
//                                   'Women',
//                                   style: railwaybold.copyWith(
//                                       color: Colors.black, fontSize: 12),
//                                 )),
//                             Tab(
//                                 child: Text(
//                                   'Kids',
//                                   style: railwaybold.copyWith(
//                                       color: Colors.black, fontSize: 12),
//                                 )),
//                           ]),
//
//                     ),
//                   )
//                       : null,
//                   // leading: null,
//                   title: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         child: InkWell(
//                           onTap: (){
//                             Get.to(MainScreen());
//                           },
//                           child: Container(
//                             // margin: EdgeInsets.all(15),
//                               padding: EdgeInsets.only(left: 5, right: 5, top: 5,bottom: 5),
//                               // color: Colors.red,
//                               height: 55, width: 75,
//                               child: Image.asset(Images.logo, height: 55, width: 70, fit: BoxFit.fill,)),
//                         ),)
//                     ],
//                   ),
//                   pinned: true,
//                   snap: false,
//                   floating: false,
//                   expandedHeight: kExpandedHeight,
//                   // show and hide FlexibleSpaceBar title
//                   flexibleSpace: _isSliverAppBarExpanded
//                       ? null
//                       : FlexibleSpaceBar(
//
//                     centerTitle: true,
//                     title: Padding(
//                       padding: const EdgeInsets.only(left: 0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         // crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//
//                               Expanded(
//                                 flex: 5,
//                                 child: Container(
//                                   height: Get.height/20,
//                                   // color: Colors.tealAccent,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//
//
//                                       Container(
//                                         height: Get.height/20,
//                                         width: Get.width/3.8,
//                                         // color: Colors.teal,
//                                         child: TabBar(
//                                           controller: _tabController,
//                                             padding: EdgeInsets.zero,
//                                             onTap: (index) {
//                                               setState(() {
//
//                                                 if(index==0) { tabColor = gold;}
//                                                 if(index==1) {tabColor = gold;}
//                                                 if(index==2) {tabColor = gold;}
//                                               });
//                                               print(index);
//                                             },
//                                             // indicator: BoxDecoration(color: tabColor,borderRadius: BorderRadius.circular(8)),
//                                             // dividerColor: Colors.black,
//
//                                             /* indicator: BoxDecoration(
//                                 borderRadius: BorderRadius.only(topLeft:
//                                 Radius.circular(10),topRight: Radius.circular(10)),
//                                 color: tabColor
//                             ),*/
//                                             // indicatorColor: Color(0xffb89600),
//                                             indicatorColor: tabColor,
//                                             indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
//                                             indicatorWeight: 1,
//                                             labelPadding: EdgeInsets.zero,
//                                             physics: BouncingScrollPhysics(),
//                                             tabs: [
//                                               Container(
//                                                 height: Get.height,
//                                                 width: Get.width,
//                                                 // color: Colors.cyanAccent,
//                                                 child: Tab(
//                                                     child: Text(
//                                                       'Men',
//                                                       style: railwaybold.copyWith(
//                                                         color: Colors.black, fontSize: 9, ),
//                                                     )),
//                                               ),
//                                               Tab(
//                                                   child: Text(
//                                                     'Women',
//                                                     style: railwaybold.copyWith(
//                                                       color: Colors.black, fontSize: 9, ),
//                                                   )),
//                                               Tab(
//                                                   child: Text(
//                                                     'Kids',
//                                                     style: railwaybold.copyWith(
//                                                       color: Colors.black, fontSize: 9, ),
//                                                   )),
//                                             ]),
//                                       ),
//
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 2,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(right: 4, top: 5),
//                                   child: Container(
//                                       height: 28,
//                                       // color: Colors.blue,
//                                       alignment: Alignment.topRight,
//                                       child: InkWell(
//                                         onTap: () {
//                                           Get.to(WishListPage(pageIndex : 0));
//                                         },
//                                         child: CircleAvatar(
//                                             radius: 16,
//                                             backgroundColor: Colors.grey.shade100,
//                                             child: Image.asset(Images.wish, height: 15, width: 15, color: Color(0xffB87253),)),
//                                       )),
//                                 ),
//                               ),
//
//                             ],
//                           ),
//
//                           SizedBox(height: 5),
//                           Text("Good ${greeting()}!", style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                           SizedBox(height: 8),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Container(
//                               // color: Colors.deepPurpleAccent,
//                               height: 28,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//
//                                   Expanded(
//                                     flex: 5,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(top: 0),
//                                       child: SizedBox(
//                                           height: 28,
//                                           child: SearchTextField()),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 6,right: 8),
//                                       child: Container(
//                                         height: 28,
//                                         width: 28,
//                                         color: Colors.grey.shade200,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(6),
//                                           child: Image.asset(Images.notification,),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     /*  background: Image.asset(
//                       'assets/images/newBeach.jpg',
//                       fit: BoxFit.fill,
//                     ),*/
//                   ),
//                 ),
//
//
//                 SliverFillRemaining(
//                   child: TabBarView(
//                       controller: _tabController,
//                     children: <Widget>[
//                       RefreshIndicator(
//                           onRefresh: () async{
//                             // await Get.find<MainPageController>().dataInitialize();
//                           },
//                           child: Men(controller: controller, pageId: '',)),
//                       RefreshIndicator(
//                           onRefresh: () async{
//                             // await Get.find<MainPageController>().dataInitialize();
//                           },
//                           child: Women(controller: controller,)),
//                       RefreshIndicator(
//                           onRefresh: () async{
//                             // await Get.find<MainPageController>().dataInitialize();
//                           },
//                           child: Kid(controller: controller,)),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         );
//       }
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