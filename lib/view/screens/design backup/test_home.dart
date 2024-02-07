// import 'dart:math';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
// import 'package:isletestapp/controller/nested%20cat%20subcat/category_page_controller.dart';
// import 'package:isletestapp/util/app_constants.dart';
// import 'package:isletestapp/util/color.dart';
// import 'package:isletestapp/util/constants.dart';
// import 'package:isletestapp/util/images.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/view/base/custom_Image_cached.dart';
// import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
// import 'package:isletestapp/view/base/custom_shimmer.dart';
// import 'package:isletestapp/view/base/custom_snackbar.dart';
// import 'package:isletestapp/view/base/custom_top_search_field.dart';
// import 'package:isletestapp/view/screens/add%20to%20cart%20screen/product_details_page.dart';
// import 'package:isletestapp/view/screens/category/product_page.dart';
// import 'package:isletestapp/view/screens/dashboard/widgets/bottom_nav_item.dart';
// import 'package:isletestapp/view/screens/discover/discover_page_previous.dart';
// import 'package:isletestapp/view/screens/kids/kid_page.dart';
// import 'package:isletestapp/view/auth/login-register.dart';
// import 'package:isletestapp/view/screens/design%20backup/categories_tab.dart';
// import 'package:isletestapp/view/screens/search/search_screen.dart';
// import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
// import '../main_page/main_screen.dart';
// import '../universal_bottom_nav/universal_bottom_nav.dart';
//
// class HomeTest extends StatefulWidget {
//   final int selectedCatIndex;
//   // final String subCategoryId;
//   // final String childCategoryId;
//   // final String sectionId;
//   // final int pageIndex;
//   const HomeTest({Key? key,
//     // required this.pageIndex,
//     required this.selectedCatIndex,
//   }) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomeTest> {
// /*
//   late TabController _tabController = TabController(
//     length: 3, // The number of tabs
//     initialIndex: 0, vsync: this, // Set the initial tab index (0 for the first tab, 1 for the second, etc.)
//   );
// */
//
//   PageController? _pageController;
//   bool isOpen=false;
//   int _pageIndex = 0;
//   List<Widget> _screens=[];
//   GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
//   final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
//   bool _canExit =  false;
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
//   TextEditingController searchCtr = TextEditingController();
//   FocusNode searchFcs = FocusNode();
//   bool isSearchClick=false;
//   TextEditingController subscribeCtr = TextEditingController();
//   FocusNode subscribeFcs = FocusNode();
//   late ScrollController _scrollController;
//   Color _textColor = Colors.black;
//   // static const kExpandedHeight = 145.0;
//   static const kExpandedHeight = 155.0;
//
//
//   int selectedIndex=0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Get.find<CategoryPageController>().dataInitialize(widget.selectedCatIndex);
//       selectedIndex=widget.selectedCatIndex;
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
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     Get.find<CategoryPageController>().disclose();
//   }
//
//
//   bool get _isSliverAppBarExpanded {
//     return _scrollController.hasClients &&
//         _scrollController.offset > kExpandedHeight - kToolbarHeight;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CategoryPageController>(
//         builder: (controller) {
//           return Scaffold(
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
//                 padding: const EdgeInsets.only(right: 12,top: 12,bottom: 12, left: 0),
//                 child: InkWell(
//                     onTap: (){
//                       // Get.dialog(PopUpMessage());
//                     },
//                     child: Image.asset("${Get.find<LocalizationController>().selectedLanguage==AppConstants.bn?Images.bd:Images.en}")),
//               )*/
//                   ],
//                   centerTitle: !_isSliverAppBarExpanded,
//                   leading: _isSliverAppBarExpanded
//                       ? Padding(
//                     padding: const EdgeInsets.only(left: 0),
//                     child: Container(
//                       // color: Colors.pinkAccent,
//                       height: 200,
//                       child:
//                       Center(
//                           child: controller.alldata!.length==0?
//                           MyShimmer(hight: 40)
//                               :
//                           ListView.builder(
//
//                               itemCount:controller.alldata!.length,
//                               physics: AlwaysScrollableScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               shrinkWrap: true,
//                               itemBuilder: (context,index){
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8),
//                                   child:  InkWell(
//                                       onTap:(){
//
//                                         controller.getNestedSectionData(controller.alldata![index].id.toString());
//                                         controller.getNestedCatSubCatData(controller.alldata![index].id.toString());
//
//                                         selectedIndex=index;
//                                         setState((){
//                                         });
//                                       },
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 2),
//                                             child: Text("${controller.alldata?[index]?.title??""}",style: selectedIndex==index? railway.copyWith(
//                                                 height: 1.5, color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold) : railway.copyWith(
//                                                 height: 1.5, color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),),
//                                           ),
//                                           SizedBox(height: 5),
//                                           selectedIndex==index?
//                                           Container(
//                                             color: gold,
//                                             height: 2,width: 40,
//
//                                           ):Container()
//                                         ],
//                                       )),
//                                 );
//                               })),
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
//                         ),
//                       )
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
//                                         child:    Container(
//                                           // color: Colors.tealAccent,
//                                           height: 55,
//                                           child: Center(
//                                               child: controller.alldata!.length==0?
//                                               MyShimmer(hight: 40)
//                                                   :
//                                               ListView.builder(
//
//                                                   itemCount:controller.alldata!.length,
//                                                   physics: AlwaysScrollableScrollPhysics(),
//                                                   scrollDirection: Axis.horizontal,
//                                                   shrinkWrap: true,
//                                                   itemBuilder: (context,index){
//                                                     return Padding(
//                                                       padding: const EdgeInsets.all(8),
//                                                       child:  InkWell(
//                                                           onTap:(){
//
//                                                             controller.getNestedSectionData(controller.alldata![index].id.toString());
//                                                             controller.getNestedCatSubCatData(controller.alldata![index].id.toString());
//
//                                                             selectedIndex=index;
//                                                             setState((){
//                                                             });
//                                                           },
//                                                           child: Column(
//                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                             children: [
//
//                                                               Padding(
//                                                                 padding: const EdgeInsets.symmetric(horizontal: 35),
//                                                                 child: Text("${controller.alldata?[index]?.title??""}",style: selectedIndex==index? railway.copyWith(
//                                                                     height: 1.5, color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold) : railway.copyWith(
//                                                                     height: 1.5, color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
//                                                               ),
//                                                               SizedBox(height: 5),
//                                                               selectedIndex==index?
//                                                               Container(
//                                                                 color: gold,
//                                                                 height: 2,width: 70,
//
//                                                               ):Container()
//                                                             ],
//                                                           )),
//                                                     );
//                                                   })),
//                                         ),
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
//                                             child: Image.asset(Images.wish, height: 15, width: 15, color: gold,)),
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
//                   ),
//                 ),
//
//
//                 SliverFillRemaining(
//                   child:
//                   controller.nestedSectionResponse!= null&&controller.nestedSectionResponse!.data!=null && controller.nestedSectionResponse!.data!.length>0 ?
//                   Expanded(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             ListView.builder(
//                                 itemCount: controller.nestedSectionResponse!.data!.length,
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Column(
//                                     children: [
//                                       InkWell(
//                                         onTap: (){
//                                           Get.to(  CustomCategoryViewPage(
//                                             categoryId: "",
//                                             page: AppConstants.SECTION,
//                                             subCategoryId: "",
//                                             childCategoryId: '',
//                                             sectionId: controller.nestedSectionResponse!.data![index].id!.toString(),
//
//                                           ));
//                                         },
//                                         child: Container(
//                                           height: 120,
//                                           // color: Colors.green,
//                                           child: Row(
//                                             children: [
//                                               Expanded(
//                                                   flex: 5,
//                                                   child: Container(
//                                                     height: 40,
//                                                     // color: Colors.pinkAccent,
//                                                     child: Padding(
//                                                       padding: const EdgeInsets.only(left: 15),
//                                                       child: Row(
//                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children: [
//                                                           InkWell(
//                                                             onTap: () {
//                                                               controller.nestedSectionResponse!.data![index].isDrop=!controller.nestedSectionResponse!.data![index].isDrop;
//                                                               setState(() {});
//                                                             },
//                                                             child: Container(
//                                                               height: 40,
//                                                               child: Center(
//                                                                 child: Text("${controller.nestedSectionResponse!.data![index].title??""}",
//                                                                   style: railway.copyWith(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 16),),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           InkWell(
//                                                               onTap : () {
//                                                                 controller.nestedSectionResponse!.data![index].isDrop=!controller.nestedSectionResponse!.data![index].isDrop;
//                                                                 setState(() {
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                 // color: Colors.purple,
//                                                                   height: 40,
//                                                                   width: 5)),
//
//                                                           // widget.isExpanded1?
//                                                           controller.nestedSectionResponse!.data![index].isDrop?
//                                                           InkWell(
//                                                             onTap : () {
//                                                               controller.nestedSectionResponse!.data![index].isDrop=!controller.nestedSectionResponse!.data![index].isDrop;
//                                                               setState(() {
//                                                               });
//                                                             },
//                                                             child: Container(
//                                                               height: 40,
//                                                               // color: Colors. blue,
//                                                               child: Padding(
//                                                                 padding: const EdgeInsets.only(left: 3),
//                                                                 child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
//                                                               ),
//                                                             ),
//                                                           ):
//                                                           InkWell(
//                                                               onTap: () {
//                                                                 controller.nestedSectionResponse!.data![index].isDrop=!controller.nestedSectionResponse!.data![index].isDrop;
//                                                                 setState(() {
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                   height: 40,
//                                                                   // color: Colors. blue,
//                                                                   child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,))),
//                                                           // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   )
//                                               ),
//
//                                               Expanded(
//                                                   flex: 3,
//                                                   child: Container(
//                                                       color: Color(0xffFFFFFF),
//                                                       child: Padding(
//                                                         padding: const EdgeInsets.only(left: 0),
//                                                         child: CustomImageCached(
//                                                           image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].banner?? ""}',
//                                                           fit: BoxFit.fill,
//                                                           isRound: false,
//                                                         ),
//                                                         // child: Image.network("https://ounass-qa.atgcdn.ae/small_light(of=webp)/pub/media/catalog/category/MW_App_Cat_New_In_WK32.jpg",fit: BoxFit.fill,),
//                                                       ))
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Divider(
//                                         height: 3,
//                                         thickness: 3,
//                                         color: Color(0xffF2F6F9),
//                                         // color: Colors.pink,
//                                       ),
//                                       // widget.isExpanded1?
//                                       controller.nestedSectionResponse!.data![index].isDrop?
//                                       Container(
//                                         // color: Colors.red,
//                                         // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                         child: Column(
//                                           children: [
//                                             ListView.builder(
//                                                 padding: EdgeInsets.zero,
//                                                 // itemCount: drawerdrop.length,
//                                                 itemCount: controller.nestedSectionResponse!.data![index].children!.length,
//                                                 shrinkWrap: true,
//                                                 scrollDirection: Axis.vertical,
//                                                 physics: ClampingScrollPhysics(),
//                                                 itemBuilder: (BuildContext context, int index2){
//                                                   return  Column(
//                                                     children: [
//                                                       Column(
//                                                         children: [
//                                                           InkWell(
//                                                             onTap: (){
//                                                               Get.to(  CustomCategoryViewPage(
//
//                                                                 categoryId: "",
//
//
//                                                                 page: AppConstants.SUBSECTION,
//                                                                 subCategoryId: "",
//                                                                 childCategoryId: '',
//                                                                 sectionId: controller.nestedSectionResponse!.data![index].children![index2].id!.toString(),
//
//                                                               ));
//                                                             },
//                                                             child: Container(
//                                                               alignment: Alignment.centerLeft,
//                                                               color: Color(0xffF2F6F9),
//                                                               // color: Colors.purpleAccent,
//                                                               height: 50,
//                                                               width: Get.width,
//                                                               child: Padding(
//                                                                 padding: const EdgeInsets.only(left: 30),
//                                                                 child: Row(
//                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                   children: [
//                                                                     Text(
//                                                                       // "${drawerdrop[index]}",
//                                                                       "${controller.nestedSectionResponse!.data![index].children![index2].title??""}",
//                                                                       style: poppins.copyWith(
//                                                                           fontSize: 12,
//                                                                           fontWeight: FontWeight.w200,
//                                                                           color: Colors.black87
//                                                                       ),
//                                                                     ),
//                                                                     SizedBox(width: 5),
//                                                                     InkWell(
//                                                                       onTap : () {
//                                                                         controller.nestedSectionResponse!.data![index].children![index2].isDrop2=!controller.nestedSectionResponse!.data![index].children![index2].isDrop2;
//                                                                         setState(() {
//                                                                         });
//                                                                       },
//                                                                       child: Container(
//                                                                         height: 50,
//                                                                         width: 100,
//                                                                         // color: Colors.green,
//                                                                         child: Row(
//                                                                           mainAxisAlignment: MainAxisAlignment.end,
//                                                                           children: [
//                                                                             SizedBox(width: 5),
//                                                                             // widget.childexp1?
//                                                                             controller.nestedSectionResponse!.data![index].children![index2].isDrop2 ?
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(right: 12),
//                                                                               child: controller.nestedSectionResponse!.data![index].children![index2].children!.length>0?Image.asset(Images.up, color: Colors.black, height: 22, width: 15,): SizedBox(),
//                                                                             ):
//                                                                             controller.nestedSectionResponse!.data![index].children![index2].children!.length>0?
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(right: 12),
//                                                                               child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                             ): SizedBox(),
//                                                                             // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//
//                                                           // widget.childexp1?
//                                                           controller.nestedSectionResponse!.data![index].children![index2].isDrop2 ?
//                                                           Container(
//                                                             // color: Colors.red,
//                                                             // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                             child: Column(
//                                                               children: [
//                                                                 ListView.builder(
//                                                                     padding: EdgeInsets.zero,
//                                                                     // itemCount: drawerdrop.length,
//                                                                     itemCount: controller.nestedSectionResponse!.data![index].children![index2].children!.length,
//                                                                     shrinkWrap: true,
//                                                                     scrollDirection: Axis.vertical,
//                                                                     physics: ClampingScrollPhysics(),
//                                                                     itemBuilder: (BuildContext context, int index3){
//                                                                       return
//                                                                         Column(
//                                                                           children: [
//                                                                             InkWell(
//                                                                               onTap: (){
//                                                                                 Get.to(  CustomCategoryViewPage(
//
//                                                                                   categoryId: "",
//
//
//                                                                                   page: AppConstants.CHILDSECTION,
//                                                                                   subCategoryId: "",
//                                                                                   childCategoryId: "",
//                                                                                   sectionId: controller.nestedSectionResponse!.data![index].children![index2].children![index3].id!.toString(),
//
//                                                                                 ));
//                                                                               },
//                                                                               child: Container(
//                                                                                 alignment: Alignment.centerLeft,
//                                                                                 color: Color(0xffFAFAFA),
//                                                                                 height: 50,
//                                                                                 width: Get.width,
//                                                                                 child: Padding(
//                                                                                   padding: const EdgeInsets.only(left: 50, right: 12),
//                                                                                   child: Row(
//                                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                     children: [
//
//                                                                                       Text(
//                                                                                         // "${drawerdrop[index]}",
//                                                                                         "${controller.nestedSectionResponse!.data![index].children![index2].children![index3].title??""}",
//                                                                                         style: poppins.copyWith(
//                                                                                             fontSize: 12,
//                                                                                             fontWeight: FontWeight.w200,
//                                                                                             color: Colors.black87
//                                                                                         ),
//                                                                                       ),
//                                                                                     ],
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         );
//                                                                     }
//
//                                                                 ),
//                                                                 // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                               ],
//                                                             ),
//                                                           ):Container(),
//
//                                                         ],
//                                                       ),
//
//                                                     ],
//                                                   );
//                                                 }
//                                             ),
//                                             // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                           ],
//                                         ),
//                                       ):Container(),
//                                     ],
//                                   );
//                                 }
//                             ),
//                             ListView.builder(
//                                 itemCount: controller.nestedCategoryResponse!.data!.length,
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Column(
//                                     children: [
//                                       InkWell(
//                                         onTap: (){
//                                           Get.to(  CustomCategoryViewPage(
//
//                                             categoryId: controller.nestedCategoryResponse!.data![index].id!.toString(),
//
//
//                                             page: AppConstants.CATEGORY,
//                                             subCategoryId: "",
//                                             childCategoryId: '',
//                                             sectionId: '',
//
//                                           ));
//                                         },
//                                         child: Container(
//                                           height: 120,
//                                           // color: Colors.green,
//
//                                           child: Row(
//                                             children: [
//                                               Expanded(
//                                                   flex: 5,
//                                                   child: Container(
//                                                     height: 40,
//                                                     // color: Colors.pinkAccent,
//                                                     child: Padding(
//                                                       padding: const EdgeInsets.only(left: 15),
//                                                       child: Row(
//                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children: [
//                                                           InkWell(
//                                                             onTap: () {
//                                                               controller.nestedCategoryResponse!.data![index].isDrop=!controller.nestedCategoryResponse!.data![index].isDrop;
//                                                               setState(() {});
//                                                             },
//                                                             child: Container(
//                                                               height: 40,
//                                                               child: Center(
//                                                                 child: Text("${controller.nestedCategoryResponse!.data![index].title??""}",
//                                                                   style: railway.copyWith(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 16),),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           InkWell(
//                                                               onTap : () {
//                                                                 controller.nestedCategoryResponse!.data![index].isDrop=!controller.nestedCategoryResponse!.data![index].isDrop;
//                                                                 setState(() {
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                 // color: Colors.purple,
//                                                                   height: 40,
//                                                                   width: 5)),
//
//                                                           // widget.isExpanded1?
//                                                           controller.nestedCategoryResponse!.data![index].isDrop?
//                                                           InkWell(
//                                                             onTap : () {
//                                                               controller.nestedCategoryResponse!.data![index].isDrop=!controller.nestedCategoryResponse!.data![index].isDrop;
//                                                               setState(() {
//                                                               });
//                                                             },
//                                                             child: Container(
//                                                               height: 40,
//                                                               // color: Colors. blue,
//                                                               child: Padding(
//                                                                 padding: const EdgeInsets.only(left: 3),
//                                                                 child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
//                                                               ),
//                                                             ),
//                                                           ):
//                                                           InkWell(
//                                                               onTap: () {
//                                                                 controller.nestedCategoryResponse!.data![index].isDrop=!controller.nestedCategoryResponse!.data![index].isDrop;
//                                                                 setState(() {
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                   height: 40,
//                                                                   // color: Colors. blue,
//                                                                   child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,))),
//                                                           // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   )
//                                               ),
//
//                                               Expanded(
//                                                   flex: 3,
//                                                   child: Container(
//                                                       color: Color(0xffFFFFFF),
//                                                       child: Padding(
//                                                         padding: const EdgeInsets.only(left: 0),
//                                                         child: CustomImageCached(
//                                                           image: '${AppConstants.BASE_URL}${controller.nestedCategoryResponse!.data![index].banner?? ""}',
//                                                           fit: BoxFit.fill,
//                                                           isRound: false,
//                                                         ),
//                                                         // child: Image.network("https://ounass-qa.atgcdn.ae/small_light(of=webp)/pub/media/catalog/category/MW_App_Cat_New_In_WK32.jpg",fit: BoxFit.fill,),
//                                                       ))
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Divider(
//                                         height: 3,
//                                         thickness: 3,
//                                         color: Color(0xffF2F6F9),
//                                         // color: Colors.pink,
//                                       ),
//                                       // widget.isExpanded1?
//                                       controller.nestedCategoryResponse!.data![index].isDrop?
//                                       Container(
//                                         // color: Colors.red,
//                                         // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                         child: Column(
//                                           children: [
//                                             ListView.builder(
//                                                 padding: EdgeInsets.zero,
//                                                 // itemCount: drawerdrop.length,
//                                                 itemCount: controller.nestedCategoryResponse!.data![index].subCategories!.length,
//                                                 shrinkWrap: true,
//                                                 scrollDirection: Axis.vertical,
//                                                 physics: ClampingScrollPhysics(),
//                                                 itemBuilder: (BuildContext context, int index2){
//                                                   return  Column(
//                                                     children: [
//                                                       Column(
//                                                         children: [
//                                                           InkWell(
//                                                             onTap: (){
//                                                               Get.to(  CustomCategoryViewPage(
//
//                                                                 categoryId: "",
//
//
//                                                                 page: AppConstants.SUBCATEGORY,
//                                                                 subCategoryId: controller.nestedCategoryResponse!.data![index].subCategories![index2].id!.toString(),
//                                                                 childCategoryId: '',
//                                                                 sectionId: '',
//
//                                                               ));
//                                                             },
//                                                             child: Container(
//                                                               alignment: Alignment.centerLeft,
//                                                               color: Color(0xffF2F6F9),
//                                                               // color: Colors.purpleAccent,
//                                                               height: 50,
//                                                               width: Get.width,
//                                                               child: Padding(
//                                                                 padding: const EdgeInsets.only(left: 30),
//                                                                 child: Row(
//                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                   children: [
//                                                                     Text(
//                                                                       // "${drawerdrop[index]}",
//                                                                       "${controller.nestedCategoryResponse!.data![index].subCategories![index2].title??""}",
//                                                                       style: poppins.copyWith(
//                                                                           fontSize: 12,
//                                                                           fontWeight: FontWeight.w200,
//                                                                           color: Colors.black87
//                                                                       ),
//                                                                     ),
//                                                                     SizedBox(width: 5),
//                                                                     InkWell(
//                                                                       onTap : () {
//                                                                         controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2=!controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2;
//                                                                         setState(() {
//                                                                         });
//                                                                       },
//                                                                       child: Container(
//                                                                         height: 50,
//                                                                         width: 100,
//                                                                         // color: Colors.green,
//                                                                         child: Row(
//                                                                           mainAxisAlignment: MainAxisAlignment.end,
//                                                                           children: [
//                                                                             SizedBox(width: 5),
//                                                                             // widget.childexp1?
//                                                                             controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2 ?
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(right: 12),
//                                                                               child: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.length>0?Image.asset(Images.up, color: Colors.black, height: 22, width: 15,): SizedBox(),
//                                                                             ):
//                                                                             controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.length>0?
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(right: 12),
//                                                                               child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                             ): SizedBox(),
//                                                                             // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//
//                                                           // widget.childexp1?
//                                                           controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2 ?
//                                                           Container(
//                                                             // color: Colors.red,
//                                                             // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                             child: Column(
//                                                               children: [
//                                                                 ListView.builder(
//                                                                     padding: EdgeInsets.zero,
//                                                                     // itemCount: drawerdrop.length,
//                                                                     itemCount: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.length,
//                                                                     shrinkWrap: true,
//                                                                     scrollDirection: Axis.vertical,
//                                                                     physics: ClampingScrollPhysics(),
//                                                                     itemBuilder: (BuildContext context, int index3){
//                                                                       return
//                                                                         Column(
//                                                                           children: [
//                                                                             InkWell(
//                                                                               onTap: (){
//                                                                                 Get.to(  CustomCategoryViewPage(
//
//                                                                                   categoryId: "",
//
//
//                                                                                   page: AppConstants.CHILDCATEGORY,
//                                                                                   subCategoryId: "",
//                                                                                   childCategoryId: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories![index3].id!.toString(),
//                                                                                   sectionId: '',
//
//                                                                                 ));
//                                                                               },
//                                                                               child: Container(
//                                                                                 alignment: Alignment.centerLeft,
//                                                                                 color: Color(0xffFAFAFA),
//                                                                                 height: 50,
//                                                                                 width: Get.width,
//                                                                                 child: Padding(
//                                                                                   padding: const EdgeInsets.only(left: 50, right: 12),
//                                                                                   child: Row(
//                                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                     children: [
//
//                                                                                       Text(
//                                                                                         // "${drawerdrop[index]}",
//                                                                                         "${controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories![index3].title??""}",
//                                                                                         style: poppins.copyWith(
//                                                                                             fontSize: 12,
//                                                                                             fontWeight: FontWeight.w200,
//                                                                                             color: Colors.black87
//                                                                                         ),
//                                                                                       ),
//                                                                                     ],
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         );
//                                                                     }
//
//                                                                 ),
//                                                                 // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                               ],
//                                                             ),
//                                                           ):Container(),
//
//                                                         ],
//                                                       ),
//
//                                                     ],
//                                                   );
//                                                 }
//                                             ),
//                                             // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                           ],
//                                         ),
//                                       ):Container(),
//                                     ],
//                                   );
//                                 }
//                             ),
//                           ],
//                         ),
//                       )
//                   )
//                       : Text("")
//                 ),
//
//               ],
//             ),
//           );
//         }
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
// }