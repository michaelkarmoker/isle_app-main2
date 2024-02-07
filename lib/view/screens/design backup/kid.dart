// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
// import 'package:isletestapp/util/app_constants.dart';
// import 'package:isletestapp/util/color.dart';
// import 'package:isletestapp/util/constants.dart';
// import 'package:isletestapp/util/images.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/util/text_SIZE.dart';
// import 'package:isletestapp/view/base/custom_Image_cached.dart';
// import 'package:isletestapp/view/base/custom_button.dart';
// import 'package:isletestapp/view/screens/add%20to%20cart%20screen/product_details_page.dart';
// import 'package:isletestapp/view/screens/category/product_page.dart';
// import 'package:isletestapp/view/screens/design%20backup/women/women_page.dart';
// import 'package:isletestapp/view/screens/home/home_page.dart';
// import 'package:isletestapp/view/screens/kids/kid_page.dart';
// import 'package:isletestapp/view/screens/wish_list/similar_product_popup.dart';
// import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
//
//
// class Kid extends StatefulWidget {
//   final MainPageController controller;
//   const Kid({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   State<Kid> createState() => _MenPageState();
// }
//
// class _MenPageState extends State<Kid> {
//   PageController? _pageController;
//   bool isOpen=false;
//   int _pageIndex = 0;
//   List<Widget> _screens=[];
//   GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
//   final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
//   bool _canExit =  false;
//
//
//   TextEditingController searchCtr = TextEditingController();
//   FocusNode searchFcs = FocusNode();
//   bool isSearchClick=false;
//   TextEditingController subscribeCtr = TextEditingController();
//   FocusNode subscribeFcs = FocusNode();
//   late ScrollController _scrollController;
//   Color _textColor = Colors.black;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Start moving the item from right to left
//     startMoving();
//   }
//   double position = 0;
//   void startMoving() {
//     Future.delayed(Duration(milliseconds: 40), () {
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
//
//   @override
//   Widget build(BuildContext context) {
//     return   SingleChildScrollView(
//       child:   Column(
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//
//           /// Top BANNER
//           Padding(
//             padding: const EdgeInsets.only(top: 0, left: 6, right: 6, bottom: 0),
//             child: Container(
//               // color: Colors.teal,
//               height: Get.height /15,
//               child: CarouselSlider.builder(
//                 itemCount: widget.controller.featureSliderResponse!.data!.length,
//                 itemBuilder: (BuildContext context, int index, _){
//                   return   Card(
//                     color:  Color(0xff424242),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           flex: 4,
//                           child: Container(
//                             height: 30,
//                             width: 30,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 widget.controller.featureSliderResponse!=null?
//                                 CustomImageCached(image: '${AppConstants.BASE_URL}${widget.controller.featureSliderResponse!.data![index].icon?? ""}',
//                                   fit: BoxFit.fitHeight,
//                                   isRound: false,
//                                   // fit: BoxFit.fill,
//                                   height: 25,
//                                   width: 25,
//                                 )
//                                     :
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8, top: 3, bottom: 0),
//                                   child : Image.asset(topbannericon[index], color: Color(0xff999999), height: 25, width: 25,),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 30,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '${widget.controller.featureSliderResponse!.data![index].title??""}',
//                                 style: railway.copyWith(color: Color(0xffCCCCCC), fontSize: 10),
//                                 textAlign: TextAlign.left,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 options: CarouselOptions(
//                   height: Get.height /2,
//                   // enlargeCenterPage: true,
//                   autoPlay: true,
//                   reverse: false,
//                   aspectRatio: 10 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   autoPlayInterval: Duration(seconds: 2),
//                   viewportFraction: 1,
//                 ),
//               ),
//             ),
//           ),
//
//           SizedBox(height: 5),
//
//           widget.controller.lovingBrandResponse!=null?  widget.controller.lovingBrandResponse!.data!.length>0 ?
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Container(
//               height: 60,
//               child: ListView.builder(
//
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 8,
//                   itemBuilder: (context, index) {
//                     return SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Transform.translate(
//                             offset: Offset(position * MediaQuery.of(context).size.width, 0),
//                             child: CustomImageCached(
//                               isRound: false,
//                               image: '${AppConstants.BASE_URL}${widget.controller.lovingBrandResponse!.data![index].logo ?? ""}',
//                               // fit: BoxFit.fitHeight,
//                               height: 60, width: 80,
//                               fit: BoxFit.contain,
//                               // height: Get.height/5.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//               ),
//             ),
//           )
//               :
//           SizedBox(child: Text("no-data"),):SizedBox(),
//
//           SizedBox(height: 5),
//
//           ///Top CARUSAL
//           Padding(
//             padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
//             child: Container(
//               // color: Colors.teal,
//               height: Get.height /1.8,
//               child: CarouselSlider.builder(
//                 itemCount: 2,
//                 itemBuilder: (BuildContext context, int index, _){
//                   return  InkWell(
//                     onTap: () {
//                       Get.to( CustomCategoryViewPage(  categoryId: '',  page: 0, subCategoryId: '', childCategoryId: '', sectionId: '',));
//                     },
//                     child: Container(
//                       // decoration: BoxDecoration(
//                       //   borderRadius: BorderRadius.circular(0),
//                       // ),
//                       child: CustomImageCached(
//                         isRound: false,
//                         image: 'https://ounass-ae.atgcdn.ae/contentful/b3xlytuyfm3e/7xR0DEHIo5bdjLF5USVU4T/a23c90650f0180d8b0257eebbff22a51/KW_FWB_Occasion_Shop_APP_EN_WK37.jpg?q=70',
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   );
//                 },
//                 options: CarouselOptions(
//                   autoPlay: true,  // Enable auto-sliding
//                   autoPlayInterval: Duration(seconds: 2),  // Set the auto-sliding interval
//                   enableInfiniteScroll: true,
//                   height: Get.height /2,
//                   // enlargeCenterPage: true,
//
//                   reverse: false,
//                   aspectRatio: 10 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//
//                   // autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   viewportFraction: 1,
//                 ),
//               ),
//             ),
//           ),
//
//           ///  BANNER IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//             child: InkWell(
//               onTap: (){
//                 Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//               },
//               child: CustomImageCached(
//                 // image: '${Images.carusalimage}}',
//                 image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fhome%2F2_HP_Watch_Shop_App_En_WK35.jpg&w=750&q=75',
//                 height: Get.height/5,
//                 isRound: false,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           // SizedBox(height: 8),
//
//           ///  isle picks
//           InkWell(
//             onTap: (){
//               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//             },
//             child: Container(
//               color: Color(0xffFAFBFB),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 8),
//                     CustomImageCached(
//                       // image: '${Images.carusalimage}}',
//                       image: 'https://ounass-ae.atgcdn.ae/contentful/b3xlytuyfm3e/47t4THgSs6zsQoGoTXgCKy/be9f32cfa4283f4fd79580232b499f4e/02_KW_Tues_Oct10_WK37.jpg?q=70',
//                       height: Get.height/3.5,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                     SizedBox(height: 15),
//                     Text("ISLE PICKS".toUpperCase(), style:  railway.copyWith(fontSize: 17, color: Color(0xff000000) ),),
//                     SizedBox(height: 12),
//                     Text("Dive into a world of miniature must-haves for girl, boy and baby", style: railway.copyWith(fontSize: 11, color: Color(0xff000000)),),
//                     SizedBox(height: 15),
//
//                     CustomButton(
//                       height: 45,
//                       width: Get.width / 2.7,
//                       buttoncolor: kidcolor,
//                       // image: Images.drop,
//                       // imageheight: 20,
//                       // imagegap: 6,
//                       color: Colors.white,
//                       buttontextcolor: Colors.white,
//                       radius: 0,
//                       fontSize: 12.5,
//                       myfontweight: FontWeight.w500,
//                       onPressed: () {
//                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                         setState(() {});
//                       },
//                       buttonText: "Shop Now".toUpperCase(),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//
//           ///  Categories part
//           SizedBox(
//             height: 32,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                   child: Text("Categories", style: railway.copyWith(fontSize: titlesize ,) ),
//                 ),
//               ],
//             ),),
//           SizedBox(
//             height: Get.height/5,
//             // width: Get.width,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8, right: 8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 // physics: NeverScrollableScrollPhysics(),
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 4,
//                 itemBuilder:  (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                     child: InkWell(
//                       onTap: () {
//                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                       },
//                       child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Container(
//                               color:  Color(0xff424242),
//                               width: Get.width/3.2,
//                               child: CustomImageCached(
//                                 // image: '${Images.carusalimage}}',
//                                 image: '${catagoryimagek[index]}',
//                                 height: Get.height/2,
//                                 isRound: false,
//                                 fit: BoxFit.fill,
//
//                               ),
//                             ),
//
//                             Positioned(
//                                 bottom: 8,
//                                 child: Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: Text("${categoryName[index]}",
//                                     style: railway.copyWith(
//                                       // color: Color(0xffDBDCE2),
//                                         color: Colors.white,
//                                         fontSize: 12),),
//                                 )
//                             )
//                           ]
//                       ),
//                     ),
//                   );
//                 },
//
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//
//           ///  Brand part
//           SizedBox(height: 12),
//           SizedBox(
//             height: 32,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                   child: Text("Discover Brands", style: railway.copyWith(fontSize: titlesize ,)),
//                 ),
//               ],
//             ),),
//           SizedBox(
//             height: Get.height/5,
//             // width: Get.width,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8, right: 8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 // physics: NeverScrollableScrollPhysics(),
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 4,
//                 itemBuilder:  (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                     child: InkWell(
//                       onTap: () {
//                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                       },
//                       child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Container(
//                               color:  Color(0xff424242),
//                               width: Get.width/3.2,
//                               child: CustomImageCached(
//                                 // image: '${Images.carusalimage}}',
//                                 image: '${catagoryimagek[index]}',
//                                 height: Get.height/2,
//                                 isRound: false,
//                                 fit: BoxFit.fill,
//
//                               ),
//                             ),
//
//                             Positioned(
//                                 bottom: 0,
//                                 child: Container(
//                                   color: Color(0xffF2F2F2).withOpacity(0.5),
//                                   child: Padding(
//                                     padding: EdgeInsets.only(left: Get.width, right: Get.width, top: 5, bottom: 6),
//                                     child: Text("${brandName[index]}".toUpperCase(),
//                                       style: railway.copyWith(
//                                         // color: Color(0xffDBDCE2),
//                                           color: Colors.black54,
//                                           fontWeight: FontWeight.w600,
//                                           // color: Colors.grey,
//                                           fontSize: 11),),
//                                   ),
//                                 )
//                             )
//                           ]
//                       ),
//                     ),
//                   );
//                 },
//
//               ),
//             ),
//           ),
//           SizedBox(height: 25),
//
//           /// new in
//           Padding(
//             padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       flex: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 4),
//                         child: Text("New In-Handpicked From The Best Brands", style: railway.copyWith(fontSize: 20 ),),
//                       ),
//                     ),
//                     Expanded(
//                         flex: 1,
//                         child: InkWell(
//                           onTap: (){
//                             Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                           },
//                           child: Text("Shop All".toUpperCase(),
//                             textAlign: TextAlign.end,
//                             style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),),
//                         )),
//                   ],
//
//                 ),
//                 SizedBox(height: 15),
//                 Container(
//                   // color: Colors.red,
//                   height: Get.height/2.35,
//                   // width: Get.width,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 0, right: 0),
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 9,
//                       itemBuilder:  (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 6),
//                           child: InkWell(
//                             onTap: () {
//                               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                             },
//                             child: Stack(
//                                 alignment: Alignment.topRight,
//                                 children: [
//                                   InkWell(
//                                     highlightColor: Colors.grey.shade100,
//                                     splashColor: Colors.grey.shade100,
//                                     // focusColor: Colors.green,
//                                     // hoverColor: Colors.blue,
//                                     onTap: (){
//                                       Get.to(Add2CartScreen( cartdetailsimage: 'https://ounass-qa.atgcdn.ae/small_light(dw=440,of=webp)/pub/media/catalog/product/2/1/216084576_blue_in.jpg?1679830501.9526', productId: '',));
//                                       // showCustomSnackBar("Click Shop Cart");
//                                     },
//                                     child: Container(
//                                       // color:  Colors.grey.shade200,
//                                       // color: Color(0xffFAFAFC),
//                                       width: Get.width/2.2,
//                                       child: Column(
//
//                                           children: [
//
//                                             Container(
//                                               // color:  Color(0xff424242),
//                                               // color:  Colors.blue,
//                                               width: Get.width/2.2,
//                                               child: Stack(
//                                                   alignment: Alignment.topCenter,
//                                                   children: [
//                                                     CustomImageCached(
//                                                       // image: '${Images.carusalimage}}',
//                                                       image: 'https://ounass-qa.atgcdn.ae/small_light(dw=440,of=webp)/pub/media/catalog/product/2/1/216084576_blue_in.jpg?1679830501.9526',
//                                                       height: Get.height/3.2,
//                                                       isRound: false,
//                                                       fit: BoxFit.fill,
//
//                                                     ),
//                                                     Positioned(
//                                                         bottom: 0,
//                                                         child: Align(
//                                                           alignment: Alignment.bottomCenter,
//                                                           child: Container(
//                                                             /// orginal color
//                                                             // color: Color(0xffF2F2F2),
//                                                             color: Colors.grey.shade300,
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
//                                                               child: Text("New Season".toUpperCase(),
//                                                                 style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                                                             ),
//                                                           ),
//                                                         )
//
//                                                     )
//                                                   ]
//                                               ),
//                                             ),
//                                             SizedBox(height: 12),
//
//
//                                             Text("${categorysliderName[index]}",
//                                               style: railway.copyWith(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 11
//                                               ),),
//                                             SizedBox(height: 7),
//
//                                             Padding(
//                                               padding: const EdgeInsets.symmetric(horizontal: 4),
//                                               child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                 overflow: TextOverflow.ellipsis,
//                                                 maxLines: 1,
//                                                 style: caluna.copyWith(
//                                                   // fontWeight: FontWeight.w100,
//                                                     fontSize: 11),),
//                                             ),
//                                             SizedBox(height: 7),
//
//                                             Text("100 BDT",
//                                               style: railway.copyWith( color: gold, fontSize: 12),),
//
//                                           ]
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 10,
//                                     right: 10,
//                                     child: InkWell(
//                                       onTap: (){
//                                         Get.to(WishListPage(pageIndex: 0,));
//                                       },
//
//                                       child: Container(
//                                         // color: Colors.black,
//                                         height: 30,
//                                         width: 30,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(5),
//                                           child: Image.asset(Images.wish, color: silvercolor, height: 20, width: 20,),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 10,
//                                     left: 10,
//                                     child: InkWell(
//                                       onTap: () {
//                                         Get.to(
//                                           showModalBottomSheet(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return SimilarPopup();
//                                             },
//                                           ),
//                                         );
//                                       },
//
//                                       child: Container(
//                                         // color: Colors.black,
//                                         height: 30,
//                                         width: 30,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(5),
//                                           child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ]
//                             ),
//                           ),
//                         );
//                       },
//
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 12),
//
//
//           ///  discover Trends
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//
//                 Expanded(
//                     child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                 SizedBox(width: 15),
//                 Expanded(
//                     child: Center(child: Text("Discover Trends", style: railway.copyWith(fontSize: 20 ),))),
//                 SizedBox(width: 8),
//                 Expanded(
//                     child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//               ],
//
//             ),
//           ),
//           SizedBox(height: 2),
//           InkWell(
//             onTap: () {
//               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//             },
//             child: Container(
//               color: Color(0xffFAFBFB),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 5),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 8),
//                     CustomImageCached(
//                       // image: '${Images.carusalimage}}',
//                       image: 'https://ounass-ae.atgcdn.ae/contentful/b3xlytuyfm3e/4F6zcNkSrB5IGDBzxgzrDA/59dbc9f92f5b9f8e33c174621e6787f1/05_KW_Fri_Oct20_WK38.jpg?q=70',
//                       height: Get.height/3.5,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                     SizedBox(height: 15),
//                     Text("Trending Now".toUpperCase(), style:  railway.copyWith(fontSize: 16, color: Color(0xff000000) ),),
//                     SizedBox(height: 12),
//                     Text("Dive into a world of miniature must-haves for girl, boy and baby",
//                       overflow: TextOverflow.ellipsis,
//                       style: railway.copyWith(fontSize: 11, color: Color(0xff000000)),),
//                     SizedBox(height: 15),
//
//                     CustomButton(
//                       height: 45,
//                       width: Get.width / 2.7,
//                       buttoncolor: kidcolor,
//                       // image: Images.drop,
//                       // imageheight: 20,
//                       // imagegap: 6,
//                       color: Colors.white,
//                       buttontextcolor: Colors.white,
//                       radius: 0,
//                       fontSize: 12.5,
//                       myfontweight: FontWeight.w500,
//                       onPressed: () {
//                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                         setState(() {});
//                       },
//                       buttonText: "Shop Now".toUpperCase(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 12),
//
//
//           ///  discover Trends
//           InkWell(
//             onTap: () {
//               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//             },
//             child: Container(
//               color: Color(0xffFAFBFB),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 8),
//                     CustomImageCached(
//                       // image: '${Images.carusalimage}}',
//                       image: 'https://ounass-ae.atgcdn.ae/contentful/b3xlytuyfm3e/3WQqqBa9ObFb32JmgH6XuS/cbbd0a927e2dfc3a057b47889287586c/KW_Trending1_APP_WK38.jpg?q=70',
//                       height: Get.height/3.5,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                     SizedBox(height: 15),
//                     Text("Trending Now".toUpperCase(), style:  railway.copyWith(fontSize: 16, color: Color(0xff000000) ),),
//                     SizedBox(height: 12),
//                     Text("Dive into a world of miniature must-haves for girl, boy and baby",
//                       overflow: TextOverflow.ellipsis,
//                       style: robotoRegular.copyWith(fontSize: 10.5, color: Color(0xff000000)),),
//                     SizedBox(height: 15),
//
//                     CustomButton(
//                       height: 45,
//                       width: Get.width / 2.7,
//                       buttoncolor: kidcolor,
//                       // image: Images.drop,
//                       // imageheight: 20,
//                       // imagegap: 6,
//                       color: Colors.white,
//                       buttontextcolor: Colors.white,
//                       radius: 0,
//                       fontSize: 12.5,
//                       myfontweight: FontWeight.w500,
//                       onPressed: () {
//                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                         setState(() {});
//                       },
//                       buttonText: "Shop Now".toUpperCase(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 12),
//
//           /// shop By Category slider part
//           Padding(
//             padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: Text("Shop By Category",style: railway.copyWith(fontSize: 20 )),
//                     ),
//                     // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                   ],
//
//                 ),
//                 SizedBox(height: 8),
//                 SizedBox(
//                   height: Get.height/5,
//                   // width: Get.width,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 8, right: 8),
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       // physics: NeverScrollableScrollPhysics(),
//                       physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 4,
//                       itemBuilder:  (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                           child: InkWell(
//                             onTap: () {
//                               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                             },
//                             child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Container(
//                                     color:  Color(0xff424242),
//                                     width: Get.width/3.2,
//                                     child: CustomImageCached(
//                                       // image: '${Images.carusalimage}}',
//                                       image: '${catagoryimagek[index]}',
//                                       height: Get.height/2,
//                                       isRound: false,
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//
//                                   Positioned(
//                                       bottom: 8,
//                                       child: Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: Text("${categoryName[index]}",
//                                           style: railway.copyWith(
//                                             // color: Color(0xffDBDCE2),
//                                               color: Colors.white,
//                                               fontSize: 12),),
//                                       )
//                                   )
//                                 ]
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//
//           /// shop By luxury ITEMS slider part
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Expanded(
//                     child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                 SizedBox(width: 15),
//                 Expanded(
//                     child: Center(child: Text("Luxury".toUpperCase(), style: railway.copyWith(fontSize: 20 ),))),
//                 SizedBox(width: 8),
//                 Expanded(
//                     child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
//             child: Container(
//               // color: Colors.red,
//               height: Get.height/2.6,
//               // width: Get.width,
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 0, right: 0),
//                   child:
//                   GridView.builder(
//                     itemCount: 3,
//                     scrollDirection: Axis.horizontal,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 1,
//                         crossAxisSpacing: 0,
//                         mainAxisSpacing: 10,
//                         // childAspectRatio: 1,
//                         mainAxisExtent: Get.width
//                     ),
//                     itemBuilder: (BuildContext context, int index){
//                       return InkWell(
//                         onTap: () {
//                           Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                         },
//                         child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Container(
//                                 color:  Color(0xff424242),
//                                 // width: Get.width/3.2,
//                                 child: CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   // image: '${catagoryimage[index]}',
//                                   image: 'https://ounass-qa.atgcdn.ae/small_light(dw=440,of=webp)/pub/media/catalog/product/2/1/216411694_purple_in.jpg?1692215248.6344',
//                                   height: Get.height/2,
//                                   width: Get.width,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//
//                               Positioned(
//                                   bottom: 30,
//                                   child: Align(
//                                     alignment: Alignment.bottomCenter,
//                                     child: Text("Nike",
//                                       // child: Text("${categoryName[index]}",
//                                       style: railway.copyWith(
//                                         // color: Color(0xffDBDCE2),
//                                           color: Colors.white,
//                                           fontSize: 20),),
//                                   )
//                               )
//                             ]
//                         ),
//                       );
//                     },
//                   )
//               ),
//             ),
//           ),
//           SizedBox(height: 12),
//
//
//           ///  Affordable Items By Category slider part
//           Padding(
//             padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: Text("Affordable Items".toUpperCase(), style: railway.copyWith(fontSize: 20),),
//                     ),
//                     // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Container(
//                   // color: Colors.red,
//                   height: Get.height/4.2,
//                   // width: Get.width,
//                   child: Padding(
//                       padding: const EdgeInsets.only(left: 7, right: 0),
//                       child:
//                       GridView.builder(
//                         itemCount: 3,
//                         scrollDirection: Axis.horizontal,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 1,
//                             crossAxisSpacing: 0,
//                             mainAxisSpacing: 10,
//                             childAspectRatio: 1
//                         ),
//                         itemBuilder: (BuildContext context, int index){
//                           return InkWell(
//                             onTap: () {
//                               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                             },
//                             child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Container(
//                                     color:  Color(0xff424242),
//                                     // width: Get.width/3.2,
//                                     child: CustomImageCached(
//                                       // image: '${Images.carusalimage}}',
//                                       image: '${catagoryimagek[index]}',
//                                       height: Get.height/4.2,
//                                       isRound: false,
//                                       fit: BoxFit.fill,
//
//                                     ),
//                                   ),
//
//                                   Positioned(
//                                       bottom: 15,
//                                       child: Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: Text("Categories",
//                                           // child: Text("${brandName[index]}",
//                                           style: railway.copyWith(
//                                             // color: Color(0xffDBDCE2),
//                                               color: Colors.white,
//                                               fontSize: 18),),
//                                       )
//
//                                   )
//                                 ]
//                             ),
//                           );
//                         },
//                       )
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//
//
//           ///  discover LIFESTYLE
//           /*   Row(
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
//           SizedBox(height: 10),
//           InkWell(
//             onTap: () {
//               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//             },
//             child: Container(
//               color: Color(0xffFAFBFB),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
//                 child: Column(
//                   children: [
//                     CustomImageCached(
//                       // image: '${Images.carusalimage}}',
//                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2FWatchShop.jpg&w=1200&q=75',
//                       height: Get.height/3.5,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // SizedBox(height: 20),
//
//           ///  13th image part
//           InkWell(
//             onTap: () {
//               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//             },
//             child: Container(
//               color: Color(0xffFAFBFB),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                 child: Column(
//                   children: [
//                     CustomImageCached(
//                       // image: '${Images.carusalimage}}',
//                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2FGrooming_Desktop.jpg&w=1200&q=75',
//                       height: Get.height/3.5,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//
//
//           /// most POPULAR SHOP slider part
//           Padding(
//             padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 4),
//                       child: Text("Most Popular", style: railway.copyWith(fontSize: 20),),
//                     ),
//                     InkWell(
//                         onTap: (){
//                           Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                         },
//                         child: Text("Shop All".toUpperCase(), style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),)),
//                   ],
//
//                 ),
//                 SizedBox(height: 15),
//                 Container(
//                   // color: Colors.red,
//                   height: Get.height/2.35,
//                   // width: Get.width,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 0, right: 0),
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 9,
//                       itemBuilder:  (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 6),
//                           child: InkWell(
//                             onTap: () {
//                               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                             },
//                             child: Stack(
//                                 alignment: Alignment.topRight,
//                                 children: [
//                                   InkWell(
//                                     highlightColor: Colors.grey.shade100,
//                                     splashColor: Colors.grey.shade100,
//                                     // focusColor: Colors.green,
//                                     // hoverColor: Colors.blue,
//                                     onTap: (){
//                                       Get.to(Add2CartScreen( cartdetailsimage: 'https://ounass-qa.atgcdn.ae/small_light(dw=440,of=webp)/pub/media/catalog/product/2/1/216084576_blue_in.jpg?1679830501.9526', productId: '',));
//                                       // showCustomSnackBar("Click Shop Cart");
//                                     },
//                                     child: Container(
//                                       // color:  Colors.grey.shade200,
//                                       // color: Color(0xffFAFAFC),
//                                       width: Get.width/2.2,
//                                       child: Column(
//                                           children: [
//                                             Container(
//                                               // color:  Color(0xff424242),
//                                               // color:  Colors.blue,
//                                               width: Get.width/2.2,
//                                               child: Stack(
//                                                   alignment: Alignment.topCenter,
//                                                   children: [
//                                                     CustomImageCached(
//                                                       // image: '${Images.carusalimage}}',
//                                                       image: 'https://ounass-qa.atgcdn.ae/small_light(dw=440,of=webp)/pub/media/catalog/product/2/1/216084576_blue_in.jpg?1679830501.9526',
//                                                       height: Get.height/3.2,
//                                                       isRound: false,
//                                                       fit: BoxFit.fill,
//                                                     ),
//                                                     Positioned(
//                                                         bottom: 0,
//                                                         child: Align(
//                                                           alignment: Alignment.bottomCenter,
//                                                           child: Container(
//                                                             /// orginal color
//                                                             // color: Color(0xffF2F2F2),
//                                                             color: Colors.grey.shade300,
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
//                                                               child: Text("New Season".toUpperCase(),
//                                                                 style: railway.copyWith(color: Colors.black, fontSize: 9),),
//                                                             ),
//                                                           ),
//                                                         )
//                                                     )
//                                                   ]
//                                               ),
//                                             ),
//                                             SizedBox(height: 12),
//
//                                             Text("${categorysliderName[index]}",
//                                               style: railway.copyWith(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 11
//                                               ),),
//                                             SizedBox(height: 7),
//
//                                             Padding(
//                                               padding: const EdgeInsets.symmetric(horizontal: 4),
//                                               child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                                 overflow: TextOverflow.ellipsis,
//                                                 maxLines: 1,
//                                                 style: caluna.copyWith(
//                                                   // fontWeight: FontWeight.w100,
//                                                     fontSize: 11),),
//                                             ),
//                                             SizedBox(height: 7),
//
//                                             Text("100 BDT",
//                                               style: caluna.copyWith( color: gold, fontSize: 12),),
//                                           ]
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 10,
//                                     right: 10,
//                                     child: InkWell(
//                                       onTap: (){
//                                         Get.to( WishListPage(pageIndex: 0,));
//                                       },
//
//                                       child: Container(
//                                         // color: Colors.black,
//                                         height: 30,
//                                         width: 30,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(5),
//                                           child: Image.asset(Images.wish, color: silvercolor, height: 20, width: 20,),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 10,
//                                     left: 10,
//                                     child: InkWell(
//                                       onTap: () {
//                                         Get.to(
//                                           showModalBottomSheet(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return SimilarPopup();
//                                             },
//                                           ),
//                                         );
//                                       },
//
//                                       child: Container(
//                                         // color: Colors.black,
//                                         height: 30,
//                                         width: 30,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(5),
//                                           child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ]
//                             ),
//                           ),
//                         );
//                       },
//
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 12),
//
//           ///  Bottom Banner1 part
//           InkWell(
//             onTap: () {
//               Get.to(WomenPage(selectedCatIndex: 0,));
//             },
//             child: Container(
//               color: Color(0xffFAFBFB),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                 child: Column(
//                   children: [
//                     CustomImageCached(
//                       // image: '${Images.carusalimage}}',
//                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2Fshop-women.jpg&w=1200&q=75',
//                       height: Get.height/9,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // SizedBox(height: 20),
//
//           ///  BOTTOM BANNER2 image part
//           InkWell(
//             onTap: () {
//               Get.to(KidPage( pageId: '', selectedCatIndex: 0,));
//             },
//             child: Container(
//               color: Color(0xffFAFBFB),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                 child: Column(
//                   children: [
//                     CustomImageCached(
//                       // image: '${Images.carusalimage}}',
//                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2Fshop-man.jpg&w=1200&q=75',
//                       height: Get.height/9,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//
//           // SizedBox(height: 500)
//
//         ],
//       ),
//     );
//   }
// }
