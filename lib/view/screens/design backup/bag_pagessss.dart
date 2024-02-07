// import 'dart:io';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/controller/auth_controller.dart';
// import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
// import 'package:isletestapp/theme/light_theme.dart';
// import 'package:isletestapp/util/app_constants.dart';
// import 'package:isletestapp/util/color.dart';
// import 'package:isletestapp/util/constants.dart';
// import 'package:isletestapp/util/dimensions.dart';
// import 'package:isletestapp/util/images.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/view/auth/login-register.dart';
// import 'package:isletestapp/view/base/custom_Image_cached.dart';
// import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
// import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
// import 'package:isletestapp/view/base/custom_snackbar.dart';
// import 'package:isletestapp/view/base/my_text_field.dart';
// import 'package:isletestapp/view/screens/all_popup/info_popup.dart';
// import 'package:isletestapp/view/screens/checkout/checkout_page.dart';
// import 'package:isletestapp/view/screens/drawer/drawer.dart';
// import 'package:isletestapp/view/screens/main_page/main_screen.dart';
// import 'package:isletestapp/view/screens/map/map_address.dart';
// import 'package:isletestapp/view/screens/design%20backup/search_sunny.dart';
// import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
// import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
// import 'package:device_info/device_info.dart';
//
// class BagPages extends StatefulWidget {
//
//
//   BagPages({Key? key,   }) : super(key: key); ///
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
//   @override
//   State<BagPages> createState() => _BagPagesState();
// }
//
// class _BagPagesState extends State<BagPages> {
//
//   TextEditingController searchCtr = TextEditingController();
//   bool isSearchClick=false;
//   TextEditingController msgCtr = TextEditingController();
//   TextEditingController islecouponCtr = TextEditingController();
//   TextEditingController brandcouponCtr = TextEditingController();
//   TextEditingController rewardCtr = TextEditingController();
//
//   FocusNode msgFcs = FocusNode();
//   FocusNode islecouponFcs = FocusNode();
//   FocusNode brandcouponFcs = FocusNode();
//   FocusNode rewardFcs = FocusNode();
//
//   bool indicatorcolor= true;
//   TextEditingController msgboxCtr = TextEditingController();
//   FocusNode msgboxFcs = FocusNode();
//
//   bool isChecked = false;
//
//   void toggleCheckbox() {
//     setState(() {
//       isChecked = !isChecked; // Toggle the checkbox state
//     });
//   }
//
//   @override
//   void initState()  {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//             (_) {
//           // Get.find<ProductDetailsController>().getBagPageCartData(widget.corelationId);
//           Get.find<ProductDetailsController>().dataInitialize();
//         }
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProductDetailsController>(
//         builder: (controller) {
//           return Scaffold(
//             /*  bottomSheet: Container(
//             height: 80,
//             padding: EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                     flex: 1,
//                     child: GetBuilder<AuthController>(
//
//                         builder: (authController) {
//                           return Container(
//                             color: gold,
//                             child: InkWell(
//                                 onTap: (){
//                                   if(authController.isLoggedIn()){
//                                     Get.to(CheckOutPage(pageIndex: 0,));
//                                   }else{
//                                     Get.to(LoginRegisterPage(isFromCart: true,));
//                                   }
//
//                                 },
//                                 child: Center(child: Text("${authController.isLoggedIn()?"CONTINUE":"Log to continue"}",style: robotoMedium.copyWith(color: Colors.white,fontSize: Dimensions.fontSizeDefault),))),
//                           );
//                         }
//                     )),
//              *//*   Expanded(
//                   flex: 1,
//                   child: Text("TOTAL ${controller.total} ${priceUnit}",textAlign:TextAlign.end,style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault)),
//                 )*//*
//               ],
//             ),
//           ),*/
//             // bottomNavigationBar: UniversalBottomNav(),
//             // backgroundColor: Color(0xffFAFBFB),
//             backgroundColor: Color(0xffFAFAFA),
//             // drawer: IsleDrawer(),
//             appBar: AppBar(
//               iconTheme: IconThemeData(color: Color(0xff000000)),
//               titleSpacing: 0,
//               backgroundColor: Color(0xffFFFFFF),
//               centerTitle: true,
//               elevation: 0,
//
//               actions: [
//                 InkWell(
//                     onTap: () {
//                       Get.to(WishListPage(pageIndex: 0,));
//                     },
//                     child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)),
//                 SizedBox(width: 15),
//                 InkWell(
//                     onTap: () {
//                       Get.to(
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return InfoPopup();
//                           },
//                         ),
//                       );
//                     },
//                     child: Image.asset(Images.info, height: 20, width: 20, color: Color(0xff000000),)),
//
//                 SizedBox(width: 10),
//
//               ],
//               leadingWidth: Get.width/3.5,
//               title: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.to(MainScreen());
//                     },
//                     child: Container(
//                       // margin: EdgeInsets.all(15),
//                         padding: EdgeInsets.only(left: 5, right: 5, top: 5,bottom: 5),
//                         // color: Colors.red,
//                         height: 55, width: 75,
//                         child: Image.asset(Images.logo, height: 55, width: 70, fit: BoxFit.fill,)),
//                   ),
//                 ],
//               ),
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 // mainAxisSize: MainAxisSize.min,
//                 children: [
//                   /// Top BANNER
//                   Container(
//                     height: 30,
//                     width: Get.width,
//                     color: Color(0xffFFFFFF),
//                     // width: Get.width,
//                     child: Column(
//                       children: [
//                         Text("Yours Bag(1)", style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 16),)
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 0),
//
//                   controller.bagePageCartResponse!=null?
//                   ListView.builder(
//                       itemCount: 1,
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemBuilder: ( BuildContext context, int index ) {
//                         return Column(
//                           children: [
//                             Container(
//                               // color: Colors.red,
//                               color: Color(0xffFAFAFA),
//                               height: Get.height/4.5,
//                               child:  Stack(
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: Color(0xffFAFBFB),
//                                         // color: Colors.tealAccent,
//                                       ),
//                                       child: ClipRRect(
//                                           child: CustomImageCached(
//                                             placeholder: "assets/image/placeholder.png",
//                                             image: '${AppConstants.BASE_URL}${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.profilePhoto??""}',
//                                             fit: BoxFit.contain,
//                                           )
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 20,
//                                       right: 20,
//                                       child: InkWell(
//                                           onTap: (){
//                                             Get.dialog( CustomAlerDialogForPermission(
//                                               title: 'Are you sure to delete this Data?',
//                                               yesBtntap: () {
//                                                 Get.back();
//                                                 // controller.deleteProduct(product_id:controller.products![index].productId!.toString());
//                                               },
//                                               noBtntap: (){
//
//                                               },
//
//                                               noBtnText: "NO",
//                                               yesBtnText: "YES",
//
//                                             ));
//                                             // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());
//
//
//                                           },
//                                           child: Image.asset(Images.delete, color: silvercolor, height: 28, width: 28,)),
//                                     )
//
//                                   ]
//                               ),
//                             ),
//                             SizedBox(height: 0),
//                             Container(
//                               /// orginal color
//                               color: Colors.white,
//                               // color: Color(0xffFEFFFF),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 12, right: 12, top: 4.5, bottom: 4.5),
//                                 child: Text("New Brand".toUpperCase(),
//                                   style: railway.copyWith(color: Colors.black, fontSize: 9.5),),
//                               ),
//                             ),
//                             /// title
//                             SizedBox(height: 2),
//                             Container(
//                               // color: Colors.purpleAccent,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                                       child: Text("${controller.bagePageCartResponse?.data?[index]?.product?.brand?.name??""}".toUpperCase(),
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: railway.copyWith(fontWeight: FontWeight.w600 ,color: Colors.black, fontSize: 20),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             /// desc
//                             SizedBox(height: 0),
//                             Container(
//                               // color: Colors.pinkAccent,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                                       child: Text("${controller.bagePageCartResponse?.data?[index]?.product?.name??""}",
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: poppins.copyWith(color: Colors.black, fontSize: 16),),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 3),
//                             Container(
//                               // color: Colors.red,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                                 child:   Row(
//
//                                   mainAxisAlignment:MainAxisAlignment.center,
//
//                                   // crossAxisAlignment: CrossAxisAlignment.center,
//
//                                   children: [
//
//                                     Row(
//                                       children: [
//                                         Text("Colour: ",       style: poppins.copyWith(fontWeight: FontWeight.bold ,color: Colors.black, fontSize: 16),),
//                                         Text("${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.color?.name??""}",
//                                           style: railway.copyWith( color: Colors.black, fontSize: 16),),
//                                       ],
//                                     ),
//                                     SizedBox(width: 8),
//                                     Row(
//                                       children: [
//                                         Text("Size: ",       style: poppins.copyWith(fontWeight: FontWeight.bold ,color: Colors.black, fontSize: 16),),
//                                         Text("XL",
//                                           // Text("${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.productInventories?[0]?.size?.sizeCode??""}",
//                                           style: railway.copyWith( color: Colors.black, fontSize: 16),),
//                                       ],
//                                     ),
//                                     SizedBox(width: 8),
//                                     /*       Row(
//                     children: [
//                       Text("Qty: ",       style: poppins.copyWith(fontWeight: FontWeight.bold ,color: Colors.black, fontSize: 10),),
//                       Text("2",       style: railway.copyWith( color: Colors.black, fontSize: 10),),
//                     ],
//                   ),*/
//                                     Container(
//                                       // color: deep,
//                                       // width: 100,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           InkWell(
//                                             onTap:(){
//
//                                               // Get.find<CartController>().updateProductToCart(cart,isIncrease: false);
//
//                                             },
//                                             child: Container(
//                                               // color: red,
//                                               //   height: 20,
//                                                 width: 30,
//                                                 // decoration: BoxDecoration(
//                                                 //   color: Theme.of(context).primaryColor,
//                                                 //   borderRadius: BorderRadius.only(
//                                                 //     topLeft: Radius.circular(40),
//                                                 //     bottomLeft: Radius.circular(40),
//                                                 //   ),
//                                                 // ),
//                                                 child: Center(child: Text('-', style: robotoMedium.copyWith(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w700),))),
//
//                                           ),
//                                           Container(
//
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
//                                               child: Center(child: Text('2',
//                                                 // child: Center(child: Text('${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.productInventories?[0]?.stockQty??""}',
//                                                 style: railway.copyWith(color: Colors.black, fontSize: 16 ),)),
//                                               // child: Center(child: Text('${cart.productQty}')),
//                                             ),),
//                                           InkWell(
//                                             onTap:(){
//                                               // Get.find<CartController>().updateProductToCart(cart,isIncrease: true);
//                                             },
//                                             child: Container(
//                                               // height: 20,
//                                                 width: 30,
//                                                 // decoration: BoxDecoration(
//                                                 //   color: Theme.of(context).primaryColor,
//                                                 //   borderRadius: BorderRadius.only(
//                                                 //     topRight: Radius.circular(40),
//                                                 //     bottomRight: Radius.circular(40),
//                                                 //   ),
//                                                 // ),
//                                                 child: Center(child: Text('+', style: robotoMedium.copyWith(color: Colors.black, fontSize: 16, ),))),
//
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                             SizedBox(height: 8),
//                             Text("${controller.bagePageCartResponse?.data?[index]?.price??""} BDT",
//                               style: poppins.copyWith(fontWeight: FontWeight.bold , color: gold , fontSize: 16),
//                             ),
//                             SizedBox(height: 20),
//
//                             Divider(
//                               color: Color(0xffF1F7F8),
//                               height: 5,
//                               thickness: 5,
//                             ),
//
//                           ],
//                         ) ;
//                       }
//
//
//
//                   )
//                       :
//                   SizedBox(),
//
//                   // SizedBox(height: 12),
//
//                   Divider(
//                     color: Color(0xffF1F7F8),
//                     height: 5,
//                     thickness: 5,
//                   ),
//
//
//                   /// gift
//                   Column(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           widget.isExpanded1=! widget.isExpanded1;
//                           setState(() {
//                           });
//                         },
//                         child: Container(
//                             color: Color(0xffFFFFFF),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 20),
//                                           child: Image.asset(Images.gift, height: 20, width: 20,),
//                                         ),
//                                       ],
//                                     )
//                                 ),
//
//                                 Expanded(
//                                     flex: 9,
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 15),
//                                       child: Text("Add Your Gift Note",
//                                         style: railway.copyWith( fontWeight: FontWeight.bold, fontSize: 12),),
//                                     )
//                                 ),
//
//                                 Expanded(
//                                     flex: 2,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 8),
//                                       child: Icon(widget.isExpanded1? Icons.minimize : Icons.add, size: 20, color: Colors.black54,),
//                                     )
//                                 )
//                               ],
//                             )
//                         ),
//                       ),
//                       widget.isExpanded1? Container(
//                         // color: Colors.red,
//                         padding: const EdgeInsets.only(left: 20,right: 15,top: 8, bottom: 8),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
//                               child: Text(
//                                 "* Item/s will be gift wrapped together and 1 gift note included.\n\n* Invoice will be excluded from the order, and sent to you via e-mail.",
//                                 style: poppins.copyWith(
//                                     fontSize: 10,
//                                     // fontWeight: FontWeight.w600,
//                                     color: Colors.black87
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             MyTextField(
//                               height: 40,
//                               titlesize: 10,
//                               maxLines: 5,
//                               minLines: 2,
//                               controller: msgCtr,
//                               focusNode: msgFcs,
//                               title: "Your Message (300)",
//                               hintText: "Text here",
//                             ),
//                             SizedBox(height: 4),
//
//                             /*  Padding(
//                           padding: const EdgeInsets.only(left: 0, right: 0),
//                           child: ElevatedButton(
//                             // style: raisedButtonStyle,
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.zero
//                               ),
//                               primary: Color(0xff2D2D2D),
//                               minimumSize: const Size.fromHeight(35),
//                             ),
//                             onPressed: () {
//                             },
//                             child: Text('Add Message'.toUpperCase(), style: railway.copyWith(fontSize: 12),),
//                           ),
//                         ),*/
//                             // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                           ],
//                         ),
//                       ):Container(),
//                     ],
//                   ),
//                   Divider(
//                     thickness: 10,
//                     color: Color(0xffF2F6F9),
//                   ),
//
//                   /// coupon
//                   Column(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           widget.isExpanded2=! widget.isExpanded2;
//                           setState(() {
//                           });
//                         },
//                         child: Container(
//                             color: Color(0xffFFFFFF),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 20),
//                                           child: Image.asset(Images.coupon, height: 20, width: 20,),
//                                         ),
//                                       ],
//                                     )
//                                 ),
//
//                                 Expanded(
//                                     flex: 9,
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 15),
//                                       child: Text("Apply Coupon",
//                                         style: railway.copyWith( fontWeight: FontWeight.bold, fontSize: 12),),
//                                     )
//                                 ),
//
//                                 Expanded(
//                                     flex: 2,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 8),
//                                       child: Icon(widget.isExpanded2? Icons.minimize : Icons.add, size: 20, color: Colors.black54,),
//                                     )
//                                 )
//                               ],
//                             )
//                         ),
//                       ),
//                       widget.isExpanded2? Container(
//                         // color: Colors.red,
//                         padding: const EdgeInsets.only(left: 20,right: 15,top: 8, bottom: 8),
//                         child: Column(
//                           children: [
//
//                             SizedBox(height: 8),
//                             MyTextField(
//                               title: "Isle Coupon",
//                               titlesize: 10,
//                               height: 40,
//                               maxLines: 5,
//                               minLines: 2,
//                               controller: islecouponCtr,
//                               focusNode: islecouponFcs,
//
//                               hintText: "APPLY",
//                             ),
//                             SizedBox(height: 4),
//                             MyTextField(
//                               title: "Brand Coupon",
//                               titlesize: 10,
//                               height: 40,
//                               maxLines: 5,
//                               minLines: 2,
//                               controller: brandcouponCtr,
//                               focusNode: brandcouponFcs,
//
//                               hintText: "APPLY",
//                             ),
//                             // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
//                           ],
//                         ),
//                       ):Container(),
//                     ],
//                   ),
//                   Divider(
//                     thickness: 10,
//                     color: Color(0xffF2F6F9),
//                   ),
//
//                   /// reward
//                   Column(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           widget.isExpanded3=! widget.isExpanded3;
//                           setState(() {
//                           });
//                         },
//                         child: Container(
//                             color: Color(0xffFFFFFF),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 20),
//                                           child: Image.asset(Images.reward, height: 20, width: 20,),
//                                         ),
//                                       ],
//                                     )
//                                 ),
//
//                                 Expanded(
//                                     flex: 9,
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 15),
//                                       child: Text("Isle Rewards - Earn & Redeem",
//                                         style: railway.copyWith( fontWeight: FontWeight.bold, fontSize: 12),),
//                                     )
//                                 ),
//
//                                 Expanded(
//                                     flex: 2,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 8),
//                                       child: Icon(widget.isExpanded3? Icons.minimize : Icons.add, size: 20, color: Colors.black54,),
//                                     )
//                                 )
//                               ],
//                             )
//                         ),
//                       ),
//                       widget.isExpanded3? Container(
//                         // color: Colors.red,
//                         padding: const EdgeInsets.only(left: 20,right: 15,top: 8, bottom: 8),
//                         child: Column(
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             InkWell(
//                               onTap: toggleCheckbox, // Toggle the checkbox when the widget is tapped
//                               child: Row(
//                                 children: <Widget>[
//                                   Checkbox(
//                                     activeColor: gold,
//                                     value: isChecked,
//                                     onChanged: (value) {
//                                       toggleCheckbox();
//                                     }, // Use an empty onChanged to make the checkbox read-only
//                                   ),
//                                   Text('Join the Isle Programme to earn with this purchase',  style: poppins.copyWith(
//                                       fontSize: 10,
//                                       // fontWeight: FontWeight.w600,
//                                       color: Colors.black87
//                                   ),),
//                                 ],
//                               ),
//                             ),
//
//                             SizedBox(height: 0),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 20,right: 15,top: 0, bottom: 8),
//                                   child: Text('By clicking the button, you agree to the Terms & Conditions of the Isle programme',
//
//                                     style: poppins.copyWith(
//                                         fontSize: 10,
//                                         // fontWeight: FontWeight.w600,
//                                         color: Colors.grey
//                                     ),),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//                             MyTextField(
//                               title: "You can Redeem 2000 points in this product",
//                               titlesize: 10,
//                               height: 40,
//                               maxLines: 5,
//                               minLines: 2,
//                               controller: rewardCtr,
//                               focusNode: rewardFcs,
//                               hintText: "APPLY",
//                             ),
//                           ],
//                         ),
//                       ):Container(),
//                     ],
//                   ),
//                   Divider(
//                     thickness: 10,
//                     color: Color(0xffF2F6F9),
//                   ),
//
//                   /// emi
//                   InkWell(
//                     onTap: (){
//                       widget.isExpanded4=! widget.isExpanded4;
//                       setState(() {
//                       });
//                     },
//                     child: Container(
//                         color: Color(0xffFFFFFF),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex: 2,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 20),
//                                       child: Image.asset(Images.emi, height: 20, width: 20,),
//                                     ),
//                                   ],
//                                 )
//                             ),
//
//                             Expanded(
//                                 flex: 9,
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 15),
//                                   child: Text("EMI",
//                                     style: railway.copyWith( fontWeight: FontWeight.bold, fontSize: 12),),
//                                 )
//                             ),
//
//                             Expanded(
//                                 flex: 2,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 8),
//                                   child: Icon(widget.isExpanded4? Icons.minimize : Icons.add, size: 20, color: Colors.black54,),
//                                 )
//                             )
//                           ],
//                         )
//                     ),
//                   ),
//
//                   widget.isExpanded4? Container(
//                     // color: Colors.red,
//                     padding: const EdgeInsets.only(left: 0,right: 15,top: 8, bottom: 8),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//
//
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                           child: Container(
//                             height: Get.height/12,
//                             child: Row(
//                               // mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: Container(
//                                     height: Get.height/11,
//                                     // width: Get.width,
//                                     // color: Colors.purple,
//                                     child: Image.asset(
//                                       Images.Isle_member,
//                                       // height: 100,
//                                       // width: Get.width,
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 15),
//                                 Expanded(
//                                   flex: 7,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//
//                                       Text.rich(
//                                           TextSpan(
//                                               text: '4 interest-free monthly payments of\n',
//                                               style: railway.copyWith(fontSize: 11, height: 1.6),
//                                               children: <InlineSpan>[
//                                                 TextSpan(
//                                                   text: '156.25 BDT',
//                                                   style: railway.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
//                                                 )
//                                               ]
//                                           )
//                                       ),
//
//                                       SizedBox(height: 0),
//                                       Text.rich(
//                                           TextSpan(
//                                               text: 'Valid for orders ',
//                                               style: railway.copyWith(fontSize: 11, height: 1.6),
//                                               children: <InlineSpan>[
//                                                 TextSpan(
//                                                   text: '10 BDT - 14,000 BDT',
//                                                   style: railway.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
//                                                 )
//                                               ]
//                                           )
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                           child: Container(
//                             height: Get.height/12,
//                             child: Row(
//                               // mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: Container(
//                                     height: Get.height/11,
//                                     // width: Get.width,
//                                     // color: Colors.purple,
//                                     child: Image.asset(
//                                       Images.Isle_member,
//                                       // height: 100,
//                                       // width: Get.width,
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 15),
//                                 Expanded(
//                                   flex: 7,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//
//                                       Text.rich(
//                                           TextSpan(
//                                               text: 'Bank instalments',
//                                               style: railway.copyWith(fontSize: 11, height: 1.6),
//                                               children: <InlineSpan>[
//                                                 TextSpan(
//                                                   text: '',
//                                                   style: railway.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
//                                                 )
//                                               ]
//                                           )
//                                       ),
//
//                                       SizedBox(height: 0),
//                                       Text.rich(
//                                           TextSpan(
//                                               text: '',
//                                               style: railway.copyWith(fontSize: 11, height: 1.6),
//                                               children: <InlineSpan>[
//                                                 TextSpan(
//                                                   text: 'Interest-free bank instalments',
//                                                   style: railway.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
//                                                 )
//                                               ]
//                                           )
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 0),
//
//                       ],
//                     ),
//                   ):Container(),
//                   Divider(
//                     thickness: 10,
//                     color: Color(0xffF2F6F9),
//                   ),
//
//
//                   Container(
//                       color: Color(0xffFFFFFF),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 25, right: 15, top: 15, bottom: 5),
//                                   child: Text("Sub Total",
//                                     style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10),),
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               Expanded(
//                                 flex: 2,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 5),
//                                   child: Text("2,445 BDT",
//                                     textAlign: TextAlign.right,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 10),),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//
//                               Expanded(
//                                 flex: 2,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 5),
//                                   child: Row(
//                                     children: [
//                                       Text("Grand Total",
//                                         style: poppins.copyWith( color: Colors.black , fontWeight: FontWeight.bold, fontSize: 12),),
//                                       SizedBox(width: 5),
//                                       Text("Vat Includes",
//                                         style: poppins.copyWith( color: Colors.grey , fontWeight: FontWeight.bold, fontSize: 9),),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               Expanded(
//                                 flex: 2,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 5),
//                                   child: Text("2,445 BDT",
//                                     textAlign: TextAlign.right,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: poppins.copyWith( color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 12),),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           SizedBox(height: 12),
//
//                           Padding(
//                             padding: const EdgeInsets.only(left: 25, right: 25),
//                             child: ElevatedButton(
//                               // style: raisedButtonStyle,
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.zero
//                                 ),
//                                 primary: gold,
//                                 // primary: Color(0xff2D2D2D),
//                                 minimumSize: const Size.fromHeight(45),
//                               ),
//                               onPressed: () {
//                                 // Get.to(MapScreen());
//                                 Get.to(CheckOutPage(pageIndex: 0,));
//                               },
//                               child: Text('Secure Checkout'.toUpperCase(), style: railway.copyWith(fontSize: 12),),
//                             ),
//                           ),
//                           SizedBox(height: 4),
//
//                         ],
//                       )
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                       color: Color(0xffF2F6F9),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(left: 25, right: 25),
//                             child: Container(
//                               // color: Colors.pinkAccent,
//                               height: 40,
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: ListView.builder(
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: bankcard.length,
//                                       itemBuilder: (context, index) {
//                                         return Container(
//                                           // color: Colors.green,
//                                           child: Padding(
//                                             padding: EdgeInsets.only(left: 5, right: 5), // Add some spacing between items
//                                             child: InkWell(
//
//                                               child: Container(
//
//                                                 width: 35,
//                                                 height: 25,
//                                                 // margin: EdgeInsets.all(10),
//                                                 // padding: EdgeInsets.all(5),
//                                                 child: Image.network("${bankcard[index]}", height: 40, width: 60,),
//
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 30),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(30 , 0, 30, 0),
//                             child: Row(
//                               children: [
//                                 Image.asset(Images.like, height: 30, width: 30,),
//                                 SizedBox(width: 12),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("Shop with confidence", style: poppins.copyWith( color: gold , fontWeight: FontWeight.bold, fontSize: 9),),
//                                     SizedBox(height: 4),
//                                     Text("Free easy returns up to 30 days.Learn more",style: poppins.copyWith( color: Colors.black ,  fontSize: 9),),
//
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           SizedBox(height: 40),
//                         ],
//                       )
//                   ),
//
//
//
//                 ],
//               ),
//             ),);
//         }
//     );
//   }
//
//
//
//
//
//
//
//
//
// }
