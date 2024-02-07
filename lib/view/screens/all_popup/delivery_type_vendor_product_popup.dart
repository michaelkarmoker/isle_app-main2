import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/checkOut/checkout_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import '../../../data/model/request model/order_place_request.dart';


class DeliveryTypePopup extends StatefulWidget {
  // final int wardrobeIndex;
  // final String wardrobeName;

  const DeliveryTypePopup({super.key,
    //required this.wardrobeIndex,
    // required this.wardrobeName
  });
  @override
  State<DeliveryTypePopup> createState() => _InfoPopupState();
}
class _InfoPopupState extends State<DeliveryTypePopup> {
  bool isSuccessful = false; // Initially set to false
/*  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
          Get.find<CheckOutController>().getBagPageCartDataForVendorType();
        }
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
        builder: (controller) {
          return ProgressHUD(
            inAsyncCall: controller.isLoading,
            child: SingleChildScrollView(
              child:
              controller.bagePageCartResponse!=null? controller.bagePageCartResponse!.data!.length>0?
              Container(
                height: MediaQuery.of(context).size.height * 0.85, // Set height to 90% of screen height
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Product Delivery Type Information', style: railway.copyWith(fontSize: 14, fontWeight: FontWeight.bold),),
                      trailing: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.vendorWiseData.length,
                        // itemCount: controller.bagePageCartResponse!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: gold,
                                  width: 0.5,
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 6, right: 6, top: 15, bottom: 15),
                              child: Column(
                                children: [
                                  ListView.builder(
                                      itemCount: controller.vendorWiseData[index].data.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index2) {
                                        return Card(
                                          elevation: 0.5,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: 55,
                                                    width: 55,
                                                    child: CustomImageCached(
                                                      placeholder: "assets/image/placeholder.png",
                                                      image: '${AppConstants.BASE_URL}${controller.vendorWiseData[index].data[index2]?.productColorVariant?.profilePhoto??""}',
                                                      fit: BoxFit.fill,
                                                      isRound: false,
                                                      height: Get.height,
                                                      width: Get.width,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Seller Name:",style: railwaybold.copyWith(fontSize: 11),),
                                                        SizedBox(height: 0),
                                                        Text("${controller.vendorWiseData[index].data[index2]?.product?.vendor?.name??""}", style: railway.copyWith(fontSize: 11),),
                                                        SizedBox(height: 4),
                                                        Text("Product Name:",style: railwaybold.copyWith(fontSize: 11),),
                                                        SizedBox(height: 0),
                                                        Text("${controller.vendorWiseData[index].data[index2]?.product?.name??""}",style: railway.copyWith(fontSize: 11),),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              /* Divider(height: 8, thickness: 8, color: Color(0xffF2F6F9),),*/
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                  Container(
                                    height: 50,
                                    width: Get.width,
                                    child: ListView.builder(
                                        itemCount: controller.vendorWiseData[index].deliveryType.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index2) {
                                          String selectedd=controller.selectedDistrict??"";
                                          bool isDhaka=selectedd=="Dhaka";

                                          return isDhaka?controller.vendorWiseData[index].deliveryType[index2]!.availableCity!?Container(
                                            width: Get.width/2.5,
                                            child: Card(
                                              elevation: 0.5,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: 25,
                                                                width: 25,
                                                                child:Radio<int>(
                                                                  activeColor: gold,
                                                                  value: controller.vendorWiseData[index].deliveryType[index2].id!,
                                                                  groupValue:controller.vendorWiseData[index].selectedDeliveryValue, // Provide the appropriate group value
                                                                  onChanged: (int? value) {
                                                                    controller.vendorWiseData[index].selectedDeliveryValue=value!;
                                                                    controller.update();
                                                                  },
                                                                ),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("${controller.vendorWiseData[index].deliveryType[index2].name}".toUpperCase(), style: railwaybold.copyWith(fontSize: 9),),
                                                                  SizedBox(height: 0),
                                                                  // Text("${controller.vendorWiseData[index].deliveryType[index2].availableOutsideCity}", style: poppins.copyWith(fontSize: 9),),
                                                                  Text("${controller.vendorWiseData[index].deliveryType[index2].deliveryChargeCity} BDT", style: poppins.copyWith(fontSize: 9),),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  /* Divider(height: 8, thickness: 8, color: Color(0xffF2F6F9),),*/
                                                ],
                                              ),
                                            ),
                                          ):SizedBox():controller.vendorWiseData[index].deliveryType[index2]!.availableOutsideCity!?Container(
                                            width: Get.width/2.5,
                                            child: Card(
                                              elevation: 0.5,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: 25,
                                                                width: 25,
                                                                child: Radio<int>(
                                                                  activeColor: gold,
                                                                  value: controller.vendorWiseData[index].deliveryType[index2].id!,
                                                                  groupValue:controller.vendorWiseData[index].selectedDeliveryValue, // Provide the appropriate group value
                                                                  onChanged: (int? value) {
                                                                    controller.vendorWiseData[index].selectedDeliveryValue=value!;
                                                                    controller.update();
                                                                  },
                                                                ),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("${controller.vendorWiseData[index].deliveryType[index2].name}".toUpperCase(), style: railwaybold.copyWith(fontSize: 9),),
                                                                  SizedBox(height: 0),
                                                                  // Text("${controller.vendorWiseData[index].deliveryType[index2].availableOutsideCity}", style: poppins.copyWith(fontSize: 9),),
                                                                  Text("${controller.vendorWiseData[index].deliveryType[index2].deliveryChargeOutsideCity} BDT", style: poppins.copyWith(fontSize: 9),),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  /* Divider(height: 8, thickness: 8, color: Color(0xffF2F6F9),),*/
                                                ],
                                              ),
                                            ),
                                          ):SizedBox();
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                          radius: 0,
                          buttoncolor: gold,
                          buttontextcolor: Colors.white,
                          fontSize: 12,
                          myfontweight: FontWeight.bold,
                          onPressed: (){
                        bool notSelect=false;
                        for(int i=0;i<controller.vendorWiseData.length;i++) {
                          if(controller.vendorWiseData[i].selectedDeliveryValue==0){
                            notSelect=true;
                            break;
                          }
                        }
                        if(notSelect){
                          showCustomSnackBar("please select delivery type");
                        }else{
                          controller.vendorWiseData.map((e) {
                            e.deliveryType.map((e2) {
                              if(e2.id==e.selectedDeliveryValue){
                                print(e2.id);
                                print(e2.name);
                                controller.orderPlaceRequest.deliveryTypes.add(new DeliveryTypes(
                                    deliveryTypeId: e2.id,
                                    vendorId: e.vendorId,
                                    packageTypeId: null,
                                    deliveryCharge: controller.selectedDistrict=="Dhaka"?e2.deliveryChargeCity!.toDouble():e2.deliveryChargeOutsideCity
                                ));
                              }
                            }).toList();
                          }).toList();
                          double totalDeliveryCost=0.0;
                          controller.orderPlaceRequest.deliveryTypes.map((e) {
                            totalDeliveryCost=totalDeliveryCost+e.deliveryCharge!.toDouble();
                          }).toList();
                          controller.orderPlaceRequest.shippingCost=totalDeliveryCost;
                          showCustomSnackBar("Delivery Added", isPosition: false, isError: false);
                          controller.update();
                          Navigator.pop(context);
                        }
                      }, buttonText: "Continue".toUpperCase()),
                    )
                  ],
                ),
              )
                  : SizedBox() : SizedBox(),
            ),
          );
        }
    );
  }

}
