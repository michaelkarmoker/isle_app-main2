import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/order%20track/order_track_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({Key? key}) : super(key: key);

  @override
  State<OrderTrack> createState() => _WardrobNameState();
}

class _WardrobNameState extends State<OrderTrack> {
  // TextEditingController ordernoCtr = TextEditingController();
  FocusNode ordernoFcs = FocusNode();
  bool isTrack = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get.find<OrderTrackController>().getOrderTrackData();
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UniversalBottomNav(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff000000)),
        titleSpacing: 0,
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        elevation: 0,
        leadingWidth: Get.width / 3.5,
        title: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(MainScreen());
              },
              child: Container(
                // margin: EdgeInsets.all(15),
                  padding: EdgeInsets.only(left: 5, right: 5, top: 5,bottom: 5),
                  // color: Colors.red,
                  height: 55, width: 75,
                  child: Image.asset(Images.logo, height: 55, width: 70, fit: BoxFit.fill,)),
            ),
          ],
        ),
      ),
      body: GetBuilder<OrderTrackController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 15,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Track Your Order", style: railway.copyWith(fontSize: 20,  fontWeight: FontWeight.w700,),),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(Images.box, color: Colors.black54, height: 25, width: 25,),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text("Please enter the order number we sent you via email/SMS in order to track your order status.",
                          style: railway.copyWith(fontSize: 11,  fontWeight: FontWeight.w500,),),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    controller: controller.ordernoCtr,
                    focusNode: ordernoFcs,
                    title: "Order Number",
                    hintText: "Enter Order Number",
                    // isRequired: true,
                    titlesize: 10,
                    // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                    myfontWeight: FontWeight.bold,
                  ),
           /*       SizedBox(height: 12),
                  MyTextField(
                    controller: wardrobCtr,
                    focusNode: wardrobFcs,
                    title: "Email / Phone",
                    hintText: "Enter your email or Phone",
                    // isRequired: true,
                    titlesize: 10,
                    // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                    myfontWeight: FontWeight.bold,
                  ),*/
                  SizedBox(height: 8),

                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset(Images.similar, height: 25, width: 25, color: Colors.black,)),
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Your ‘Order Details’ in ‘My Account’",
                                    overflow: TextOverflow.ellipsis,
                                    style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 12,),),
                                  SizedBox(height: 4),
                                  Text("If you are registered with Isle, you can track the status of your order delivery by signing into your account and selecting", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 11,),),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 8),
                  CustomButton(
                      height: 45,
                      width: Get.width / 1,
                      buttoncolor: gold,
                      // image: Images.drop,
                      // imageheight: 20,
                      // imagegap: 6,
                      color: Colors.white,
                      buttontextcolor: Colors.white,
                      radius: 0,
                      fontSize: 12.5,
                      onPressed: () {
                        // Get.to(OrderStatusWidget(orderTrackResponse: controller.orderTrackresponse!,));
                        if(controller.ordernoCtr.text != ''){
                          Get.find<OrderTrackController>().getOrderTrackData(id: controller.ordernoCtr.text.trim());
                          isTrack=! isTrack;
                          setState(() {
                          });
                        } else{
                          showCustomSnackBar("Please Enter Order No", duration: 1.5);
                       if(isTrack= true){
                         isTrack=! isTrack;
                         setState(() {
                         });
                       } else {}
                        }
                      },
                      buttonText: "View Order Status".toUpperCase()),
                  isTrack ?
                      controller.orderTrackresponse!=null?
                          ListView.builder(
                            itemCount: controller.orderTrackresponse!.data!.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                              int indx = index+1;
                              return   Column(
                                children: [
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Image.asset(Images.box, height: 18, width: 18,),
                                      SizedBox(width: 8),
                                      Text("${controller.orderTrackresponse?.data?[index]?.packageName??""}"),
                                      // Text("Package-$indx-${controller.ordernoCtr.text.toString()}"),
                                    ],
                                  ),
                                  SizedBox(height: 8),

                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: gold, ),
                                        borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  flex:2,child: Text('Order No',
                                                style: railwaybold.copyWith(
                                                    color: gold,
                                                    fontSize: 11
                                                ),
                                              )
                                              ),
                                              Container(
                                                // color: Colors.red,
                                                width: 15,
                                                child: Text(" : ", style: poppins.copyWith(fontSize: 11), textAlign: TextAlign.left),
                                              ),
                                              Expanded(flex:4,child: Text(
                                                "${controller.orderTrackresponse?.data?[index]?.order?.orderNo??""}",
                                                style: poppins.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                    color: Color(0xff374E5F),
                                                    fontSize: 11),
                                              ))
                                            ],),
                                          SizedBox(height: 1),
                                          Row(
                                            children: [
                                              Expanded(flex:2,child: Text('Seller',
                                                style: railwaybold.copyWith(
                                                    color: gold,
                                                    fontSize: 11
                                                ),
                                              )),
                                              Container(
                                                // color: Colors.red,
                                                width: 15,
                                                child: Text(" : ", style: poppins.copyWith(fontSize: 11), textAlign: TextAlign.left),
                                              ),
                                              Expanded(flex:4,child: Text('${controller.orderTrackresponse?.data?[index]?.vendor?.name??""}',
                                                style: railwaybold.copyWith(
                                                    color: Color(0xff374E5F),
                                                    fontSize: 11),
                                              ))
                                            ],),
                                          SizedBox(height: 1),
                                          Row(
                                            children: [
                                              Expanded(flex:2,child: Text('Email/Phone',
                                                style: railwaybold.copyWith(
                                                    color: gold,
                                                    fontSize: 11
                                                ),
                                              )),
                                              Container(
                                                // color: Colors.red,
                                                width: 15,
                                                child: Text(" : ", style: poppins.copyWith(fontSize: 11), textAlign: TextAlign.left),
                                              ),
                                              Expanded(flex:4,child: Text('${Get.find<UserProfileController>().userProfileResponse?.data?.email!=null? Get.find<UserProfileController>().userProfileResponse?.data?.email??"" : Get.find<UserProfileController>().userProfileResponse?.data?.phone ??""}',
                                                style: poppins.copyWith(
                                                    color: Color(0xff374E5F),
                                                    fontSize: 11),
                                              ))
                                            ],),
                                          SizedBox(height: 1),
                                          Row(
                                            children: [
                                              Expanded(flex:2,child: Text('Delivery Type',
                                                style: railwaybold.copyWith(
                                                    color: gold,
                                                    fontSize: 11
                                                ),
                                              )),
                                              Container(
                                                // color: Colors.red,
                                                width: 15,
                                                child: Text(" : ", style: poppins.copyWith(fontSize: 11), textAlign: TextAlign.left),
                                              ),
                                              Expanded(flex:4,child: Text('${controller.orderTrackresponse?.data?[index]?.deliveryType?.name??""}',
                                                style: poppins.copyWith(
                                                    color: Color(0xff374E5F),
                                                    fontSize: 11),
                                              ))
                                            ],),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      // color: Colors.red,
                                      padding: const EdgeInsets.only(left: 0,right: 0,top: 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Column(
                                                children: [
                                                  controller.orderTrackresponse != null
                                                      ? controller.orderTrackresponse!.data != null &&
                                                      controller.orderTrackresponse!.data!.length > 0
                                                      ? CircleAvatar(
                                                    backgroundColor: controller.orderTrackresponse!.data![index].packageStatus == "pending" ?
                                                    gold
                                                        : silvercolor,
                                                    radius: 30,
                                                    child: Image.asset(Images.orderlist, color: Colors.black, height: 40, width: 40),
                                                  )
                                                      : SizedBox(child: Text('No data available'))
                                                      : SizedBox(child: Text('Loading...')),

                                                  SizedBox(height: 5),
                                                  Text("Received",
                                                    // textAlign: TextAlign.center,
                                                    style: railway.copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              controller.orderTrackresponse!.data![index].packageStatus == "confirmed" ?
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(2,30, 2, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color:  gold,
                                                      height: 6,
                                                      width: 30,
                                                    )
                                                  ],
                                                ),
                                              )
                                                  :      Padding(
                                                padding: const EdgeInsets.fromLTRB(1,30, 1, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  controller.orderTrackresponse != null
                                                      ? controller.orderTrackresponse!.data != null &&
                                                      controller.orderTrackresponse!.data!.length > 0
                                                      ? CircleAvatar(
                                                    backgroundColor: controller.orderTrackresponse!.data![index].packageStatus == "confirmed"
                                                        ? gold
                                                        : silvercolor,
                                                    radius: 30,
                                                    child: Image.asset(Images.box, color: Colors.black, height: 32, width: 32),
                                                  )
                                                      : SizedBox(child: Text('No data available'))
                                                      : SizedBox(child: Text('Loading...')),
                                                  SizedBox(height: 5),
                                                  Text("Confirmed",
                                                    // textAlign: TextAlign.center,
                                                    style: railway.copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),

                                              controller.orderTrackresponse!.data![index].packageStatus == "in-process" ?
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(2,30, 2, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color:  gold,
                                                      height: 6,
                                                      width: 30,
                                                    )
                                                  ],
                                                ),
                                              )
                                                  :      Padding(
                                                padding: const EdgeInsets.fromLTRB(1,30, 1, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  controller.orderTrackresponse != null
                                                      ? controller.orderTrackresponse!.data != null &&
                                                      controller.orderTrackresponse!.data!.length > 0
                                                      ? CircleAvatar(
                                                    backgroundColor: controller.orderTrackresponse!.data![index].packageStatus == "in-process"
                                                        ? gold
                                                        : silvercolor,
                                                    radius: 30,
                                                    child: Image.asset(Images.car3, color: Colors.black, height: 32, width: 32),
                                                  )
                                                      : SizedBox(child: Text('No data available'))
                                                      : SizedBox(child: Text('Loading...')),
                                                  SizedBox(height: 5),
                                                  Text("In-process",
                                                    // textAlign: TextAlign.center,
                                                    style: railway.copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              controller.orderTrackresponse!.data![index].packageStatus == "shipped" ?
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(2,30, 2, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color:  gold,
                                                      height: 6,
                                                      width: 30,
                                                    )
                                                  ],
                                                ),
                                              )
                                                  :      Padding(
                                                padding: const EdgeInsets.fromLTRB(1,30, 1, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Column(
                                                children: [
                                                  controller.orderTrackresponse != null
                                                      ? controller.orderTrackresponse!.data != null &&
                                                      controller.orderTrackresponse!.data!.length > 0
                                                      ? CircleAvatar(
                                                    backgroundColor: controller.orderTrackresponse!.data![index].packageStatus == "shipped"
                                                        ? gold
                                                        : silvercolor,
                                                    radius: 30,
                                                    child: Image.asset(Images.car, color: Colors.black, height: 30, width: 30),
                                                  )
                                                      : SizedBox(child: Text('No data available'))
                                                      : SizedBox(child: Text('Loading...')),
                                                  SizedBox(height: 5),
                                                  Text("Shipped",
                                                    // textAlign: TextAlign.center,
                                                    style: railway.copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              controller.orderTrackresponse!.data![index].packageStatus == "delivered" ?
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(2,30, 2, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color:  gold,
                                                      height: 6,
                                                      width: 30,
                                                    )
                                                  ],
                                                ),
                                              )
                                                  :      Padding(
                                                padding: const EdgeInsets.fromLTRB(1,30, 1, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 1),
                                                      child: CircleAvatar(
                                                        radius: 3,
                                                        backgroundColor: silvercolor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Column(
                                                children: [
                                                  controller.orderTrackresponse != null
                                                      ? controller.orderTrackresponse!.data != null &&
                                                      controller.orderTrackresponse!.data!.length > 0
                                                      ? CircleAvatar(
                                                    backgroundColor: controller.orderTrackresponse!.data![index].packageStatus == "delivered" ?
                                                    gold
                                                        : silvercolor,
                                                    radius: 30,
                                                    child: Image.asset(Images.delivered, color: Colors.black, height: 35, width: 35),
                                                  )
                                                      : SizedBox(child: Text('No data available'))
                                                      : SizedBox(child: Text('Loading...')),
                                                  SizedBox(height: 5),
                                                  Text("Delivered",
                                                    // textAlign: TextAlign.center,
                                                    style: railway.copyWith(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30)
                                ],
                              );
                              }
                          )

                 : SizedBox() : SizedBox(),




                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
