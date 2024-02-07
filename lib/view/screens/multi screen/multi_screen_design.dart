import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/multi%20page%20controller/multi_page_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/custom_shimmer.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/multi%20screen/custom_widget.dart';
import 'package:isletestapp/view/screens/multi%20screen/video_player.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';

class MultiScreen extends StatefulWidget {
  final String title;
  final int page;
  const MultiScreen({Key? key, required this.title, required this.page}) : super(key: key);

  @override
  State<MultiScreen> createState() => _AboutState();
}

class _AboutState extends State<MultiScreen> {

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
          if(widget.page==AppConstants.ABOUT){
            Get.find<MultiPageController>().getAboutUs();
          } else if (widget.page==AppConstants.TERMS){
            Get.find<MultiPageController>().getTermsConditions();
          }else if (widget.page==AppConstants.PRIVECY){
            Get.find<MultiPageController>().getPrivecyCookies();
          }else if (widget.page==AppConstants.SHIPPING){
            Get.find<MultiPageController>().getShippingDelivery();
          }
   /*       else if (widget.page==AppConstants.PAYMENT){
            Get.find<MultiPageController>().getPaymentPricing();
          }*/
          else if (widget.page==AppConstants.RETURN){
            Get.find<MultiPageController>().getReturnRefund();
          }
          else if (widget.page==AppConstants.ORDERDELIVERY){
            Get.find<MultiPageController>().getOrderDelivery();
          }
          else if (widget.page==AppConstants.CAREER){
            Get.find<MultiPageController>().getCareer();
          }
          else if (widget.page==AppConstants.COLLABORATE){
            Get.find<MultiPageController>().getCollaborate();
          }
          else if (widget.page==AppConstants.FINDITEMS){
            Get.find<MultiPageController>().getFindItems();
          }
          else if (widget.page==AppConstants.ORDERPAY){
            Get.find<MultiPageController>().getOrderPay();
          }
          else {
           showCustomSnackBar("something error occur");
          }
        }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MultiPageController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: Color(0xffFAFAFA),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xff000000)),
              titleSpacing: 0,
              backgroundColor: Color(0xffFFFFFF),
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 62,
              actions: [
                InkWell(
                    onTap: () {
                      Get.to(WishListPage());
                    },
                    child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)),
                // SizedBox(width: 15),


                SizedBox(width: 10),
              ],


              leadingWidth: Get.width/3.5,
              title: CustomLogo(),
            ),
            body: SingleChildScrollView(
                child: controller.isLoading?MyShimmer(hight: 40):
                Column(
                  children: [
                    if(widget.page==AppConstants.ABOUT)...{
                      controller.aboutUsResponse!=null? CustomView(
                        title: controller.aboutUsResponse?.data?.title??"",
                          desc: controller.aboutUsResponse?.data?.shortDescription??"",
                          // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                      )
                          :Container(
                        height: Get.height,
                        width: Get.width,
                        child: Center(child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                        ),),),

                    }
                    else if (widget.page==AppConstants.TERMS)...{
                      controller.termsConditionResponse!=null? CustomView(
                        title: controller.termsConditionResponse?.data?.title??"",
                        desc: controller.termsConditionResponse?.data?.shortDescription??"",
                        // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                      )
                          :Container(
                        height: Get.height,
                        width: Get.width,
                        child: Center(child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                        ),),),

                    }
              else if (widget.page==AppConstants.PRIVECY)...{
          controller.privecyCookiesResponse!=null? CustomView(
          title: controller.privecyCookiesResponse?.data?.title??"",
          desc: controller.privecyCookiesResponse?.data?.description??"",
          // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
          )
              :Container(
          height: Get.height,
          width: Get.width,
          child: Center(child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Image.asset(Images.result_not_found, height: 80, width: 80,),
          ),),),

          }
                      else if (widget.page==AppConstants.SHIPPING)...{
                          controller.shippingDeliveryResponse!=null? CustomView(
                            title: controller.shippingDeliveryResponse?.data?.title??"",
                            desc: controller.shippingDeliveryResponse?.data?.description??"",
                            // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                          )
                              :Container(
                            height: Get.height,
                            width: Get.width,
                            child: Center(child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                            ),),),

                        }
                     /*   else if (widget.page==AppConstants.PAYMENT)...{
                            controller.paymentPricingResponse!=null? CustomView(
                              title: controller.paymentPricingResponse?.data?.title??"",
                              desc: controller.paymentPricingResponse?.data?.description??"",
                              // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                            )
                                :Container(
                              height: Get.height,
                              width: Get.width,
                              child: Center(child: Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                              ),),),

                          }*/
                          else if (widget.page==AppConstants.RETURN)...{
                              controller.returnRefundResponse!=null? CustomView(
                                title: controller.returnRefundResponse?.data?.title??"",
                                desc: controller.returnRefundResponse?.data?.description??"",
                                // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                              )
                                  :Container(
                                height: Get.height,
                                width: Get.width,
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                                ),),),

                            }
                            else if (widget.page==AppConstants.ORDERDELIVERY)...{
                                controller.orderDeliveryresponse!=null? CustomView(
                                  title: controller.orderDeliveryresponse?.data?.title??"",
                                  // shortDesc: controller.orderDeliveryresponse?.data?.slug!.replaceAll('-', '') ??"",
                                  desc: controller.orderDeliveryresponse?.data?.description??"",
                                  // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                                )
                                    :Container(
                                  height: Get.height,
                                  width: Get.width,
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                                  ),),),

                              }
                              else if (widget.page==AppConstants.CAREER)...{
                                  controller.careerResponse!=null? CustomView(
                                    title: controller.careerResponse?.data?.title??"",
                                    desc: controller.careerResponse?.data?.description??"",
                                    // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                                  )
                                      :Container(
                                    height: Get.height,
                                    width: Get.width,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                                    ),),),

                                }
                                else if (widget.page==AppConstants.COLLABORATE)...{
                                    controller.collaborateResponse!=null? CustomView(
                                      title: controller.collaborateResponse?.data?.title??"",
                                      desc: controller.collaborateResponse?.data?.description??"",
                                      // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                                    ) :Container(
                                      height: Get.height,
                                      width: Get.width,
                                      child: Center(child: Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                                      ),),),

                                  }
                                  else if (widget.page==AppConstants.FINDITEMS)...{
                                      controller.findItemsResponse!=null? Column(
                                        children: [
                                          CustomView(
                                            shortDesc: controller.findItemsResponse?.data?.title??"",
                                            title: controller.findItemsResponse?.data?.slug!.replaceAll('-', ' ')??"",
                                            desc: controller.findItemsResponse?.data?.description??"",
                                            // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                                          ),
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child:  Container(
                                                // height: 250,
                                                child: VideoPlayerWidget(url: controller.findItemsResponse!.data!.video!.toString(),)),),

                                        ],
                                      )
                                          :Container(
                                        height: Get.height,
                                        width: Get.width,
                                        child: Center(child: Padding(
                                          padding: const EdgeInsets.only(top: 0),
                                          child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                                        ),),),

                                    }
                                    else if (widget.page==AppConstants.ORDERPAY)...{
                                        controller.orderPayResponse!=null? Column(
                                          children: [
                                            CustomView(
                                              title: controller.orderPayResponse?.data?.slug!.replaceAll('-', ' ')??"",
                                              shortDesc: controller.orderPayResponse?.data?.title??"",
                                              desc: controller.orderPayResponse?.data?.description??"",
                                              // image: "${AppConstants.ABOUT_IMAGE_URL}${controller.aboutUsResponse!.about!.image??""}"
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child:  Container(
                                                // height: 250,
                                                  child: VideoPlayerWidget(url: controller.orderPayResponse!.data!.video!.toString(),)),),
                                          ],
                                        )
                                            :Container(
                                          height: Get.height,
                                          width: Get.width,
                                          child: Center(child: Padding(
                                            padding: const EdgeInsets.only(top: 0),
                                            child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                                          ),),),

                                      },








                    SizedBox(height: 50)
                  ],
                )
            ),
          );
        }
    );
  }
}
