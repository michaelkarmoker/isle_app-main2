import 'dart:async';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/util/HexColor.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/util/text_SIZE.dart';
import 'package:isletestapp/view/Shimmer/shimmer.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_shimmer.dart';
import 'package:isletestapp/view/base/custom_top_search_field.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/multi%20screen/multi_screen_design.dart';
import 'package:isletestapp/view/screens/notification/notification_screen.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:isletestapp/view/screens/product%20page/newin_most_popular_product_screen.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';

class Home extends StatefulWidget {
/*  final int? page;
  final String? id;*/
  const Home({super.key,
    // this.page, this.id,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  ScrollController _scrollController3 = ScrollController();


  late ScrollController _scrollController;
  static const kExpandedHeight = 150.0;
  bool isSearchClick=false;

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }




  late ScrollController _scrollCtr;
  late Timer _timer;
  double _scrollPosition = 0.0;
  final double _maxScrollExtent = 2000.0; // Set a large value for infinite scrolling
  final double _scrollIncrement = 1.0; // Adjust scroll speed

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
/*      if (widget.page == AppConstants.CONTINUESHOP) {
        Get.find<MainPageController>().dataInitializeForHomeContinueShopping(widget.id!.toString() as int);
      } else {
        Get.find<MainPageController>().dataInitializeForHome();
      }*/
      Get.find<MainPageController>().dataInitializeForHome();

      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
      double minScrollExtent2 = _scrollController2.position.minScrollExtent;
      double maxScrollExtent2 = _scrollController2.position.maxScrollExtent;
      double minScrollExtent3 = _scrollController3.position.minScrollExtent;
      double maxScrollExtent3 = _scrollController3.position.maxScrollExtent;
      //
      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
          _scrollController1);
      animateToMaxMin(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 15,
          _scrollController2);
      animateToMaxMin(maxScrollExtent3, minScrollExtent3, maxScrollExtent3, 20,
          _scrollController3);

    });

    // Get.find<MainPageController>().getMultisectionProductFilter(3);
    _scrollController = ScrollController()..addListener(() {
        setState(() {
          // _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
        });
      });
   startMoving();
    // _startAutoScroll();
    _scrollCtr = ScrollController();

    // Start scrolling automatically
    _timer = Timer.periodic(const Duration(milliseconds: 60), (_) {
      setState(() {
        _scrollPosition += _scrollIncrement;
        if (_scrollPosition >= _maxScrollExtent) {
          _scrollPosition = 0.0;
        }
        _scrollCtr.jumpTo(_scrollPosition);
      });
    });
  }
  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
        duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  double position = 0;
  void startMoving() {
    Future.delayed(Duration(milliseconds: 60), () {
      if (position < -1) {
        // Reset the position to move the item to the right
        position = 1;
      } else {
        // Move the item to the left
        position -= 0.01;
      }

      if (mounted) {
        setState(() {

        });
        startMoving();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<MainPageController>().discloseForHome();
    _timer.cancel();
    _scrollCtr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        builder: (controller) {

          return Scaffold(
            bottomNavigationBar: const UniversalBottomNav(),
            body:  CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  iconTheme: const IconThemeData(color: Color(0xffFAFBFB)),
                  // backgroundColor: Color(0xffFAFBFB),
                  backgroundColor: Colors.white,
                  leadingWidth: Get.width/2.9,
                  toolbarHeight: 70,
                  actions: [
                    _isSliverAppBarExpanded?   !isSearchClick? InkWell(
                        onTap: (){
                          isSearchClick=!isSearchClick;
                          setState(() {
                            Get.to(const SearchScreen());
                          });
                        },
                        // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                        child: Image.asset(Images.search, height: 22, width: 22,)):const SizedBox(): const SizedBox(),
                    const SizedBox(width: 2),
                    _isSliverAppBarExpanded? const WishButtonWidget()  : const SizedBox(),
                    const SizedBox(width: 4),
                  ],
                  centerTitle: !_isSliverAppBarExpanded,
                  leading: _isSliverAppBarExpanded
                      ? Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SizedBox(
                      // color: Colors.pinkAccent,
                      height: 200,
                      child:
                      controller.genderList.isEmpty?
                      // MyShimmer(hight: 40)
                      const SizedBox()
                          :
                      ListView.builder(
                          itemCount:controller.genderList.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.all(0),
                              child:  InkWell(
                                  onTap:(){
                                    _scrollController.animateTo(
                                      _scrollController.position.minScrollExtent,
                                      duration: const Duration(milliseconds: 100),
                                      curve: Curves.easeIn,
                                    );

                                    controller.getTopSliderData(controller.genderList[index].id.toString());
                                    controller.getHomePageAllData(controller.genderList[index].id.toString());
                                    controller.selectedGenderIndex=index;

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 7),
                                          child: Text(controller.genderList[index].title??"",style: controller.selectedGenderIndex==index? railway.copyWith(
                                              height: 1.5, color: Colors.black, fontSize: Dimensions.appbarGenderText1, fontWeight: FontWeight.bold) : railway.copyWith(
                                              height: 1.5, color: Colors.black, fontSize: Dimensions.appbarGenderText1, fontWeight: FontWeight.bold),),
                                        ),
                                        const SizedBox(height: 2),
                                        controller.selectedGenderIndex==index?
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0),
                                          child: Container(
                                            color: gold,
                                            height: 2,width: 22,

                                          ),
                                        ):Container()
                                      ],
                                    ),
                                  )),
                            );
                          }),

                    ),
                  )
                      : null,
                  // leading: null,

               /*   title: controller.generalSettingResponse!= null? controller.generalSettingResponse?.data?.logo!=null?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: InkWell(
                          onTap: (){
                            Get.to(MainScreen());
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 2),
                              CustomImageCached(image: '${AppConstants.BASE_URL}${controller.generalSettingResponse?.data?.logo?? ""}',
                                // fit: BoxFit.fitHeight,
                                isRound: false,
                                height: 45, width: 75, fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 1.5),
                                child: Text("${controller.generalSettingResponse?.data?.tagLine??""}", style: railway.copyWith(fontSize: 7.8,  color: Colors.black),),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ) : SizedBox() : SizedBox(),*/
                  title: const CustomLogo(),
                  pinned: true,
                  snap: false,
                  floating: false,
                  expandedHeight: kExpandedHeight,
                  // show and hide FlexibleSpaceBar title
                  flexibleSpace: _isSliverAppBarExpanded
                      ? null
                      : FlexibleSpaceBar(

                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  height: Get.height/17,
                                  // color: Colors.yellow,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7.7, top: 2),
                                        child: Text("Good ${greeting()}!", style: railway.copyWith(color: Colors.black, fontSize: Dimensions.goodmorningfontSize),),
                                      ),
                                      const SizedBox(height: 4),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7.7),
                                        child: SizedBox(
                                          height: 22,
                                          width: Get.width/3.8,
                                          // color: Colors.red,
                                          child:    controller.genderList.isEmpty?
                                          // MyShimmer(hight: 40)
                                          const SizedBox()
                                              :
                                          ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount:controller.genderList.length,
                                              physics: const AlwaysScrollableScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder: (context,index){
                                                return Padding(
                                                  padding: const EdgeInsets.all(0),
                                                  child:  Container(
                                                    child: InkWell(
                                                        onTap:(){
                                                          controller.getTopSliderData(controller.genderList[index].id.toString());
                                                          controller.getHomePageAllData(controller.genderList[index].id.toString());
                                                          controller.selectedGenderIndex=index;
                                                          setState((){});
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [

                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 5),
                                                              child: Text(controller.genderList[index].title??"",
                                                                style: controller.selectedGenderIndex==index? railway.copyWith(
                                                                  height: 1.5, color: Colors.black, fontSize: Dimensions.appbarGenderText2, fontWeight: FontWeight.bold) : railway.copyWith(
                                                                  height: 1.5, color: Colors.black, fontSize: Dimensions.appbarGenderText2, fontWeight: FontWeight.bold),),
                                                            ),
                                                            const SizedBox(height: 1),
                                                            controller.selectedGenderIndex==index?
                                                            Container(
                                                              color: gold,
                                                              height: 1.5,
                                                              width: 14,

                                                            ):Container()
                                                          ],
                                                        )),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25, top: 0),
                                  child: Container(
                                      height: 32,
                                      width: 32,
                                      // color: Colors.blue,
                                      alignment: Alignment.topRight,
                                      child: const WishButtonWidget(radius: 6, textsize: 6, top: 5,right: 7,)),
                                ),
                              ),
                            ],
                          ),

                          // SizedBox(height: 5),
                          // Text("Good ${greeting()}!", style: railway.copyWith(color: Colors.black, fontSize: 9),),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              // color: Colors.deepPurpleAccent,
                              height: 28,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: GestureDetector(
                                        onTap: (){
                                          Get.to(const SearchScreen());
                                        },
                                        child: SizedBox(
                                            height: 28,
                                            child: SearchTextField()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 6,right: 8),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(NotificationScreen());
                                        },
                                        child: Container(
                                          height: 28,
                                          width: 28,
                                          color: Colors.grey.shade200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: Image.asset(Images.notification,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                /*  SliverToBoxAdapter(
                child: Container(
                  color: Colors.purple,
                  height: 120,
                  child: Center(
                    child: Text('Scroll to see the SliverAppBar in effect.'),
                  ),
                ),
              ),*/
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (BuildContext context, int index) {
                     return
                        controller.homePageAllDataResponse!= null &&controller.homePageAllDataResponse!.data!=null && controller.homePageAllDataResponse!.data!.isNotEmpty ?
                        SingleChildScrollView(
                          controller: controller.scrollController,
                          child:   Column(
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


/// headline
                              controller.homeHeadlineResponse!=null?  controller.homeHeadlineResponse!.data!.length>0 ?
                                 Padding(
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 10 ),
                                child: Container(
                                  // color: Colors.green,
                                  height: 45,
                                  child: ListView.builder(
                                      controller: _scrollCtr,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.homeHeadlineResponse!.data!.length * 10000,
                                      itemBuilder: (context, index) {
                                        final i = index % controller.homeHeadlineResponse!.data!.length;
                                        return Padding(
                                          padding: const EdgeInsets.all(13),
                                          child: CustomImageCached(
                                            isRound: false,
                                            image: '${AppConstants.BASE_URL}${controller.homeHeadlineResponse!.data![i].logo ?? ""}',
                                            height: 40, width: 70,
                                            fit: BoxFit.contain,
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              )
                                      : SizedBox(child: Text("no-data"),):SizedBox(),
     /*                         Padding(
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15 ),
                                child: Container(
                                  height: 60,
                                  child: ListView.builder(

                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.homeHeadlineResponse!.data!.length,
                                      itemBuilder: (context, index) {
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Transform.translate(
                                                offset: Offset(position * MediaQuery.of(context).size.width, 0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child: CustomImageCached(
                                                    isRound: false,
                                                    image: '${AppConstants.BASE_URL}${controller.homeHeadlineResponse!.data![index].logo ?? ""}',
                                                    height: 60, width: 80,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              )
                                  : SizedBox(child: Text("no-data"),):SizedBox(),*/

  /// big caruosal
                              controller.homeSliderResponse!= null?  controller.homeSliderResponse!.data!.isNotEmpty?
                              Padding(
                                padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
                                child: SizedBox(
                                  // color: Colors.teal,
                               /*   height: Get.height /1.8,*/
                                  height: Get.height /5,
                                  child: CarouselSlider.builder(
                                    itemCount: controller.homeSliderResponse?.data?.length,
                                    itemBuilder: (BuildContext context, int index, _){
                                      return  CustomImageCached(
                                        isRound: false,
                                        image: '${AppConstants.BASE_URL}${controller.homeSliderResponse?.data?[index].banner ?? ""}',
                                        fit: BoxFit.fill,
                                      );
                                    },
                                    options: CarouselOptions(
                                      autoPlay: true,  // Enable auto-sliding
                                      autoPlayInterval: const Duration(seconds: 2),  // Set the auto-sliding interval
                                      enableInfiniteScroll: true,
                                      height: Get.height /2,
                                      // enlargeCenterPage: true,
                                      reverse: false,
                                      aspectRatio: 10 / 9,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      // autoPlayAnimationDuration: Duration(milliseconds: 800),
                                      viewportFraction: 1,
                                    ),
                                  ),
                                ),
                              ) : const SizedBox() : const Text("no-data"),

   ///  banner part
                              controller.topHomeBannerResponse!= null?  controller.topHomeBannerResponse!.data!.isNotEmpty?
                              Padding(
                                padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                                child: InkWell(
                                  onTap: (){
                                    AppConstants.launchUrls(urls: controller.topHomeBannerResponse?.data?[controller.selectedGenderIndex].bannerUrl??"" );
                                  },
                                  child: CustomImageCached(
                                    image: '${AppConstants.BASE_URL}${controller.topHomeBannerResponse?.data?[controller.selectedGenderIndex].banner ?? ""}',
                                    height: Get.height/9,
                                    isRound: false,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ) : const SizedBox() : const SizedBox(),

      /// all section start
                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data!= null ?
                              ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.homePageAllDataResponse?.data?.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        /// isle pick
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.ILEPICKS?
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: (){
                                              },
                                              child: Container(
                                                color: const Color(0xffFAFBFB),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 10),
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(height: 8),
                                                      CustomImageCached(
                                                        image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].banner ?? ""}',
                                                        height: Get.height/4.5,
                                                        isRound: false,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      const SizedBox(height: 15),
                                                      Text((controller.homePageAllDataResponse?.data?[index].title??"").toUpperCase(), style:  railway.copyWith(fontSize: 18, color: const Color(0xff000000) ),),
                                                      const SizedBox(height: 12),
                                                      Text(controller.homePageAllDataResponse?.data?[index].shortDescription??"",
                                                        textAlign: TextAlign.center,
                                                        style: railway.copyWith(fontSize: 14, color: const Color(0xff000000)),),
                                                      const SizedBox(height: 15),
                                                      controller.homePageAllDataResponse?.data?[index].buttonTxt != null?
                                                          CustomButton(
                                                            height: 40,
                                                            width : 180,
                                                            fontSize : 15,
                                                              onPressed: () {
                                                              // Get.to(()=> PageDetailsRakib());

                                                                try{
                                                                  log('================@ Call');
                                                                  // controller.getMultisectionProductFilter([28, 34, 40, 31, 43]);
                                                                  log('==========@ Section Id${controller.homePageAllDataResponse!.data![index].sectionHomepageDetails?[index].sectionId!.toString()}');
                                                                  log('==========@ Section Id${controller.homePageAllDataResponse!.data![index].sectionHomepageDetails?[index].id!.toString()}');
                                                                  log('==========@ Page Id${controller.homePageAllDataResponse?.data?[index].pageId}');
                                                                  Get.to(()=> ProductPage(
                                                                    id: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails?[index].id!.toString() ?? '',
                                                                    // sectionId: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails?[index].sectionId! ?? [],
                                                                    pageId: controller.homePageAllDataResponse?.data?[index].pageId ?? 1,
                                                                    sectionId: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails?.map<int>((item){
                                                                      return item.sectionId ?? 0;
                                                                    }).toList(),
                                                                    page: AppConstants.menShop,

                                                                  ));
                                                                } catch(e, s){
                                                                  log('Error', error: e, stackTrace: s);
                                                                }

                                                              },
                                                              buttonText: controller.homePageAllDataResponse?.data?[index].buttonTxt??"Shop Now",
                                                            buttoncolor: controller.colorResponse?.data?.pages?[controller.selectedGenderIndex].bgColor!=null? HexColor(controller.colorResponse?.data?.pages?[controller.selectedGenderIndex].bgColor??"") : Colors.transparent,
                                                            buttontextcolor: Colors.white,
                                                          )
                                                          : SizedBox(child: Text("SHOP NOW", style: railway.copyWith(fontSize: 12.5),),),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),

                                            ///  isle child
                                   /*         controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails!= null ?
                                            SizedBox(
                                              height: 32,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                                    child: Text("${controller.homePageAllDataResponse?.data?[index]?.title??""}", style: railway.copyWith(fontSize: titlesize ,) ),
                                                  ),
                                                ],
                                              ),) : SizedBox(),*/
                                            controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                                              child: SizedBox(
                                                height: Get.height/5,
                                                // width: Get.width,
                                                child: Stack(
                                                  children: [
                                                  ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    // physics: NeverScrollableScrollPhysics(),
                                                    physics: const ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                                    itemBuilder:  (BuildContext context, int index2) {
                                                      return Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.5),
                                                        child: InkWell(
                                                          onTap: () {
                                                            print(controller.homePageAllDataResponse!.data![index].sectionHomepageDetails![index2].sectionId!.toString());

                                                            Get.to(()=> ProductPage(
                                                              image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                              title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                              details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                              page: AppConstants.SECTION,
                                                              id: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails![index2].sectionId!.toString(),
                                                            ));},

                                                          child: Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  color:  const Color(0xff424242),
                                                                  width: Get.width/3.2,
                                                                  child: CustomImageCached(
                                                                    image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                                    height: Get.height/2,
                                                                    isRound: false,
                                                                    fit: BoxFit.fill,

                                                                  ),
                                                                ),

                                                                Positioned(
                                                                    bottom: 8,
                                                                    child: Align(
                                                                      alignment: Alignment.bottomCenter,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal : 8),
                                                                        child: Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                          style: nonito.copyWith(
                                                                            // color: Color(0xffDBDCE2),
                                                                              color: Colors.white,
                                                                              fontSize: 14),),
                                                                      ),
                                                                    )
                                                                ),
                                                              ]
                                                          ),
                                                        ),
                                                      );
                                                    },

                                                  ),
                                                    Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        bottom: 0,
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                            child: Image.asset(Images.arrow, height: 25, width: 25, color: Colors.white,)
                                                        )
                                                    )
                                                  ]
                                                ),
                                              ),
                                            )
                                                : const SizedBox(),
                                          ],
                                        ) : const SizedBox(),

                                        /// discover brand
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.DISCOVERBRAND?
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                                          child: Column(
                                            children: [
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: 32,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                                      child: Text(controller.homePageAllDataResponse?.data?[index].title??"", style: railway.copyWith(fontSize: titlesize ,)),
                                                    ),
                                                  ],
                                                ),) : const SizedBox(),
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: Get.height/5,
                                                // width: Get.width,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                                  child: ListView.builder(
                                                    controller: _scrollController1,
                                                    padding: EdgeInsets.zero,
                                                    // physics: NeverScrollableScrollPhysics(),
                                                    physics: const ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    // itemCount: controller.homePageAllDataResponse?.data?[index]?.sectionHomepageDetails?[index2],
                                                    itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                                    itemBuilder:  (BuildContext context, int index2) {
                                                      return Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.5),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Get.to(  ProductPage(
                                                              image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                              title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                              details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                              page: AppConstants.BRAND,
                                                              id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].brandId?.toString()??"",
                                                              pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                                            ));

                                                          },
                                                          child: Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  color:  const Color(0xff424242),
                                                                  width: Get.width/3.2,
                                                                  child: CustomImageCached(
                                                                    // image: '${Images.carusalimage}}',
                                                                    image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                                    height: Get.height/2,
                                                                    isRound: false,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),

                                                                Positioned(
                                                                    bottom: 0,
                                                                    child: Container(
                                                                      color: const Color(0xffF2F2F2).withOpacity(0.6),
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(left: Get.width, right: Get.width, top: 6, bottom: 7),
                                                                        child: Text((controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"").toUpperCase(),
                                                                          style: nonito.copyWith(
                                                                            // color: Color(0xffDBDCE2),
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold,
                                                                              // color: Colors.grey,
                                                                              fontSize: 12),),
                                                                      ),
                                                                    )

                                                                )
                                                              ]
                                                          ),
                                                        ),
                                                      );
                                                    },

                                                  ),
                                                ),
                                              )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ) : const SizedBox(),

                                        /// discover trend
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.DISCOVERTREND?
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 5),
                                          child: Column(
                                            children: [
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10, right: 10),
                                                child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    const Expanded(
                                                        child: Divider(color: Colors.black, thickness: 1, height: 1,)),
                                                    const SizedBox(width: 8),
                                                    Center(child: Text(controller.homePageAllDataResponse?.data?[index].title??"", style: railway.copyWith(fontSize: 20 ),)),
                                                    const SizedBox(width: 8),
                                                    const Expanded(
                                                        child: Divider(color: Colors.black, thickness: 1, height: 1,)),
                                                  ],
                                                ),
                                              ) : const SizedBox(),
                                              const SizedBox(height: 8),
                                              ListView.builder(
                                                padding: EdgeInsets.zero,
                                                  itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemBuilder: ( BuildContext context, int index2 ) {
                                                    return  InkWell(
                                                      onTap: () {
                                                        // print(controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails![index2]!.sectionId!.toString());
                                                        Get.to(  ProductPage(
                                                          image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                          title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                          details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                          page: AppConstants.SECTION,
                                                          id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].sectionId?.toString()??"",
                                                          pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                                        ));    },
                                                      child: Container(
                                                        color: const Color(0xffFAFBFB),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(height: 8),
                                                              CustomImageCached(
                                                                // image: '${Images.carusalimage}}',
                                                                image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                                height: Get.height/4,
                                                                isRound: false,
                                                                fit: BoxFit.fill,
                                                              ),
                                                              const SizedBox(height: 15),
                                                              Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title ??"", style:  nonito.copyWith(fontSize: 20, color: const Color(0xff000000) ),),
                                                              const SizedBox(height: 12),
                                                              Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                                textAlign: TextAlign.center,
                                                                style: railway.copyWith(fontSize: 14, color: const Color(0xff000000)),),
                                                              const SizedBox(height: 15),

                                                              controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].buttonTxt != null?
                                                              CustomButton(
                                                                height: 40,
                                                                width : 180,
                                                                fontSize : 15,
                                                                onPressed: () {
                                                                  Get.to(  ProductPage(
                                                                    image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                                    title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                    details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                                    page: AppConstants.SECTION,
                                                                    id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].sectionId?.toString()??"",
                                                                    pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                                                    parentId: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails![index2].section?.parentSectionId,
                                                                  ));
                                                                  log('Parand Section Id: ${controller.homePageAllDataResponse!.data![index].sectionHomepageDetails![index2].section?.parentSectionId}');
                                                                },
                                                                buttonText: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].buttonTxt??"Shop Now",
                                                                buttoncolor: controller.colorResponse?.data?.pages?[controller.selectedGenderIndex].bgColor!=null? HexColor(controller.colorResponse?.data?.pages?[controller.selectedGenderIndex].bgColor??"") : Colors.transparent,
                                                                buttontextcolor: Colors.white,
                                                              )
                                                                  : SizedBox(child: Text("Shop Now", style: railway.copyWith(fontSize: 12.5),),),
                                                              const SizedBox(height: 8),

                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              ),
                                            ],
                                          ),
                                        )
                                            : const SizedBox(),

                                        /// shop By category slider part
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.SHOPBYCATEGORY?
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                                          child: Column(
                                            children: [
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: 32,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                                      child: Text(controller.homePageAllDataResponse?.data?[index].title??"", style: railway.copyWith(fontSize: titlesize ,) ),
                                                    ),
                                                  ],
                                                ),) : const SizedBox(),
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: Get.height/5,
                                                // width: Get.width,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    // physics: NeverScrollableScrollPhysics(),
                                                    physics: const ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                                    itemBuilder:  (BuildContext context, int index2) {
                                                      return Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.5),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Get.to(
                                                                ProductPage(
                                                              image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                              title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                              details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                              page: AppConstants.CHILDCATEGORY,
                                                              id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].childCategoryId?.toString()??"",
                                                            )
                                                            );
                                                          },
                                                          child: Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  color:  const Color(0xff424242),
                                                                  width: Get.width/3.2,
                                                                  child: CustomImageCached(
                                                                    // image: '${Images.carusalimage}}',
                                                                    image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                                    height: Get.height/2,
                                                                    isRound: false,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                    bottom: 8,
                                                                    child: Align(
                                                                      alignment: Alignment.bottomCenter,
                                                                      child: Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                        style: nonito.copyWith(
                                                                          // color: Color(0xffDBDCE2),
                                                                            color: Colors.white,
                                                                            fontSize: 14),),
                                                                    )
                                                                )
                                                              ]
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ) : const SizedBox(),

                                        /// luxury
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.LUXURY?
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                                          child: Column(
                                            children: [
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              Padding(
                                                padding: const EdgeInsets.only(left: 12, right: 12, ),
                                                child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    const Expanded(
                                                        child: Divider(color: Colors.black, thickness: 1, height: 1,)),
                                                    const SizedBox(width: 15),
                                                    Expanded(
                                                        child: Center(child: Text((controller.homePageAllDataResponse?.data?[index].title??"").toUpperCase(), style: railway.copyWith(fontSize: 20 ),))),
                                                    const SizedBox(width: 8),
                                                    const Expanded(
                                                        child: Divider(color: Colors.black, thickness: 1, height: 1,)),
                                                  ],
                                                ),
                                              ) : const SizedBox(),
                                              const SizedBox(height: 6),
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8, right: 8, top: 8, ),
                                                child: SizedBox(
                                                  // color: Colors.red,
                                                  height: Get.height/2,
                                                  // width: Get.width,
                                                  child: Padding(
                                                      padding: const EdgeInsets.only(left: 0, right: 0),
                                                      child:
                                                      GridView.builder(
                                                        itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                                        scrollDirection: Axis.horizontal,
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 1,
                                                            crossAxisSpacing: 0,
                                                            mainAxisSpacing: 10,
                                                            // childAspectRatio: 1,
                                                            mainAxisExtent: Get.width
                                                        ),
                                                        itemBuilder: (BuildContext context, int index2){
                                                          return InkWell(
                                                            onTap: () {
                                                              Get.to(()=> ProductPage(
                                                                image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                                title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                                page: AppConstants.BRAND,
                                                                id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].brandId?.toString()??"",
                                                                pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                                              ));
                                                            },
                                                            child: Stack(
                                                                alignment: Alignment.center,
                                                                children: [
                                                                  Container(
                                                                    color:  const Color(0xff424242),
                                                                    // width: Get.width/3.2,
                                                                    child: CustomImageCached(
                                                                      image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                                      height: Get.height,
                                                                      width: Get.width,
                                                                      isRound: false,
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                      bottom: 30,
                                                                      child: Align(
                                                                        alignment: Alignment.bottomCenter,
                                                                        child: Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title ?? "",
                                                                          // child: Text("${categoryName[index]}",
                                                                          style: nonito.copyWith(
                                                                            // color: Color(0xffDBDCE2),
                                                                              color: Colors.white,
                                                                              fontSize: 20),),
                                                                      )
                                                                  ),
                                                                  Positioned(
                                                                      right: 10,
                                                                      child: Align(
                                                                        alignment: Alignment.bottomRight,
                                                                        child: Image.asset(Images.arrow, height: 40, width: 40, color: Colors.white,)
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                          );
                                                        },
                                                      )
                                                  ),
                                                ),
                                              )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ) : const SizedBox(),

                                        /// featured
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.FEATURED?
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                                          child: ListView.builder(
                                              itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),

                                              itemBuilder: ( BuildContext context, int index2 ) {
                                                return  Padding(
                                                  padding: const EdgeInsets.only(top: 12),
                                                  child: Column(
                                                    children: [
                                                      controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(  ProductPage(
                                                            image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                            title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                            details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                            page: AppConstants.CHILDCATEGORY,
                                                            id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].childCategoryId?.toString()??"",
                                                            pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                                          ));
                                                        },
                                                        child: Container(
                                                          color: const Color(0xffFAFBFB),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                                                            child:   CustomImageCached(
                                                              // image: '${Images.carusalimage}}',
                                                              image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                              height: Get.height/2.1,
                                                              isRound: false,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                          : const SizedBox(),
                                                      const SizedBox(height: 12),
                                                      controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title!= null?
                                                      Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"", style: nonito.copyWith(fontSize: 18,),)
                                                      : const SizedBox(),

                                                    ],
                                                  ),
                                                );
                                              }
                                          ),
                                        )
                                            : const SizedBox(),

                                        /// affordable
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.AFFORDABLEITEM?
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                                          child: Column(
                                            children: [
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: 32,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                                      child: Text(controller.homePageAllDataResponse?.data?[index].title??"", style: railway.copyWith(fontSize: titlesize ,) ),
                                                    ),
                                                  ],
                                                ),) : const SizedBox(),
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                // color: Colors.red,
                                                height: Get.height/4.2,
                                                width: Get.width,
                                                child: Padding(
                                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                                    child:
                                                    GridView.builder(
                                                      itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                                      scrollDirection: Axis.horizontal,
                                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 1,
                                                          crossAxisSpacing: 0,
                                                          mainAxisSpacing: 10,
                                                          childAspectRatio: 1
                                                      ),
                                                      itemBuilder: (BuildContext context, int index2 ){
                                                        return InkWell(
                                                          onTap: () {
                                                            Get.to(()=>
                                                                ProductPage(
                                                                  image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                                  title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                  details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                                  page: AppConstants.CHILDCATEGORY,
                                                                  id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].childCategoryId?.toString()??"",
                                                                  pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                                                )
                                                            );
                                                            log('Category Id: ${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].childCategoryId?.toString()}');
                                                          },
                                                          child: Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  color:  const Color(0xff424242),
                                                                  // width: Get.width/3.2,
                                                                  child: CustomImageCached(
                                                                    image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                                    // image: '${catagoryimage[index]}',
                                                                    height: Get.height/4.2,
                                                                    isRound: false,
                                                                    fit: BoxFit.fill,

                                                                  ),
                                                                ),
                                                                Positioned(
                                                                    bottom: 15,
                                                                    child: Align(
                                                                      alignment: Alignment.bottomCenter,
                                                                      child: Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                        // child: Text("${brandName[index]}",
                                                                        style: nonito.copyWith(
                                                                          // color: Color(0xffDBDCE2),
                                                                            color: Colors.white,
                                                                            fontSize: 18),),
                                                                    )
                                                                )
                                                              ]
                                                          ),
                                                        );
                                                      },
                                                    )
                                                ),
                                              )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ) : const SizedBox(),

                                        /// new in
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.NEWIN?
                                        Padding(
                                          padding: const EdgeInsets.only(left: 6, right: 8, top: 5, bottom: 5),
                                          child: Column(
                                            children: [
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: 32,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: Text(controller.homePageAllDataResponse?.data?[index].title??"", style: railway.copyWith(fontSize: titlesize ,) ),
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: (){
                                                            // Get.to(  ProductPage(
                                                            //   image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                            //   title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                            //   details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                            //   page: AppConstants.SECTION,
                                                            //   id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].sectionId?.toString()??"",
                                                            //   pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                                            //   parentId: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails![index2].section?.parentSectionId,
                                                            // ));
                                                            Get.to(()=> ProductPage(
                                                              // image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse!.data![index].banner ?? ""}',
                                                              title: controller.homePageAllDataResponse?.data?[index]?.title ?? "",
                                                              // details: controller.homePageAllDataResponse?.data?[index]?.shortDescription ?? "",
                                                              page: AppConstants.newIn,
                                                              id: controller.genderPageResponse?.data?[controller.selectedGenderIndex]?.id.toString() ?? '',
                                                              pageId: controller.homePageAllDataResponse?.data?[index].pageId,
                                                            ));

                                                            // Get.to(() => NewinLandingPage(
                                                            //   page: AppConstants.NEWIN,
                                                            //   id: controller.genderPageResponse!.data![controller.selectedGenderIndex]!.id!,));
                                                         },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(right: 8),
                                                            child: Text("Shop All".toUpperCase(),
                                                              textAlign: TextAlign.end,
                                                              style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),),
                                                          ),
                                                        )),
                                                  ],
                                                ),) : const SizedBox(),
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                // color: Colors.red,
                                                height: Get.height/2.1,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 2, right: 0),
                                               child: GridView.builder(
                                                 scrollDirection: Axis.horizontal,
                                                 itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!.length??0,
                                                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                   childAspectRatio: 1.85,
                                                   crossAxisCount: 1, // Set the number of items in a row
                                                 ),
                                                 itemBuilder: (BuildContext context, int index2) {
                                                   return Padding(
                                                     padding: const EdgeInsets.only(left: 2, right: 6),
                                                     child: Column(
                                                      children: [
                                                        InkWell(
                                                          onTap : () {
                                                            Get.to(ProductDetailsPage(
                                                              productId: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails![index2].id!.toString(),
                                                            ));
                                                          },
                                                          child: Container(
                                                            // color:  Color(0xff424242),
                                                            // color:  Colors.blue,
                                                            child: Stack(
                                                                alignment: Alignment.topCenter,
                                                                children: [
                                                                  CustomImageCached(
                                                                    placeholder: Images.placeholder,
                                                                    image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse!.data![index]!.sectionHomepageDetails?[index2]!.productColorVariants![0]!.profilePhoto??""}',
                                                                    // height: Get.height/3,
                                                                    height: Get.height/3,
                                                                    isRound: false,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                  Positioned(
                                                                      bottom: 0,
                                                                      child: Align(
                                                                        alignment: Alignment.bottomCenter,
                                                                        child: Container(
                                                                          /// orginal color
                                                                          // color: Color(0xffF2F2F2),
                                                                          color: Colors.grey.shade300,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                                                                            child: Text((controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].season?.name??"").toUpperCase(),
                                                                              style: railway.copyWith(color: Colors.black, fontSize: 9),),
                                                                          ),
                                                                        ),
                                                                      )

                                                                  )
                                                                ]
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 12),
                                                        Text((controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].brand?.name??"").toUpperCase(),
                                                          overflow: TextOverflow.ellipsis,
                                                          style: railway.copyWith(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600),),
                                                        const SizedBox(height: 7),

                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                                          child: Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].name??"",
                                                            overflow: TextOverflow.ellipsis,
                                                            // maxLines: 1,
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight.w200,
                                                                fontSize: 12
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 7),

                                                /*        Text("100 BDT",
                                                          style: railway.copyWith( color: gold, fontSize: 12),),*/
                                                        controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].discount == "null" || controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].discount == 0 ?
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                                          child: Text(
                                                            "${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].price} BDT",
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight.w600,
                                                                color: gold,
                                                                fontSize: 12
                                                            ),
                                                          ),
                                                        )
                                                            :
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].discountedPrice} BDT",
                                                                style: poppins.copyWith(
                                                                    fontWeight: FontWeight.w600,
                                                                    color: gold,
                                                                    fontSize: 12
                                                                ),
                                                              ),
                                                              const SizedBox(height: 2),
                                                              Text(
                                                                "${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].price} BDT",
                                                                style: poppins.copyWith(
                                                                    fontWeight: FontWeight.w600,
                                                                    decoration: TextDecoration.lineThrough,
                                                                    color: Colors.red,
                                                                    fontSize: 12
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                     ),
                                                   );
                                                 },
                                               ),
                                                ),
                                              )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ) : const SizedBox(),

                                        /// most popular
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.MOSTPOPULAR?
                                        Padding(
                                          padding: const EdgeInsets.only(left: 6, right: 8, top: 5, bottom: 5),
                                          child: Column(
                                            children: [
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: 32,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: Text(controller.homePageAllDataResponse?.data?[index].title??"", style: railway.copyWith(fontSize: titlesize ,) ),
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: (){
                                                            Get.to(()=> ProductPage(
                                                              image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse!.data![index].banner ?? ""}',
                                                              title: controller.homePageAllDataResponse?.data?[index]?.title ?? "",
                                                              details: controller.homePageAllDataResponse?.data?[index]?.shortDescription ?? "",
                                                              page: AppConstants.mostPopular,
                                                              id: controller.genderPageResponse?.data?[controller.selectedGenderIndex]?.id.toString() ?? '',
                                                              pageId: controller.homePageAllDataResponse?.data?[index].pageId
                                                            ));

                                                            // Get.to(() => NewinLandingPage(
                                                            //   page: AppConstants.MOSTPOPULAR,
                                                            //   id: controller.genderPageResponse!.data![controller.selectedGenderIndex]!.id!,));
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(right: 8),
                                                            child: Text("Shop All".toUpperCase(),
                                                              textAlign: TextAlign.end,
                                                              style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),),
                                                          ),
                                                        )),
                                                  ],
                                                ),) : const SizedBox(),
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                // color: Colors.red,
                                                height: Get.height/2.2,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 0, right: 0),
                                                  child: GridView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!.length??0,
                                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                      childAspectRatio: 1.81,
                                                      crossAxisCount: 1, // Set the number of items in a row
                                                    ),
                                                    itemBuilder: (BuildContext context, int index2) {
                                                      return Padding(
                                                        padding: const EdgeInsets.only(left: 2, right: 8),
                                                        child: Column(
                                                          children: [
                                                            InkWell(
                                                              onTap : () {
                                                                Get.to(ProductDetailsPage(
                                                                  productId: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails![index2].id!.toString(),
                                                                ));
                                                              },
                                                              child: Container(
                                                                // color:  Color(0xff424242),
                                                                // color:  Colors.blue,
                                                                child: Stack(
                                                                    alignment: Alignment.topCenter,
                                                                    children: [
                                                                      CustomImageCached(
                                                                        image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].productColorVariants?[0].frontPhoto??""}',
                                                                        height: Get.height/3,
                                                                        isRound: false,
                                                                        fit: BoxFit.fill,

                                                                      ),
                                                                      Positioned(
                                                                          bottom: 0,
                                                                          child: Align(
                                                                            alignment: Alignment.bottomCenter,
                                                                            child: Container(
                                                                              /// orginal color
                                                                              // color: Color(0xffF2F2F2),
                                                                              color: Colors.grey.shade300,
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                                                                                child: Text((controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].season?.name??"").toUpperCase(),
                                                                                  style: railway.copyWith(color: Colors.black, fontSize: 9),),
                                                                              ),
                                                                            ),
                                                                          )

                                                                      )
                                                                    ]
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(height: 12),
                                                            Text((controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].brand?.name??"").toUpperCase(),
                                                              overflow: TextOverflow.ellipsis,
                                                              style: railway.copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w600),),
                                                            const SizedBox(height: 7),

                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                                              child: Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].name??"",
                                                                overflow: TextOverflow.ellipsis,
                                                                // maxLines: 1,
                                                                style: poppins.copyWith(
                                                                    fontWeight: FontWeight.w200,
                                                                    fontSize: 12
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(height: 7),

                                                            /*        Text("100 BDT",
                                                          style: railway.copyWith( color: gold, fontSize: 12),),*/
                                                            controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].discount == 0 ||  controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].discount == null  ?
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                                              child: Text(
                                                                "${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].price} BDT",
                                                                style: poppins.copyWith(
                                                                    fontWeight: FontWeight.w600,
                                                                    color: gold,
                                                                    fontSize: 12
                                                                ),
                                                              ),
                                                            )
                                                                :
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    "${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].discountedPrice} BDT",
                                                                    style: poppins.copyWith(
                                                                        fontWeight: FontWeight.w600,
                                                                        color: gold,
                                                                        fontSize: 12
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ) : const SizedBox(),

                                        /// shop by age
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.SHOPBYAGE?
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: 32,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                                                      child: Text(controller.homePageAllDataResponse?.data?[index].title??"", style: railway.copyWith(fontSize: titlesize ,) ),
                                                    ),
                                                  ],
                                                ),) : const SizedBox(),
                                              controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                              SizedBox(
                                                height: Get.height/5.2,
                                                // width: Get.width,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    // physics: NeverScrollableScrollPhysics(),
                                                    physics: const ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                                    itemBuilder:  (BuildContext context, int index2) {
                                                      return Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 2.5),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Get.to(
                                                                ProductPage(
                                                                  image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner?? ""}',
                                                                  title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                  details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                                  page: AppConstants.CHILDCATEGORY,
                                                                  id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].childCategoryId?.toString()??"",
                                                                )
                                                            );
                                                          },
                                                          child: Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Container(
                                                                  color:  const Color(0xff424242),
                                                                  width: Get.width/2.5,
                                                                  child: CustomImageCached(
                                                                    // image: '${Images.carusalimage}}',
                                                                    image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                                    height: Get.height/2.5,
                                                                    isRound: false,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                    bottom: 8,
                                                                    child: Align(
                                                                      alignment: Alignment.bottomCenter,
                                                                      child: Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                        style: nonito.copyWith(
                                                                          // color: Color(0xffDBDCE2),
                                                                            color: Colors.white,
                                                                            fontSize: 14),),
                                                                    )
                                                                )
                                                              ]
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ) : const SizedBox(),

                                        /// occasion
                                        controller.homePageAllDataResponse?.data?[index].sectionType == AppConstants.OCCASION?
                                        Column(
                                          children: [
                                            controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                // crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  const Expanded(
                                                      child: Divider(color: Colors.black, thickness: 1, height: 1,)),
                                                  const SizedBox(width: 8),
                                                  Center(child: Text(controller.homePageAllDataResponse?.data?[index].title??"", style: railway.copyWith(fontSize: 20 ),)),
                                                  const SizedBox(width: 8),
                                                  const Expanded(
                                                      child: Divider(color: Colors.black, thickness: 1, height: 1,)),
                                                ],
                                              ),
                                            ) : const SizedBox(),
                                            // const SizedBox(height: 8),
                                            SizedBox(
                                              // color: Colors.green,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 5, bottom: 5),
                                                child: ListView.builder(
                                                    itemCount: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?.length,
                                                    shrinkWrap: true,
                                                    physics: const NeverScrollableScrollPhysics(),

                                                    itemBuilder: ( BuildContext context, int index2 ) {
                                                      return  Padding(
                                                        padding: const EdgeInsets.only(bottom: 12),
                                                        child: Column(
                                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                                          // mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            controller.homePageAllDataResponse != null && controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails!= null ?
                                                            InkWell(
                                                              onTap: () {
                                                                Get.to(  ProductPage(
                                                                  image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2]?.section?.banner?? ""}',
                                                                  title: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"",
                                                                  details: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].shortDescription??"",
                                                                  page: AppConstants.CHILDSECTION,
                                                                  id: controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].section?.id?.toString()??"",
                                                                ));
                                                              },
                                                              child: Container(
                                                                color: const Color(0xffFAFBFB),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                                                                  child:   CustomImageCached(
                                                                    // image: '${Images.carusalimage}}',
                                                                    image: '${AppConstants.BASE_URL}${controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].banner ?? ""}',
                                                                    height: Get.height/2.1,
                                                                    isRound: false,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                                : const SizedBox(),
                                                            const SizedBox(height: 12),
                                                            controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title!= null?
                                                            Text(controller.homePageAllDataResponse?.data?[index].sectionHomepageDetails?[index2].title??"", style: nonito.copyWith(fontSize: 18,),)
                                                                : const SizedBox(),

                                                          ],
                                                        ),
                                                      );
                                                    }
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                            : const SizedBox(),
                                      ],
                                    );
                                  })
                                  : const ShimmerLoading(),

                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.genderList.length??0,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                                    child: InkWell(
                                      onTap: () {
                                        _scrollController.animateTo(
                                          _scrollController.position.minScrollExtent,
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.easeIn,
                                        );
                                        controller.getTopSliderData(controller.genderList[index].id.toString());
                                        controller.getHomePageAllData(controller.genderList[index].id.toString());
                                        controller.selectedGenderIndex=index;
                                       // Get.to(Home());
                                      },

                                      child :  controller.selectedGenderIndex!=index?Container(
                                        color: const Color(0xffFAFBFB),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
                                          child: Column(
                                            children: [
                                              CustomImageCached(image: '${AppConstants.BASE_URL}${controller.genderList[index].banner?? ""}',
                                                height: Get.height/10,
                                                isRound: false,
                                                fit: BoxFit.fill,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ):const SizedBox(),
                                    ),
                                  );
                                },
                              ),


                      const SizedBox(height: 20),

                            ],
                          ),
                        )
                            : const Text("");
                    },
                  ),
                ),
              ],
            ),

          );
        }
    );
  }



  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 14) {
      return 'Noon';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    if (hour < 20) {
      return 'Evening';
    }
    return 'Night';
  }


}
