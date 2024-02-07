// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
// import 'package:isletestapp/controller/nested%20cat%20subcat/category_page_controller.dart';
// import 'package:isletestapp/util/HexColor.dart';
// import 'package:isletestapp/util/app_constants.dart';
// import 'package:isletestapp/util/color.dart';
// import 'package:isletestapp/util/constants.dart';
// import 'package:isletestapp/util/images.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/util/text_SIZE.dart';
// import 'package:isletestapp/view/base/custom_Image_cached.dart';
// import 'package:isletestapp/view/base/custom_shimmer.dart';
// import 'package:isletestapp/view/base/custom_top_search_field.dart';
// import 'package:isletestapp/view/screens/add%20to%20cart%20screen/product_details_page.dart';
// import 'package:isletestapp/view/screens/category/product_page.dart';
// import 'package:isletestapp/view/screens/design%20backup/women/women_page.dart';
// import 'package:isletestapp/view/screens/kids/kid_page.dart';
// import 'package:isletestapp/view/screens/main_page/main_screen.dart';
// import 'package:isletestapp/view/screens/search/search_screen.dart';
// import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
// import 'package:isletestapp/view/screens/wish_list/similar_product_popup.dart';
// import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
//
//
//
// class Home extends StatefulWidget {
//   final int selectedCatIndex;
//   const Home({super.key, required this.selectedCatIndex});
//
//
//   @override
//   State<Home> createState() => _SliverAppBarExampleState();
// }
//
// class _SliverAppBarExampleState extends State<Home> {
//   late ScrollController _scrollController;
//   static const kExpandedHeight = 155.0;
//   bool isSearchClick=false;
//
//
//   bool get _isSliverAppBarExpanded {
//     return _scrollController.hasClients &&
//         _scrollController.offset > kExpandedHeight - kToolbarHeight;
//   }
//
//   int selectedIndex=0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Get.find<MainPageController>().dataInitialize();
//       selectedIndex=widget.selectedCatIndex;
//     });
//     _scrollController = ScrollController()..addListener(() {
//         setState(() {
//           // _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
//         });
//       });
//     startMoving();
//   }
//
//   double position = 0;
//   void startMoving() {
//     Future.delayed(Duration(milliseconds: 60), () {
//       if (position < -1) {
//         // Reset the position to move the item to the right
//         position = 1;
//       } else {
//         // Move the item to the left
//         position -= 0.01;
//       }
//
//       if (mounted) {
//         setState(() {});
//         startMoving();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     Get.find<MainPageController>().disclose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<MainPageController>(
//       builder: (controller) {
//         return Scaffold(
//           bottomNavigationBar: UniversalBottomNav(),
//           body:  CustomScrollView(
//             controller: _scrollController,
//             slivers: <Widget>[
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 iconTheme: IconThemeData(color: Color(0xffFAFBFB)),
//                 backgroundColor: Color(0xffFAFBFB),
//                 // backgroundColor: Colors.teal,
//                 // show and hide SliverAppBar Title
//                 leadingWidth: Get.width/2.7,
//                 toolbarHeight: 70,
//                 actions: [
//                   _isSliverAppBarExpanded?   !isSearchClick? InkWell(
//                       onTap: (){
//                         isSearchClick=!isSearchClick;
//                         setState(() {
//                           Get.to(SearchScreen());
//                         });
//                       },
//                       // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
//                       child: Image.asset(Images.search, height: 22, width: 22,)):SizedBox(): SizedBox(),
//                   SizedBox(width: 15),
//                   _isSliverAppBarExpanded?   InkWell(
//                       onTap: () {
//                         Get.to(WishListPage(pageIndex: 0,));
//                       },
//                       child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)): SizedBox(),
//
//
//                   SizedBox(width: 10),
//                   /* Padding(
//                 padding: const EdgeInsets.only(right: 12,top: 12,bottom: 12, left: 0),
//                 child: InkWell(
//                     onTap: (){
//                       // Get.dialog(PopUpMessage());
//                     },
//                     child: Image.asset("${Get.find<LocalizationController>().selectedLanguage==AppConstants.bn?Images.bd:Images.en}")),
//               )*/
//                 ],
//                 centerTitle: !_isSliverAppBarExpanded,
//                 leading: _isSliverAppBarExpanded
//                     ? Padding(
//                   padding: const EdgeInsets.only(left: 0),
//                   child: Container(
//                     // color: Colors.pinkAccent,
//                     height: 200,
//                     child:
//                     Center(
//                         child: controller.genderList!.length==0?
//                         // MyShimmer(hight: 40)
//                         SizedBox()
//                             :
//                         ListView.builder(
//
//                             itemCount:controller.genderList!.length,
//                             physics: AlwaysScrollableScrollPhysics(),
//                             scrollDirection: Axis.horizontal,
//                             shrinkWrap: true,
//                             itemBuilder: (context,index){
//                               return Padding(
//                                 padding: const EdgeInsets.all(8),
//                                 child:  InkWell(
//                                     onTap:(){
//
//                                       controller.getTopSliderData(controller.genderList![index].id.toString());
//                                       controller.getHomePageAllData(controller.genderList![index].id.toString());
//
//                                       selectedIndex=index;
//                                       setState((){
//                                       });
//                                     },
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 1),
//                                           child: Text("${controller.genderList?[index]?.title??""}",style: selectedIndex==index? railway.copyWith(
//                                               height: 1.5, color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold) : railway.copyWith(
//                                               height: 1.5, color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
//                                         ),
//                                         SizedBox(height: 5),
//                                         selectedIndex==index?
//                                         Container(
//                                           color: gold,
//                                           height: 2,width: 40,
//
//                                         ):Container()
//                                       ],
//                                     )),
//                               );
//                             })),
//
//                   ),
//                 )
//                     : null,
//                 // leading: null,
//                 title: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                       child: InkWell(
//                         onTap: (){
//                           Get.to(MainScreen());
//                         },
//                         child: Container(
//                           // margin: EdgeInsets.all(15),
//                             padding: EdgeInsets.only(left: 5, right: 5, top: 5,bottom: 5),
//                             // color: Colors.red,
//                             height: 55, width: 75,
//                             child: Image.asset(Images.logo, height: 55, width: 70, fit: BoxFit.fill,)),
//                       ),
//                     )
//                   ],
//                 ),
//                 pinned: true,
//                 snap: false,
//                 floating: false,
//                 expandedHeight: kExpandedHeight,
//                 // show and hide FlexibleSpaceBar title
//                 flexibleSpace: _isSliverAppBarExpanded
//                     ? null
//                     : FlexibleSpaceBar(
//
//                   centerTitle: true,
//                   title: Padding(
//                     padding: const EdgeInsets.only(left: 0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             Expanded(
//                               flex: 5,
//                               child: Container(
//                                 height: Get.height/18,
//                                 // color: Colors.yellow,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8),
//                                       child: Text("Good ${greeting()}!", style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                                     ),
//
//                                     Container(
//                                       height: Get.height/25,
//                                       width: Get.width/3.8,
//                                       // color: Colors.red,
//                                       child:    Container(
//                                         // color: Colors.tealAccent,
//                                         height: 55,
//                                         child: Center(
//                                             child: controller.genderList!.length==0?
//                                             // MyShimmer(hight: 40)
//                                             SizedBox()
//                                                 :
//                                             ListView.builder(
//
//                                                 itemCount:controller.genderList!.length,
//                                                 physics: AlwaysScrollableScrollPhysics(),
//                                                 scrollDirection: Axis.horizontal,
//                                                 shrinkWrap: true,
//                                                 itemBuilder: (context,index){
//                                                   return Padding(
//                                                     padding: const EdgeInsets.all(0),
//                                                     child:  InkWell(
//                                                         onTap:(){
//
//                                                           controller.getTopSliderData(controller.genderList![index].id.toString());
//                                                           controller.getHomePageAllData(controller.genderList![index].id.toString());
//
//                                                           selectedIndex=index;
//                                                           setState((){
//                                                           });
//                                                         },
//                                                         child: Column(
//                                                           mainAxisAlignment: MainAxisAlignment.center,
//                                                           children: [
//
//                                                             Padding(
//                                                               padding: const EdgeInsets.symmetric(horizontal: 4.5),
//                                                               child: Text("${controller.genderList?[index]?.title??""}",style: selectedIndex==index? railway.copyWith(
//                                                                   height: 1.5, color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold) : railway.copyWith(
//                                                                   height: 1.5, color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),),
//                                                             ),
//                                                             SizedBox(height: 4),
//                                                             selectedIndex==index?
//                                                             Container(
//                                                               color: gold,
//                                                               height: 1.5,width: 30,
//
//                                                             ):Container()
//                                                           ],
//                                                         )),
//                                                   );
//                                                 })),
//                                       ),
//                                     ),
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 4, top: 5),
//                                 child: Container(
//                                     height: 28,
//                                     // color: Colors.blue,
//                                     alignment: Alignment.topRight,
//                                     child: InkWell(
//                                       onTap: () {
//                                         Get.to(WishListPage(pageIndex : 0));
//                                       },
//                                       child: CircleAvatar(
//                                           radius: 16,
//                                           backgroundColor: Colors.grey.shade100,
//                                           child: Image.asset(Images.wish, height: 15, width: 15, color: gold,)),
//                                     )),
//                               ),
//                             ),
//
//                           ],
//                         ),
//
//                         // SizedBox(height: 5),
//                         // Text("Good ${greeting()}!", style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                         SizedBox(height: 8),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: Container(
//                             // color: Colors.deepPurpleAccent,
//                             height: 28,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//
//                                 Expanded(
//                                   flex: 5,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(top: 0),
//                                     child: SizedBox(
//                                         height: 28,
//                                         child: SearchTextField()),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 1,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 6,right: 8),
//                                     child: Container(
//                                       height: 28,
//                                       width: 28,
//                                       color: Colors.grey.shade200,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(6),
//                                         child: Image.asset(Images.notification,),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//              /*  SliverToBoxAdapter(
//                 child: Container(
//                   color: Colors.purple,
//                   height: 120,
//                   child: Center(
//                     child: Text('Scroll to see the SliverAppBar in effect.'),
//                   ),
//                 ),
//               ),*/
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   childCount: 1,
//                       (BuildContext context, int index) {
//                     return
//                       controller.homePageAllDataResponse!= null&&controller.homePageAllDataResponse!.data!=null && controller.homePageAllDataResponse!.data!.length>0 ?
//                     SingleChildScrollView(
//                       child:   Column(
//                         // mainAxisSize: MainAxisSize.min,
//                         children: [
//
//                           /// Top BANNER
//                           Padding(
//                             padding: const EdgeInsets.only(top: 0, left: 6, right: 6, bottom: 0),
//                             child: Container(
//                               // color: Colors.teal,
//                               height: Get.height /15,
//                               child: CarouselSlider.builder(
//                                 itemCount: controller.featureSliderResponse!.data!.length,
//                                 itemBuilder: (BuildContext context, int index, _){
//                                   return   Card(
//                                     color:  Color(0xff424242),
//                                     child: Row(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           flex: 4,
//                                           child: Container(
//                                             height: 30,
//                                             width: 30,
//                                             child: Column(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               children: [
//                                                 controller.featureSliderResponse!=null?
//                                                 CustomImageCached(image: '${AppConstants.BASE_URL}${controller.featureSliderResponse!.data![index].icon?? ""}',
//                                                   fit: BoxFit.fitHeight,
//                                                   isRound: false,
//                                                   // fit: BoxFit.fill,
//                                                   height: 25,
//                                                   width: 25,
//                                                 )
//                                                     :
//                                                SizedBox(),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 30,
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 '${controller.featureSliderResponse!.data![index].title??""}',
//                                                 style: railway.copyWith(color: Color(0xffCCCCCC), fontSize: 12),
//                                                 textAlign: TextAlign.left,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                                 options: CarouselOptions(
//                                   height: Get.height /2,
//                                   // enlargeCenterPage: true,
//                                   autoPlay: true,
//                                   reverse: false,
//                                   aspectRatio: 10 / 9,
//                                   autoPlayCurve: Curves.fastOutSlowIn,
//                                   enableInfiniteScroll: true,
//                                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                                   autoPlayInterval: Duration(seconds: 2),
//                                   viewportFraction: 1,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           SizedBox(height: 8),
//
//                           controller.homeScrollBarResponse!=null?  controller.homeScrollBarResponse!.data!.length>0 ?
//                           Padding(
//                             padding: const EdgeInsets.only(left: 12, right: 12, ),
//                             child: Container(
//                               height: 60,
//                               child: ListView.builder(
//
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: controller.homeScrollBarResponse!.data!.length,
//                                   itemBuilder: (context, index) {
//                                     return SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Row(
//                                         children: [
//                                           Transform.translate(
//                                             offset: Offset(position * MediaQuery.of(context).size.width, 0),
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(10),
//                                               child: CustomImageCached(
//                                                 isRound: false,
//                                                 image: '${AppConstants.BASE_URL}${controller.homeScrollBarResponse!.data![index].logo ?? ""}',
//                                                 // fit: BoxFit.fitHeight,
//                                                 height: 60, width: 80,
//                                                 fit: BoxFit.contain,
//                                                 // height: Get.height/5.5,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   }
//                               ),
//                             ),
//                           )
//                               :
//                           SizedBox(child: Text("no-data"),):SizedBox(),
//
//                           SizedBox(height: 0),
//
//                           ///Top CARUSAL
//                           controller.homeSliderResponse!= null?  controller.homeSliderResponse!.data!.length!>0?
//                           Padding(
//                             padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
//                             child: Container(
//                               // color: Colors.teal,
//                               height: Get.height /1.8,
//                               child: CarouselSlider.builder(
//                                 itemCount: controller.homeSliderResponse?.data?.length,
//                                 itemBuilder: (BuildContext context, int index, _){
//                                   return  InkWell(
//                                     onTap: () {
//                                     //  Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                     },
//                                     child: Container(
//                                       // decoration: BoxDecoration(
//                                       //   borderRadius: BorderRadius.circular(0),
//                                       // ),
//                                       child: CustomImageCached(
//                                         isRound: false,
//                                         image: '${AppConstants.BASE_URL}${controller.homeSliderResponse?.data?[index]?.banner ?? ""}',
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 options: CarouselOptions(
//                                   autoPlay: true,  // Enable auto-sliding
//                                   autoPlayInterval: Duration(seconds: 2),  // Set the auto-sliding interval
//                                   enableInfiniteScroll: true,
//                                   height: Get.height /2,
//                                   // enlargeCenterPage: true,
//                                   reverse: false,
//                                   aspectRatio: 10 / 9,
//                                   autoPlayCurve: Curves.fastOutSlowIn,
//
//                                   // autoPlayAnimationDuration: Duration(milliseconds: 800),
//                                   viewportFraction: 1,
//                                 ),
//                               ),
//                             ),
//                           ) : SizedBox() : Text("no-data"),
//
//                           ///  BANNER IMAGE
//                           Padding(
//                             padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
//                             child: InkWell(
//                               onTap: (){
//                                // Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                               },
//                               child: CustomImageCached(
//                                 // image: '${Images.carusalimage}}',
//                                 image: '${AppConstants.BASE_URL}${controller.topHomeBannerResponse?.data?[0]?.banner ?? ""}',
//                                 height: Get.height/5,
//                                 isRound: false,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                           // SizedBox(height: 8),
//
//
//
//
//
//                           /// all section start
//                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data!= null ?
//
//                           ListView.builder(
//                               padding: EdgeInsets.zero,
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: controller.homePageAllDataResponse?.data?.length,
//                               // itemCount: 1,
//                               itemBuilder: (context, index) {
//                                 // Questions questions = controller.questions![index];
//                                 return Padding(
//                                   padding: const EdgeInsets.only(left: 0,top: 0, right: 0,),
//                                   child: Column(
//                                     // mainAxisAlignment: MainAxisAlignment.start,
//                                     // crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
// SizedBox(height: 15),
//                                       /// isle pick
//                                       controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.ILEPICKS?
//                                       Column(
//                                         children: [
//                                           InkWell(
//                                             onTap: (){
//                                               // Get.to(  CustomCategoryViewPage(
//                                               //   categoryId: "",
//                                               //
//                                               //
//                                               //   page: AppConstants.SECTION,
//                                               //   subCategoryId: "",
//                                               //   childCategoryId: '',
//                                               //   sectionId: controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails![widget.selectedCatIndex]!.sectionId!.toString(),
//                                               //
//                                               // ));
//                                             },
//                                             child: Container(
//                                               color: Color(0xffFAFBFB),
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                                                 child: Column(
//                                                   children: [
//                                                     SizedBox(height: 8),
//                                                     CustomImageCached(
//                                                       // image: '${Images.carusalimage}}',
//                                                       image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index]?.banner ?? ""}',
//                                                       height: Get.height/3.5,
//                                                       isRound: false,
//                                                       fit: BoxFit.fill,
//                                                     ),
//                                                     SizedBox(height: 15),
//                                                     Text("${controller.homePageAllDataResponse?.data?[index]?.title??""}".toUpperCase(), style:  railway.copyWith(fontSize: 18, color: Color(0xff000000) ),),
//                                                     SizedBox(height: 12),
//                                                     Text("${controller.homePageAllDataResponse?.data?[index]?.shortDescription??""}",
//                                                       textAlign: TextAlign.center,
//                                                       style: railway.copyWith(fontSize: 14, color: Color(0xff000000)),),
//                                                     SizedBox(height: 15),
//
//                                                     controller.homePageAllDataResponse?.data?[index]?.buttonTxt != null?
//                                                     ElevatedButton(
//                                                       // style: raisedButtonStyle,
//                                                       // style: ElevatedButton.styleFrom(primary: HexColor("${controller.mainPageDataResponse?.data?[index]?.activeBgBtnColor??""}")),
//                                                       style: ElevatedButton.styleFrom(primary:  HexColor("${controller.genderPageResponse?.data?[index]?.activeColor??""}"),),
//                                                       onPressed: () {
//                                                       },
//                                                       child: Padding(
//                                                         padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                                                         child: Text('${controller.homePageAllDataResponse?.data?[index]?.buttonTxt??"Shop Now"}'.toUpperCase(), style: railway.copyWith(fontSize: 12.5),),
//                                                       ),
//                                                     ) : SizedBox(child: Text("SHOP NOW", style: railway.copyWith(fontSize: 12.5),),)
//
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//
//                                           ///  Categories part
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           SizedBox(
//                                             height: 32,
//                                             child: Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                                                   child: Text("${controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,) ),
//                                                 ),
//                                               ],
//                                             ),) : SizedBox(),
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           SizedBox(
//                                             height: Get.height/5,
//                                             // width: Get.width,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(left: 8, right: 8),
//                                               child: ListView.builder(
//                                                 padding: EdgeInsets.zero,
//                                                 // physics: NeverScrollableScrollPhysics(),
//                                                 physics: ClampingScrollPhysics(),
//                                                 shrinkWrap: true,
//                                                 scrollDirection: Axis.horizontal,
//                                                 itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                                 itemBuilder:  (BuildContext context, int index2) {
//                                                   return Padding(
//                                                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         print(controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails![index2]!.sectionId!.toString());
//                                                         Get.to(  CustomCategoryViewPage(
//                                                           categoryId: "",
//                                                           page: AppConstants.SECTION,
//                                                           subCategoryId: "",
//                                                           childCategoryId: '',
//                                                           sectionId: controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails![index2]!.sectionId!.toString(),
//
//                                                         ));    },
//                                                       child: Stack(
//                                                           alignment: Alignment.center,
//                                                           children: [
//                                                             Container(
//                                                               color:  Color(0xff424242),
//                                                               width: Get.width/3.2,
//                                                               child: CustomImageCached(
//                                                                 // image: '${Images.carusalimage}}',
//                                                                 image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                                 height: Get.height/2,
//                                                                 isRound: false,
//                                                                 fit: BoxFit.fill,
//
//                                                               ),
//                                                             ),
//
//                                                             Positioned(
//                                                                 bottom: 8,
//                                                                 child: Align(
//                                                                   alignment: Alignment.bottomCenter,
//                                                                   child: Text("${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title??""}",
//                                                                     style: railwaybold.copyWith(
//                                                                       // color: Color(0xffDBDCE2),
//                                                                         color: Colors.white,
//                                                                         fontSize: 12),),
//                                                                 )
//                                                             )
//                                                           ]
//                                                       ),
//                                                     ),
//                                                   );
//                                                 },
//
//                                               ),
//                                             ),
//                                           )
//                                               : SizedBox(),
//
//                                           SizedBox(height: 20),
//                                         ],
//                                       ) : SizedBox(),
//
//
//                                       /// discover brand
//                                       controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.DISCOVERBRAND?
//                                       Column(
//                                         children: [
//
//                                           SizedBox(height: 0),
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           SizedBox(
//                                             height: 32,
//                                             child: Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                                                   child: Text("${controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,)),
//                                                 ),
//                                               ],
//                                             ),) : SizedBox(),
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           SizedBox(
//                                             height: Get.height/5,
//                                             // width: Get.width,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(left: 8, right: 8),
//                                               child: ListView.builder(
//                                                 padding: EdgeInsets.zero,
//                                                 // physics: NeverScrollableScrollPhysics(),
//                                                 physics: ClampingScrollPhysics(),
//                                                 shrinkWrap: true,
//                                                 scrollDirection: Axis.horizontal,
//                                                 // itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2],
//                                                 itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                                 itemBuilder:  (BuildContext context, int index2) {
//                                                   return Padding(
//                                                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         Get.to(  CustomCategoryViewPage(
//                                                           page: AppConstants.BRAND,
//                                                           brandId: controller.brandSectionProductResponse!.data!.result![index2]!.brandId!.toString(),
//                                                         ));
//                                                       },
//                                                       child: Stack(
//                                                           alignment: Alignment.center,
//                                                           children: [
//                                                             Container(
//                                                               color:  Color(0xff424242),
//                                                               width: Get.width/3.2,
//                                                               child: CustomImageCached(
//                                                                 // image: '${Images.carusalimage}}',
//                                                                 image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                                 height: Get.height/2,
//                                                                 isRound: false,
//                                                                 fit: BoxFit.fill,
//                                                               ),
//                                                             ),
//
//                                                             Positioned(
//                                                                 bottom: 0,
//                                                                 child: Container(
//                                                                   color: Color(0xffF2F2F2).withOpacity(0.5),
//                                                                   child: Padding(
//                                                                     padding: EdgeInsets.only(left: Get.width, right: Get.width, top: 5, bottom: 6),
//                                                                     child: Text("${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title??""}".toUpperCase(),
//                                                                       style: railwaybold.copyWith(
//                                                                         // color: Color(0xffDBDCE2),
//                                                                           color: Colors.black,
//                                                                           fontWeight: FontWeight.bold,
//                                                                           // color: Colors.grey,
//                                                                           fontSize: 11),),
//                                                                   ),
//                                                                 )
//
//                                                             )
//                                                           ]
//                                                       ),
//                                                     ),
//                                                   );
//                                                 },
//
//                                               ),
//                                             ),
//                                           )
//                                               : SizedBox(),
//
//                                           SizedBox(height: 5),
//                                         ],
//                                       ) : SizedBox(),
//
//                                       /// discover trend
//                                       controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.DISCOVERTREND?
//                                       ListView.builder(
//                                           itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                           shrinkWrap: true,
//                                           physics: NeverScrollableScrollPhysics(),
//
//                                           itemBuilder: ( BuildContext context, int index2 ) {
//                                             return  Column(
//                                               children: [
//                                                 controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(left: 12, right: 12),
//                                                   child: Row(
//                                                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     // crossAxisAlignment: CrossAxisAlignment.end,
//                                                     children: [
//
//                                                       Expanded(
//                                                           child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                                                       SizedBox(width: 15),
//                                                       Expanded(
//                                                           child: Center(child: Text("${controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: 20 ),))),
//                                                       SizedBox(width: 8),
//                                                       Expanded(
//                                                           child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                                                     ],
//
//                                                   ),
//                                                 ) : SizedBox(),
//
//                                                 InkWell(
//                                                   onTap: () {
//                                                    // print(controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails![index2]!.sectionId!.toString());
//                                                     Get.to(  CustomCategoryViewPage(
//                                                       page: AppConstants.SECTION,
//                                                       sectionId: controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails![index2]!.sectionId!.toString(),
//
//                                                     ));    },
//                                                   child: Container(
//                                                     color: Color(0xffFAFBFB),
//                                                     child: Padding(
//                                                       padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
//                                                       child: Column(
//                                                         children: [
//                                                           SizedBox(height: 8),
//                                                           CustomImageCached(
//                                                             // image: '${Images.carusalimage}}',
//                                                             image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                             height: Get.height/3.5,
//                                                             isRound: false,
//                                                             fit: BoxFit.fill,
//                                                           ),
//                                                           SizedBox(height: 15),
//                                                           Text("${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title ??""}".toUpperCase(), style:  railway.copyWith(fontSize: 18, color: Color(0xff000000) ),),
//                                                           SizedBox(height: 12),
//                                                           Text("${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.shortDescription??""}",
//                                                             textAlign: TextAlign.center,
//                                                             style: railway.copyWith(fontSize: 14, color: Color(0xff000000)),),
//                                                           SizedBox(height: 15),
//
//                                                           ElevatedButton(
//                                                             // style: raisedButtonStyle,
//                                                             style: ElevatedButton.styleFrom(primary: mencolor),
//                                                             onPressed: () {
//                                                             },
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                                                               child:
//                                                               controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.buttonTxt != null?
//                                                               Text('${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.buttonTxt??"SHOP NOW"}'.toUpperCase(), style: railway.copyWith(fontSize: 12.5),)
//                                                               : SizedBox(child: Text("SHOP NOW", style: railway.copyWith(fontSize: 12.5), ),),
//                                                             ),
//                                                           )
//
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(height: 20),
//                                               ],
//                                             );
//                                           }
//                                       )
//                                           : SizedBox(),
//
//                                       /// shop By category slider part
//                                       controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.SHOPBYCATEGORY?
//                                       Column(
//                                         children: [
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           SizedBox(
//                                             height: 32,
//                                             child: Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                                                   child: Text("${controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,) ),
//                                                 ),
//                                               ],
//                                             ),) : SizedBox(),
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           SizedBox(
//                                             height: Get.height/5,
//                                             // width: Get.width,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(left: 8, right: 8),
//                                               child: ListView.builder(
//                                                 padding: EdgeInsets.zero,
//                                                 // physics: NeverScrollableScrollPhysics(),
//                                                 physics: ClampingScrollPhysics(),
//                                                 shrinkWrap: true,
//                                                 scrollDirection: Axis.horizontal,
//                                                 itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                                 itemBuilder:  (BuildContext context, int index2) {
//                                                   return Padding(
//                                                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         Get.to(  CustomCategoryViewPage(
//                                                           categoryId: "",
//                                                           page: AppConstants.CHILDCATEGORY,
//                                                           subCategoryId: "",
//                                                           childCategoryId: controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails![index2]!.childCategoryId!.toString(),
//                                                           sectionId: "",
//
//                                                         ));
//                                                         },
//                                                       child: Stack(
//                                                           alignment: Alignment.center,
//                                                           children: [
//                                                             Container(
//                                                               color:  Color(0xff424242),
//                                                               width: Get.width/3.2,
//                                                               child: CustomImageCached(
//                                                                 // image: '${Images.carusalimage}}',
//                                                                 image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                                 height: Get.height/2,
//                                                                 isRound: false,
//                                                                 fit: BoxFit.fill,
//
//                                                               ),
//                                                             ),
//
//                                                             Positioned(
//                                                                 bottom: 8,
//                                                                 child: Align(
//                                                                   alignment: Alignment.bottomCenter,
//                                                                   child: Text("${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title??""}",
//                                                                     style: railwaybold.copyWith(
//                                                                       // color: Color(0xffDBDCE2),
//                                                                         color: Colors.white,
//                                                                         fontSize: 12),),
//                                                                 )
//
//                                                             )
//
//
//                                                           ]
//                                                       ),
//                                                     ),
//                                                   );
//                                                 },
//
//                                               ),
//                                             ),
//                                           )
//                                               : SizedBox(),
//                                         ],
//                                       ) : SizedBox(),
//                                       // SizedBox(height: 8),
//
//                                       /// luxury
//                                       controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.LUXURY?
//                                       Column(
//                                         children: [
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           Padding(
//                                             padding: const EdgeInsets.only(left: 12, right: 12, ),
//                                             child: Row(
//                                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               // crossAxisAlignment: CrossAxisAlignment.end,
//                                               children: [
//                                                 Expanded(
//                                                     child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                                                 SizedBox(width: 15),
//                                                 Expanded(
//                                                     child: Center(child: Text("${controller.homePageAllDataResponse?.data?[index]?.title??""}".toUpperCase(), style: railway.copyWith(fontSize: 20 ),))),
//                                                 SizedBox(width: 8),
//                                                 Expanded(
//                                                     child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                                               ],
//                                             ),
//                                           ) : SizedBox(),
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           Padding(
//                                             padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
//                                             child: Container(
//                                               // color: Colors.red,
//                                               height: Get.height/2.6,
//                                               // width: Get.width,
//                                               child: Padding(
//                                                   padding: const EdgeInsets.only(left: 0, right: 0),
//                                                   child:
//                                                   GridView.builder(
//                                                     itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                                     scrollDirection: Axis.horizontal,
//                                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                                         crossAxisCount: 1,
//                                                         crossAxisSpacing: 0,
//                                                         mainAxisSpacing: 10,
//                                                         // childAspectRatio: 1,
//                                                         mainAxisExtent: Get.width
//                                                     ),
//                                                     itemBuilder: (BuildContext context, int index2){
//                                                       return InkWell(
//                                                         onTap: () {
//                                                           Get.to(  CustomCategoryViewPage(
//                                                             page: AppConstants.BRAND,
//                                                             brandId: controller.brandSectionProductResponse!.data!.result![index2]!.brandId!.toString(),
//                                                           ));
//                                                         },
//                                                         child: Stack(
//                                                             alignment: Alignment.center,
//                                                             children: [
//                                                               Container(
//                                                                 color:  Color(0xff424242),
//                                                                 // width: Get.width/3.2,
//                                                                 child: CustomImageCached(
//                                                                   // image: '${Images.carusalimage}}',
//                                                                   // image: '${catagoryimage[index]}',
//                                                                   image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                                   height: Get.height/2,
//                                                                   width: Get.width,
//                                                                   isRound: false,
//                                                                   fit: BoxFit.fill,
//
//                                                                 ),
//                                                               ),
//
//                                                               Positioned(
//                                                                   bottom: 30,
//                                                                   child: Align(
//                                                                     alignment: Alignment.bottomCenter,
//                                                                     child: Text("${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title ?? ""}",
//                                                                       // child: Text("${categoryName[index]}",
//                                                                       style: railway.copyWith(
//                                                                         // color: Color(0xffDBDCE2),
//                                                                           color: Colors.white,
//                                                                           fontSize: 20),),
//                                                                   )
//
//                                                               )
//
//
//                                                             ]
//                                                         ),
//                                                       );
//                                                     },
//                                                   )
//                                               ),
//                                             ),
//                                           )
//                                               : SizedBox(),
//                                         ],
//                                       ) : SizedBox(),
//                                       // SizedBox(height: 8),
//
//                                       /// featured
//                                       controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.FEATURED?
//                                       ListView.builder(
//                                           itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                           shrinkWrap: true,
//                                           physics: NeverScrollableScrollPhysics(),
//
//                                           itemBuilder: ( BuildContext context, int index2 ) {
//                                             return  Column(
//                                               children: [
//                                                 controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                                 InkWell(
//                                                   onTap: () {
//                                                     Get.to(  CustomCategoryViewPage(
//                                                       categoryId: "",
//                                                       page: AppConstants.CHILDCATEGORY,
//                                                       subCategoryId: "",
//                                                       childCategoryId: controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails![index2]!.childCategoryId!.toString(),
//                                                       sectionId: "",
//
//                                                     ));
//                                                   },
//                                                   child: Container(
//                                                     color: Color(0xffFAFBFB),
//                                                     child: Padding(
//                                                       padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
//                                                       child:   CustomImageCached(
//                                                         // image: '${Images.carusalimage}}',
//                                                         image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                         height: Get.height/3.5,
//                                                         isRound: false,
//                                                         fit: BoxFit.fill,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                                     : SizedBox(),
//                                                 SizedBox(height: 5),
//                                               ],
//                                             );
//                                           }
//                                       )
//                                           : SizedBox(),
//
//                                       /// affordable
//                                       controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.AFFORDABLEITEM?
//                                       Column(
//                                         children: [
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           SizedBox(
//                                             height: 32,
//                                             child: Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                                                   child: Text("${controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,) ),
//                                                 ),
//                                               ],
//                                             ),) : SizedBox(),
//                                           controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                           Container(
//                                             // color: Colors.red,
//                                             height: Get.height/4.2,
//                                             // width: Get.width,
//                                             child: Padding(
//                                                 padding: const EdgeInsets.only(left: 7, right: 0),
//                                                 child:
//                                                 GridView.builder(
//                                                   itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                                   scrollDirection: Axis.horizontal,
//                                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                                       crossAxisCount: 1,
//                                                       crossAxisSpacing: 0,
//                                                       mainAxisSpacing: 10,
//                                                       childAspectRatio: 1
//                                                   ),
//                                                   itemBuilder: (BuildContext context, int index2 ){
//                                                     return InkWell(
//                                                       onTap: () {
//                                                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                                       },
//                                                       child: Stack(
//                                                           alignment: Alignment.center,
//                                                           children: [
//                                                             Container(
//                                                               color:  Color(0xff424242),
//                                                               // width: Get.width/3.2,
//                                                               child: CustomImageCached(
//                                                                 image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                                 // image: '${catagoryimage[index]}',
//                                                                 height: Get.height/4.2,
//                                                                 isRound: false,
//                                                                 fit: BoxFit.fill,
//
//                                                               ),
//                                                             ),
//                                                             Positioned(
//                                                                 bottom: 15,
//                                                                 child: Align(
//                                                                   alignment: Alignment.bottomCenter,
//                                                                   child: Text("${controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title??""}",
//                                                                     // child: Text("${brandName[index]}",
//                                                                     style: railway.copyWith(
//                                                                       // color: Color(0xffDBDCE2),
//                                                                         color: Colors.white,
//                                                                         fontSize: 18),),
//                                                                 )
//                                                             )
//
//
//                                                           ]
//                                                       ),
//                                                     );
//                                                   },
//                                                 )
//                                             ),
//                                           )
//                                               : SizedBox(),
//                                         ],
//                                       ) : SizedBox(),
//                                       // SizedBox(height: 8),
//
//
//                                     ],
//                                   ),
//                                 );
//                               })
//                               : Container(),
//                           SizedBox(height: 20),
//
//
//
//
//
//                           /// new in
//                           Padding(
//                             padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(left: 4),
//                                         child: Text("New In-Handpicked From The Best Brands", style: railway.copyWith(fontSize: 20 ),),
//                                       ),
//                                     ),
//                                     Expanded(
//                                         flex: 1,
//                                         child: InkWell(
//                                           onTap: (){
//                                             Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                           },
//                                           child: Text("Shop All".toUpperCase(),
//                                             textAlign: TextAlign.end,
//                                             style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),),
//                                         )),
//                                   ],
//
//                                 ),
//                                 SizedBox(height: 15),
//                                 Container(
//                                   // color: Colors.red,
//                                   height: Get.height/2.35,
//                                   // width: Get.width,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 0, right: 0),
//                                     child: ListView.builder(
//                                       padding: EdgeInsets.zero,
//                                       physics: ClampingScrollPhysics(),
//                                       shrinkWrap: true,
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: 9,
//                                       itemBuilder:  (BuildContext context, int index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 6),
//                                           child: InkWell(
//                                             onTap: () {
//                                               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                             },
//                                             child: Stack(
//                                                 alignment: Alignment.topRight,
//                                                 children: [
//                                                   InkWell(
//                                                     highlightColor: Colors.grey.shade100,
//                                                     splashColor: Colors.grey.shade100,
//                                                     // focusColor: Colors.green,
//                                                     // hoverColor: Colors.blue,
//                                                     onTap: (){
//                                                       Get.to(Add2CartScreen(
//
//                                                         cartdetailsimage: '',
//                                                         productId: '',
//                                                       ));
//                                                       // showCustomSnackBar("Click Shop Cart");
//                                                     },
//                                                     child: Container(
//                                                       // color:  Colors.grey.shade200,
//                                                       // color: Color(0xffFAFAFC),
//                                                       width: Get.width/2.2,
//                                                       child: Column(
//
//                                                           children: [
//
//                                                             Container(
//                                                               // color:  Color(0xff424242),
//                                                               // color:  Colors.blue,
//                                                               width: Get.width/2.2,
//                                                               child: Stack(
//                                                                   alignment: Alignment.topCenter,
//                                                                   children: [
//                                                                     CustomImageCached(
//                                                                       // image: '${Images.carusalimage}}',
//                                                                       image: '${catagorysliderimage[index]}',
//                                                                       height: Get.height/3.2,
//                                                                       isRound: false,
//                                                                       fit: BoxFit.fill,
//
//                                                                     ),
//                                                                     Positioned(
//                                                                         bottom: 0,
//                                                                         child: Align(
//                                                                           alignment: Alignment.bottomCenter,
//                                                                           child: Container(
//                                                                             /// orginal color
//                                                                             // color: Color(0xffF2F2F2),
//                                                                             color: Colors.grey.shade300,
//                                                                             child: Padding(
//                                                                               padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
//                                                                               child: Text("New Season".toUpperCase(),
//                                                                                 style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                                                                             ),
//                                                                           ),
//                                                                         )
//
//                                                                     )
//                                                                   ]
//                                                               ),
//                                                             ),
//                                                             SizedBox(height: 12),
//
//
//                                                             Text("${categorysliderName[index]}",
//                                                               style: railway.copyWith(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 11
//                                                               ),),
//                                                             SizedBox(height: 7),
//
//                                                             Padding(
//                                                               padding: const EdgeInsets.symmetric(horizontal: 4),
//                                                               child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 maxLines: 1,
//                                                                 style: caluna.copyWith(
//                                                                   // fontWeight: FontWeight.w100,
//                                                                     fontSize: 11),),
//                                                             ),
//                                                             SizedBox(height: 7),
//
//                                                             Text("100 BDT",
//                                                               style: railway.copyWith( color: gold, fontSize: 12),),
//
//                                                           ]
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Positioned(
//                                                     top: 10,
//                                                     right: 10,
//                                                     child: InkWell(
//                                                       onTap: (){
//                                                         Get.to(WishListPage(pageIndex: 0,));
//                                                       },
//
//                                                       child: Container(
//                                                         // color: Colors.black,
//                                                         height: 30,
//                                                         width: 30,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.all(5),
//                                                           child: Image.asset(Images.wish, color: silvercolor, height: 20, width: 20,),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Positioned(
//                                                     top: 10,
//                                                     left: 10,
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         Get.to(
//                                                           showModalBottomSheet(
//                                                             context: context,
//                                                             builder: (BuildContext context) {
//                                                               return SimilarPopup();
//                                                             },
//                                                           ),
//                                                         );
//                                                       },
//
//                                                       child: Container(
//                                                         // color: Colors.black,
//                                                         height: 30,
//                                                         width: 30,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.all(5),
//                                                           child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ]
//                                             ),
//                                           ),
//                                         );
//                                       },
//
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 12),
//
//
//                           ///  discover LIFESTYLE
//                           /*   Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Expanded(
//                 flex: 5,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Text("Discover Lifestyle", style: railway.copyWith(fontSize: 20 ),),
//                 ),
//               ),
//               Expanded(
//                   flex: 1,
//                   child: Text("".toUpperCase(),
//                     textAlign: TextAlign.end,
//                     style: railway.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),)),
//             ],
//           ),*/
//
//
//                           /// most POPULAR SHOP slider part
//                           Padding(
//                             padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 4),
//                                       child: Text("Most Popular", style: railway.copyWith(fontSize: 20),),
//                                     ),
//                                     InkWell(
//                                         onTap: (){
//                                           Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                         },
//                                         child: Text("Shop All".toUpperCase(), style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),)),
//                                   ],
//
//                                 ),
//                                 SizedBox(height: 15),
//                                 Container(
//                                   // color: Colors.red,
//                                   height: Get.height/2.35,
//                                   // width: Get.width,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 0, right: 0),
//                                     child: ListView.builder(
//                                       padding: EdgeInsets.zero,
//                                       physics: ClampingScrollPhysics(),
//                                       shrinkWrap: true,
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: 9,
//                                       itemBuilder:  (BuildContext context, int index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 6),
//                                           child: InkWell(
//                                             onTap: () {
//                                               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                             },
//                                             child: Stack(
//                                                 alignment: Alignment.topRight,
//                                                 children: [
//                                                   InkWell(
//                                                     highlightColor: Colors.grey.shade100,
//                                                     splashColor: Colors.grey.shade100,
//                                                     // focusColor: Colors.green,
//                                                     // hoverColor: Colors.blue,
//                                                     onTap: (){
//                                                       Get.to(Add2CartScreen(
//                                                         cartdetailsimage: '',
//                                                         productId: '',
//                                                       ));
//                                                       // showCustomSnackBar("Click Shop Cart");
//                                                     },
//                                                     child: Container(
//                                                       // color:  Colors.grey.shade200,
//                                                       // color: Color(0xffFAFAFC),
//                                                       width: Get.width/2.2,
//                                                       child: Column(
//
//                                                           children: [
//
//                                                             Container(
//                                                               // color:  Color(0xff424242),
//                                                               // color:  Colors.blue,
//                                                               width: Get.width/2.2,
//                                                               child: Stack(
//                                                                   alignment: Alignment.topCenter,
//                                                                   children: [
//                                                                     CustomImageCached(
//                                                                       // image: '${Images.carusalimage}}',
//                                                                       image: '${catagorysliderimage[index]}',
//                                                                       height: Get.height/3.2,
//                                                                       isRound: false,
//                                                                       fit: BoxFit.fill,
//
//                                                                     ),
//                                                                     Positioned(
//                                                                         bottom: 0,
//                                                                         child: Align(
//                                                                           alignment: Alignment.bottomCenter,
//                                                                           child: Container(
//                                                                             /// orginal color
//                                                                             // color: Color(0xffF2F2F2),
//                                                                             color: Colors.grey.shade300,
//                                                                             child: Padding(
//                                                                               padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
//                                                                               child: Text("New Season".toUpperCase(),
//                                                                                 style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                                                                             ),
//                                                                           ),
//                                                                         )
//
//                                                                     )
//                                                                   ]
//                                                               ),
//                                                             ),
//                                                             SizedBox(height: 12),
//
//
//                                                             Text("${categorysliderName[index]}",
//                                                               style: railway.copyWith(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 11
//                                                               ),),
//                                                             SizedBox(height: 7),
//
//                                                             Padding(
//                                                               padding: const EdgeInsets.symmetric(horizontal: 4),
//                                                               child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 maxLines: 1,
//                                                                 style: caluna.copyWith(
//                                                                   // fontWeight: FontWeight.w100,
//                                                                     fontSize: 11),),
//                                                             ),
//                                                             SizedBox(height: 7),
//
//                                                             Text("100 BDT",
//                                                               style: caluna.copyWith( color: gold, fontSize: 12),),
//
//                                                           ]
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Positioned(
//                                                     top: 10,
//                                                     right: 10,
//                                                     child: InkWell(
//                                                       onTap: (){
//                                                         Get.to(WishListPage(pageIndex: 0,));
//                                                       },
//
//                                                       child: Container(
//                                                         // color: Colors.black,
//                                                         height: 30,
//                                                         width: 30,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.all(5),
//                                                           child: Image.asset(Images.wish, color: silvercolor, height: 20, width: 20,),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Positioned(
//                                                     top: 10,
//                                                     left: 10,
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         Get.to(
//                                                           showModalBottomSheet(
//                                                             context: context,
//                                                             builder: (BuildContext context) {
//                                                               return SimilarPopup();
//                                                             },
//                                                           ),
//                                                         );
//                                                       },
//
//                                                       child: Container(
//                                                         // color: Colors.black,
//                                                         height: 30,
//                                                         width: 30,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.all(5),
//                                                           child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ]
//                                             ),
//                                           ),
//                                         );
//                                       },
//
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 12),
//
//                           ///  Bottom Banner1 part
//                           InkWell(
//                             onTap: () {
//                               Get.to(WomenPage(selectedCatIndex: 0,));
//                             },
//                             child: Container(
//                               color: Color(0xffFAFBFB),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                                 child: Column(
//                                   children: [
//                                     CustomImageCached(
//                                       // image: '${Images.carusalimage}}',
//                                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2Fshop-women.jpg&w=1200&q=75',
//                                       height: Get.height/9,
//                                       isRound: false,
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           // SizedBox(height: 20),
//
//                           ///  BOTTOM BANNER2 image part
//                           InkWell(
//                             onTap: () {
//                               Get.to( KidPage( pageId: '', selectedCatIndex: 0,));
//                             },
//                             child: Container(
//                               color: Color(0xffFAFBFB),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                                 child: Column(
//                                   children: [
//                                     CustomImageCached(
//                                       // image: '${Images.carusalimage}}',
//                                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2Fshop-man.jpg&w=1200&q=75',
//                                       height: Get.height/9,
//                                       isRound: false,
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 20),
//
//                           // SizedBox(height: 500)
//
//                         ],
//                       ),
//                     )
//                         : Text("");
//                   },
//                 ),
//               ),
//             ],
//           ),
//
//         );
//       }
//     );
//   }
//
//
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
// }
