import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/cart/cart_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/all_popup/info_popup.dart';
import 'package:isletestapp/view/screens/checkout/checkout_page.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';
import 'package:isletestapp/view/screens/home/home_page.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import '../../base/custom_button.dart';

class BagPage extends StatefulWidget {


  BagPage({Key? key,

  }) : super(key: key); ///
  bool isExpanded1=false;
  bool isExpanded2=false;
  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;
  bool isExpanded6=false;
  bool isExpanded7=false;

  bool childexp1=false;
  bool childexp2=false;
  bool childexp3=false;
  bool childexp4=false;
  bool childexp5=false;
  bool childexp6=false;

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {

  TextEditingController searchCtr = TextEditingController();
  bool isSearchClick=false;

  TextEditingController rewardCtr = TextEditingController();

  FocusNode msgFcs = FocusNode();
  FocusNode islecouponFcs = FocusNode();
  FocusNode brandcouponFcs = FocusNode();
  FocusNode rewardFcs = FocusNode();

  bool indicatorcolor= true;
  TextEditingController msgboxCtr = TextEditingController();
  FocusNode msgboxFcs = FocusNode();

  bool isChecked = false;

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked; // Toggle the checkbox state
    });
  }


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
          // Get.find<ProductDetailsController>().getBagPageCartData(widget.corelationId);
          Get.find<CartController>().getBagPageCartData();
          Get.find<CartController>().getGeneralSettingData();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        builder: (controller) {
          return Scaffold(
            // backgroundColor: Color(0xffFAFBFB),
            backgroundColor: Color(0xffFAFAFA),
            // drawer: IsleDrawer(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xff000000)),
              titleSpacing: 0,
              backgroundColor: Color(0xffFFFFFF),
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 62,
              actions: [
                WishButtonWidget(),
                SizedBox(width: 7),
                InkWell(
                    onTap: () {
                      Get.to(
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return InfoPopup();
                          },
                        ),
                      );
                    },
                    child: Image.asset(Images.info, height: 20, width: 20, color: Color(0xff000000),)),
                SizedBox(width: 10),
              ],
              leadingWidth: Get.width/3.5,
              title: CustomLogo(),
            ),
            body: SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Get.find<CartController>().getBagPageCartData();
                  await Get.find<CartController>().getGeneralSettingData();
                },
                child: Column(
                  children: [
                    /// Top BANNER
                    Container(
                      height: 30,
                      width: Get.width,
                      color: Color(0xffFFFFFF),
                      // width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Yours Bag"+" (${controller.bagePageCartResponse?.data?.length??"0"})", style: poppins.copyWith(fontWeight: FontWeight.bold, fontSize: 16),)
                        ],
                      ),
                    ),
                    SizedBox(height: 0),
                    controller.bagePageCartResponse!=null? controller.bagePageCartResponse!.data!.length>0?
                    Column(
                      children: [
                        ListView.builder(
                            itemCount: controller.bagePageCartResponse?.data?.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: ( BuildContext context, int index ) {
                              return InkWell(
                                onTap: (){
                                  Get.to(ProductDetailsPage(
                                    productId: controller.bagePageCartResponse?.data?[index]?.productId?.toString()??"",
                                  ));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      // color: Colors.red,
                                      color: Color(0xffFAFAFA),
                                      height: Get.height/4.5,
                                      child:  Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xffFAFBFB),
                                                // color: Colors.tealAccent,
                                              ),
                                              child: ClipRRect(
                                                  child: CustomImageCached(
                                                    placeholder: "assets/image/placeholder.png",
                                                    image: '${AppConstants.BASE_URL}${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.profilePhoto??""}',
                                                    fit: BoxFit.contain,
                                                  )
                                              ),
                                            ),
                                            Positioned(
                                              top: 20,
                                              right: 20,
                                              child: InkWell(
                                                  onTap: (){
                                                    Get.dialog( CustomAlerDialogForPermission(
                                                      iconString: Images.delete,
                                                      title: 'Remove Item',
                                                      description: 'Do you really want to remove from bag?',
                                                      yesBtntap: () {
                                                        Get.back();
                                                        controller.cartDelete(controller.bagePageCartResponse?.data?[index]?.id?.toString()??"");
                                                      },
                                                      noBtntap: (){
                                                      },
                                                      noBtnText: "NO",
                                                      yesBtnText: "YES",
                                                    ));
                                                    // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());
                                                  },
                                                  child: Image.asset(Images.delete, color: silvercolor, height: 28, width: 28,)),
                                            )
                                          ]
                                      ),
                                    ),
                                    SizedBox(height: 0),
                                    InkWell(
                                      onTap: (){
                                        // Get.to(Dashboard(pageIndex: 0));
                                        Get.to(Home());
                                      },
                                      child: Container(
                                        /// orginal color
                                        color: Colors.white,
                                        // color: Color(0xffFEFFFF),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 12, right: 12, top: 4.5, bottom: 4.5),
                                          child: Text("Shopping Continue".toUpperCase(),
                                            style: railway.copyWith(color: Colors.black, fontSize: 9.5),),
                                        ),
                                      ),
                                    ),
                                    /// title
                                    SizedBox(height: 2),
                                    Container(
                                      // color: Colors.purpleAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text("${controller.bagePageCartResponse?.data?[index]?.product?.brand?.name??""}".toUpperCase(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontWeight: FontWeight.w600 ,color: Colors.black, fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    /// desc
                                    SizedBox(height: 0),
                                    Container(
                                      // color: Colors.pinkAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text("${controller.bagePageCartResponse?.data?[index]?.product?.name??""}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: poppins.copyWith(color: Colors.black, fontSize: 16),),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Container(
                                      // color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child:   Row(
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Colour: ",       style: poppins.copyWith(fontWeight: FontWeight.bold ,color: Colors.black, fontSize: 16),),
                                                Text("${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.color?.name??""}",
                                                  style: railway.copyWith( color: Colors.black, fontSize: 16),),
                                              ],
                                            ),
                                            SizedBox(width: 8),
                                            Row(
                                              children: [
                                                Text("Size: ",       style: poppins.copyWith(fontWeight: FontWeight.bold ,color: Colors.black, fontSize: 16),),
                                                Text("${controller.bagePageCartResponse?.data?[index]?.productInventory?.size?.sizeCode??""}",
                                                  // Text("${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.productInventories?[0]?.size?.sizeCode??""}",
                                                  style: railway.copyWith( color: Colors.black, fontSize: 16),),
                                              ],
                                            ),
                                            SizedBox(width: 8),
                                            Container(
                                              // color: deep,
                                              // width: 100,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap:(){
                                                      controller.addQuantity(false, index);
                                                    },
                                                    child: Container(
                                                        width: 30,
                                                        child: Center(child: Text('-', style: robotoMedium.copyWith(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w700),))),
                                                  ),
                                                  Container(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
                                                      child: Center(child: Text("${controller.bagePageCartResponse?.data?[index]?.quantity??0}",
                                                        // child: Center(child: Text('${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.productInventories?[0]?.stockQty??""}',
                                                        style: poppins.copyWith(color: Colors.black, fontSize: 16 ),)),
                                                      // child: Center(child: Text('${cart.productQty}')),
                                                    ),),
                                                  InkWell(
                                                    onTap: (){
                                                      controller.addQuantity(true, index);
                                                    },
                                                    child: Container(
                                                      // height: 20,
                                                        width: 30,
                                                        child: Center(child: Text('+', style: robotoMedium.copyWith(color: Colors.black, fontSize: 16, ),))),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    controller.bagePageCartResponse?.data?[index]?.product?.discount == 0 ||  controller.bagePageCartResponse?.data?[index]?.product?.discount == null  ?
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        "${controller.bagePageCartResponse?.data?[index]?.totalPrice?.toStringAsFixed(0)??0} BDT",
                                        style: poppins.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: gold,
                                            fontSize: 16
                                        ),
                                      ),
                                    )
                                        :
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: Row(  mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${controller.bagePageCartResponse?.data?[index]?.totalPrice?.toStringAsFixed(0)??0} BDT",
                                            style: poppins.copyWith(
                                                decoration: TextDecoration.lineThrough,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red,
                                                fontSize: 16
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            "${controller.bagePageCartResponse?.data?[index]?.totalDiscountedPrice?.toStringAsFixed(0)??0} BDT",
                                            style: poppins.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: gold,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    /*    Text("${controller.bagePageCartResponse!.data![index].totalPrice!.toStringAsFixed(2)??""} BDT",
                                      style: poppins.copyWith(fontWeight: FontWeight.bold , color: gold , fontSize: 16),
                                    ),*/
                                    controller.bagePageCartResponse!.data![index].productInventory!.stockQty!<6? SizedBox(height: 5) : SizedBox(),
                                    controller.bagePageCartResponse!.data![index].productInventory!=null?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        controller.bagePageCartResponse!.data![index].productInventory!.stockQty!<6?
                                        Image.asset(Images.clock, height: 15, width: 15, color: red)
                                            : SizedBox(),
                                        SizedBox(width: 5),
                                        Text("${controller.bagePageCartResponse!.data![index].productInventory!.stockQty!<6?"Stock is low: only ${controller.bagePageCartResponse!.data![index].productInventory!.stockQty!} is left":""}",
                                          style: robotoRegular.copyWith(color: Colors.red),),
                                      ],
                                    ):SizedBox() ,
                                    controller.bagePageCartResponse!.data![index].productInventory!.stockQty!<6? SizedBox(height: 20) : SizedBox(),
                                    Divider(
                                      color: Color(0xffF1F7F8),
                                      height: 5,
                                      thickness: 5,
                                    ),
                                  ],
                                ),
                              ) ;
                            }
                        ),
                        Divider(
                          color: Color(0xffF1F7F8),
                          height: 5,
                          thickness: 5,
                        ),
                        /// gift
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                widget.isExpanded1=! widget.isExpanded1;
                                setState(() {
                                });
                              },
                              child: Container(
                                  color: Color(0xffFFFFFF),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20),
                                                child: Image.asset(Images.gift, height: 20, width: 20,),
                                              ),
                                            ],
                                          )
                                      ),

                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Text("Add Your Gift Note",
                                              style: railway.copyWith( fontWeight: FontWeight.bold, fontSize: 12),),
                                          )
                                      ),

                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(widget.isExpanded1? Icons.minimize : Icons.add, size: 20, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),
                            widget.isExpanded1? Container(
                              // color: Colors.red,
                              padding: const EdgeInsets.only(left: 20,right: 15,top: 8, bottom: 8),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
                                    child: Text(
                                      "● Invoice will be excluded from the order, and sent to you via e-mail.",
                                      style: poppins.copyWith(
                                          fontSize: 10,
                                          // fontWeight: FontWeight.w600,
                                          color: Colors.black87
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  MyTextField(
                                    height: 40,
                                    titlesize: 10,
                                    // maxLines: 5,
                                    // minLines: 2,
                                    controller: controller.msgCtr,
                                    focusNode: msgFcs,
                                    title: "Your Message (300)",
                                    hintText: "Text here",
                                    hintStyle: railway.copyWith(fontSize: 9),
                                  ),
                                  SizedBox(height: 4),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
                                    child: ElevatedButton(
                                      // style: raisedButtonStyle,
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero
                                        ),
                                        primary: Color(0xff2D2D2D),
                                        minimumSize: const Size.fromHeight(35),
                                      ),
                                      onPressed: () {
                                        // Get the text from the controller
                                        String giftNote = controller.msgCtr.text;
                                        // Navigate to the other screen and pass the value as a parameter
                                        // Get.to(CheckOutPage(giftNote: msgCtr.text,));
                                        if (giftNote.isNotEmpty) {
                                          // Get.to(CheckOutPage(giftNote: giftNote));
                                          // If not empty, show the snack message
                                          showCustomSnackBar("Added your note", isError: false);
                                          // You can also navigate to another screen here if needed
                                        } else {
                                          // If empty, you may choose to show a different message or take other actions
                                        }
                                      },
                                      child: Text('Add Message'.toUpperCase(), style: railway.copyWith(fontSize: 12),),
                                    ),
                                  ),
                                  // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                ],
                              ),
                            ):Container(),
                          ],
                        ),
                        Divider(
                          thickness: 10,
                          color: Color(0xffF2F6F9),
                        ),

                        /// coupon
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                widget.isExpanded2=! widget.isExpanded2;
                                setState(() {
                                });
                              },
                              child: Container(
                                  color: Color(0xffFFFFFF),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20),
                                                child: Image.asset(Images.coupon, height: 20, width: 20,),
                                              ),
                                            ],
                                          )
                                      ),
                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Text("Apply Coupon",
                                              style: railway.copyWith( fontWeight: FontWeight.bold, fontSize: 12),),
                                          )
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(widget.isExpanded2? Icons.minimize : Icons.add, size: 20, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),
                            widget.isExpanded2? Container(
                              // color: Colors.red,
                              padding: const EdgeInsets.only(left: 20,right: 6,top: 8, bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(height: 8),
                                  Text("You can apply only one coupon",
                                    style: poppins.copyWith(
                                        fontSize: 10,
                                        // fontWeight: FontWeight.w600,
                                        color: Colors.black87
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,

                                    children: [
                                      Expanded(
                                        child: MyTextField(
                                          title: "ISLE Coupon",
                                          titlesize: 10,
                                          height: 40,
                                          controller: controller.islecouponCtr,
                                          focusNode: islecouponFcs,
                                          hintText: "Isle-xxxxxx",
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      InkWell(
                                          onTap: () async{

                                            String deviceID = await Get.find<AuthController>().getDeviceID();
                                            String customerID = await Get.find<AuthController>().getUserId();
                                            controller.applyIsleCoupon(
                                                customer_id: customerID,
                                                corelation_id: deviceID,
                                                code: controller.islecouponCtr.text,
                                                type: "isle",
                                                is_guest: "false"
                                            );
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: gold,
                                                  borderRadius: BorderRadius.circular(0)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15,right: 15),
                                                child: Text("Apply".toUpperCase(), style: railway.copyWith(fontSize: 8, fontWeight: FontWeight.w600),),
                                              ))
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: MyTextField(
                                          title: "Brand Coupon",
                                          titlesize: 10,
                                          height: 40,
                                          controller: controller.brandcouponCtr,
                                          focusNode: brandcouponFcs,
                                          hintText: "brand-xxxxx",
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      InkWell(
                                          onTap: () async{
                                            String deviceID = await Get.find<AuthController>().getDeviceID();
                                            String customerID = await Get.find<AuthController>().getUserId();
                                            controller.applyIsleCoupon(
                                                customer_id: customerID,
                                                corelation_id: deviceID,
                                                code: controller.brandcouponCtr.text,
                                                type: "brand",
                                                is_guest: "false"
                                            );
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: gold,
                                                  borderRadius: BorderRadius.circular(0)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15,right: 15),
                                                child: Text("Apply".toUpperCase(), style: railway.copyWith(fontSize: 8, fontWeight: FontWeight.w600),),
                                              ))
                                      )
                                    ],
                                  ),
                                  // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                ],
                              ),
                            ):Container(),
                          ],
                        ),
                        Divider(
                          thickness: 10,
                          color: Color(0xffF2F6F9),
                        ),

                        /// reward
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                widget.isExpanded3=! widget.isExpanded3;
                                setState(() {
                                });
                              },
                              child: Container(
                                  color: Color(0xffFFFFFF),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20),
                                                child: Image.asset(Images.reward, height: 20, width: 20,),
                                              ),
                                            ],
                                          )
                                      ),

                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Text("Isle Rewards - Earn & Redeem",
                                              style: railway.copyWith( fontWeight: FontWeight.bold, fontSize: 12),),
                                          )
                                      ),

                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Icon(widget.isExpanded3? Icons.minimize : Icons.add, size: 20, color: Colors.black54,),
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),
                            widget.isExpanded3? Container(
                              // color: Colors.red,
                              padding: const EdgeInsets.only(left: 20,right: 15,top: 8, bottom: 8),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  /*      InkWell(
                                    onTap: toggleCheckbox, // Toggle the checkbox when the widget is tapped
                                    child: Row(
                                      children: <Widget>[
                                        Checkbox(
                                          activeColor: gold,
                                          value: isChecked,
                                          onChanged: (value) {
                                            toggleCheckbox();
                                          }, // Use an empty onChanged to make the checkbox read-only
                                        ),
                                        Text('Join the Isle Programme to earn with this purchase',  style: poppins.copyWith(
                                            fontSize: 10,
                                            // fontWeight: FontWeight.w600,
                                            color: Colors.black87
                                        ),),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20,right: 15,top: 0, bottom: 8),
                                        child: Text('By clicking the button, you agree to the Terms & Conditions of the Isle programme',

                                          style: poppins.copyWith(
                                              fontSize: 10,
                                              // fontWeight: FontWeight.w600,
                                              color: Colors.grey
                                          ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),*/
                                  MyTextField(
                                    title: "You can Redeem 2000 points in this product",
                                    titlesize: 10,
                                    height: 40,
                                    controller: rewardCtr,
                                    focusNode: rewardFcs,
                                    hintText: "Redeem",
                                  ),
                                ],
                              ),
                            ):Container(),
                          ],
                        ),
                        Divider(
                          thickness: 10,
                          color: Color(0xffF2F6F9),
                        ),

                        /// emi
                        /*        InkWell(
                          onTap: (){
                            widget.isExpanded4=! widget.isExpanded4;
                            setState(() {
                            });
                          },
                          child: Container(
                              color: Color(0xffFFFFFF),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: Image.asset(Images.emi, height: 20, width: 20,),
                                          ),
                                        ],
                                      )
                                  ),

                                  Expanded(
                                      flex: 9,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Text("EMI",
                                          style: railway.copyWith( fontWeight: FontWeight.bold, fontSize: 12),),
                                      )
                                  ),

                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Icon(widget.isExpanded4? Icons.minimize : Icons.add, size: 20, color: Colors.black54,),
                                      )
                                  )
                                ],
                              )
                          ),
                        ),
                        widget.isExpanded4? Container(
                          // color: Colors.red,
                          padding: const EdgeInsets.only(left: 0,right: 15,top: 8, bottom: 8),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [


                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Container(
                                  height: Get.height/12,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: Get.height/11,
                                          // width: Get.width,
                                          // color: Colors.purple,
                                          child: Image.asset(
                                            Images.Isle_member,
                                            // height: 100,
                                            // width: Get.width,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        flex: 7,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text.rich(
                                                TextSpan(
                                                    text: '4 interest-free monthly payments of\n',
                                                    style: railway.copyWith(fontSize: 11, height: 1.6),
                                                    children: <InlineSpan>[
                                                      TextSpan(
                                                        text: '156.25 BDT',
                                                        style: railway.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
                                                      )
                                                    ]
                                                )
                                            ),

                                            SizedBox(height: 0),
                                            Text.rich(
                                                TextSpan(
                                                    text: 'Valid for orders ',
                                                    style: railway.copyWith(fontSize: 11, height: 1.6),
                                                    children: <InlineSpan>[
                                                      TextSpan(
                                                        text: '10 BDT - 14,000 BDT',
                                                        style: railway.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
                                                      )
                                                    ]
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Container(
                                  height: Get.height/12,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: Get.height/11,
                                          // width: Get.width,
                                          // color: Colors.purple,
                                          child: Image.asset(
                                            Images.Isle_member,
                                            // height: 100,
                                            // width: Get.width,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        flex: 7,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text.rich(
                                                TextSpan(
                                                    text: 'Bank instalments',
                                                    style: railway.copyWith(fontSize: 11, height: 1.6),
                                                    children: <InlineSpan>[
                                                      TextSpan(
                                                        text: '',
                                                        style: railway.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
                                                      )
                                                    ]
                                                )
                                            ),

                                            SizedBox(height: 0),
                                            Text.rich(
                                                TextSpan(
                                                    text: '',
                                                    style: railway.copyWith(fontSize: 11, height: 1.6),
                                                    children: <InlineSpan>[
                                                      TextSpan(
                                                        text: 'Interest-free bank instalments',
                                                        style: railway.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
                                                      )
                                                    ]
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 0),

                            ],
                          ),
                        ):Container(),*/
             /*           Divider(
                          thickness: 10,
                          color: Color(0xffF2F6F9),
                        ),
*/

                        Container(
                            color: Color(0xffFFFFFF),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15, top: 25, bottom: 0),
                                        child: Row(
                                          children: [
                                            Text("Sub Total",
                                              style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 13),),
                                            Text(" ( + VAT)",
                                              style: poppins.copyWith( fontSize: 11, color: Colors.grey),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15, top: 25, bottom: 0),
                                        child: Text("${controller.subTotal!.toStringAsFixed(0)??""} BDT",
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 13),),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),

                                controller.isleCouponDis>0?Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                        child: Text("Isle Coupon",
                                          style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 13),),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                        child: Text("${controller.isleCouponDis??""} BDT",
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 13),),
                                      ),
                                    ),
                                  ],
                                )
                                    : SizedBox() ,
                                SizedBox(height: 5),

                                controller.brandCouponDis>0?Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                        child: Text("Brand Coupon",
                                          style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 13),),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                        child: Text("${controller.brandCouponDis??""} BDT",
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 13),),
                                      ),
                                    ),
                                  ],
                                )
                                    : SizedBox(),
                                SizedBox(height: 5),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 5),
                                        child:
                                        Text("Grand Total",
                                          style: poppins.copyWith( color: Colors.black , fontWeight: FontWeight.bold, fontSize: 15),),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 5),
                                        child: Text("${controller.grandTotal!.toStringAsFixed(0)??""} BDT",
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 15),),
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 25, right: 25),
                                  child: Text("Shipping cost and VAT amount will be calculated at final checkout",
                                    style: poppins.copyWith( color: Colors.black , fontSize: 11),),
                                ),
                                SizedBox(height: 8),
                                controller.bagePageCartResponse!.data!.length>0?
                                Container(
                                  height: 80,
                                  padding: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                                  child: GetBuilder<AuthController>(
                                      builder: (authController) {
                                        return Container(
                                          color: gold,
                                          child: InkWell(
                                              onTap: (){
                                                if(authController.isLoggedIn() || authController.isLoggedInGuest()){
                                                  Get.to(CheckOutPage(
                                                    orderPlaceRequest:controller.orderPlaceRequest,
                                                    isleCoupon: controller.islecouponCtr.text, brandCoupon: controller.brandcouponCtr.text,));
                                                }else{
                                                  Get.to(LoginRegisterPage(isFromCart: true, isbottomSheet: true,));
                                                }
                                              },
                                              child: Center(child: Text("${authController.isLoggedIn()?"Secure Checkout":"Login to continue"}".toUpperCase(),
                                                style: railwaybold.copyWith(color: Colors.white,fontSize: 12),))),
                                        );
                                      }
                                  ),
                                ):SizedBox(),

                                // Padding(
                                //   padding: const EdgeInsets.only(left: 25, right: 15),
                                //   child: CustomButton(
                                //     buttonText: 'Secure Checkout'.toUpperCase(),
                                //     fontSize: 12,
                                //     buttoncolor: gold,
                                //     // buttoncolor: gold,
                                //     buttontextcolor: Colors.white,
                                //     radius: 0,
                                //     onPressed: () {
                                //       // Get.to(MapScreen());
                                //       Get.to(CheckOutPage(pageIndex: 0,));
                                //     },
                                //   ),
                                // ),
                                SizedBox(height: 4),

                              ],
                            )
                        ),
                        // SizedBox(height: 8),
                        Container(
                            color: Color(0xffF2F6F9),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 21, right: 21),
                                  child: Container(
                                    // color: Colors.pinkAccent,
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: bankcard.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                // color: Colors.green,
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: 5, right: 5), // Add some spacing between items
                                                  child: InkWell(
                                                    child: Container(
                                                      width: 35,
                                                      height: 25,
                                                      // margin: EdgeInsets.all(10),
                                                      // padding: EdgeInsets.all(5),
                                                      child: Image.asset("${bankcard[index]}", height: 40, width: 60,),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30 , 0, 30, 0),
                                  child: Row(
                                    children: [
                                      Image.asset(Images.like, height: 30, width: 30,),
                                      SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Shop with confidence", style: poppins.copyWith( color: gold , fontWeight: FontWeight.bold, fontSize: 9),),
                                          SizedBox(height: 4),
                                          Text("Free easy returns up to 30 days.Learn more",style: poppins.copyWith( color: Colors.black ,  fontSize: 9),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                              ],
                            )
                        ),

                      ],
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 70,),
                        Image.asset(Images.emptybag,),
                        SizedBox(height: 20,),
                        Text("Your Shopping Bag is\n    currently empty!",style: railway.copyWith(fontSize: 18),),
                        SizedBox(height: 30),
                        CustomButton(
                          radius: 0,
                          height: 45,
                          width: 180,
                          buttoncolor: Colors.black,
                          buttontextcolor: Colors.white,
                          myfontweight: FontWeight.bold,
                          onPressed: () {
                            Get.to(()=>ProductPage(
                             page: AppConstants.SECTION,
                              indexId: 2,
                              pageId: 1,
                              id: "1",
                            ));
                            // Get.offAll(Dashboard(pageIndex: 0));
                          },
                          buttonText: 'shop new in'.toUpperCase(),
                          fontSize: 15,
                        ),
                        SizedBox(height: 30),
                      ],
                    )
                        : SizedBox(),
                  ],
                ),
              ),
            ),

          );
        }
    );
  }



/*int getStock(int index,CartController controller){
  String size=controller.bagePageCartResponse?.data?[index].size??"";
  int stock=0;
  controller.bagePageCartResponse?.data?[index].productColorVariant?.productInventories?.map((e) {
    if(e.size==size){
      stock=e.stockQty??0;
    }
  }).toList();
  return stock;
}*/







}
