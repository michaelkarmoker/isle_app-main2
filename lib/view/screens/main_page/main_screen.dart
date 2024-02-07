
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/util/HexColor.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/Shimmer/shimmer.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/custom_shimmer.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/FAQ/faq_page.dart';
import 'package:isletestapp/view/screens/contact%20us/contact_us.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/multi%20screen/multi_screen_design.dart';
import 'package:isletestapp/view/screens/order%20track/order_track_page.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/cart/cart_controller.dart';
import '../home/home_page.dart';
import '../search/search_screen.dart';

class MainScreen extends StatefulWidget {

  MainScreen({Key? key,}) : super(key: key);
  bool isExpanded1=false;
  bool isExpanded2=false;
  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;

  @override
  State<MainScreen> createState() => _IsleHomeScreenState();
}

class _IsleHomeScreenState extends State<MainScreen> {
  TextEditingController searchCtr = TextEditingController();
  bool isSearchClick=false;
  TextEditingController subscribeCtr = TextEditingController();
  FocusNode subscribeFcs = FocusNode();

  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartController>().getBagPageCartData();
      Get.find<MainPageController>().dataInitialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async{
            await Get.find<MainPageController>().dataInitialize();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: const Color(0xffFAFBFB),
            // drawer: IsleDrawer(),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Color(0xff000000)),
              titleSpacing: 0,
              // backgroundColor: Colors.green,
              backgroundColor: const Color(0xffFFFFFF),
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 62,
              actions: [
                !isSearchClick?InkWell(
                    onTap: (){
                      Get.to(SearchScreen());
                   /*   isSearchClick=!isSearchClick;
                      setState(() {
                      });*/
                    },
                    // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                    child: Image.asset(Images.search, height: 22, width: 22,)):const SizedBox(),
                const SizedBox(width: 15),

              ],
              title: const CustomLogo(),
            ),
            body: controller.isLoading? const ShimmerLoading() : controller.genderPageResponse!=null?
            SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  /// feature carousal
                  controller.featureSliderResponse!=null ? controller.featureSliderResponse!.data!.length>0 ?
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 2, right: 2, bottom: 0),
                    child: Container(
                      // color: Colors.teal,
                      height: Get.height /15,
                      child: CarouselSlider.builder(
                        itemCount: controller.featureSliderResponse!.data!.length,
                        itemBuilder: (BuildContext context, int index, _){
                          return   InkWell(
                            onTap: () {
                              if (index == 0) {
                                Get.to(const MultiScreen(
                                    title: "ORDER AND DELIVERY",
                                    page: AppConstants.ORDERDELIVERY
                                ));
                              } else if (index == 1) {
                                Get.to(const MultiScreen(title: "Terms & Conditions", page: AppConstants.TERMS));
                              } else if (index == 2) {
                                Get.to(const MultiScreen(title: "HOW TO FIND ITEMS", page: AppConstants.FINDITEMS));
                              }
                            },
                            child: Card(
                              color:  const Color(0xff424242),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // color: Colors.red,
                                      height: 23,
                                      width: 23,
                                      child: controller.featureSliderResponse!=null?
                                      CustomImageCached(image: '${AppConstants.BASE_URL}${controller.featureSliderResponse!.data![index].icon?? ""}',
                                        fit: BoxFit.fill,
                                        isRound: false,
                                        height: 23,
                                        width: 23,
                                      )
                                         :
                                      const SizedBox(),
                                    ),
                                    // SizedBox(width: 45),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12),
                                        child: Text(controller.featureSliderResponse?.data?[index].title??"",
                                          maxLines: 1,
                                          style: poppins.copyWith(color: Colors.white,  fontSize: 11, fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: Get.height /2,
                          // enlargeCenterPage: true,
                          autoPlay: true,
                          // reverse: true,
                          aspectRatio: 10 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayInterval: const Duration(seconds: 4),
                          viewportFraction: 1,
                        ),
                      ),
                    ),
                  )
                  : const SizedBox() : const Padding(
                    padding: EdgeInsets.only(left: 8 , right: 8),
                    child: MyShimmer(hight: 45),
                  ),
                  const SizedBox(height: 0),
 ///  gender pages
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.genderPageResponse!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0, top: 6),
                        child: InkWell(
                          onTap: () {
                            controller.selectedGenderIndex=index;
                            Get.to(()=>const Home());
                          },
                          child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  // color:  Color(0xff424242),
                                  width: Get.width,
                                  child: CustomImageCached(image: '${AppConstants.BASE_URL}${controller.genderPageResponse!.data![index].mobileBgPhoto?? ""}',
                                    // fit: BoxFit.fitHeight,
                                    isRound: false,
                                    fit: BoxFit.fill,
                                    height: Get.height/5.5,
                                  ),
                                ),
                                controller.genderPageResponse!.data![index].buttonTxt!=null?
                                Positioned(
                                    bottom: 50,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: 200,
                                        /// orginal color
                                        // color: Color(0xffF2F2F2),
                                        color: Colors.white.withOpacity(1),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                          child: Center(
                                            child: Text((controller.genderPageResponse!.data![index].buttonTxt??"").toUpperCase(),
                                              style: railwaybold.copyWith(
                                                  color:
                                                  controller.genderPageResponse?.data?[index].color!= null?
                                                  HexColor(controller.genderPageResponse?.data?[index].color??"")
                                                  : Colors.black,
                                                  fontSize: 15),),
                                          ),
                                        ),
                                      ),
                                    )
                                ) : const SizedBox(),
                               controller.genderPageResponse!.data![index].bannerTxt!=null ?
                                Positioned(
                                    right: 18,
                                    bottom: 50,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
                                        child: Center(
                                          child: Text((controller.genderPageResponse!.data![index].bannerTxt??"").toUpperCase(),
                                            style: railwaybold.copyWith(
                                                color:
                                                controller.genderPageResponse?.data?[index].color!= null?
                                                HexColor(controller.genderPageResponse?.data?[index].color??"")
                                                : Colors.black,
                                                fontSize: 16, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    )
                                ) : const SizedBox()
                              ]
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
   /// loving brands
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 8, top: 0, bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text("Your Loving Brands", style: poppins.copyWith(fontSize: 22),),
                            ),
                            // Text("Shop All".toUpperCase(), style: robotoRegular.copyWith(decoration: TextDecoration.underline,color: Color(0xffB56D4D),fontSize: 9.5),),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(left: 8, right: 8),
                          child: GridView.builder(
                            itemCount: controller.lovingBrandResponse?.data?.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true, // Important to make it work inside a SingleChildScrollView
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5, // Number of columns
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1
                            ),
                            itemBuilder: (context, index) {

                              return InkWell(
                                onTap: (){
                                  Get.to(
                                      ProductPage(
                                        image: '${AppConstants.BASE_URL}${controller.lovingBrandResponse!.data![index].brand!.banner?? ""}',
                                        title: controller.lovingBrandResponse!.data![index].brand!.name??"",
                                        details: controller.lovingBrandResponse!.data![index].brand!.details??"",
                                        page: AppConstants.BRAND,
                                        id: controller.lovingBrandResponse!.data![index].brand!.id!.toString(),
                                      ));
                                },
                                child: Card(
                                  margin: const EdgeInsets.all(2),
                                  elevation: 0.5,
                                  child: Container(
                                    // color: Colors.green,
                                    height: 70, width: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: CustomImageCached(
                                        isRound: false,
                                        image: '${AppConstants.BASE_URL}${controller.lovingBrandResponse!.data![index].logo ?? ""}',
                                        // fit: BoxFit.fitHeight,
                                        height: 70,
                                        width: 110,
                                        fit: BoxFit.contain,
                                        // height: Get.height/5.5,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }, // Total number of items
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Get.find<AuthController>().isLoggedIn()?
                      controller.membershipInfoResponse!= null ?
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: Get.height/8,
                                  width: Get.width/4,
                                  // color: Colors.purple,
                                  child: CustomImageCached(
                                    isRound: true,
                                    image: '${AppConstants.BASE_URL}${controller.membershipInfoResponse?.data?.banner ?? ""}',
                                    // fit: BoxFit.fitHeight,
                                    // height: 70, width: 110,
                                    fit: BoxFit.fill,
                                    // height: Get.height/5.5,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4, right: 8, top: 8),
                                        child: Text(controller.membershipInfoResponse?.data?.rawTitle??"",
                                            // textAlign: TextAlign.center,
                                            style: railwaybold.copyWith(fontSize: 15)),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4, right: 8, top: 0),
                                        child: Text(controller.membershipInfoResponse?.data?.subRawTitle??"",
                                            // textAlign: TextAlign.center,
                                            style: railway.copyWith(fontSize: 12)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            controller.membershipBenifitInfoResponse!= null?
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Membership Benefits", style: railwaybold.copyWith(fontSize: 16),),
                                    const SizedBox(height: 15),
                                    ListView.builder(
                                      itemCount: controller.membershipBenifitInfoResponse!.data!.length,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top : 4, bottom: 4),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CustomImageCached(
                                                  image: "${AppConstants.BASE_URL}${controller.membershipBenifitInfoResponse!.data![index].img??""}",
                                                height: 25,
                                                width: 25,
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(child: Text(controller.membershipBenifitInfoResponse?.data?[index].title??"",
                                              style: railway.copyWith(fontSize: 12),))
                                            ],
                                          ),
                                        );
                                        }
                                    )
                                  ],
                                )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ) : const SizedBox()
                      :
                  controller.isleMemberShipResponse!= null?
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      children: [
                        Container(
                          height: Get.height/7,
                          width: Get.width/3,
                          // color: Colors.purple,
                          child: CustomImageCached(
                            isRound: false,
                            image: '${AppConstants.BASE_URL}${controller.isleMemberShipResponse?.data?.banner ?? ""}',
                            // fit: BoxFit.fitHeight,
                            // height: 70, width: 110,
                            fit: BoxFit.fill,
                            // height: Get.height/5.5,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: Text(controller.isleMemberShipResponse?.data?.shortDescription??"",
                                    textAlign: TextAlign.center,
                                    style: railway.copyWith(fontSize: 15)),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                // style: raisedButtonStyle,
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero
                                  ), backgroundColor: const Color(0xff2D2D2D),
                                  minimumSize: const Size.fromHeight(45),
                                ),
                                onPressed: () {
                                  Get.to(const LoginRegisterPage(isFromCart: false, ));
                                },
                                child: Text((controller.isleMemberShipResponse?.data?.buttonTxt??"").toUpperCase(), style: railway.copyWith(fontSize: 11),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  : const SizedBox(),
                  const SizedBox(height: 40),

                  /// footer part
                  Container(
                    color: const Color(0xff2D2D2D),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
                      child: Column(
                        children: [
                          Text("SUBSCRIBE TO OUR NEWSLETTER".toUpperCase(), style: robotoMedium.copyWith(color: Colors.white,fontSize: 14)),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              // color: Colors.pinkAccent,
                              height: 45,
                              child: Row(
                                children: [

                                  Expanded(
                                    flex: 5,
                                    child: CustomOnlyTextFieldWithBorder(
                                      height: 45,
                                      controller: subscribeCtr,
                                      focusNode: subscribeFcs,
                                      hintText: "Enter your email Address here",
                                      hintStyle: railway.copyWith(fontSize: 13),
                                      color: Colors.grey,
                                    ),
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 0.4),
                                      child: CustomButton(
                                        height: 45,
                                          onPressed: (){
                                          newsletterValidation(controller);
                                          },
                                          buttonText: 'Subscribe'.toUpperCase(),
                                        fontSize: 12,
                                        buttoncolor: Colors.white,
                                        radius: 0,
                                      ),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text("Follow Isle".toUpperCase(), style: railway.copyWith(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 20),

                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Container(
                              height: 60,
                              width: Get.width,
                              child: controller.socialResponse != null
                                  ? controller.socialResponse!.data!.length > 0
                                  ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.socialResponse!.data!.length > 6 ? 6 : controller.socialResponse!.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: InkWell(
                                      onTap: () {
                                        String linkUrl = controller.socialResponse!.data![index].url ?? "";
                                        launch(linkUrl);
                                      },
                                      child: SizedBox(
                                        height: 60,
                                        width: Get.width / 6.5,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 18),
                                          child: CustomImageCached(
                                            isRound: false,
                                            image: '${AppConstants.BASE_URL}${controller.socialResponse!.data![index].icon ?? ""}',
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                                  : const SizedBox(child: Text("no-data"))
                                  : const SizedBox(child: Text("result not found")),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded1=! widget.isExpanded1;
                                setState(() {
                                });
                              },
                              child: Container(
                                color: const Color(0xff3B3A3A),
                                height: 45,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Top Brands".toUpperCase(),
                                              style: robotoMedium.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white60,
                                              ),
                                            ),
                                          ],
                                        ),),
                                      const Expanded(
                                          flex: 1,
                                          child: Icon(Icons.arrow_drop_down_sharp,
                                            color: Colors.white60,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          widget.isExpanded1?
                          controller.topBrandResponse != null && controller.topBrandResponse!.data != null ?
                          ListView.builder(
                            // reverse: true,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.topBrandResponse!.data!.length,
                              itemBuilder: (BuildContext context, int index){
                                return  Container(
                                  // color: Colors.red,
                                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                         Get.to(()=> ProductPage(
                                           image: '${AppConstants.BASE_URL}${controller.topBrandResponse!.data![index].brand!.banner?? ""}',
                                           title: controller.topBrandResponse!.data![index].brand!.name??"",
                                           details: controller.topBrandResponse!.data![index].brand!.details??"",
                                           page: AppConstants.BRAND,
                                           id: controller.topBrandResponse!.data![index].brand!.id!.toString(),
                                           pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                         ));
                                        },
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          //  color: Colors.green,
                                          height: 45,
                                          width: Get.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Text(
                                              controller.topBrandResponse?.data?[index].brand?.name??"",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white60
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                    ],
                                  ),
                                );
                              }
                          ) : const SizedBox()
                              :Container(),

                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded2=! widget.isExpanded2;
                                setState(() {
                                });
                              },
                              child: Container(
                                color: const Color(0xff3B3A3A),
                                height: 45,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Customer Care".toUpperCase(),
                                              style: robotoMedium.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white60,
                                              ),
                                            ),
                                          ],
                                        ),),
                                      const Expanded(
                                          flex: 1,
                                          child: Icon(Icons.arrow_drop_down_sharp,
                                            color: Colors.white60,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          widget.isExpanded2? Container(
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(const Contactus());
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Contact us",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                     Get.to(FAQPage());
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "FAQ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(const MultiScreen(title: "Order & Delivery", page: AppConstants.ORDERDELIVERY));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Order & Delivery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(const MultiScreen(title: "Returns & Refunds", page: AppConstants.RETURN));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Returns & Refunds",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(const MultiScreen(title: "Payment & Pricing", page: AppConstants.PAYMENT));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Payment & Pricing",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    if(Get.find<AuthController>().isLoggedIn()){
                                      Get.to(const OrderTrack());
                                    }else{
                                      Get.to(const LoginRegisterPage(isFromCart: false,));
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Track Order",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),

                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded3=! widget.isExpanded3;
                                setState(() {
                                });
                              },
                              child: Container(
                                color: const Color(0xff3B3A3A),
                                height: 45,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Company".toUpperCase(),
                                              style: robotoMedium.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white60,
                                              ),
                                            ),
                                          ],
                                        ),),
                                      const Expanded(
                                          flex: 1,
                                          child: Icon(Icons.arrow_drop_down_sharp,
                                            color: Colors.white60,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          widget.isExpanded3? Container(
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(const MultiScreen(title: "About", page: AppConstants.ABOUT));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "About us",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(const MultiScreen(title: "Career", page: AppConstants.CAREER));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Career",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),
                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded4=! widget.isExpanded4;
                                setState(() {
                                });
                              },
                              child: Container(
                                color: const Color(0xff3B3A3A),
                                height: 45,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Legal".toUpperCase(),
                                              style: robotoMedium.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white60,
                                              ),
                                            ),
                                          ],
                                        ),),
                                      const Expanded(
                                          flex: 1,
                                          child: Icon(Icons.arrow_drop_down_sharp,
                                            color: Colors.white60,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          widget.isExpanded4? Container(
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(const MultiScreen(title: "Terms & Conditions", page: AppConstants.TERMS));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Terms & Conditions",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(const MultiScreen(title: "Privecy & Cookies", page: AppConstants.PRIVECY));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Privecy & Cookies Policy",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(const MultiScreen(title: "What to Collaborate?", page: AppConstants.COLLABORATE));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "What to Collaborate?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),
                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded5=! widget.isExpanded5;
                                setState(() {
                                });
                              },
                              child: Container(
                                color: const Color(0xff3B3A3A),
                                height: 45,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Quick Link".toUpperCase(),
                                              style: robotoMedium.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white60,
                                              ),
                                            ),
                                          ],
                                        ),),
                                      const Expanded(
                                          flex: 1,
                                          child: Icon(Icons.arrow_drop_down_sharp,
                                            color: Colors.white60,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          widget.isExpanded5? Container(
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 10.0,right: 10,top: 7),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    //  color: Colors.green,
                                    height: 45,
                                    width: Get.width,
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "How to shop",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white60
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(const MultiScreen(title: "How to find items", page: AppConstants.FINDITEMS));
                                    },
                                    child: Row(children: [
                                      const SizedBox(
                                          width: 8,
                                          child: CircleAvatar(backgroundColor: Colors.white60, radius: 10)),
                                      const SizedBox(width: 8),
                                      Text("How to find items", style: robotoRegular.copyWith(color: Colors.white60),)
                                    ],),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(const MultiScreen(title: "How to order & Pay", page: AppConstants.ORDERPAY));
                                    },
                                    child: Row(children: [
                                      const SizedBox(
                                          width: 8,
                                          child: CircleAvatar(backgroundColor: Colors.white60, radius: 10)),
                                      const SizedBox(width: 8),
                                      Text("How to order & Pay", style: robotoRegular.copyWith(color: Colors.white60),)
                                    ],),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                              ],
                            ),
                          ):Container(),
                          const SizedBox(height: 30),
                          Text("Customer Care".toUpperCase(), style: railway.copyWith(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        launchUrl(Uri.parse("tel:${controller.generalSettingResponse?.data?.phone??""}"));
                                      },
                                      child: Container(
                                          // height: Get.height/9.5,
                                          // width: 120,
                                          decoration:  BoxDecoration(
                                              color: const Color(0xff3B3A3A),
                                              // color: Colors.pink,
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              children: [
                                                // Image.asset(Images.facebook),
                                                const Icon(Icons.call, color: Colors.white, size: 32,),
                                                const SizedBox(height: 5),
                                                Text("Call us", style: poppins.copyWith(color: Colors.white,fontSize: 11),)
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        AppConstants.launchUrls(urls: "https://api.whatsapp.com/send?phone="+"${controller.generalSettingResponse?.data?.phone??""}");
                                        // AppConstants.launchUrls(urls: "https://web.whatsapp.com/" );
                                      },
                                      child: Container(
                                          // height: Get.height/9.5,
                                          // width: 120,
                                          decoration:  BoxDecoration(
                                              color: const Color(0xff3B3A3A),
                                              // color: Colors.pink,
                                              borderRadius: BorderRadius.circular(8)
                                          ),

                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              children: [
                                                Image.asset(Images.whatsapp, height: 32, width: 32),
                                                // Icon(Icons.call, color: Colors.white, size: 35,),
                                                const SizedBox(height: 5),
                                                Text("WhatsApps",
                                                  maxLines: 1,
                                                  style: poppins.copyWith(color: Colors.white,fontSize: 11),)
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        AppConstants.launchUrlsemail(urls: controller.generalSettingResponse?.data?.email?? "");
                                      },
                                      child: Container(
                                        // height: Get.height / 9.5,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff3B3A3A),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Image.asset(Images.email, height: 32, width: 32, color: Colors.white),
                                              const SizedBox(height: 5),
                                              Text("E-mail", style: poppins.copyWith(color: Colors.white, fontSize: 11)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          controller.generalSettingResponse?.data?.footerAppLinkTitle!=null?
                          Text("${controller.generalSettingResponse?.data?.footerAppLinkTitle??""}",  style: poppins.copyWith(color: Colors.white,fontSize: 11),)
                              : SizedBox.shrink(),
                          SizedBox(height: 5),
                          controller.generalSettingResponse?.data?.textField1!=null?
                          Text("${controller.generalSettingResponse?.data?.footerAppLinkTitle??""}", style: poppins.copyWith(color: Colors.white,fontSize: 11),)
                              : SizedBox.shrink(),
                          const SizedBox(height: 30),
                          controller.generalSettingResponse!=null?
                          Container(
                            height: 42,
                            child: CustomImageCached(image: '${AppConstants.BASE_URL}${controller.generalSettingResponse?.data?.footerLogo?? ""}',
                              // fit: BoxFit.fitHeight,
                              isRound: false,
                              height: 45, width: 75, fit: BoxFit.fill,
                            ),
                          )
                         :
                        const SizedBox(),
                          const SizedBox(height: 20),
                      controller.generalSettingResponse!=null?
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     AutoSizeText(
                      //       "djfkdjfkj kljdf djfkdjkfj dfjd fjdkfj d f dfdjfd fjdf jdf f  fdjfjdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w200,
                      //         color: Colors.white,
                      //         fontSize: 14,
                      //       ),
                      //       maxLines: 1, // Ensure the text stays on one line
                      //       textAlign: TextAlign.center, // Center align the text
                      //       minFontSize: 10, // Minimum font size
                      //       overflow: TextOverflow.visible, // Allow text to overflow if needed
                      //     ),
                      //   ],
                      // )

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HtmlWidget(controller.generalSettingResponse?.data?.copyRight ?? "",
                              textStyle: poppins.copyWith( fontWeight: FontWeight.w200,color: Colors.white,
                                  fontSize: Get.width < 430 ? Get.width < 360 ? 9 : 11 : 14)),
                        ],
                      ) : const SizedBox(),

                          const SizedBox(height: 20),
                          // Text("The FMC-CBN JV initiative 2024. All Rights Reserved", style: aaaaaaaa.copyWith(fontWeight: FontWeight.w200,color: Colors.white,fontSize: 12)),
                          // SizedBox(height: 20),
                          //            Text("The FMC-CBN JV initiative 2024. All Rights Reserved", style: aaaaaaaa.copyWith(fontWeight: FontWeight.w200,color: Colors.white,fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ):const ShimmerLoading(),
          ),
        );
      }
    );
  }

  void newsletterValidation(MainPageController controller) {
    if (subscribeCtr.text.toString().isNotEmpty) {
              controller.submitNewsletter( email: subscribeCtr.text, );
    }
    else {
      showCustomSnackBar("Please Enter Email");
    }
  }





}
