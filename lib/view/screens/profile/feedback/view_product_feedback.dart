import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/about%20isle%20reward/about_isle_reward_controller.dart';
import 'package:isletestapp/controller/profile/product%20feedback/product_feedback_controller.dart';
import 'package:isletestapp/helper/date_converter.dart';
import 'package:isletestapp/util/HexColor.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/coustom_searching.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_dropdown.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/all_popup/account_product_feedback_popup.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';

class ViewProductFeedback extends StatefulWidget {
  final String orderNo;
  ViewProductFeedback({Key? key, required this.orderNo,
  }) : super(key: key);
  @override
  State<ViewProductFeedback> createState() => _WishListPageState();
}

class _WishListPageState extends State<ViewProductFeedback> {

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductFeedbackController>().getViewProductFeedbackData(widget.orderNo);
    }
    );
  }
  @override
  void dispose() {
    super.dispose();
    Get.find<ProductFeedbackController>().dataClearForProductFeedback();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductFeedbackController>(
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: const UniversalBottomNav(),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Color(0xff000000)),
              titleSpacing: 0,
              backgroundColor: const Color(0xffFFFFFF),
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 62,
              actions: [
                InkWell(
                    onTap: () {
                      Get.to(SearchScreen());
                    },
                    // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                    child: Image.asset(
                      Images.search,
                      height: 22,
                      width: 22,
                    )),
                const SizedBox(width: 10),
              ],
              leadingWidth: Get.width / 3.5,
              title: const CustomLogo(),
            ),
            // backgroundColor: Color(0xffEBEFF3),
            backgroundColor: const Color(0xffFFFFFF),
            body: controller.accountProductFeedbackResponse!=null?
            ProgressHUD(
              inAsyncCall: controller.isLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics:  NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          itemCount: controller.productFeedbackDetailsResponse?.data?.length??0,
                          // itemCount: controller.jobCardResponse!.cardDetails!.length,
                          itemBuilder: (context, index) {
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.productFeedbackDetailsResponse?.data?.length ?? 0,
                              itemBuilder: (context, index2) {
                                return Column(
                                  children: [
                                    Divider(
                                      height: 5,
                                      thickness: 5,
                                      color: Color(0xffF2F6F9),
                                      // color: Colors.pink,
                                    ),
                                    Container(
                                      height: 90,
                                      // color: Colors.green,
                                      child: Row(
                                        children: [
                                        Expanded(
                                          flex: 1,
                                          child: CustomImageCached(
                                            isRound: false,
                                            image: '${AppConstants.BASE_URL}${controller.productFeedbackDetailsResponse!.data![index]?.orderDetails?[index2]?.productColorVariant?.profilePhoto ?? ""}',
                                            height: Get.height,
                                            width: Get.width,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8, top: 12),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${controller.productFeedbackDetailsResponse?.data?[index]?.orderDetails?[index2]?.product?.name??""}", style: railwaybold.copyWith(fontSize: 13),),
                                                  SizedBox(height: 7),
                                                  Text("Brand Name: ${controller.productFeedbackDetailsResponse?.data?[index]?.orderDetails?[index2]?.product?.brand?.name??""??""}".toUpperCase(), style: railway.copyWith(fontSize: 11, fontWeight: FontWeight.w500)),
                                                  SizedBox(height: 4),
                                                  Text("Quantity: ${controller.productFeedbackDetailsResponse?.data?[index]?.orderDetails?[index2]?.quantity??""??""}", style: railway.copyWith(fontSize: 11, fontWeight: FontWeight.w500)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child:  Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Container(
                                                  alignment: Alignment.bottomRight,
                                                  height: 32, width:32,child: GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      showModalBottomSheet(
                                                        isScrollControlled: true,
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return ProductFeedbackPopup(id: controller.productFeedbackDetailsResponse?.data?[index]?.orderDetails?[index2]?.productId!.toString()??"",);
                                                        },
                                                      ),
                                                      fullscreenDialog: true
                                                  );
                                                },
                                                  child: Icon(Icons.feedback_outlined, color: gold, size: 28, ))),
                                            ),
                                          ),
                                          ],
                                         ),
                                    ),
                                  ],
                                );
                                },
                            );
                          }),
      /*                Divider(
                        height: 10,
                        thickness: 10,
                        color: Color(0xffF2F6F9),
                        // color: Colors.pink,
                      ),
*/
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )
                : SizedBox(),
          );
        }
    );
  }

















}
