// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/theme/light_theme.dart';
// import 'package:isletestapp/util/app_constants.dart';
// import 'package:isletestapp/util/constants.dart';
// import 'package:isletestapp/util/dimensions.dart';
// import 'package:isletestapp/util/images.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/view/base/custom_Image_cached.dart';
// import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
// import 'package:isletestapp/view/base/custom_snackbar.dart';
// import 'package:isletestapp/view/screens/add%20to%20cart%20screen/product_details_page.dart';
// import 'package:isletestapp/view/screens/drawer/drawer.dart';
//
// class IsleMenScreen extends StatefulWidget {
//
//   IsleMenScreen({Key? key}) : super(key: key);
//    bool isExpanded1=false;
//    bool isExpanded2=false;
//    bool isExpanded3=false;
//    bool isExpanded4=false;
//
//   @override
//   State<IsleMenScreen> createState() => _IsleHomeScreenState();
// }
//
// class _IsleHomeScreenState extends State<IsleMenScreen> {
//   TextEditingController searchCtr = TextEditingController();
//   bool isSearchClick=false;
//   TextEditingController subscribeCtr = TextEditingController();
//   FocusNode subscribeFcs = FocusNode();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffFAFBFB),
//       drawer: IsleDrawer(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Color(0xff000000)),
//           titleSpacing: 0,
//           backgroundColor: Color(0xffFFFFFF),
//           centerTitle: true,
//           elevation: 0,
//         actions: [
//       /*    !isSearchClick?InkWell(
//               onTap: (){
//                 isSearchClick=!isSearchClick;
//                 setState(() {
//
//                 });
//               },
//               child: Icon(Icons.search,color: Colors.grey,size: 25,)):SizedBox(),*/
//           // !isSearchClick?SizedBox(width: 10,):SizedBox(),
//
// Icon(Icons.favorite_outline, color: Color(0xff000000),),
// SizedBox(width: 20),
// Icon(Icons.shopping_bag_outlined, color: Color(0xff000000),),
//           SizedBox(width: 6),
//          /* Padding(
//             padding: const EdgeInsets.only(right: 12,top: 12,bottom: 12, left: 0),
//             child: InkWell(
//                 onTap: (){
//                   // Get.dialog(PopUpMessage());
//                 },
//                 child: Image.asset("${Get.find<LocalizationController>().selectedLanguage==AppConstants.bn?Images.bd:Images.en}")),
//           )*/
//         ],
//
//           title: Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//
//                   !isSearchClick?InkWell(
//                       onTap: (){
//                         isSearchClick=!isSearchClick;
//                         setState(() {
//
//                         });
//                       },
//                       child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
//                    !isSearchClick?SizedBox(width: Get.width/4,):SizedBox(),
//                   isSearchClick? SizedBox() : Text("Isle", style: titl.copyWith(color: Color(0xff1C1C1C), fontSize: 32, fontWeight: FontWeight.w100,letterSpacing: 3)),
//                   isSearchClick? SizedBox() : SizedBox(width: 10),
//
//                   isSearchClick?Expanded(
//                     // flex: 2,
//                     child: Container(
//                       height: 35,
//                       decoration: BoxDecoration(
//                           color: Colors.grey.shade100,
//                           // color: Colors.greenAccent.shade100,
//                           borderRadius: BorderRadius.circular(32)
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 15, bottom: 2),
//                         child: TextField(
//                           controller: searchCtr,
//                           style: TextStyle(fontSize: 13, color: Colors.black),
//                           cursorColor: Colors.black,
//
//                           textInputAction: TextInputAction.search,
//                           onSubmitted: (value){
//                             searchCtr.text="";
//                             // Get.to(SearchScreen(searchKeyword: value,));
//                           },
//                           decoration:  InputDecoration(
//                             suffixIcon: IconButton(onPressed:(){
//
//                               searchCtr.text="";
//                               isSearchClick=false;
//                               setState(() {
//                               });
//                               /* var value=searchCtr.text.toString();
//                             searchCtr.text="";
//                             Get.to(BlogListScreen(searchKeyword: value, id: null,));*/
//                             }, icon: Icon(Icons.close,size: 20,)),
//                             hintText: 'Search...',
//                             hintStyle: TextStyle(color: Colors.black),
//                             border: InputBorder.none,
//                             suffixIconColor: Colors.grey,
//
//                           ),
//
//                           onChanged: (value) {
//                             // Perform search functionality here
//                           },
//                         ),
//                       ),
//                     ),
//                   ):Container(),
//                 ],
//               )),
//     ),
//     body: SingleChildScrollView(
//       child: Column(
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//
//    /// Top BANNER
//           SizedBox(
//             height: 55.0,
//             // width: Get.width,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8, right: 8),
//               child: ListView.builder(
//                 physics: BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3,
//                 itemBuilder:  (BuildContext context, int index) {
//                   return SizedBox(
//                     width: Get.width/1.16,
//                     child: Card(
//                       color:  Color(0xff424242),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
//                                   child : Image.asset(topbannericon[index], color: Color(0xff999999)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                            Expanded(
//                              flex: 30,
//                              child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   '${title[index]}',
//                                   style: TextStyle(color: Color(0xffCCCCCC), fontSize: 9.5),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ],
//                           ),
//                            ),
//                         ],
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
//    ///Top CARUSAL
//           Padding(
//             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//             child: Container(
//               // color: Colors.teal,
//               height: Get.height /2,
//               child: CarouselSlider.builder(
//                 itemCount: 2,
//                 itemBuilder: (BuildContext context, int index, _){
//                   return  Container(
//                     // decoration: BoxDecoration(
//                     //   borderRadius: BorderRadius.circular(0),
//                     // ),
//                     child: CustomImageCached(
//                       isRound: false,
//                       image: '${topcurosalimage[index]}',fit: BoxFit.fill,),
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
//                   viewportFraction: 1,
//                 ),
//               ),
//             ),
//           ),
//
//    ///  BANNER IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//             child: InkWell(
//               onTap: (){
//                 showCustomSnackBar("Click The Button...");
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
//   ///  4th image part
//           InkWell(
//             onTap: (){
//               showCustomSnackBar("Click The Button...");
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
//                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fhome%2F07_KW_Sun_Oct1_WK35.jpg&w=640&q=75',
//                       height: Get.height/3.5,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                     SizedBox(height: 15),
//                     Text("MOST WANTED".toUpperCase(), style:  robotoRegular.copyWith(fontSize: 17, color: Color(0xff000000) ),),
//                     SizedBox(height: 12),
//                     Text("Dive into a world of miniature must-haves for girl, boy and baby", style: robotoRegular.copyWith(fontSize: 10.5, color: Color(0xff000000)),),
//                     SizedBox(height: 15),
//
//                     ElevatedButton(
//                       // style: raisedButtonStyle,
//                       style: ElevatedButton.styleFrom(primary: Color(0xff2D2D2D)),
//                       onPressed: () {
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                         child: Text('Shop Now'.toUpperCase(), style: robotoRegular.copyWith(fontSize: 12.5),),
//                       ),
//                     )
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//
//    ///  Categories part
//           SizedBox(
//             height: 32,
//             child: Text("Categories".toUpperCase(), style: acme.copyWith(),),),
//           SizedBox(
//             height: Get.height/3,
//             // width: Get.width,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8, right: 8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 // physics: NeverScrollableScrollPhysics(),
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3,
//                 itemBuilder:  (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                     child: Stack(
//                         alignment: Alignment.center,
//                       children: [
//                         Container(
//                         color:  Color(0xff424242),
//                         width: Get.width/3.2,
//                         child: CustomImageCached(
//                           // image: '${Images.carusalimage}}',
//                           image: '${catagoryimage[index]}',
//                           height: Get.height/2,
//                           isRound: false,
//                           fit: BoxFit.fill,
//
//                         ),
//                       ),
//
//                         Positioned(
//                           bottom: 5,
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Text("${categoryName[index]}",
//                                 style: robotoRegular.copyWith(color: Color(0xffDBDCE2), fontSize: 12),),
//                             )
//
//                         )
//
//
//                       ]
//                     ),
//                   );
//                 },
//
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//
//   ///  Brand part
//           SizedBox(height: 12),
//           SizedBox(
//             height: 32,
//             child: Text("Discover Brands".toUpperCase(), style: acme.copyWith(),),),
//           SizedBox(
//             height: Get.height/3.2,
//             // width: Get.width,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8, right: 8),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 physics: BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 6,
//                 itemBuilder:  (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                     child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Container(
//                             color:  Color(0xff424242),
//                             width: Get.width/2.7,
//                             child: CustomImageCached(
//                               // image: '${Images.carusalimage}}',
//                               image: '${brandimage[index]}',
//                               height: Get.height/2,
//                               isRound: false,
//                               fit: BoxFit.fill,
//
//                             ),
//                           ),
//
//                           Positioned(
//                               bottom: 0,
//                               child: Container(
//                                 color: Color(0xffF2F2F2).withOpacity(0.5),
//                                 child: Padding(
//                                   padding: EdgeInsets.only(left: Get.width, right: Get.width, top: 3, bottom: 3),
//                                   child: Text("${brandName[index]}".toUpperCase(),
//                                     style: robotoRegular.copyWith(
//                                         // color: Color(0xffDBDCE2),
//                                          color: Color(0xffB56D4D),
//                                       // color: Colors.grey,
//                                         fontSize: 11.5),),
//                                 ),
//                               )
//
//                           )
//
//
//                         ]
//                     ),
//                   );
//                 },
//
//               ),
//             ),
//           ),
//           SizedBox(height: 25),
//
//
//    ///  5th image part
// /*
//           SizedBox(height: 15),
//           Padding(
//             padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 0),
//             child: InkWell(
//               onTap: (){
//                 showCustomSnackBar("Click The Button...");
//               },
//               child: CustomImageCached(
//                 // image: '${Images.carusalimage}}',
//                 image: 'https://ounass-ae.atgcdn.ae/contentful/b3xlytuyfm3e/62mpbp0xMcdhuy9Or6ocsE/1f69e9950016022e16077730851c8a2c/MW_R_S_Mohammed_APP_EN_WK34.jpg?q=70',
//                 height: Get.height/2.2,
//                 isRound: false,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
// */
//
// /// 6th SHOP slider part
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
//                       child: Text("New In-Handpicked From The Best Brands", style: titl.copyWith(fontSize: 15),),
//                     ),
//                     Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                   ],
//
//                 ),
//                 SizedBox(height: 15),
//                 Container(
//                     // color: Colors.red,
//                     height: Get.height/2.45,
//                     // width: Get.width,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 0, right: 0),
//                       child: ListView.builder(
//                         padding: EdgeInsets.zero,
//                         physics: ClampingScrollPhysics(),
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 9,
//                         itemBuilder:  (BuildContext context, int index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 6),
//                             child: Stack(
//                                 alignment: Alignment.topRight,
//                               children: [
//                                 InkWell(
//                                   highlightColor: Colors.grey,
//                                   splashColor: Colors.grey,
//                                   // focusColor: Colors.green,
//                                   // hoverColor: Colors.blue,
//                                 onTap: (){
//                                     Get.to(Add2CartScreen( cartdetailsimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75', productId: '',));
//                                   // showCustomSnackBar("Click Shop Cart");
//                                 },
//                                 child: Container(
//                                   // color:  Colors.cyan,
//                                   color: Color(0xffFAFAFC),
//                                   width: Get.width/2.7,
//                                   child: Column(
//
//                                       children: [
//
//                                         Container(
//                                           // color:  Color(0xff424242),
//                                           // color:  Colors.blue,
//                                           width: Get.width/2.7,
//                                           child: Stack(
//                                               alignment: Alignment.topCenter,
//                                               children: [
//                                                 CustomImageCached(
//                                                   // image: '${Images.carusalimage}}',
//                                                   image: '${catagorysliderimage[index]}',
//                                                   height: Get.height/3.2,
//                                                   isRound: false,
//                                                   fit: BoxFit.fill,
//
//                                                 ),
//                                                 Positioned(
//                                                     bottom: 0,
//                                                     child: Align(
//                                                       alignment: Alignment.bottomCenter,
//                                                       child: Container(
//                                                         /// orginal color
//                                                         // color: Color(0xffF2F2F2),
//                                                         color: Colors.grey.shade400,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
//                                                           child: Text("New Season".toUpperCase(),
//                                                             style: robotoRegular.copyWith(color: Colors.black, fontSize: 9),),
//                                                         ),
//                                                       ),
//                                                     )
//
//                                                 )
//                                               ]
//                                           ),
//                                         ),
//                                         SizedBox(height: 12),
//
//
//                                         Text("${categorysliderName[index]}",
//                                           style: acme.copyWith( fontSize: 12),),
//                                         SizedBox(height: 7),
//
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 4),
//                                           child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                             style: acme.copyWith( fontWeight: FontWeight.w100, fontSize: 11),),
//                                         ),
//                                         SizedBox(height: 7),
//
//                                         Text("100 BDT",
//                                           style: acme.copyWith( color: Color(0xffB56D4D), fontSize: 12),),
//
//                                       ]
//                                   ),
//                                 ),
//                               ),
//                                 Positioned(
//                                   top: 10,
//                                   right: 10,
//                                   child: Align(
//                                     alignment: Alignment.topRight,
//                                     child: Icon(Icons.favorite_border, color: Colors.grey),
//                                   ),
//                                 ),
//                               ]
//                             ),
//                           );
//                         },
//
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           SizedBox(height: 12),
//
//
// ///  7th image part
//           InkWell(
//             onTap: (){
//               showCustomSnackBar("Click The Button...");
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
//                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2FTrending1.jpg&w=384&q=75',
//                       height: Get.height/3.5,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                     SizedBox(height: 15),
//                     Text("New Style Staples".toUpperCase(), style:  robotoRegular.copyWith(fontSize: 17, color: Color(0xff000000) ),),
//                     SizedBox(height: 12),
//                     Text("Discover the most refined essentials for now",
//                       overflow: TextOverflow.ellipsis,
//                       style: robotoRegular.copyWith(fontSize: 10, color: Color(0xff000000)),),
//                     SizedBox(height: 15),
//
//                     ElevatedButton(
//                       // style: raisedButtonStyle,
//                       style: ElevatedButton.styleFrom(primary: Color(0xff2D2D2D)),
//                       onPressed: () {
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                         child: Text('Shop The Edit'.toUpperCase(), style: robotoRegular.copyWith(fontSize: 12.5),),
//                       ),
//                     )
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 12),
//
//
//  ///  8th image part
//           InkWell(
//             onTap: (){
//               showCustomSnackBar("Click The Button...");
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
//                       image: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fman%2FTrending2.jpg&w=384&q=75',
//                       height: Get.height/3.5,
//                       isRound: false,
//                       fit: BoxFit.fill,
//                     ),
//                     SizedBox(height: 15),
//                     Text("Presents For Him".toUpperCase(), style:  robotoRegular.copyWith(fontSize: 17, color: Color(0xff000000) ),),
//                     SizedBox(height: 12),
//                     Text("Explore the season's best gifts, bound to impress",
//                       overflow: TextOverflow.ellipsis,
//                       style: robotoRegular.copyWith(fontSize: 10, color: Color(0xff000000)),),
//                     SizedBox(height: 15),
//
//                     ElevatedButton(
//                       // style: raisedButtonStyle,
//                       style: ElevatedButton.styleFrom(primary: Color(0xff2D2D2D)),
//                       onPressed: () {
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                         child: Text('Shop Now'.toUpperCase(), style: robotoRegular.copyWith(fontSize: 12.5),),
//                       ),
//                     )
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 12),
//
//  /// 9th SHOP By Category slider part
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
//                       child: Text("Shop By Category", style: titl.copyWith(fontSize: 25),),
//                     ),
//                    // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                   ],
//
//                 ),
//                 SizedBox(height: 8),
//                 Container(
//                   // color: Colors.red,
//                   height: Get.height/4.2,
//                   // width: Get.width,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 7, right: 0),
//                     child:
//                     GridView.builder(
//                       itemCount: 3,
//                       scrollDirection: Axis.horizontal,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 1,
//                           crossAxisSpacing: 0,
//                           mainAxisSpacing: 10,
//                         childAspectRatio: 1
//                       ),
//                       itemBuilder: (BuildContext context, int index){
//                         return Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Container(
//                                 color:  Color(0xff424242),
//                                 // width: Get.width/3.2,
//                                 child: CustomImageCached(
//                                   // image: '${Images.carusalimage}}',
//                                   image: '${catagoryimage[index]}',
//                                   height: Get.height/4.2,
//                                   isRound: false,
//                                   fit: BoxFit.fill,
//
//                                 ),
//                               ),
//
//                               Positioned(
//                                   bottom: 15,
//                                   child: Align(
//                                     alignment: Alignment.bottomCenter,
//                                     child: Text("Categories",
//                                       style: robotoBold.copyWith(
//                                           // color: Color(0xffDBDCE2),
//                                           color: Colors.white,
//                                           fontSize: 18),),
//                                   )
//
//                               )
//
//
//                             ]
//                         );
//                       },
//                     )
//
//
//
//             /*     GridView.builder(
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         childAspectRatio: 1
//                       ),
//                       padding: EdgeInsets.zero,
//                       physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 9,
//                       itemBuilder:  (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 6),
//                           child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   color:  Color(0xff424242),
//                                   width: Get.width/2,
//                                   child: CustomImageCached(
//                                     // image: '${Images.carusalimage}}',
//                                     image: '${catagoryimage[index]}',
//                                     height: Get.height/2,
//                                     isRound: false,
//                                     fit: BoxFit.fill,
//
//                                   ),
//                                 ),
//
//                                 Positioned(
//                                     bottom: 5,
//                                     child: Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Text("${categoryName[index]}",
//                                         style: robotoRegular.copyWith(color: Color(0xffDBDCE2), fontSize: 12),),
//                                     )
//
//                                 )
//
//
//                               ]
//                           ),
//                         );
//                       },
//
//                     ),*/
//
//
//
//
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//
// /// 10th SHOP By LuXURY ITEMS slider part
//           Padding(
//             padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 4),
//                       child: Text("Luxury Items", style: titl.copyWith(fontSize: 25),),
//                     ),
//                     // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                   ],
//
//                 ),
//                 SizedBox(height: 8),
//                 Container(
//                   // color: Colors.red,
//                   height: Get.height/2.2,
//                   // width: Get.width,
//                   child: Padding(
//                       padding: const EdgeInsets.only(left: 0, right: 0),
//                       child:
//                       GridView.builder(
//                         itemCount: 3,
//                         scrollDirection: Axis.horizontal,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 1,
//                             crossAxisSpacing: 0,
//                             mainAxisSpacing: 10,
//                             // childAspectRatio: 1,
//                           mainAxisExtent: Get.width
//                         ),
//                         itemBuilder: (BuildContext context, int index){
//                           return Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   color:  Color(0xff424242),
//                                   // width: Get.width/3.2,
//                                   child: CustomImageCached(
//                                     // image: '${Images.carusalimage}}',
//                                     image: '${catagoryimage[index]}',
//                                     height: Get.height/2,
//                                     width: Get.width,
//                                     isRound: false,
//                                     fit: BoxFit.fill,
//
//                                   ),
//                                 ),
//
//                                 Positioned(
//                                     bottom: 30,
//                                     child: Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Text("${categoryName[index]}",
//                                         style: robotoBold.copyWith(
//                                           // color: Color(0xffDBDCE2),
//                                             color: Colors.white,
//                                             fontSize: 20),),
//                                     )
//
//                                 )
//
//
//                               ]
//                           );
//                         },
//                       )
//
//
//
//                     /*     GridView.builder(
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         childAspectRatio: 1
//                       ),
//                       padding: EdgeInsets.zero,
//                       physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 9,
//                       itemBuilder:  (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 6),
//                           child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   color:  Color(0xff424242),
//                                   width: Get.width/2,
//                                   child: CustomImageCached(
//                                     // image: '${Images.carusalimage}}',
//                                     image: '${catagoryimage[index]}',
//                                     height: Get.height/2,
//                                     isRound: false,
//                                     fit: BoxFit.fill,
//
//                                   ),
//                                 ),
//
//                                 Positioned(
//                                     bottom: 5,
//                                     child: Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Text("${categoryName[index]}",
//                                         style: robotoRegular.copyWith(color: Color(0xffDBDCE2), fontSize: 12),),
//                                     )
//
//                                 )
//
//
//                               ]
//                           ),
//                         );
//                       },
//
//                     ),*/
//
//
//
//
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 12),
//
//
//  /// 11th SHOP Affordable Items By Category slider part
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
//                       child: Text("Affordable Items", style: titl.copyWith(fontSize: 25),),
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
//                           return Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   color:  Color(0xff424242),
//                                   // width: Get.width/3.2,
//                                   child: CustomImageCached(
//                                     // image: '${Images.carusalimage}}',
//                                     image: '${brandimage[index]}',
//                                     height: Get.height/4.2,
//                                     isRound: false,
//                                     fit: BoxFit.fill,
//
//                                   ),
//                                 ),
//
//                                 Positioned(
//                                     bottom: 15,
//                                     child: Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Text("${brandName[index]}",
//                                         style: robotoBold.copyWith(
//                                           // color: Color(0xffDBDCE2),
//                                             color: Colors.white,
//                                             fontSize: 18),),
//                                     )
//
//                                 )
//
//
//                               ]
//                           );
//                         },
//                       )
//
//
//
//                     /*     GridView.builder(
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         childAspectRatio: 1
//                       ),
//                       padding: EdgeInsets.zero,
//                       physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 9,
//                       itemBuilder:  (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 6),
//                           child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   color:  Color(0xff424242),
//                                   width: Get.width/2,
//                                   child: CustomImageCached(
//                                     // image: '${Images.carusalimage}}',
//                                     image: '${catagoryimage[index]}',
//                                     height: Get.height/2,
//                                     isRound: false,
//                                     fit: BoxFit.fill,
//
//                                   ),
//                                 ),
//
//                                 Positioned(
//                                     bottom: 5,
//                                     child: Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Text("${categoryName[index]}",
//                                         style: robotoRegular.copyWith(color: Color(0xffDBDCE2), fontSize: 12),),
//                                     )
//
//                                 )
//
//
//                               ]
//                           ),
//                         );
//                       },
//
//                     ),*/
//
//
//
//
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//
//
//  ///  12th image part
//           InkWell(
//             onTap: (){
//               showCustomSnackBar("Click The Button...");
//             },
//             child: Container(
//               color: Color(0xffFAFBFB),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
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
//
//  ///  13th image part
//           InkWell(
//             onTap: (){
//               showCustomSnackBar("Click The Button...");
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
//  ///14th MoST POPULAR SHOP slider part
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
//                       child: Text("Most Popular", style: titl.copyWith(fontSize: 25),),
//                     ),
//                     Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
//                   ],
//
//                 ),
//                 SizedBox(height: 15),
//                 Container(
//                   // color: Colors.red,
//                   height: Get.height/2.45,
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
//                           child: Stack(
//                               alignment: Alignment.topRight,
//                               children: [
//                                 InkWell(
//                                   highlightColor: Colors.grey,
//                                   splashColor: Colors.grey,
//                                   // focusColor: Colors.green,
//                                   // hoverColor: Colors.blue,
//                                   onTap: (){
//                                     showCustomSnackBar("Click Shop Cart");
//                                   },
//                                   child: Container(
//                                     // color:  Colors.cyan,
//                                     color: Color(0xffFAFAFC),
//                                     width: Get.width/2.7,
//                                     child: Column(
//
//                                         children: [
//
//                                           Container(
//                                             // color:  Color(0xff424242),
//                                             // color:  Colors.blue,
//                                             width: Get.width/2.7,
//                                             child: Stack(
//                                                 alignment: Alignment.topCenter,
//                                                 children: [
//                                                   CustomImageCached(
//                                                     // image: '${Images.carusalimage}}',
//                                                     image: '${catagorysliderimage[index]}',
//                                                     height: Get.height/3.2,
//                                                     isRound: false,
//                                                     fit: BoxFit.fill,
//
//                                                   ),
//                                                   Positioned(
//                                                       bottom: 0,
//                                                       child: Align(
//                                                         alignment: Alignment.bottomCenter,
//                                                         child: Container(
//                                                           /// orginal color
//                                                           // color: Color(0xffF2F2F2),
//                                                           color: Colors.grey.shade400,
//                                                           child: Padding(
//                                                             padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
//                                                             child: Text("New Season".toUpperCase(),
//                                                               style: robotoRegular.copyWith(color: Colors.black, fontSize: 9),),
//                                                           ),
//                                                         ),
//                                                       )
//
//                                                   )
//                                                 ]
//                                             ),
//                                           ),
//                                           SizedBox(height: 12),
//
//
//                                           Text("${categorysliderName[index]}",
//                                             style: acme.copyWith( fontSize: 12),),
//                                           SizedBox(height: 7),
//
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(horizontal: 4),
//                                             child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
//                                               overflow: TextOverflow.ellipsis,
//                                               maxLines: 1,
//                                               style: acme.copyWith( fontWeight: FontWeight.w100, fontSize: 11),),
//                                           ),
//                                           SizedBox(height: 7),
//
//                                           Text("100 BDT",
//                                             style: acme.copyWith( color: Color(0xffB56D4D), fontSize: 12),),
//
//                                         ]
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 10,
//                                   right: 10,
//                                   child: Align(
//                                     alignment: Alignment.topRight,
//                                     child: Icon(Icons.favorite_border, color: Colors.grey),
//                                   ),
//                                 ),
//                               ]
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
// ///  Bottom Banner1 part
//           InkWell(
//             onTap: (){
//               showCustomSnackBar("Click The Button...");
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
//           // SizedBox(height: 20),
//
// ///  BOTTOM BANNER2 image part
//           InkWell(
//             onTap: (){
//               showCustomSnackBar("Click The Button...");
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
//           SizedBox(height: 20),
//
// /// Bottom BOX Part
//           Padding(
//             padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
//             child: Container(
//               // color: Colors.deepPurple,
//               width: Get.width,
//               decoration: BoxDecoration(
//                 // color: Colors.deepPurple,
//                   borderRadius: BorderRadius.circular(0),
//                   border: Border.all(color: Colors.grey)),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: 0, left: 8, right: 8,bottom: 4),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                         height: 100,
//                         width: 100,
//                         child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo.b894c686.jpeg&w=1080&q=75")),
//                     Text("Enjoy exclusive rewards and member-only offers.", style: TextStyle(fontSize: Dimensions.fontSizeDefault)),
//                     SizedBox(height: 15),
//                     ElevatedButton(
//                       // style: raisedButtonStyle,
//                       style: ElevatedButton.styleFrom(primary: Color(0xff2D2D2D)),
//                       onPressed: () {
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                         child: Text('Shop Now'.toUpperCase(), style: robotoRegular.copyWith(fontSize: 12.5),),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     SizedBox(
//                         width: Get.width,
//                         height: Get.height/4,
//                         child: Image.network("https://i.ibb.co/BfmvVBh/dsk-kw-en-WK19.png")),
//
//                     SizedBox(height: 15),
//                     Text("Get 10% Off Your First App Order", style: titl.copyWith(fontSize: 18.5)),
//                     SizedBox(height: 8),
//                     Text("Enter code APP10 at checkout", style: titl.copyWith(fontSize: 17.5)),
//
//                     Row(children: [
//                       Expanded(
//                         child: SizedBox(
//                          /*   height: 80,
//                             width: 80,*/
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 30, right: 30),
//                               child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fapp-store-logo-app-store-icon-white-11562871464udagr53bau.b80a6763.png&w=384&q=75"),
//                             )),
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           height: 80,
//                           width: 80,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 30, right: 30),
//                               child: Image.asset(Images.playstore),
//                             )),
//                       ),     ],)
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 35),
//
// /// Footer part
//           Container(
//             color: Color(0xff11253D),
//             height: Get.height,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
//               child: Column(
//                 children: [
//
//                   Text("SUBSCRIBE TO OUR NEWSLETTER".toUpperCase(), style: robotoMedium.copyWith(color: Colors.white,fontSize: 14)),
//                   SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Row(
//                       children: [
//
//                         Expanded(
//                           flex: 5,
//                           child: CustomOnlyTextFieldWithBorder(
//                               controller: subscribeCtr,
//                               focusNode: subscribeFcs,
//                             hintText: "Enter your email Address here",
//                             color: Colors.grey,
//
//                           ),
//                         ),
//
//                         Expanded(
//                           flex: 2,
//                           child: ElevatedButton(
//                             style: TextButton.styleFrom(
//                               // primary: Color(0xff2D2D2D)
//                               //   primary: Colors.white,
//                               backgroundColor: Colors.white,
//                               shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
//                             ),
//                             onPressed: () {
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 5, right: 5, top: 10.8, bottom: 10.5),
//                               child: Text('Subscribe'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black,fontSize: 12.5),),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   Text("Follow Isle".toUpperCase(), style: robotoMedium.copyWith(color: Colors.white,fontSize: 14)),
//                   SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       children: [
//
//                         Expanded(
//                           // flex: 5,
//                           child: SizedBox(
//                               height: Get.height/30,
//                               width: Get.width/30,
//                               child: Image.asset(Images.facebook)),
//                         ),
//
//                         Expanded(
//                           // flex: 5,
//                           child: SizedBox(
//                               height: Get.height/30,
//                               width: Get.width/30,
//                               child: Image.asset(Images.instagram)),
//                         ),
//                         Expanded(
//                           // flex: 5,
//                           child: SizedBox(
//                               height: Get.height/17,
//                               width: Get.width/30,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 15),
//                                 child: Image.asset(Images.youtube),
//                               )),
//                         ),
//                         Expanded(
//                           // flex: 5,
//                           child: SizedBox(
//                               height: Get.height/30,
//                               width: Get.width/30,
//                               child: Image.asset(Images.linkedin)),
//                         ),
//                         Expanded(
//                           // flex: 5,
//                           child: SizedBox(
//                               height: Get.height/30,
//                               width: Get.width/30,
//                               child: Image.asset(Images.tiktok)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//
//
//
//                   Padding(
//                     padding: const EdgeInsets.only(left: 5,right: 5),
//                     child: InkWell(
//                       onTap: (){
//                         widget.isExpanded1=! widget.isExpanded1;
//                         setState(() {
//                         });
//                       },
//                       child: Container(
//                         color: Color(0xff20243D),
//                         height: 45,
//                         width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 4,
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Top Brands".toUpperCase(),
//                                       style: robotoMedium.copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white60,
//                                       ),
//                                     ),
//                                   ],
//                                 ),),
//                               Expanded(
//                                   flex: 1,
//                                   child: Icon(Icons.arrow_drop_down_sharp,
//                                     color: Colors.white60,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   widget.isExpanded1? Container(
//                     // color: Colors.red,
//                     padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Aarong",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Sailor",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Yellow",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Nike",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                         //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                       ],
//                     ),
//                   ):Container(),
//
//                   Padding(
//                     padding: const EdgeInsets.only(left: 5,right: 5),
//                     child: InkWell(
//                       onTap: (){
//                         widget.isExpanded2=! widget.isExpanded2;
//                         setState(() {
//                         });
//                       },
//                       child: Container(
//                         color: Color(0xff20243D),
//                         height: 45,
//                         width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 4,
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Customer Care".toUpperCase(),
//                                       style: robotoMedium.copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white60,
//                                       ),
//                                     ),
//                                   ],
//                                 ),),
//                               Expanded(
//                                   flex: 1,
//                                   child: Icon(Icons.arrow_drop_down_sharp,
//                                     color: Colors.white60,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   widget.isExpanded2? Container(
//                     // color: Colors.red,
//                     padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny1');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Contact us",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny1');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "FAQ",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny1');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Order & Delivery",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny1');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Returns & Refunds",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny1');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Payment & Pricing",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny1');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Track Order",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                       ],
//                     ),
//                   ):Container(),
//
//                   Padding(
//                     padding: const EdgeInsets.only(left: 5,right: 5),
//                     child: InkWell(
//                       onTap: (){
//                         widget.isExpanded3=! widget.isExpanded3;
//                         setState(() {
//                         });
//                       },
//                       child: Container(
//                         color: Color(0xff20243D),
//                         height: 45,
//                         width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 4,
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Company".toUpperCase(),
//                                       style: robotoMedium.copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white60,
//                                       ),
//                                     ),
//                                   ],
//                                 ),),
//                               Expanded(
//                                   flex: 1,
//                                   child: Icon(Icons.arrow_drop_down_sharp,
//                                     color: Colors.white60,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   widget.isExpanded3? Container(
//                     // color: Colors.red,
//                     padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny3');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "About us",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny3');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Career",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny3');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Legal",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny3');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Terms & Condition",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny3');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Privecy & Cookies Policy",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny3');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Want to collaborate?",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                       ],
//                     ),
//                   ):Container(),
//
//                   Padding(
//                     padding: const EdgeInsets.only(left: 5,right: 5),
//                     child: InkWell(
//                       onTap: (){
//                         widget.isExpanded4=! widget.isExpanded4;
//                         setState(() {
//                         });
//                       },
//                       child: Container(
//                         color: Color(0xff20243D),
//                         height: 45,
//                         width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 4,
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "Quick Link".toUpperCase(),
//                                       style: robotoMedium.copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white60,
//                                       ),
//                                     ),
//                                   ],
//                                 ),),
//                               Expanded(
//                                   flex: 1,
//                                   child: Icon(Icons.arrow_drop_down_sharp,
//                                     color: Colors.white60,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   widget.isExpanded4? Container(
//                     // color: Colors.red,
//                     padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny4');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Size guide",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny4');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "Care guide",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: (){
//                             // Get.to(AssesmentForm(grade: "1"));
//                             // Get.toNamed(RouteHelper.getAssessmentRoute("${controller.assessmentGrades![index].id.toString()}"));
//                             showCustomSnackBar('Sunny4');
//                           },
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             //  color: Colors.green,
//                             height: 45,
//                             width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "How to shop",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white60
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(children: [
//                             SizedBox(
//                                 width: 8,
//                                 child: CircleAvatar(backgroundColor: Colors.white60, radius: 10)),
//                             SizedBox(width: 8),
//                             Text("How to find items", style: robotoRegular.copyWith(color: Colors.white60),)
//                           ],),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(children: [
//                             SizedBox(
//                                 width: 8,
//                                 child: CircleAvatar(backgroundColor: Colors.white60, radius: 10)),
//                             SizedBox(width: 8),
//                             Text("How to order & Pay", style: robotoRegular.copyWith(color: Colors.white60),)
//                           ],),
//                         ),
//                         SizedBox(height: 8),
//                         Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                       ],
//                     ),
//                   ):Container(),
//
//
//                   SizedBox(height: 20),
//               /*    SizedBox(height: 30),
//                   Text("Isle Apps".toUpperCase(), style: robotoMedium.copyWith(color: Colors.white,fontSize: 15)),
//                   SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: SizedBox(
//                         height: 50,
//                         width: 160,
//                         child: Image.asset(Images.playstore)),
//                   ),*/
//                   SizedBox(height: 8),
//                   Text("Customer care", style: aaaaaaaa.copyWith(fontWeight: FontWeight.w200,color: Colors.white,fontSize: 22)),
//                   SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Row(
//                       children: [
//
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Container(
//                               height: Get.height/9.5,
//                               // width: 120,
//                               decoration:  BoxDecoration(
//                               color: Color(0xff20243D),
//                               // color: Colors.pink,
//                               borderRadius: BorderRadius.circular(8)
//                   ),
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(15),
//                                   child: Column(
//                                     children: [
//                                       // Image.asset(Images.facebook),
//                                       Icon(Icons.call, color: Colors.white, size: 32,),
//                                       SizedBox(height: 5),
//                                       Text("Call us", style: robotoRegular.copyWith(color: Colors.white,fontSize: 11),)
//                                     ],
//                                   ),
//                                 )),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Container(
//                                 height: Get.height/9.5,
//                                 // width: 120,
//                                 decoration:  BoxDecoration(
//                                   color: Color(0xff20243D),
//                                     // color: Colors.pink,
//                                     borderRadius: BorderRadius.circular(8)
//                                 ),
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(15),
//                                   child: Column(
//                                     children: [
//                                       Image.asset(Images.whatsapp, height: 32, width: 32),
//                                       // Icon(Icons.call, color: Colors.white, size: 35,),
//                                       SizedBox(height: 5),
//                                       Text("WhatsApps", style: robotoRegular.copyWith(color: Colors.white,fontSize: 11),)
//                                     ],
//                                   ),
//                                 )),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Container(
//                                 height: Get.height/9.5,
//                                 // width: 120,
//                                 decoration:  BoxDecoration(
//                                   color: Color(0xff20243D),
//                                     // color: Colors.pink,
//                                     borderRadius: BorderRadius.circular(8)
//                                 ),
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(15),
//                                   child: Column(
//                                     children: [
//                                       Image.asset(Images.email, height: 32, width: 32, color: Colors.white,),
//                                       // Icon(Icons.call, color: Colors.white, size: 35,),
//                                       SizedBox(height: 5),
//                                       Text("E-mail", style: robotoRegular.copyWith(color: Colors.white,fontSize: 11),)
//                                     ],
//                                   ),
//                                 )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 40),
//
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Color(0xffF7F7F7),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Image.network("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo.b894c686.jpeg&w=1080&q=75"),
//                     ),
//
//                     // backgroundImage: NetworkImage("https://isle.vercel.app/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flogo.b894c686.jpeg&w=1080&q=75"),
//                   ),
//                   SizedBox(height: 20),
//                   Text("THE DEFINITIVE HOME OF LUXURY", style: aaaaaaaa.copyWith(fontWeight: FontWeight.w200,color: Colors.white,fontSize: 12)),
//
//                   SizedBox(height: 10),
//                   Text("The FMC-CBN JV initiative 2024. All Rights Reserved", style: aaaaaaaa.copyWith(fontWeight: FontWeight.w200,color: Colors.white,fontSize: 12)),
//
//
//
//
//
//                 ],
//               ),
//             ),
//           ),
//
//
//
//
//
//
//
//
//
//       // SizedBox(height: 500)
//
//         ],
//       ),
//     ),);
//   }
// }
