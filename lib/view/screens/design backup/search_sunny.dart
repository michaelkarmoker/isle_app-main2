// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/util/images.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
// import 'package:isletestapp/view/base/custom_only_textfield_with_border_for_search.dart';
//
//
// class Sunny extends StatefulWidget {
//   Sunny({Key? key}) : super(key: key);
//
//   @override
//   State<Sunny> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<Sunny> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//  TextEditingController searchCtr = TextEditingController();
//   FocusNode searchFcs=FocusNode();
//
//   int selectedIndex=0;
//
// /*
//    @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Get.find<SearchController>().getCateData();
//   }
// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     Get.find<SearchController>().clear();
//   }*/
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       // endDrawer: FilterDrawer(controller:controller),
//       backgroundColor: Colors.white,
//       body: SafeArea(child:
//       Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.topLeft,
//                     // color: Colors.purple,
//                     child: InkWell(
//                         onTap: (){
//                           Get.back();
//                         },
//                         child: Icon(Icons.arrow_back_ios,size: 25,color: Theme.of(context).primaryColor,)),
//                   ),
//                 ),
//
//                 Expanded(
//                    child: Container(
//                     // color: Colors.red,
//                       height: 35, width: 100,
//                       child: Image.asset(Images.logo, height: 35, width: 100)),
//                  ),
//                 Expanded(child: SizedBox())
//               ],
//             ),
//
//             SizedBox(height: 15,),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Container(
//                 height: 40,
//                 // color: Colors.green,
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//
//                   children: [
//
//                     Expanded(
//                       flex: 7,
//                       child: CustomOnlyTextFieldWithBorder(
//                         height: 40,
//                         prefixIcon: Images.search,
//                         controller: searchCtr,
//                         focusNode: searchFcs,
//                         hintText: "Enter your email Address here",
//                         color: Colors.grey,
//
//                       ),
//                     ),
//
//                     Expanded(
//                       flex: 2,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 12),
//                         child: ElevatedButton(
//                           style: TextButton.styleFrom(
//                             // primary: Color(0xff2D2D2D)
//                             //   primary: Colors.white,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.zero
//                             ),
//                             primary: Color(0xff2D2D2D),
//                             minimumSize: const Size.fromHeight(40),
//                             backgroundColor: Colors.black87,
//                             // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
//                           ),
//                           onPressed: () {
//                           },
//                           child: Text('Search', style: robotoRegular.copyWith(color: Colors.white,fontSize: 11),),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 25,),
//
//
//
//             /* Text("YOU MIGHT BE INTERESTED IN",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
//                       SizedBox(height: 25,),*/
//          Expanded(
//               child: GridView.builder(
//                 // itemCount: controller.filterByProductResponse!.products!.data!.length,
//                 itemCount: 10,
//                 physics: BouncingScrollPhysics(),
//
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     childAspectRatio: 0.6,
//
//                     crossAxisCount:  2 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   // return InkWell(
//                   //     onTap: (){
//                   //       Get.to(ProductDetails(id:controller.filterByProductResponse!.products!.data![index].id.toString(),));
//                   //     },
//                   //     child: ProductItem(product: controller.filterByProductResponse!.products!.data![index],));
//                   return Center(child: Text("Product Card"),);
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//       ),
//     );
//   }
// }
