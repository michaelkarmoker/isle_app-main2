// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
// import 'package:isletestapp/util/HexColor.dart';
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
// import 'package:isletestapp/view/screens/kids/kid_page.dart';
// import 'package:isletestapp/view/screens/wish_list/similar_product_popup.dart';
// import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
//
// class Men extends StatefulWidget {
//   final String  pageId;
//   final MainPageController controller;
//
//   const Men({Key? key, required this.controller, required this.pageId}) : super(key: key);
//
//   @override
//   State<Men> createState() => _MenPageState();
// }
//
// class _MenPageState extends State<Men> {
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
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Get.find<MainPageController>().getTopSliderData(widget.pageId);
//       Get.find<MainPageController>().getHomePageAllData(widget.pageId);
//
//     });
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
//                                 style: railway.copyWith(color: Color(0xffCCCCCC), fontSize: 12),
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
//     scrollDirection: Axis.horizontal,
//     itemCount: widget.controller.lovingBrandResponse!.data!.length,
//     itemBuilder: (context, index) {
//       return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//             children: [
//               Transform.translate(
//                 offset: Offset(position * MediaQuery.of(context).size.width, 0),
//                 child: CustomImageCached(
//                   isRound: false,
//                   image: '${AppConstants.BASE_URL}${widget.controller.lovingBrandResponse!.data![index].logo ?? ""}',
//                   // fit: BoxFit.fitHeight,
//                   height: 60, width: 80,
//                   fit: BoxFit.contain,
//                   // height: Get.height/5.5,
//                 ),
//               ),
//             ],
//         ),
//       );
//     }
//               ),
//             ),
//           )
//           :
//           SizedBox(child: Text("no-data"),):SizedBox(),
//
//           SizedBox(height: 5),
//
//           ///Top CARUSAL
//           widget.controller.homeSliderResponse!= null?  widget.controller.homeSliderResponse!.data!.length!>0?
//           Padding(
//             padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
//             child: Container(
//               // color: Colors.teal,
//               height: Get.height /1.8,
//               child: CarouselSlider.builder(
//                 itemCount: widget.controller.homeSliderResponse?.data?.length,
//                 itemBuilder: (BuildContext context, int index, _){
//                   return  InkWell(
//                     onTap: () {
//                       Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                     },
//                     child: Container(
//                       // decoration: BoxDecoration(
//                       //   borderRadius: BorderRadius.circular(0),
//                       // ),
//                       child: CustomImageCached(
//                         isRound: false,
//                         image: '${AppConstants.BASE_URL}${widget.controller.homeSliderResponse?.data?[index]?.banner ?? ""}',
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
//                   reverse: false,
//                   aspectRatio: 10 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//
//                   // autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   viewportFraction: 1,
//                 ),
//               ),
//             ),
//           ) : SizedBox() : Text("no-data"),
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
//                 image: '${AppConstants.BASE_URL}${widget.controller.topHomeBannerResponse?.data?[0]?.banner ?? ""}',
//                 height: Get.height/5,
//                 isRound: false,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           // SizedBox(height: 8),
//
//           /// all section start
//           widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data!= null ?
//
//           ListView.builder(
//             padding: EdgeInsets.zero,
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: widget.controller.homePageAllDataResponse?.data?.length,
//               // itemCount: 1,
//               itemBuilder: (context, index) {
//                 // Questions questions = controller.questions![index];
//                 return Padding(
//                   padding: const EdgeInsets.only(left: 0,top:0,right: 0,),
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       /// isle pick
//                       widget.controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.ILEPICKS?
//                   Column(
//                     children: [
//                       InkWell(
//                           onTap: (){
//                 Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                 },
//                       child: Container(
//                         color: Color(0xffFAFBFB),
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
//                           child: Column(
//                             children: [
//                               SizedBox(height: 8),
//                               CustomImageCached(
//                                 // image: '${Images.carusalimage}}',
//                                 image: '${AppConstants.BASE_URL}${widget.controller.homePageAllDataResponse?.data?[index]?.banner ?? ""}',
//                                 height: Get.height/3.5,
//                                 isRound: false,
//                                 fit: BoxFit.fill,
//                               ),
//                               SizedBox(height: 15),
//                               Text("${widget.controller.homePageAllDataResponse?.data?[index]?.title??""}".toUpperCase(), style:  railway.copyWith(fontSize: 17, color: Color(0xff000000) ),),
//                               SizedBox(height: 12),
//                               Text("${widget.controller.homePageAllDataResponse?.data?[index]?.shortDescription??""}", style: railway.copyWith(fontSize: 11, color: Color(0xff000000)),),
//                               SizedBox(height: 15),
//
//                               widget.controller.homePageAllDataResponse?.data?[index]?.buttonTxt != null?
//                               ElevatedButton(
//                                 // style: raisedButtonStyle,
//                                 // style: ElevatedButton.styleFrom(primary: HexColor("${widget.controller.mainPageDataResponse?.data?[index]?.activeBgBtnColor??""}")),
//                                 style: ElevatedButton.styleFrom(primary: HexColor("#0b1d65")),
//                                 onPressed: () {
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                                   child: Text('${widget.controller.homePageAllDataResponse?.data?[index]?.buttonTxt??""}'.toUpperCase(), style: railway.copyWith(fontSize: 12.5),),
//                                 ),
//                               ) : SizedBox()
//
//                             ],
//                           ),
//                         ),
//                       ),
//                 ),
//
//                       ///  Categories part
//                       widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                       SizedBox(
//                         height: 32,
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                               child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,) ),
//                             ),
//                           ],
//                         ),) : SizedBox(),
//                       widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                       SizedBox(
//                         height: Get.height/5,
//                         // width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8, right: 8),
//                           child: ListView.builder(
//                             padding: EdgeInsets.zero,
//                             // physics: NeverScrollableScrollPhysics(),
//                             physics: ClampingScrollPhysics(),
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                             itemBuilder:  (BuildContext context, int index2) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                   },
//                                   child: Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         Container(
//                                           color:  Color(0xff424242),
//                                           width: Get.width/3.2,
//                                           child: CustomImageCached(
//                                             // image: '${Images.carusalimage}}',
//                                             image: '${AppConstants.BASE_URL}${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                             height: Get.height/2,
//                                             isRound: false,
//                                             fit: BoxFit.fill,
//
//                                           ),
//                                         ),
//
//                                         Positioned(
//                                             bottom: 8,
//                                             child: Align(
//                                               alignment: Alignment.bottomCenter,
//                                               child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title??""}",
//                                                 style: railway.copyWith(
//                                                   // color: Color(0xffDBDCE2),
//                                                     color: Colors.white,
//                                                     fontSize: 12),),
//                                             )
//                                         )
//                                       ]
//                                   ),
//                                 ),
//                               );
//                             },
//
//                           ),
//                         ),
//                       )
//                       : SizedBox(),
//
//                       SizedBox(height: 20),
//                     ],
//                   ) : SizedBox(),
//
//
//                       /// discover brand
//                       widget.controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.DISCOVERBRAND?
//                       Column(
//                         children: [
//
//                           SizedBox(height: 12),
//                           widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                           SizedBox(
//                             height: 32,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                                   child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,)),
//                                 ),
//                               ],
//                             ),) : SizedBox(),
//                           widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                           SizedBox(
//                             height: Get.height/5,
//                             // width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 8, right: 8),
//                               child: ListView.builder(
//                                 padding: EdgeInsets.zero,
//                                 // physics: NeverScrollableScrollPhysics(),
//                                 physics: ClampingScrollPhysics(),
//                                 shrinkWrap: true,
//                                 scrollDirection: Axis.horizontal,
//                                 // itemCount: widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2],
//                                 itemCount: widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                 itemBuilder:  (BuildContext context, int index2) {
//                                   return Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                                     child: InkWell(
//                                       onTap: () {
//                                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                       },
//                                       child: Stack(
//                                           alignment: Alignment.center,
//                                           children: [
//                                             Container(
//                                               color:  Color(0xff424242),
//                                               width: Get.width/3.2,
//                                               child: CustomImageCached(
//                                                 // image: '${Images.carusalimage}}',
//                                                 image: '${AppConstants.BASE_URL}${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                 height: Get.height/2,
//                                                 isRound: false,
//                                                 fit: BoxFit.fill,
//
//                                               ),
//                                             ),
//
//                                             Positioned(
//                                                 bottom: 0,
//                                                 child: Container(
//                                                   color: Color(0xffF2F2F2).withOpacity(0.5),
//                                                   child: Padding(
//                                                     padding: EdgeInsets.only(left: Get.width, right: Get.width, top: 5, bottom: 6),
//                                                     child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title??""}".toUpperCase(),
//                                                       style: railway.copyWith(
//                                                         // color: Color(0xffDBDCE2),
//                                                           color: Colors.black54,
//                                                           fontWeight: FontWeight.w600,
//                                                           // color: Colors.grey,
//                                                           fontSize: 11),),
//                                                   ),
//                                                 )
//
//                                             )
//
//
//                                           ]
//                                       ),
//                                     ),
//                                   );
//                                 },
//
//                               ),
//                             ),
//                           )
//                               : SizedBox(),
//
//                           SizedBox(height: 25),
//                         ],
//                       ) : SizedBox(),
//
//      /// discover trend
//       widget.controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.DISCOVERTREND?
//            ListView.builder(
//              itemCount: widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                shrinkWrap: true,
//                physics: NeverScrollableScrollPhysics(),
//
//                itemBuilder: ( BuildContext context, int index2 ) {
//                return  Column(
//                  children: [
//                    widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                    Padding(
//                      padding: const EdgeInsets.all(12),
//                      child: Row(
//                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        // crossAxisAlignment: CrossAxisAlignment.end,
//                        children: [
//
//                          Expanded(
//                              child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                          SizedBox(width: 15),
//                          Expanded(
//                              child: Center(child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: 20 ),))),
//                          SizedBox(width: 8),
//                          Expanded(
//                              child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                        ],
//
//                      ),
//                    ) : SizedBox(),
//
//                    InkWell(
//                      onTap: (){
//                        Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                      },
//                      child: Container(
//                        color: Color(0xffFAFBFB),
//                        child: Padding(
//                          padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
//                          child: Column(
//                            children: [
//                              SizedBox(height: 8),
//                              CustomImageCached(
//                                // image: '${Images.carusalimage}}',
//                                image: '${AppConstants.BASE_URL}${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                height: Get.height/3.5,
//                                isRound: false,
//                                fit: BoxFit.fill,
//                              ),
//                              SizedBox(height: 15),
//                              Text("${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title ??""}".toUpperCase(), style:  railway.copyWith(fontSize: 17, color: Color(0xff000000) ),),
//                              SizedBox(height: 12),
//                              Text("${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.shortDescription??""}", style: railway.copyWith(fontSize: 11, color: Color(0xff000000)),),
//                              SizedBox(height: 15),
//
//                              ElevatedButton(
//                                // style: raisedButtonStyle,
//                                style: ElevatedButton.styleFrom(primary: mencolor),
//                                onPressed: () {
//                                },
//                                child: Padding(
//                                  padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12),
//                                  child: Text('${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.buttonTxt??""}'.toUpperCase(), style: railway.copyWith(fontSize: 12.5),),
//                                ),
//                              )
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                    SizedBox(height: 20),
//                  ],
//                );
//                }
//            )
//           : SizedBox(),
//
//    /// shop By category slider part
//                       widget.controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.SHOPBYCATEGORY?
//                       Column(
//                         children: [
//                           widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                           SizedBox(
//                             height: 32,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                                   child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,) ),
//                                 ),
//                               ],
//                             ),) : SizedBox(),
//                           widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                           SizedBox(
//                             height: Get.height/5,
//                             // width: Get.width,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 8, right: 8),
//                               child: ListView.builder(
//                                 padding: EdgeInsets.zero,
//                                 // physics: NeverScrollableScrollPhysics(),
//                                 physics: ClampingScrollPhysics(),
//                                 shrinkWrap: true,
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                 itemBuilder:  (BuildContext context, int index2) {
//                                   return Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 2.5),
//                                     child: InkWell(
//                                       onTap: () {
//                                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                       },
//
//                                       child: Stack(
//                                           alignment: Alignment.center,
//                                           children: [
//                                             Container(
//                                               color:  Color(0xff424242),
//                                               width: Get.width/3.2,
//                                               child: CustomImageCached(
//                                                 // image: '${Images.carusalimage}}',
//                                                 image: '${AppConstants.BASE_URL}${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                 height: Get.height/2,
//                                                 isRound: false,
//                                                 fit: BoxFit.fill,
//
//                                               ),
//                                             ),
//
//                                             Positioned(
//                                                 bottom: 8,
//                                                 child: Align(
//                                                   alignment: Alignment.bottomCenter,
//                                                   child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title??""}",
//                                                     style: railway.copyWith(
//                                                       // color: Color(0xffDBDCE2),
//                                                         color: Colors.white,
//                                                         fontSize: 12),),
//                                                 )
//
//                                             )
//
//
//                                           ]
//                                       ),
//                                     ),
//                                   );
//                                 },
//
//                               ),
//                             ),
//                           )
//                               : SizedBox(),
//                         ],
//                       ) : SizedBox(),
//                       SizedBox(height: 8),
//
//    /// luxury
//                       widget.controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.LUXURY?
//                           Column(
//                             children: [
//                               widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                               Padding(
//                                 padding: const EdgeInsets.all(12),
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   // crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Expanded(
//                                         child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                                     SizedBox(width: 15),
//                                     Expanded(
//                                         child: Center(child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.title??""}".toUpperCase(), style: railway.copyWith(fontSize: 20 ),))),
//                                     SizedBox(width: 8),
//                                     Expanded(
//                                         child: Divider(color: Colors.black, thickness: 1, height: 1,)),
//                                   ],
//                                 ),
//                               ) : SizedBox(),
//                               widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
//                                 child: Container(
//                                   // color: Colors.red,
//                                   height: Get.height/2.6,
//                                   // width: Get.width,
//                                   child: Padding(
//                                       padding: const EdgeInsets.only(left: 0, right: 0),
//                                       child:
//                                       GridView.builder(
//                                         itemCount: widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                         scrollDirection: Axis.horizontal,
//                                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 1,
//                                             crossAxisSpacing: 0,
//                                             mainAxisSpacing: 10,
//                                             // childAspectRatio: 1,
//                                             mainAxisExtent: Get.width
//                                         ),
//                                         itemBuilder: (BuildContext context, int index2){
//                                           return InkWell(
//                                             onTap: () {
//                                               Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                             },
//                                             child: Stack(
//                                                 alignment: Alignment.center,
//                                                 children: [
//                                                   Container(
//                                                     color:  Color(0xff424242),
//                                                     // width: Get.width/3.2,
//                                                     child: CustomImageCached(
//                                                       // image: '${Images.carusalimage}}',
//                                                       // image: '${catagoryimage[index]}',
//                                                       image: '${AppConstants.BASE_URL}${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                       height: Get.height/2,
//                                                       width: Get.width,
//                                                       isRound: false,
//                                                       fit: BoxFit.fill,
//
//                                                     ),
//                                                   ),
//
//                                                   Positioned(
//                                                       bottom: 30,
//                                                       child: Align(
//                                                         alignment: Alignment.bottomCenter,
//                                                         child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title ?? ""}",
//                                                           // child: Text("${categoryName[index]}",
//                                                           style: railway.copyWith(
//                                                             // color: Color(0xffDBDCE2),
//                                                               color: Colors.white,
//                                                               fontSize: 20),),
//                                                       )
//
//                                                   )
//
//
//                                                 ]
//                                             ),
//                                           );
//                                         },
//                                       )
//                                   ),
//                                 ),
//                               )
//                                   : SizedBox(),
//                             ],
//                           ) : SizedBox(),
//                       SizedBox(height: 8),
//
//    /// affordable
//                       widget.controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.AFFORDABLEITEM?
//                       Column(
//                         children: [
//                           widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                           SizedBox(
//                             height: 32,
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                                   child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,) ),
//                                 ),
//                               ],
//                             ),) : SizedBox(),
//                           widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                           Container(
//                             // color: Colors.red,
//                             height: Get.height/4.2,
//                             // width: Get.width,
//                             child: Padding(
//                                 padding: const EdgeInsets.only(left: 7, right: 0),
//                                 child:
//                                 GridView.builder(
//                                   itemCount: widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                                   scrollDirection: Axis.horizontal,
//                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 1,
//                                       crossAxisSpacing: 0,
//                                       mainAxisSpacing: 10,
//                                       childAspectRatio: 1
//                                   ),
//                                   itemBuilder: (BuildContext context, int index2 ){
//                                     return InkWell(
//                                       onTap: () {
//                                         Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                       },
//                                       child: Stack(
//                                           alignment: Alignment.center,
//                                           children: [
//                                             Container(
//                                               color:  Color(0xff424242),
//                                               // width: Get.width/3.2,
//                                               child: CustomImageCached(
//                                                 image: '${AppConstants.BASE_URL}${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                                 // image: '${catagoryimage[index]}',
//                                                 height: Get.height/4.2,
//                                                 isRound: false,
//                                                 fit: BoxFit.fill,
//
//                                               ),
//                                             ),
//                                             Positioned(
//                                                 bottom: 15,
//                                                 child: Align(
//                                                   alignment: Alignment.bottomCenter,
//                                                   child: Text("${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.title??""}",
//                                                     // child: Text("${brandName[index]}",
//                                                     style: railway.copyWith(
//                                                       // color: Color(0xffDBDCE2),
//                                                         color: Colors.white,
//                                                         fontSize: 18),),
//                                                 )
//                                             )
//
//
//                                           ]
//                                       ),
//                                     );
//                                   },
//                                 )
//                             ),
//                           )
//                               : SizedBox(),
//                         ],
//                       ) : SizedBox(),
//                       SizedBox(height: 8),
//
//
//   /// featured
//                       widget.controller.homePageAllDataResponse?.data?[index]?.sectionType == AppConstants.FEATURED?
//                       ListView.builder(
//                           itemCount: widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?.length,
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//
//                           itemBuilder: ( BuildContext context, int index2 ) {
//                             return  Column(
//                               children: [
//                                 widget.controller.homePageAllDataResponse != null && widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
//                                 InkWell(
//                                   onTap: (){
//                                     Get.to( CustomCategoryViewPage(subCategoryId: '', childCategoryId: '', sectionId: '',  categoryId: '',  page: 0,));
//                                   },
//                                   child: Container(
//                                     color: Color(0xffFAFBFB),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
//                                       child:   CustomImageCached(
//                                         // image: '${Images.carusalimage}}',
//                                         image: '${AppConstants.BASE_URL}${widget.controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2]?.banner ?? ""}',
//                                         height: Get.height/3.5,
//                                         isRound: false,
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                                     : SizedBox(),
//                                 SizedBox(height: 20),
//                               ],
//                             );
//                           }
//                       )
//                           : SizedBox(),
//
//
//
//                     ],
//                   ),
//                 );
//               })
//               : Container(),
//           SizedBox(height: 20),
//
//
//
//
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
//                                       Get.to(Add2CartScreen( cartdetailsimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75', productId: '',));
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
//                                                       image: '${catagorysliderimage[index]}',
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
//           ///  discover LIFESTYLE
//        /*   Row(
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
//                                       Get.to(Add2CartScreen( cartdetailsimage: 'https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75', productId: '',));
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
//                                                       image: '${catagorysliderimage[index]}',
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
//                                               style: caluna.copyWith( color: gold, fontSize: 12),),
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
