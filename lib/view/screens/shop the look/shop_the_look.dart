import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/all_popup/shop_the_look_size_or_color_popup.dart';
import 'package:isletestapp/view/screens/all_popup/wishlist_size_or_color_popup.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';

class ShopTheLook extends StatefulWidget {
  final int genderid;
  final int productId;
  final int childCategoryId;
  ShopTheLook({Key? key, required this.genderid,  required this.childCategoryId, required this.productId}) : super(key: key);

  @override
  State<ShopTheLook> createState() => _WardrobNameState();
}

class _WardrobNameState extends State<ShopTheLook> {
  TextEditingController wardrobCtr = TextEditingController();
  FocusNode wardrobFcs = FocusNode();

  PageController? _pageController;
  bool isOpen=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.find<ProductDetailsController>().getShopTheLookData( product_id: widget.productId!.toString(), gender_id: widget.genderid.toString(), child_category_id: widget.childCategoryId!.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F6F9),
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
            Text("Shop The Look",  style: railway.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
     /*       SizedBox(height: 2),
            Text("0 items",  style: railway.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),),*/
          ],
        ),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return RefreshIndicator(
              onRefresh: () async {
                // showCustomSnackBar("2");
              },
              child: SingleChildScrollView(
                child:
                controller.shopTheLookResponse!=null? controller.shopTheLookResponse!.data!.length>0?
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.shopTheLookResponse!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height:  Get.height / 4,
                          // color: Colors.deepPurpleAccent,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        // color: Colors.cyan,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                           /*   Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 5, right: 5),
                                                    child: InkWell(
                                                        onTap: (){
                                                          Get.dialog( CustomAlerDialogForPermission(
                                                            iconString: Images.delete,
                                                            title: 'Remove Item',
                                                            description: 'Do you really want to remove from wishlist?',
                                                            yesBtntap: () {
                                                              Get.back();
                                                            },
                                                            noBtntap: (){
                                                              Get.back();
                                                              controller.deleteWish(controller.shopTheLookResponse?.data?[index]?.id?.toString()??"");
                                                            },
                                                            noBtnText: "YES",
                                                            yesBtnText: "NO",
                                                          ));
                                                          // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());

                                                        },
                                                        child: Image.asset(Images.delete, color: silvercolor, height: 28, width: 28,)),
                                                  ),
                                                ],
                                              ),*/
                                              SizedBox(height: 10),
                                              controller.shopTheLookResponse!.data![index]!.brand== null?
                                              SizedBox():
                                              Text(
                                                "${controller.shopTheLookResponse!.data![index]!.brand!.brandName??""}",
                                                maxLines: 1,
                                                style: railway.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                    fontSize: 16
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "${controller.shopTheLookResponse!.data![index]!.name??""}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: railway.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54,
                                                    fontSize: 14
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              controller.shopTheLookResponse?.data?[index]?.discount == null || controller.shopTheLookResponse?.data?[index]?.discount == 0   ?
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${controller.shopTheLookResponse?.data?[index]?.price!.toStringAsFixed(0)} BDT",
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight.w600,
                                                        color: gold,
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                ],
                                              )
                                                  :
                                              Row(  mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${controller.shopTheLookResponse?.data?[index]?.price!.toStringAsFixed(0)} BDT",
                                                    style: poppins.copyWith(
                                                        decoration: TextDecoration.lineThrough,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.red,
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "${controller.shopTheLookResponse?.data?[index]?.discountedPrice!.toStringAsFixed(0)} BDT",
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight.w600,
                                                        color: gold,
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 8),
                                                child: Container(
                                                  // color: Colors.deepPurple,
                                                  // width: Get.width ,
                                                  height: 40 ,
                                                  decoration: BoxDecoration(
                                                    // color: Colors.yellowAccent.shade100,
                                                      borderRadius: BorderRadius.circular(0),
                                                      border: Border.all(color: Colors.grey,
                                                        width: 0.1,
                                                      )),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Get.to(
                                                                          showModalBottomSheet(
                                                                            isScrollControlled: true,
                                                                            context: context,
                                                                            builder: (BuildContext context) {
                                                                              return  ShopTheLookPopupSizeOrColor(productIndex: index,);
                                                                            },
                                                                          ),
                                                                          fullscreenDialog: true
                                                                      );
                                                                    },
                                                                    child:
                                                                    Container(
                                                                      // color: Colors.blue.shade50,
                                                                      height: 35,
                                                                      width: 120,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.only(left: 0, bottom: 0, top: 0),
                                                                        child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              // color: Colors.white,
                                                                              // height: 20,
                                                                              padding: const EdgeInsets.only(left: 0, top: 5),
                                                                              child: Text(
                                                                                textAlign: TextAlign.center,
                                                                                "Size".toUpperCase(),
                                                                                style: railway.copyWith(
                                                                                  fontSize: 10,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  color: Colors.black54,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 1),
                                                                            Container(
                                                                              // height: 20,
                                                                              // color: Colors.yellow,
                                                                              child: Row(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    "select",
                                                                                    style: railway.copyWith(
                                                                                      fontSize: 11,
                                                                                      fontWeight: FontWeight.w700,
                                                                                      color: Colors.black54,
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(width: 2),
                                                                                  Image.asset(Images.drop, height: 13, width: 13, color: Colors.black54,),
                                                                                  // Icon(Icons.arrow_drop_down_sharp, color: Colors.black54, size: 13),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  // Get.back();
                                                                },
                                                                child:
                                                                Container(
                                                                    alignment: Alignment.centerRight,
                                                                    // color: Colors.teal,
                                                                    width: 25,
                                                                    height: 28,
                                                                    // child: Icon(Icons.close, color: gold, size: 16,)
                                                                    child: SizedBox()
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          left: 12,
                                          right: 8,
                                          child:  CustomButton(
                                              height: 35,
                                              width: Get.width,
                                              buttoncolor: gold,
                                              color: Colors.white,
                                              buttontextcolor: Colors.white,
                                              myfontweight: FontWeight.bold,
                                              radius: 0,
                                              fontSize: 11,
                                              onPressed: () {
                                                Get.to(
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return  ShopTheLookPopupSizeOrColor(productIndex: index,);
                                                      },
                                                    ),
                                                    fullscreenDialog: true
                                                );
                                              },
                                              buttonText: "Add to Bag".toUpperCase())
                                      )
                                    ]
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      /*          Container(
                                        height: 120,
                                        width: 90,
                                        color: Colors.green,
                                        child: SizedBox(),
                                      ),*/
                                      Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              // color: Color(0xffFFFFFF),
                                                color: Color(0xffFAFAFA),
                                              //   color: Colors.pink,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(bottom: 0, left: 0, right: 0 ),
                                                  child : CarouselSlider(
                                                    // options: CarouselOptions(height: 400.0),
                                                    items: [
                                                      // controller.productDetailsResponse!.data!.productColorVariants![controller.sectedColorVAriantIndex].profilePhoto,
                                                      controller.shopTheLookResponse?.data?[index]?.productColorVariants?[0].frontPhoto??"",
                                                      controller.shopTheLookResponse?.data?[index]?.productColorVariants?[0].backsidePhoto??"",
                                                      controller.shopTheLookResponse?.data?[index]?.productColorVariants?[0].details1Photo??"",
                                                      controller.shopTheLookResponse?.data?[index]?.productColorVariants?[0].details2Photo??"",
                                                      controller.shopTheLookResponse?.data?[index]?.productColorVariants?[0].outfitPhoto??"",
                                                    ].map((i) {
                                                      return Builder(
                                                        builder: (BuildContext context) {
                                                          return Container(
                                                            decoration: BoxDecoration(
                                                              // color: Theme.of(context).cardColor,
                                                              // color: Color(0xffFBFBFB),
                                                              color: Colors.tealAccent,
                                                            ),
                                                            child: ClipRRect(
                                                                child: CustomImageCached(
                                                                  // placeholder: "assets/image/placeholder.png",
                                                                  image: '${AppConstants.BASE_URL}$i',
                                                                  // image: widget.cartdetailsimage,
                                                                  fit: BoxFit.fill,
                                                                  isRound: false,
                                                                  height: Get.height / 4,
                                                                  width: Get.width,
                                                                )
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }).toList(),
                                                    options: CarouselOptions(
                                                      autoPlay: false,
                                                      disableCenter: true,
                                                      viewportFraction: 1,
                                                      autoPlayInterval: Duration(seconds: 7),
                                                      height: Get.height / 4,
                                                      scrollDirection: Axis.horizontal,
                                                      onPageChanged: (index, reason) {
                                                        setState((){
                                                          // currentIndex=index;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  /*  child: CustomImageCached(
                                                                    placeholder: "assets/image/placeholder.png",
                                                                    image: '${AppConstants.BASE_URL}${controller.getWishlistResponse?.data?[index]?.product?.productColorVariants?[controller.sectedColorVAriantIndex].profilePhoto??""}',
                                                                    fit: BoxFit.fill,
                                                                    isRound: false,
                                                                    height: Get.height / 4.5,
                                                                    width: Get.width,
                                                                  ),*/

                                                )),
                                            Positioned(
                                              bottom: 0,
                                              // left: 15,
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    /// orginal color
                                                    // color: Color(0xffF2F2F2),
                                                    color: Colors.grey.shade300,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                                                      child: Text(
                                                        "${controller.shopTheLookResponse?.data?[index]?.season?.seasonName??""}".toUpperCase(),
                                                        style: railway.copyWith(color: Colors.black, fontSize: 8.5),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 2,
                                              right: -1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 5, right: 5),
                                                child: InkWell(
                                                    onTap: (){

                                                      // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());

                                                    },
                                                    child: Image.asset(Images.wish, color: gold, height: 22, width: 22,)),
                                              ),
                                            ),
                                           /* Positioned(
                                              top: 2,
                                              right: -1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 5, right: 5),
                                                child: InkWell(
                                                    onTap: (){
                                                      Get.dialog( CustomAlerDialogForPermission(
                                                        iconString: Images.delete,
                                                        title: 'Remove Item',
                                                        description: 'Do you really want to remove from wishlist?',
                                                        yesBtntap: () {
                                                          Get.back();
                                                        },
                                                        noBtntap: (){
                                                          Get.back();
                                                          controller.deleteWish(controller.shopTheLookResponse?.data?[index]?.id?.toString()??"");
                                                        },
                                                        noBtnText: "YES",
                                                        yesBtnText: "NO",
                                                      ));
                                                      // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());

                                                    },
                                                    child: Image.asset(Images.delete, color: Colors.grey.shade800, height: 28, width: 28,)),
                                              ),
                                            ),*/
                                          ]),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Divider(height: 8, thickness: 8, color: Color(0xffF2F6F9),),
                      ],
                    );
                  },
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 120,),
                    // Image.asset(Images.emptybag,),
      /*              Icon(Icons.favorite_outlined, color: gold, size: 80,),
                    SizedBox(height: 20,),
                    Text("All your favorites\nwill be saved here",style: railwaybold.copyWith(fontSize: 25, height: 1.2),),
                    SizedBox(height: 20),
                    Text("Start adding items to your wishlist by clicking on the heart",style: railway.copyWith(fontSize: 13),),*/
                    SizedBox(height: 30),
                    CustomButton(
                      radius: 0,
                      height: 45,
                      width: 180,
                      buttoncolor: Colors.black,
                      buttontextcolor: Colors.white,
                      myfontweight: FontWeight.bold,
                      onPressed: () {
                        Get.to(MainScreen());
                      },
                      buttonText: 'Start Shopping'.toUpperCase(),
                      fontSize: 13,
                    ),

                    SizedBox(height: 30),

                  ],
                )
                    : SizedBox(),
              )
          );
        }
      ),
    );
  }











}
