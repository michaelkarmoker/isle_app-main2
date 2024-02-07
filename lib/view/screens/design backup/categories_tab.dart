// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/controller/nested%20cat%20subcat/category_page_controller.dart';
// import 'package:isletestapp/util/app_constants.dart';
// import 'package:isletestapp/util/color.dart';
// import 'package:isletestapp/util/constants.dart';
// import 'package:isletestapp/util/images.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/view/base/ProgressHUD.dart';
// import 'package:isletestapp/view/base/custom_Image_cached.dart';
// import 'package:isletestapp/view/base/custom_snackbar.dart';
// import 'package:isletestapp/view/screens/brand_page/brand_view_page.dart';
// import 'package:isletestapp/view/screens/home/home_page.dart';
// import 'package:isletestapp/view/screens/kids/kid_page.dart';
// import 'package:isletestapp/view/screens/main_page/main_screen.dart';
// import 'package:isletestapp/view/screens/search/search_screen.dart';
// import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
// import 'package:isletestapp/view/auth/login-register.dart';
//
// import '../category/product_page.dart';
//
//
// class IsleCategorise extends StatefulWidget {
//   final int selectedCatIndex;
//   final bool isfromDash;
//   bool isExpanded1=false;
//   bool isExpanded2=false;
//   bool isExpanded3=false;
//   bool isExpanded4=false;
//   bool isExpanded5=false;
//   bool isExpanded6=false;
//   bool isExpanded7=false;
//
//
//   bool childexp1=false;
//   bool childexp2=false;
//   bool childexp3=false;
//   bool childexp4=false;
//   bool childexp5=false;
//   bool childexp6=false;
//
//   IsleCategorise({super.key, required this.selectedCatIndex, required this.isfromDash});
//
//
//
//
//   @override
//   State<IsleCategorise> createState() => _IsleDrawerState();
// }
//
// class _IsleDrawerState extends State<IsleCategorise> {
//   Color tabColor= gold;
//
//   Color button1Color = gold;
//   Color button2Color = gold;
//   Color button3Color = gold;
//
//   void changeColor(int buttonNumber) {
//     setState(() {
//       switch (buttonNumber) {
//         case 1:
//           button1Color = gold;
//           button2Color = gold;
//           button3Color = gold;
//           break;
//         case 2:
//           button1Color = gold;
//           button2Color = gold;
//           button3Color = gold;
//           break;
//         case 3:
//           button1Color = gold;
//           button2Color = gold;
//           button3Color = gold;
//           break;
//       }
//     });
//   }
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Get.find<CategoryPageController>().dataInitialize(widget.selectedCatIndex);
//     }
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CategoryPageController>(
//       builder: (controller) {
//         return Container(
//
//           // width: Get.width/1.18,
//           child: DefaultTabController(
//             length: 3,
//             child: SafeArea(
//               child: Scaffold(
//                   appBar: AppBar(
//                   iconTheme: IconThemeData(color: Color(0xff000000)),
//                   titleSpacing: 0,
//                   backgroundColor: Color(0xffFFFFFF),
//                   centerTitle: true,
//                   elevation: 0,
//
//                   actions: [
//                     InkWell(
//                         onTap: (){
//                           Get.to(SearchScreen());
//                         },
//                         // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
//                         child: Image.asset(Images.search, height: 22, width: 22,)),
//                     SizedBox(width: 15),
//                     InkWell(
//                         onTap: (){
//                           Get.to(WishListPage(pageIndex: 0,));
//                         },
//                         child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)),
//
//
//                     SizedBox(width: 10),
//                     /* Padding(
//             padding: const EdgeInsets.only(right: 12,top: 12,bottom: 12, left: 0),
//             child: InkWell(
//                 onTap: (){
//                   // Get.dialog(PopUpMessage());
//                 },
//                 child: Image.asset("${Get.find<LocalizationController>().selectedLanguage==AppConstants.bn?Images.bd:Images.en}")),
//           )*/
//                   ],
//                   leadingWidth: Get.width/3.5,
//                  /* leading: Padding(
//                     padding: const EdgeInsets.only(left: 5),
//                     child: Container(
//                       // color: Colors.pinkAccent,
//                         height: 200,
//                         child:
//
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: InkWell(
//                                 onTap: () {
//                                   Get.to(HomePage());
//                                   changeColor(1);
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text("Men", style: robotoMedium.copyWith(fontSize: 11, color: button1Color),),
//                                     SizedBox(height: 3),
//                                     Container( width: 80, child:  Divider(   height: 1.5,thickness: 1.5, color: button1Color,),),
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 4),
//                             Expanded(
//                               flex: 4,
//                               child: InkWell(
//                                 onTap: () {
//                                   Get.to(WomenPage());
//                                   changeColor(2);
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text("Women", style: robotoMedium.copyWith(fontSize: 11, color: Colors.black54),),
//                                     SizedBox(height: 3),
//                                     Container( width: 80, child:  Divider(   height: 1.5,thickness: 1.5, color: button2Color,),),
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 4),
//                             Expanded(
//                               flex: 2,
//                               child: InkWell(
//                                 onTap: () {
//                                   Get.to(KidPage());
//                                   changeColor(3);
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text("Kids", style: robotoMedium.copyWith(fontSize: 11, color: Colors.black54,),),
//                                     SizedBox(height: 3),
//                                     Container( width: 80, child:  Divider(   height: 1.5,thickness: 1.5, color: button3Color,),),
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 4),
//
//
//
//                           ],
//                         )
//
//                     ),
//                   ),*/
//                   title: Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Get.to(MainScreen());
//                         },
//                         child: Container(
//                           // margin: EdgeInsets.all(15),
//                             padding: EdgeInsets.only(left: 5, right: 5, top: 5,bottom: 5),
//                             // color: Colors.red,
//                             height: 55, width: 75,
//                             child: Image.asset(Images.logo, height: 55, width: 70, fit: BoxFit.fill,)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // backgroundColor: Color(0xffEBEFF3),
//                 backgroundColor: Color(0xffFFFFFF),
//
//                 body:  ProgressHUD(
//                   inAsyncCall: controller.isLoading,
//                   child:
//                       controller.nestedCategoryResponse!=null? controller.nestedCategoryResponse!.data!=null?
//                       Column(
//                     children: [
//
//                       /// Tab Bar Part
//                       Container(
//                         // color: Color(0xffFFFFFF),
//                         height: 40,
//                         child: Container(
//                           // color: tabColor,
//                           // color: Color(0xffFFFFFF),
//                           child: TabBar(
//                             indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
//                               onTap: (index) {
//                                 setState(() {
//
//                                   if(index==0) { tabColor = gold;}
//                                   if(index==1) {tabColor = gold;}
//                                   if(index==2) {tabColor = gold;}
//                                 });
//                                 print(index);
//                               },
//                               indicatorColor: tabColor,
//                               indicatorWeight: 2.5,
//
//                           tabs: [
//                           Tab(
//                           child: Text(
//                             'Men',
//                             style: railway.copyWith(
//                                 color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                           )),
//                       Tab(
//                           child: Text(
//                             'Women',
//                             style: railway.copyWith(
//                                 color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                           )),
//                       Tab(
//                           child: Text(
//                             'Kids',
//                             style: railway.copyWith(
//                                 color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                           )),
//                       ]),
//                         ),
//                       ),
//
//                       Expanded(
//                         child: TabBarView(
//                             children: [
//                               /// 1 st TAB
//                               RefreshIndicator(
//                                   onRefresh: () async{
//                                     // showCustomSnackBar("2");
//                                   },
//                                   child: SingleChildScrollView(
//                                     child:
//
//                                     Column(
//                                       children: [
// /// section
//                                         controller.nestedSectionResponse!= null&&controller.nestedSectionResponse!.data!=null && controller.nestedSectionResponse!.data!.length>0
//                                             ?   ListView.builder(
//                                             itemCount: controller.nestedSectionResponse!.data!.length,
//                                             shrinkWrap: true,
//                                             physics: NeverScrollableScrollPhysics(),
//                                             itemBuilder: (BuildContext context, int index) {
//                                               return Column(
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: (){
//                                                       Get.to(  CustomCategoryViewPage(
//
//                                                         categoryId: "",
//
//
//                                                         page: AppConstants.SECTION,
//                                                         subCategoryId: "",
//                                                         childCategoryId: '',
//                                                         sectionId: controller.nestedSectionResponse!.data![index].id!.toString(),
//
//                                                       ));
//                                                     },
//                                                     child: Container(
//                                                       height: 120,
//                                                       // color: Colors.green,
//
//                                                       child: Row(
//                                                         children: [
//                                                           Expanded(
//                                                               flex: 5,
//                                                               child: Container(
//                                                                 height: 40,
//                                                                 // color: Colors.pinkAccent,
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.only(left: 15),
//                                                                   child: Row(
//                                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     children: [
//                                                                       InkWell(
//                                                                         onTap: () {
//                                                                           controller.nestedSectionResponse!.data![index].isDrop=!controller.nestedSectionResponse!.data![index].isDrop;
//                                                                           setState(() {});
//                                                                         },
//                                                                         child: Container(
//                                                                           height: 40,
//                                                                           child: Center(
//                                                                             child: Text("${controller.nestedSectionResponse!.data![index].title??""}",
//                                                                               style: railway.copyWith(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 16),),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                       InkWell(
//                                                                           onTap : () {
//                                                                             controller.nestedSectionResponse!.data![index].isDrop=!controller.nestedSectionResponse!.data![index].isDrop;
//                                                                             setState(() {
//                                                                             });
//                                                                           },
//                                                                           child: Container(
//                                                                             // color: Colors.purple,
//                                                                               height: 40,
//                                                                               width: 5)),
//
//                                                                       // widget.isExpanded1?
//                                                                       controller.nestedSectionResponse!.data![index].isDrop?
//                                                                       InkWell(
//                                                                         onTap : () {
//                                                                           controller.nestedSectionResponse!.data![index].isDrop=!controller.nestedSectionResponse!.data![index].isDrop;
//                                                                           setState(() {
//                                                                           });
//                                                                         },
//                                                                         child: Container(
//                                                                           height: 40,
//                                                                           // color: Colors. blue,
//                                                                           child: Padding(
//                                                                             padding: const EdgeInsets.only(left: 3),
//                                                                             child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
//                                                                           ),
//                                                                         ),
//                                                                       ):
//                                                                       InkWell(
//                                                                           onTap: () {
//                                                                             controller.nestedSectionResponse!.data![index].isDrop=!controller.nestedSectionResponse!.data![index].isDrop;
//                                                                             setState(() {
//                                                                             });
//                                                                           },
//                                                                           child: Container(
//                                                                               height: 40,
//                                                                               // color: Colors. blue,
//                                                                               child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,))),
//                                                                       // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               )
//                                                           ),
//
//                                                           Expanded(
//                                                               flex: 3,
//                                                               child: Container(
//                                                                   color: Color(0xffFFFFFF),
//                                                                   child: Padding(
//                                                                     padding: const EdgeInsets.only(left: 0),
//                                                                     child: CustomImageCached(
//                                                                       image: '${AppConstants.BASE_URL}${controller.nestedSectionResponse!.data![index].banner?? ""}',
//                                                                       fit: BoxFit.fill,
//                                                                       isRound: false,
//                                                                     ),
//                                                                     // child: Image.network("https://ounass-qa.atgcdn.ae/small_light(of=webp)/pub/media/catalog/category/MW_App_Cat_New_In_WK32.jpg",fit: BoxFit.fill,),
//                                                                   ))
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Divider(
//                                                     height: 3,
//                                                     thickness: 3,
//                                                     color: Color(0xffF2F6F9),
//                                                     // color: Colors.pink,
//                                                   ),
//                                                   // widget.isExpanded1?
//                                                   controller.nestedSectionResponse!.data![index].isDrop?
//                                                   Container(
//                                                     // color: Colors.red,
//                                                     // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                     child: Column(
//                                                       children: [
//                                                         ListView.builder(
//                                                             padding: EdgeInsets.zero,
//                                                             // itemCount: drawerdrop.length,
//                                                             itemCount: controller.nestedSectionResponse!.data![index].children!.length,
//                                                             shrinkWrap: true,
//                                                             scrollDirection: Axis.vertical,
//                                                             physics: ClampingScrollPhysics(),
//                                                             itemBuilder: (BuildContext context, int index2){
//                                                               return  Column(
//                                                                 children: [
//                                                                   Column(
//                                                                     children: [
//                                                                       InkWell(
//                                                                         onTap: (){
//                                                                           Get.to(  CustomCategoryViewPage(
//
//                                                                             categoryId: "",
//
//
//                                                                             page: AppConstants.SUBSECTION,
//                                                                             subCategoryId: "",
//                                                                             childCategoryId: '',
//                                                                             sectionId: controller.nestedSectionResponse!.data![index].children![index2].id!.toString(),
//
//                                                                           ));
//                                                                         },
//                                                                         child: Container(
//                                                                           alignment: Alignment.centerLeft,
//                                                                           color: Color(0xffF2F6F9),
//                                                                           // color: Colors.purpleAccent,
//                                                                           height: 50,
//                                                                           width: Get.width,
//                                                                           child: Padding(
//                                                                             padding: const EdgeInsets.only(left: 30),
//                                                                             child: Row(
//                                                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                               children: [
//                                                                                 Text(
//                                                                                   // "${drawerdrop[index]}",
//                                                                                   "${controller.nestedSectionResponse!.data![index].children![index2].title??""}",
//                                                                                   style: poppins.copyWith(
//                                                                                       fontSize: 12,
//                                                                                       fontWeight: FontWeight.w200,
//                                                                                       color: Colors.black87
//                                                                                   ),
//                                                                                 ),
//                                                                                 SizedBox(width: 5),
//                                                                                 InkWell(
//                                                                                   onTap : () {
//                                                                                     controller.nestedSectionResponse!.data![index].children![index2].isDrop2=!controller.nestedSectionResponse!.data![index].children![index2].isDrop2;
//                                                                                     setState(() {
//                                                                                     });
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     height: 50,
//                                                                                     width: 100,
//                                                                                     // color: Colors.green,
//                                                                                     child: Row(
//                                                                                       mainAxisAlignment: MainAxisAlignment.end,
//                                                                                       children: [
//                                                                                         SizedBox(width: 5),
//                                                                                         // widget.childexp1?
//                                                                                         controller.nestedSectionResponse!.data![index].children![index2].isDrop2 ?
//                                                                                         Padding(
//                                                                                           padding: const EdgeInsets.only(right: 12),
//                                                                                           child: controller.nestedSectionResponse!.data![index].children![index2].children!.length>0?Image.asset(Images.up, color: Colors.black, height: 22, width: 15,): SizedBox(),
//                                                                                         ):
//                                                                                         controller.nestedSectionResponse!.data![index].children![index2].children!.length>0?
//                                                                                         Padding(
//                                                                                           padding: const EdgeInsets.only(right: 12),
//                                                                                           child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                         ): SizedBox(),
//                                                                                         // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//
//                                                                       // widget.childexp1?
//                                                                       controller.nestedSectionResponse!.data![index].children![index2].isDrop2 ?
//                                                                       Container(
//                                                                         // color: Colors.red,
//                                                                         // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                         child: Column(
//                                                                           children: [
//                                                                             ListView.builder(
//                                                                                 padding: EdgeInsets.zero,
//                                                                                 // itemCount: drawerdrop.length,
//                                                                                 itemCount: controller.nestedSectionResponse!.data![index].children![index2].children!.length,
//                                                                                 shrinkWrap: true,
//                                                                                 scrollDirection: Axis.vertical,
//                                                                                 physics: ClampingScrollPhysics(),
//                                                                                 itemBuilder: (BuildContext context, int index3){
//                                                                                   return
//                                                                                     Column(
//                                                                                       children: [
//                                                                                         InkWell(
//                                                                                           onTap: (){
//                                                                                             Get.to(  CustomCategoryViewPage(
//
//                                                                                               categoryId: "",
//
//
//                                                                                               page: AppConstants.CHILDSECTION,
//                                                                                               subCategoryId: "",
//                                                                                               childCategoryId: "",
//                                                                                               sectionId: controller.nestedSectionResponse!.data![index].children![index2].children![index3].id!.toString(),
//
//                                                                                             ));
//                                                                                           },
//                                                                                           child: Container(
//                                                                                             alignment: Alignment.centerLeft,
//                                                                                             color: Color(0xffFAFAFA),
//                                                                                             height: 50,
//                                                                                             width: Get.width,
//                                                                                             child: Padding(
//                                                                                               padding: const EdgeInsets.only(left: 50, right: 12),
//                                                                                               child: Row(
//                                                                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                                 children: [
//
//                                                                                                   Text(
//                                                                                                     // "${drawerdrop[index]}",
//                                                                                                     "${controller.nestedSectionResponse!.data![index].children![index2].children![index3].title??""}",
//                                                                                                     style: poppins.copyWith(
//                                                                                                         fontSize: 12,
//                                                                                                         fontWeight: FontWeight.w200,
//                                                                                                         color: Colors.black87
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 ],
//                                                                                               ),
//                                                                                             ),
//                                                                                           ),
//                                                                                         ),
//                                                                                       ],
//                                                                                     );
//                                                                                 }
//
//                                                                             ),
//                                                                             // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                           ],
//                                                                         ),
//                                                                       ):Container(),
//
//                                                                     ],
//                                                                   ),
//
//                                                                 ],
//                                                               );
//                                                             }
//                                                         ),
//                                                         // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                       ],
//                                                     ),
//                                                   ):Container(),
//                                                 ],
//                                               );
//                                             }
//                                         ): Text(""),
//
//
//      /// category
//                                         controller.nestedCategoryResponse!= null&&controller.nestedCategoryResponse!.data!=null && controller.nestedCategoryResponse!.data!.length>0
//                                             ?   ListView.builder(
//                                             itemCount: controller.nestedCategoryResponse!.data!.length,
//                                             shrinkWrap: true,
//                                             physics: NeverScrollableScrollPhysics(),
//                                             itemBuilder: (BuildContext context, int index) {
//                                               return Column(
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: (){
//                                                       Get.to(  CustomCategoryViewPage(
//
//                                                         categoryId: controller.nestedCategoryResponse!.data![index].id!.toString(),
//
//
//                                                         page: AppConstants.CATEGORY,
//                                                         subCategoryId: "",
//                                                         childCategoryId: '',
//                                                         sectionId: '',
//
//                                                       ));
//                                                     },
//                                                     child: Container(
//                                                       height: 120,
//                                                       // color: Colors.green,
//
//                                                       child: Row(
//                                                         children: [
//                                                           Expanded(
//                                                               flex: 5,
//                                                               child: Container(
//                                                                 height: 40,
//                                                                 // color: Colors.pinkAccent,
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.only(left: 15),
//                                                                   child: Row(
//                                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     children: [
//                                                                       InkWell(
//                                                                         onTap: () {
//                                                                           controller.nestedCategoryResponse!.data![index].isDrop=!controller.nestedCategoryResponse!.data![index].isDrop;
//                                                                           setState(() {});
//                                                                         },
//                                                                         child: Container(
//                                                                           height: 40,
//                                                                           child: Center(
//                                                                             child: Text("${controller.nestedCategoryResponse!.data![index].title??""}",
//                                                                               style: railway.copyWith(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 16),),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                       InkWell(
//                                                                         onTap : () {
//                                                                           controller.nestedCategoryResponse!.data![index].isDrop=!controller.nestedCategoryResponse!.data![index].isDrop;
//                                                                           setState(() {
//                                                                           });
//                                                                         },
//                                                                           child: Container(
//                                                                             // color: Colors.purple,
//                                                                               height: 40,
//                                                                               width: 5)),
//
//                                                                       // widget.isExpanded1?
//                                                                       controller.nestedCategoryResponse!.data![index].isDrop?
//                                                                       InkWell(
//                                                                         onTap : () {
//                                                                           controller.nestedCategoryResponse!.data![index].isDrop=!controller.nestedCategoryResponse!.data![index].isDrop;
//                                                                           setState(() {
//                                                                           });
//                                                                         },
//                                                                         child: Container(
//                                                                           height: 40,
//                                                                           // color: Colors. blue,
//                                                                           child: Padding(
//                                                                             padding: const EdgeInsets.only(left: 3),
//                                                                             child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
//                                                                           ),
//                                                                         ),
//                                                                       ):
//                                                                       InkWell(
//                                                                         onTap: () {
//                                                                           controller.nestedCategoryResponse!.data![index].isDrop=!controller.nestedCategoryResponse!.data![index].isDrop;
//                                                                           setState(() {
//                                                                           });
//                                                                         },
//                                                                           child: Container(
//                                                                               height: 40,
//                                                                               // color: Colors. blue,
//                                                                               child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,))),
//                                                                       // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               )
//                                                           ),
//
//                                                           Expanded(
//                                                               flex: 3,
//                                                               child: Container(
//                                                                   color: Color(0xffFFFFFF),
//                                                                   child: Padding(
//                                                                     padding: const EdgeInsets.only(left: 0),
//                                                                     child: CustomImageCached(
//                                                                       image: '${AppConstants.BASE_URL}${controller.nestedCategoryResponse!.data![index].banner?? ""}',
//                                                                       fit: BoxFit.fill,
//                                                                       isRound: false,
//                                                                     ),
//                                                                     // child: Image.network("https://ounass-qa.atgcdn.ae/small_light(of=webp)/pub/media/catalog/category/MW_App_Cat_New_In_WK32.jpg",fit: BoxFit.fill,),
//                                                                   ))
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Divider(
//                                                     height: 3,
//                                                     thickness: 3,
//                                                     color: Color(0xffF2F6F9),
//                                                     // color: Colors.pink,
//                                                   ),
//                                                   // widget.isExpanded1?
//                                                   controller.nestedCategoryResponse!.data![index].isDrop?
//                                                   Container(
//                                                     // color: Colors.red,
//                                                     // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                     child: Column(
//                                                       children: [
//                                                         ListView.builder(
//                                                             padding: EdgeInsets.zero,
//                                                             // itemCount: drawerdrop.length,
//                                                             itemCount: controller.nestedCategoryResponse!.data![index].subCategories!.length,
//                                                             shrinkWrap: true,
//                                                             scrollDirection: Axis.vertical,
//                                                             physics: ClampingScrollPhysics(),
//                                                             itemBuilder: (BuildContext context, int index2){
//                                                               return  Column(
//                                                                 children: [
//                                                                   Column(
//                                                                     children: [
//                                                                       InkWell(
//                                                                         onTap: (){
//                                                                           Get.to(  CustomCategoryViewPage(
//
//                                                                             categoryId: "",
//
//
//                                                                             page: AppConstants.SUBCATEGORY,
//                                                                             subCategoryId: controller.nestedCategoryResponse!.data![index].subCategories![index2].id!.toString(),
//                                                                             childCategoryId: '',
//                                                                             sectionId: '',
//
//                                                                           ));
//                                                                         },
//                                                                         child: Container(
//                                                                           alignment: Alignment.centerLeft,
//                                                                           color: Color(0xffF2F6F9),
//                                                                           // color: Colors.purpleAccent,
//                                                                           height: 50,
//                                                                           width: Get.width,
//                                                                           child: Padding(
//                                                                             padding: const EdgeInsets.only(left: 30),
//                                                                             child: Row(
//                                                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                               children: [
//                                                                                 Text(
//                                                                                   // "${drawerdrop[index]}",
//                                                                                   "${controller.nestedCategoryResponse!.data![index].subCategories![index2].title??""}",
//                                                                                   style: poppins.copyWith(
//                                                                                       fontSize: 12,
//                                                                                       fontWeight: FontWeight.w200,
//                                                                                       color: Colors.black87
//                                                                                   ),
//                                                                                 ),
//                                                                                 SizedBox(width: 5),
//                                                                                 InkWell(
//                                                                                   onTap : () {
//                                                                                     controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2=!controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2;
//                                                                                     setState(() {
//                                                                                     });
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     height: 50,
//                                                                                     width: 100,
//                                                                                     // color: Colors.green,
//                                                                                     child: Row(
//                                                                                       mainAxisAlignment: MainAxisAlignment.end,
//                                                                                       children: [
//                                                                                         SizedBox(width: 5),
//                                                                                         // widget.childexp1?
//                                                                                         controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2 ?
//                                                                                         Padding(
//                                                                                           padding: const EdgeInsets.only(right: 12),
//                                                                                           child: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.length>0?Image.asset(Images.up, color: Colors.black, height: 22, width: 15,): SizedBox(),
//                                                                                         ):
//                                                                                         controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.length>0?
//                                                                                         Padding(
//                                                                                           padding: const EdgeInsets.only(right: 12),
//                                                                                           child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                         ): SizedBox(),
//                                                                                         // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//
//                                                                       // widget.childexp1?
//                                                                       controller.nestedCategoryResponse!.data![index].subCategories![index2].isDrop2 ?
//                                                                       Container(
//                                                                         // color: Colors.red,
//                                                                         // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                         child: Column(
//                                                                           children: [
//                                                                             ListView.builder(
//                                                                                 padding: EdgeInsets.zero,
//                                                                                 // itemCount: drawerdrop.length,
//                                                                                 itemCount: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories!.length,
//                                                                                 shrinkWrap: true,
//                                                                                 scrollDirection: Axis.vertical,
//                                                                                 physics: ClampingScrollPhysics(),
//                                                                                 itemBuilder: (BuildContext context, int index3){
//                                                                                   return
//                                                                                   Column(
//                                                                                     children: [
//                                                                                       InkWell(
//                                                                                         onTap: (){
//                                                                                           Get.to(  CustomCategoryViewPage(
//
//                                                                                             categoryId: "",
//
//
//                                                                                             page: AppConstants.CHILDCATEGORY,
//                                                                                             subCategoryId: "",
//                                                                                             childCategoryId: controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories![index3].id!.toString(),
//                                                                                             sectionId: '',
//
//                                                                                           ));
//                                                                                         },
//                                                                                         child: Container(
//                                                                                           alignment: Alignment.centerLeft,
//                                                                                           color: Color(0xffFAFAFA),
//                                                                                           height: 50,
//                                                                                           width: Get.width,
//                                                                                           child: Padding(
//                                                                                             padding: const EdgeInsets.only(left: 50, right: 12),
//                                                                                             child: Row(
//                                                                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                               children: [
//
//                                                                                                 Text(
//                                                                                                   // "${drawerdrop[index]}",
//                                                                                                   "${controller.nestedCategoryResponse!.data![index].subCategories![index2].childCategories![index3].title??""}",
//                                                                                                   style: poppins.copyWith(
//                                                                                                       fontSize: 12,
//                                                                                                       fontWeight: FontWeight.w200,
//                                                                                                       color: Colors.black87
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               ],
//                                                                                             ),
//                                                                                           ),
//                                                                                         ),
//                                                                                       ),
//                                                                                     ],
//                                                                                   );
//                                                                                 }
//
//                                                                             ),
//                                                                             // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                           ],
//                                                                         ),
//                                                                       ):Container(),
//
//                                                                     ],
//                                                                   ),
//
//                                                                 ],
//                                                               );
//                                                             }
//                                                         ),
//                                                         // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                       ],
//                                                     ),
//                                                   ):Container(),
//                                                 ],
//                                               );
//                                             }
//                                         ): Text(""),
//                                       ],
//                                     ),
//                                   )
//                               ),
//
//                               /// 2nd TAB
//                               RefreshIndicator(
//                                   onRefresh: () async{
//                                     // showCustomSnackBar("2");
//                                   },
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         Column(
//                                           children: [
//
//                                             /// New In
//                                             InkWell(
//                                               onTap: (){
//                                                 widget.isExpanded1=! widget.isExpanded1;
//                                                 setState(() {
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 120,
//                                                 // color: Colors.green,
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                         flex: 5,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 15),
//                                                           child: Row(
//                                                             children: [
//                                                               Text("New In", style: railway.copyWith(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 20),),
//                                                               SizedBox(width: 5),
//
//                                                               widget.isExpanded1?   Padding(
//                                                                 padding: const EdgeInsets.only(left: 3),
//                                                                 child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
//                                                               ):
//                                                               Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                               // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
//                                                             ],
//                                                           ),
//                                                         )
//                                                     ),
//
//                                                     Expanded(
//                                                         flex: 3,
//                                                         child: Container(
//                                                             color: Color(0xffFFFFFF),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left: 0),
//                                                               child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
//                                                             ))
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             Divider(
//                                               height: 3,
//                                               thickness: 3,
//                                               color: Color(0xffF2F6F9),
//                                               // color: Colors.pink,
//                                             ),
//                                             widget.isExpanded1? Container(
//                                               // color: Colors.red,
//                                               // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                               child: Column(
//                                                 children: [
//                                                   ListView.builder(
//                                                       padding: EdgeInsets.zero,
//                                                       // itemCount: drawerdrop.length,
//                                                       itemCount: 1,
//                                                       shrinkWrap: true,
//                                                       scrollDirection: Axis.vertical,
//                                                       physics: ClampingScrollPhysics(),
//                                                       itemBuilder: (BuildContext context, int index){
//                                                         return  Column(
//                                                           children: [
//
//                                                             InkWell(
//                                                               onTap: (){
//                                                                 // widget.childexp1=! widget.childexp1;
//                                                                 setState(() {
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                 alignment: Alignment.centerLeft,
//                                                                 color: Color(0xffF2F6F9),
//                                                                 height: 50,
//                                                                 width: Get.width,
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.only(left: 15),
//                                                                   child: Row(
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         // "${drawerdrop[index]}",
//                                                                         "All New In",
//                                                                         style: poppins.copyWith(
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w200,
//                                                                             color: Colors.black87
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(width: 5),
//                                                                       Padding(
//                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                         child: Row(
//                                                                           children: [
//                                                                             SizedBox(width: 5),
//                                                                             /*        widget.childexp1?   Image.asset(Images.up, color: Colors.black, height: 22, width: 22,):
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(left: 3),
//                                                                               child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 17,),
//                                                                             ),*/
//                                                                             // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             /// shop by
//                                                             Column(
//                                                               children: [
//                                                                 InkWell(
//                                                                   onTap: (){
//                                                                     widget.childexp1=! widget.childexp1;
//                                                                     setState(() {
//                                                                     });
//                                                                   },
//                                                                   child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     color: Color(0xffF2F6F9),
//                                                                     height: 50,
//                                                                     width: Get.width,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 15),
//                                                                       child: Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Text(
//                                                                             // "${drawerdrop[index]}",
//                                                                             "Shop By",
//                                                                             style: poppins.copyWith(
//                                                                                 fontSize: 12,
//                                                                                 fontWeight: FontWeight.w200,
//                                                                                 color: Colors.black87
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(width: 5),
//                                                                           Padding(
//                                                                             padding: const EdgeInsets.only(right: 12),
//                                                                             child: Row(
//                                                                               children: [
//                                                                                 SizedBox(width: 5),
//                                                                                 widget.childexp1?   Padding(
//                                                                                   padding: const EdgeInsets.only(left: 0),
//                                                                                   child: Image.asset(Images.up, color: Colors.black, height: 22, width: 15,),
//                                                                                 ):
//                                                                                 Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                 // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 widget.childexp1? Container(
//                                                                   // color: Colors.red,
//                                                                   // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       ListView.builder(
//                                                                           padding: EdgeInsets.zero,
//                                                                           // itemCount: drawerdrop.length,
//                                                                           itemCount: 1,
//                                                                           shrinkWrap: true,
//                                                                           scrollDirection: Axis.vertical,
//                                                                           physics: ClampingScrollPhysics(),
//                                                                           itemBuilder: (BuildContext context, int index){
//                                                                             return  Column(
//                                                                               children: [
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Fall/Winter23",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Accessories",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Bag",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ],
//                                                                             );
//                                                                           }
//
//                                                                       ),
//                                                                       // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                     ],
//                                                                   ),
//                                                                 ):Container(),
//
//                                                               ],
//                                                             ),
//                                                             /// trending now
//                                                             Column(
//                                                               children: [
//                                                                 InkWell(
//                                                                   onTap: (){
//                                                                     widget.childexp2=! widget.childexp2;
//                                                                     setState(() {
//                                                                     });
//                                                                   },
//                                                                   child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     color: Color(0xffF2F6F9),
//                                                                     height: 50,
//                                                                     width: Get.width,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 15),
//                                                                       child: Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Text(
//                                                                             // "${drawerdrop[index]}",
//                                                                             "Trending Now",
//                                                                             style: poppins.copyWith(
//                                                                                 fontSize: 12,
//                                                                                 fontWeight: FontWeight.w200,
//                                                                                 color: Colors.black87
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(width: 5),
//                                                                           Padding(
//                                                                             padding: const EdgeInsets.only(right: 12),
//                                                                             child: Row(
//                                                                               children: [
//                                                                                 SizedBox(width: 5),
//                                                                                 widget.childexp2?   Padding(
//                                                                                   padding: const EdgeInsets.only(left: 0),
//                                                                                   child: Image.asset(Images.up, color: Colors.black, height: 22, width: 15,),
//                                                                                 ):
//                                                                                 Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                 // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 widget.childexp2? Container(
//                                                                   // color: Colors.red,
//                                                                   // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       ListView.builder(
//                                                                           padding: EdgeInsets.zero,
//                                                                           // itemCount: drawerdrop.length,
//                                                                           itemCount: 1,
//                                                                           shrinkWrap: true,
//                                                                           scrollDirection: Axis.vertical,
//                                                                           physics: ClampingScrollPhysics(),
//                                                                           itemBuilder: (BuildContext context, int index){
//                                                                             return  Column(
//                                                                               children: [
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Adidas",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Nike",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Tommy",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ],
//                                                                             );
//
//
//
//                                                                           }
//
//                                                                       ),
//                                                                       // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                     ],
//                                                                   ),
//                                                                 ):Container(),
//                                                               ],
//                                                             ),
//
//
//
//                                                           ],
//                                                         );
//
//                                                       }
//
//                                                   ),
//                                                   // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                 ],
//                                               ),
//                                             ):Container(),
//
//                                             /// Designers
//                                             InkWell(
//                                               onTap: (){
//                                                 widget.isExpanded2=! widget.isExpanded2;
//                                                 setState(() {
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 120,
//                                                 // color: Colors.green,
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                         flex: 5,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 15),
//                                                           child: Row(
//                                                             children: [
//                                                               Text("New Designers", style: railway.copyWith(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 20),),
//                                                               SizedBox(width: 5),
//
//                                                               widget.isExpanded2?   Padding(
//                                                                 padding: const EdgeInsets.only(left: 3),
//                                                                 child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
//                                                               ):
//                                                               Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                               // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
//                                                             ],
//                                                           ),
//                                                         )
//                                                     ),
//
//                                                     Expanded(
//                                                         flex: 3,
//                                                         child: Container(
//                                                             color: Color(0xffFFFFFF),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left: 0),
//                                                               child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fwomen%2FCat2_Clothing_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
//                                                             ))
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             Divider(
//                                               height: 3,
//                                               thickness: 3,
//                                               color: Color(0xffF2F6F9),
//                                               // color: Colors.pink,
//                                             ),
//                                             widget.isExpanded2? Container(
//                                               // color: Colors.red,
//                                               // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                               child: Column(
//                                                 children: [
//                                                   ListView.builder(
//                                                       padding: EdgeInsets.zero,
//                                                       // itemCount: drawerdrop.length,
//                                                       itemCount: 1,
//                                                       shrinkWrap: true,
//                                                       scrollDirection: Axis.vertical,
//                                                       physics: ClampingScrollPhysics(),
//                                                       itemBuilder: (BuildContext context, int index){
//                                                         return  Column(
//                                                           children: [
//
//                                                             InkWell(
//                                                               onTap: (){
//                                                                 // widget.childexp1=! widget.childexp1;
//                                                                 setState(() {
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                 alignment: Alignment.centerLeft,
//                                                                 color: Color(0xffF2F6F9),
//                                                                 height: 50,
//                                                                 width: Get.width,
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.only(left: 15),
//                                                                   child: Row(
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         // "${drawerdrop[index]}",
//                                                                         "All New In",
//                                                                         style: poppins.copyWith(
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w200,
//                                                                             color: Colors.black87
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(width: 5),
//                                                                       Padding(
//                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                         child: Row(
//                                                                           children: [
//                                                                             SizedBox(width: 5),
//                                                                             /*        widget.childexp1?   Image.asset(Images.up, color: Colors.black, height: 22, width: 22,):
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(left: 3),
//                                                                               child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 17,),
//                                                                             ),*/
//                                                                             // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             /// shop by
//                                                             Column(
//                                                               children: [
//                                                                 InkWell(
//                                                                   onTap: (){
//                                                                     widget.childexp3=! widget.childexp3;
//                                                                     setState(() {
//                                                                     });
//                                                                   },
//                                                                   child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     color: Color(0xffF2F6F9),
//                                                                     height: 50,
//                                                                     width: Get.width,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 15),
//                                                                       child: Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Text(
//                                                                             // "${drawerdrop[index]}",
//                                                                             "Shop By",
//                                                                             style: poppins.copyWith(
//                                                                                 fontSize: 12,
//                                                                                 fontWeight: FontWeight.w200,
//                                                                                 color: Colors.black87
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(width: 5),
//                                                                           Padding(
//                                                                             padding: const EdgeInsets.only(right: 12),
//                                                                             child: Row(
//                                                                               children: [
//                                                                                 SizedBox(width: 5),
//                                                                                 widget.childexp3?   Padding(
//                                                                                   padding: const EdgeInsets.only(left: 0),
//                                                                                   child: Image.asset(Images.up, color: Colors.black, height: 22, width: 15,),
//                                                                                 ):
//                                                                                 Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                 // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 widget.childexp3? Container(
//                                                                   // color: Colors.red,
//                                                                   // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       ListView.builder(
//                                                                           padding: EdgeInsets.zero,
//                                                                           // itemCount: drawerdrop.length,
//                                                                           itemCount: 1,
//                                                                           shrinkWrap: true,
//                                                                           scrollDirection: Axis.vertical,
//                                                                           physics: ClampingScrollPhysics(),
//                                                                           itemBuilder: (BuildContext context, int index){
//                                                                             return  Column(
//                                                                               children: [
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Fall/Winter23",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Accessories",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Bag",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ],
//                                                                             );
//                                                                           }
//
//                                                                       ),
//                                                                       // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                     ],
//                                                                   ),
//                                                                 ):Container(),
//
//                                                               ],
//                                                             ),
//                                                             /// trending now
//                                                             Column(
//                                                               children: [
//                                                                 InkWell(
//                                                                   onTap: (){
//                                                                     widget.childexp4=! widget.childexp4;
//                                                                     setState(() {
//                                                                     });
//                                                                   },
//                                                                   child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     color: Color(0xffF2F6F9),
//                                                                     height: 50,
//                                                                     width: Get.width,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 15),
//                                                                       child: Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Text(
//                                                                             // "${drawerdrop[index]}",
//                                                                             "Trending Now",
//                                                                             style: poppins.copyWith(
//                                                                                 fontSize: 12,
//                                                                                 fontWeight: FontWeight.w200,
//                                                                                 color: Colors.black87
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(width: 5),
//                                                                           Padding(
//                                                                             padding: const EdgeInsets.only(right: 12),
//                                                                             child: Row(
//                                                                               children: [
//                                                                                 SizedBox(width: 5),
//                                                                                 widget.childexp4?   Padding(
//                                                                                   padding: const EdgeInsets.only(left: 0),
//                                                                                   child: Image.asset(Images.up, color: Colors.black, height: 22, width: 15,),
//                                                                                 ):
//                                                                                 Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                 // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 widget.childexp4? Container(
//                                                                   // color: Colors.red,
//                                                                   // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       ListView.builder(
//                                                                           padding: EdgeInsets.zero,
//                                                                           // itemCount: drawerdrop.length,
//                                                                           itemCount: 1,
//                                                                           shrinkWrap: true,
//                                                                           scrollDirection: Axis.vertical,
//                                                                           physics: ClampingScrollPhysics(),
//                                                                           itemBuilder: (BuildContext context, int index){
//                                                                             return  Column(
//                                                                               children: [
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Tommy",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Adidas",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Nike",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//
//                                                                               ],
//                                                                             );
//
//
//
//                                                                           }
//
//                                                                       ),
//                                                                       // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                     ],
//                                                                   ),
//                                                                 ):Container(),
//                                                               ],
//                                                             ),
//
//                                                           ],
//                                                         );
//
//                                                       }
//
//                                                   ),
//                                                   // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                 ],
//                                               ),
//                                             ):Container(),
//
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//
//
//                                   )
//
//                               ),
//
//                               /// 3rd TAB
//                               RefreshIndicator(
//                                   onRefresh: () async{
//                                     // showCustomSnackBar("2");
//                                   },
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         Column(
//                                           children: [
//
//                                             /// New In
//                                             InkWell(
//                                               onTap: (){
//                                                 widget.isExpanded1=! widget.isExpanded1;
//                                                 setState(() {
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 120,
//                                                 // color: Colors.green,
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                         flex: 5,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 15),
//                                                           child: Row(
//                                                             children: [
//                                                               Text("New In", style: railway.copyWith(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 20),),
//                                                               SizedBox(width: 5),
//
//                                                               widget.isExpanded1?   Padding(
//                                                                 padding: const EdgeInsets.only(left: 3),
//                                                                 child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
//                                                               ):
//                                                               Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                               // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
//                                                             ],
//                                                           ),
//                                                         )
//                                                     ),
//
//                                                     Expanded(
//                                                         flex: 3,
//                                                         child: Container(
//                                                             color: Color(0xffFFFFFF),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left: 0),
//                                                               child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
//                                                             ))
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             Divider(
//                                               height: 3,
//                                               thickness: 3,
//                                               color: Color(0xffF2F6F9),
//                                               // color: Colors.pink,
//                                             ),
//                                             widget.isExpanded1? Container(
//                                               // color: Colors.red,
//                                               // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                               child: Column(
//                                                 children: [
//                                                   ListView.builder(
//                                                       padding: EdgeInsets.zero,
//                                                       // itemCount: drawerdrop.length,
//                                                       itemCount: 1,
//                                                       shrinkWrap: true,
//                                                       scrollDirection: Axis.vertical,
//                                                       physics: ClampingScrollPhysics(),
//                                                       itemBuilder: (BuildContext context, int index){
//                                                         return  Column(
//                                                           children: [
//
//                                                             InkWell(
//                                                               onTap: (){
//                                                                 // widget.childexp1=! widget.childexp1;
//                                                                 setState(() {
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                 alignment: Alignment.centerLeft,
//                                                                 color: Color(0xffF2F6F9),
//                                                                 height: 50,
//                                                                 width: Get.width,
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.only(left: 15),
//                                                                   child: Row(
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         // "${drawerdrop[index]}",
//                                                                         "All New In",
//                                                                         style: poppins.copyWith(
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w200,
//                                                                             color: Colors.black87
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(width: 5),
//                                                                       Padding(
//                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                         child: Row(
//                                                                           children: [
//                                                                             SizedBox(width: 5),
//                                                                             /*        widget.childexp1?   Image.asset(Images.up, color: Colors.black, height: 22, width: 22,):
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(left: 3),
//                                                                               child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 17,),
//                                                                             ),*/
//                                                                             // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             /// shop by
//                                                             Column(
//                                                               children: [
//                                                                 InkWell(
//                                                                   onTap: (){
//                                                                     widget.childexp1=! widget.childexp1;
//                                                                     setState(() {
//                                                                     });
//                                                                   },
//                                                                   child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     color: Color(0xffF2F6F9),
//                                                                     height: 50,
//                                                                     width: Get.width,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 15),
//                                                                       child: Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Text(
//                                                                             // "${drawerdrop[index]}",
//                                                                             "Shop By",
//                                                                             style: poppins.copyWith(
//                                                                                 fontSize: 12,
//                                                                                 fontWeight: FontWeight.w200,
//                                                                                 color: Colors.black87
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(width: 5),
//                                                                           Padding(
//                                                                             padding: const EdgeInsets.only(right: 12),
//                                                                             child: Row(
//                                                                               children: [
//                                                                                 SizedBox(width: 5),
//                                                                                 widget.childexp1?   Padding(
//                                                                                   padding: const EdgeInsets.only(left: 0),
//                                                                                   child: Image.asset(Images.up, color: Colors.black, height: 22, width: 15,),
//                                                                                 ):
//                                                                                 Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                 // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 widget.childexp1? Container(
//                                                                   // color: Colors.red,
//                                                                   // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       ListView.builder(
//                                                                           padding: EdgeInsets.zero,
//                                                                           // itemCount: drawerdrop.length,
//                                                                           itemCount: 1,
//                                                                           shrinkWrap: true,
//                                                                           scrollDirection: Axis.vertical,
//                                                                           physics: ClampingScrollPhysics(),
//                                                                           itemBuilder: (BuildContext context, int index){
//                                                                             return  Column(
//                                                                               children: [
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Fall/Winter23",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Accessories",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Bag",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ],
//                                                                             );
//                                                                           }
//
//                                                                       ),
//                                                                       // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                     ],
//                                                                   ),
//                                                                 ):Container(),
//
//                                                               ],
//                                                             ),
//                                                             /// trending now
//                                                             Column(
//                                                               children: [
//                                                                 InkWell(
//                                                                   onTap: (){
//                                                                     widget.childexp2=! widget.childexp2;
//                                                                     setState(() {
//                                                                     });
//                                                                   },
//                                                                   child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     color: Color(0xffF2F6F9),
//                                                                     height: 50,
//                                                                     width: Get.width,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 15),
//                                                                       child: Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Text(
//                                                                             // "${drawerdrop[index]}",
//                                                                             "Trending Now",
//                                                                             style: poppins.copyWith(
//                                                                                 fontSize: 12,
//                                                                                 fontWeight: FontWeight.w200,
//                                                                                 color: Colors.black87
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(width: 5),
//                                                                           Padding(
//                                                                             padding: const EdgeInsets.only(right: 12),
//                                                                             child: Row(
//                                                                               children: [
//                                                                                 SizedBox(width: 5),
//                                                                                 widget.childexp2?   Padding(
//                                                                                   padding: const EdgeInsets.only(left: 0),
//                                                                                   child: Image.asset(Images.up, color: Colors.black, height: 22, width: 15,),
//                                                                                 ):
//                                                                                 Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                 // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 widget.childexp2? Container(
//                                                                   // color: Colors.red,
//                                                                   // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       ListView.builder(
//                                                                           padding: EdgeInsets.zero,
//                                                                           // itemCount: drawerdrop.length,
//                                                                           itemCount: 1,
//                                                                           shrinkWrap: true,
//                                                                           scrollDirection: Axis.vertical,
//                                                                           physics: ClampingScrollPhysics(),
//                                                                           itemBuilder: (BuildContext context, int index){
//                                                                             return  Column(
//                                                                               children: [
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Adidas",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Nike",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Tommy",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ],
//                                                                             );
//
//
//
//                                                                           }
//
//                                                                       ),
//                                                                       // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                     ],
//                                                                   ),
//                                                                 ):Container(),
//                                                               ],
//                                                             ),
//
//
//
//                                                           ],
//                                                         );
//
//                                                       }
//
//                                                   ),
//                                                   // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                 ],
//                                               ),
//                                             ):Container(),
//
//                                             /// Designers
//                                             InkWell(
//                                               onTap: (){
//                                                 widget.isExpanded2=! widget.isExpanded2;
//                                                 setState(() {
//                                                 });
//                                               },
//                                               child: Container(
//                                                 height: 120,
//                                                 // color: Colors.green,
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                         flex: 5,
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 15),
//                                                           child: Row(
//                                                             children: [
//                                                               Text("New Designers", style: railway.copyWith(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 20),),
//                                                               SizedBox(width: 5),
//
//                                                               widget.isExpanded2?   Padding(
//                                                                 padding: const EdgeInsets.only(left: 3),
//                                                                 child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
//                                                               ):
//                                                               Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                               // Icon(Icons.arrow_drop_down, color: Colors.white,size: 18,)
//                                                             ],
//                                                           ),
//                                                         )
//                                                     ),
//
//                                                     Expanded(
//                                                         flex: 3,
//                                                         child: Container(
//                                                             color: Color(0xffFFFFFF),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left: 0),
//                                                               child: Image.network("https://isle.vercel.app/_next/image?url=%2Fimages%2Fkids%2F3_Shop_Baby_Web_WK33.jpg&w=640&q=75",fit: BoxFit.fill,),
//                                                             ))
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             Divider(
//                                               height: 3,
//                                               thickness: 3,
//                                               color: Color(0xffF2F6F9),
//                                               // color: Colors.pink,
//                                             ),
//                                             widget.isExpanded2? Container(
//                                               // color: Colors.red,
//                                               // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                               child: Column(
//                                                 children: [
//                                                   ListView.builder(
//                                                       padding: EdgeInsets.zero,
//                                                       // itemCount: drawerdrop.length,
//                                                       itemCount: 1,
//                                                       shrinkWrap: true,
//                                                       scrollDirection: Axis.vertical,
//                                                       physics: ClampingScrollPhysics(),
//                                                       itemBuilder: (BuildContext context, int index){
//                                                         return  Column(
//                                                           children: [
//
//                                                             InkWell(
//                                                               onTap: (){
//                                                                 // widget.childexp1=! widget.childexp1;
//                                                                 setState(() {
//                                                                 });
//                                                               },
//                                                               child: Container(
//                                                                 alignment: Alignment.centerLeft,
//                                                                 color: Color(0xffF2F6F9),
//                                                                 height: 50,
//                                                                 width: Get.width,
//                                                                 child: Padding(
//                                                                   padding: const EdgeInsets.only(left: 15),
//                                                                   child: Row(
//                                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         // "${drawerdrop[index]}",
//                                                                         "All New In",
//                                                                         style: poppins.copyWith(
//                                                                             fontSize: 12,
//                                                                             fontWeight: FontWeight.w200,
//                                                                             color: Colors.black87
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(width: 5),
//                                                                       Padding(
//                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                         child: Row(
//                                                                           children: [
//                                                                             SizedBox(width: 5),
//                                                                             /*        widget.childexp1?   Image.asset(Images.up, color: Colors.black, height: 22, width: 22,):
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(left: 3),
//                                                                               child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 17,),
//                                                                             ),*/
//                                                                             // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             /// shop by
//                                                             Column(
//                                                               children: [
//                                                                 InkWell(
//                                                                   onTap: (){
//                                                                     widget.childexp3=! widget.childexp3;
//                                                                     setState(() {
//                                                                     });
//                                                                   },
//                                                                   child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     color: Color(0xffF2F6F9),
//                                                                     height: 50,
//                                                                     width: Get.width,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 15),
//                                                                       child: Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Text(
//                                                                             // "${drawerdrop[index]}",
//                                                                             "Shop By",
//                                                                             style: poppins.copyWith(
//                                                                                 fontSize: 12,
//                                                                                 fontWeight: FontWeight.w200,
//                                                                                 color: Colors.black87
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(width: 5),
//                                                                           Padding(
//                                                                             padding: const EdgeInsets.only(right: 12),
//                                                                             child: Row(
//                                                                               children: [
//                                                                                 SizedBox(width: 5),
//                                                                                 widget.childexp3?   Padding(
//                                                                                   padding: const EdgeInsets.only(left: 0),
//                                                                                   child: Image.asset(Images.up, color: Colors.black, height: 22, width: 15,),
//                                                                                 ):
//                                                                                 Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                 // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 widget.childexp3? Container(
//                                                                   // color: Colors.red,
//                                                                   // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       ListView.builder(
//                                                                           padding: EdgeInsets.zero,
//                                                                           // itemCount: drawerdrop.length,
//                                                                           itemCount: 1,
//                                                                           shrinkWrap: true,
//                                                                           scrollDirection: Axis.vertical,
//                                                                           physics: ClampingScrollPhysics(),
//                                                                           itemBuilder: (BuildContext context, int index){
//                                                                             return  Column(
//                                                                               children: [
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Fall/Winter23",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Accessories",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Bag",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ],
//                                                                             );
//                                                                           }
//
//                                                                       ),
//                                                                       // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                     ],
//                                                                   ),
//                                                                 ):Container(),
//
//                                                               ],
//                                                             ),
//                                                             /// trending now
//                                                             Column(
//                                                               children: [
//                                                                 InkWell(
//                                                                   onTap: (){
//                                                                     widget.childexp4=! widget.childexp4;
//                                                                     setState(() {
//                                                                     });
//                                                                   },
//                                                                   child: Container(
//                                                                     alignment: Alignment.centerLeft,
//                                                                     color: Color(0xffF2F6F9),
//                                                                     height: 50,
//                                                                     width: Get.width,
//                                                                     child: Padding(
//                                                                       padding: const EdgeInsets.only(left: 15),
//                                                                       child: Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           Text(
//                                                                             // "${drawerdrop[index]}",
//                                                                             "Trending Now",
//                                                                             style: poppins.copyWith(
//                                                                                 fontSize: 12,
//                                                                                 fontWeight: FontWeight.w200,
//                                                                                 color: Colors.black87
//                                                                             ),
//                                                                           ),
//                                                                           SizedBox(width: 5),
//                                                                           Padding(
//                                                                             padding: const EdgeInsets.only(right: 12),
//                                                                             child: Row(
//                                                                               children: [
//                                                                                 SizedBox(width: 5),
//                                                                                 widget.childexp4?   Padding(
//                                                                                   padding: const EdgeInsets.only(left: 0),
//                                                                                   child: Image.asset(Images.up, color: Colors.black, height: 22, width: 15,),
//                                                                                 ):
//                                                                                 Image.asset( Images.drop, color: Colors.black, height: 22, width: 20,),
//                                                                                 // Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 widget.childexp4? Container(
//                                                                   // color: Colors.red,
//                                                                   // padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       ListView.builder(
//                                                                           padding: EdgeInsets.zero,
//                                                                           // itemCount: drawerdrop.length,
//                                                                           itemCount: 1,
//                                                                           shrinkWrap: true,
//                                                                           scrollDirection: Axis.vertical,
//                                                                           physics: ClampingScrollPhysics(),
//                                                                           itemBuilder: (BuildContext context, int index){
//                                                                             return  Column(
//                                                                               children: [
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Tommy",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Adidas",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 InkWell(
//                                                                                   onTap: (){
//                                                                                     // showCustomSnackBar("Click");
//                                                                                   },
//                                                                                   child: Container(
//                                                                                     alignment: Alignment.centerLeft,
//                                                                                     color: Color(0xffFAFAFA),
//                                                                                     height: 50,
//                                                                                     width: Get.width,
//                                                                                     child: Padding(
//                                                                                       padding: const EdgeInsets.only(left: 40, right: 12),
//                                                                                       child: Row(
//                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                         children: [
//                                                                                           Text(
//                                                                                             // "${drawerdrop[index]}",
//                                                                                             "Nike",
//                                                                                             style: poppins.copyWith(
//                                                                                                 fontSize: 12,
//                                                                                                 fontWeight: FontWeight.w200,
//                                                                                                 color: Colors.black87
//                                                                                             ),
//                                                                                           ),
//                                                                                           /*  SizedBox(width: 5),
//                                                                                       Padding(
//                                                                                         padding: const EdgeInsets.only(right: 12),
//                                                                                         child: Image.asset(Images.drop, color: Colors.black, height: 22, width: 22,),
//                                                                                       ),*/
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//
//                                                                               ],
//                                                                             );
//
//
//
//                                                                           }
//
//                                                                       ),
//                                                                       // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                                     ],
//                                                                   ),
//                                                                 ):Container(),
//                                                               ],
//                                                             ),
//
//                                                           ],
//                                                         );
//
//                                                       }
//
//                                                   ),
//                                                   // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                                                 ],
//                                               ),
//                                             ):Container(),
//
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//
//
//                                   )
//
//                               ),
//                             ]),
//                       )
//                     ],
//                   ): SizedBox(): SizedBox(),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
