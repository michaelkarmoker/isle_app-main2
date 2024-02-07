// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:isletestapp/controller/product/product_details_controller.dart';
// import 'package:isletestapp/util/app_constants.dart';
// import 'package:isletestapp/util/styles.dart';
// import 'package:isletestapp/view/base/ProgressHUD.dart';
// import 'package:isletestapp/view/screens/category/product_page.dart';
//
// class ProductListPage extends StatefulWidget {
//   final String title;
//   final int page;
//   final String categoryId;
//   const ProductListPage({Key? key, required this.title, required this.page, required this.categoryId}) : super(key: key);
//
//   @override
//   State<ProductListPage> createState() => _AboutState();
// }
//
// class _AboutState extends State<ProductListPage> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     WidgetsBinding.instance.addPostFrameCallback(
//             (_) {
//           if(widget.page==AppConstants.SECTION){
//             Get.find<ProductListController>().getCategoryProductData(widget.categoryId);
//           } else if (widget.page==AppConstants.CATEGORY){
//             Get.find<ProductListController>().getCategoryProductData(widget.categoryId);
//           }else if (widget.page==AppConstants.SUBCATEGORY){
//             Get.find<ProductListController>().getSubCategoryProductData(widget.categoryId);
//           }else{
//             Get.find<ProductListController>().getCategoryProductData(widget.categoryId);
//           }
//
//         }
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProductListController>(
//         builder: (controller) {
//           return ProgressHUD(
//             inAsyncCall: controller.isLoading,
//             child: Scaffold(
//               appBar: AppBar(
//                 iconTheme: IconThemeData(color: Colors.black),
//                 centerTitle: true,title: Text(widget.title, style: railway.copyWith(color: Colors.black),),),
//               body: SingleChildScrollView(
//                   child: controller.isLoading?Container():
//                   Column(
//                     children: [
//                       if(widget.page==AppConstants.SECTION)...{
//                         controller.categoryProductResponse!=null?
//                         CustomCategoryViewPage(
//                           passindex: index,
//                           categoryId: controller.nestedCategoryResponse!.data![index].id!.toString(),
//                           pageIndex: 0,
//                           cardimage: '',
//
//
//
//
//         /*                  title: controller.aboutUsResponse!.about!.title??"",
//                             desc: controller.aboutUsResponse!.about!.description??"",
//                             image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}",*/
//
//                         )
//
//                             :Container(
//                           height: Get.height,
//                           width: Get.width,
//                           child: Center(child: Padding(
//                             padding: const EdgeInsets.only(top: 0),
//                             child: Image.asset(Images.result_not_found, height: 80, width: 80,),
//                           ),),),
//
//                       } else if (widget.page==AppConstants.BTRI)...{
//                         controller.btriResponse!=null?
//                         CustomView(title: selectedLanguage==AppConstants.en?controller!.btriResponse!.btri!.title??"":controller!.btriResponse!.btri!.titleBn??"",
//                             desc: selectedLanguage==AppConstants.en?controller.btriResponse!.btri!.description??"":controller.btriResponse!.btri!.descriptionBn??"",
//                             image: "${AppConstants.BTRI_IMAGE_URL}${controller.btriResponse!.btri!.image??""}")
//                             :Container(
//                           height: Get.height,
//                           width: Get.width,
//                           child: Center(child: Padding(
//                             padding: const EdgeInsets.only(top: 0),
//                             child: Image.asset(Images.result_not_found, height: 80, width: 80,),
//                           ),),),
//
//                       }else if (widget.page==AppConstants.INNOVATOR)...{
//                         controller.innovatorResponse!=null?
//                         CustomView(title: selectedLanguage==AppConstants.en?controller.innovatorResponse!.innovator!.title??"":controller.innovatorResponse!.innovator!.titleBn??"",
//                             desc: selectedLanguage==AppConstants.en?controller.innovatorResponse!.innovator!.description??"":controller.innovatorResponse!.innovator!.descriptionBn??"",
//                             image: "${AppConstants.ABOUT_IMAGE_URL}${controller.innovatorResponse!.innovator!.image??""}")
//                             :Container(
//                           height: Get.height,
//                           width: Get.width,
//                           child: Center(child: Padding(
//                             padding: const EdgeInsets.only(top: 0),
//                             child: Image.asset(Images.result_not_found, height: 80, width: 80,),
//                           ),),),
//
//                       }else...{
//                         controller.dedicatedResponse!=null?
//                         CustomView(title: selectedLanguage==AppConstants.en?controller.dedicatedResponse!.dedicated!.title??"":controller.dedicatedResponse!.dedicated!.titleBn??"",
//                             desc: selectedLanguage==AppConstants.en?controller.dedicatedResponse!.dedicated!.description??"":controller.dedicatedResponse!.dedicated!.descriptionBn??"",
//                             image: "${AppConstants.ABOUT_IMAGE_URL}${controller.dedicatedResponse!.dedicated!.image??""}")
//                             :Container(
//                           height: Get.height,
//                           width: Get.width,
//                           child: Center(child: Padding(
//                             padding: const EdgeInsets.only(top: 0),
//                             child: Image.asset(Images.result_not_found, height: 80, width: 80,),
//                           ),),),
//                       },
//                       SizedBox(height: 50)
//                     ],
//                   )
//               ),
//             ),
//           );
//         }
//     );
//   }
// }
