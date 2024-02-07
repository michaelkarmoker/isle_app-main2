import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/theme/light_theme.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import 'package:isletestapp/view/screens/all_popup/info_popup.dart';
import 'package:isletestapp/view/screens/brand_page/brand_page_previous.dart';
import 'package:isletestapp/view/screens/design%20backup/categories_tab.dart';
import 'package:isletestapp/view/screens/all_popup/sort_popup.dart';
import 'package:isletestapp/view/screens/dashboard/widgets/bottom_nav_item.dart';
import 'package:isletestapp/view/screens/all_popup/custom_discover_dialog.dart';
import 'package:isletestapp/view/screens/discover/discover_page_previous.dart';
import 'package:isletestapp/view/screens/drawer/drawer.dart';
import 'package:isletestapp/view/screens/filter/people_filter_dialog.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';



class BrandViewPage extends StatefulWidget {
  final int pageIndex;
  final String cardimage;
  BrandViewPage({Key? key, required this.pageIndex, required this.cardimage}) : super(key: key);
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
  State<BrandViewPage> createState() => _IsleHomeScreenState();
}

class _IsleHomeScreenState extends State<BrandViewPage> {


  @override
  void initState() {
    super.initState();
  }


  TextEditingController searchCtr = TextEditingController();
  bool isSearchClick=false;
  TextEditingController subscribeCtr = TextEditingController();
  FocusNode subscribeFcs = FocusNode();

  bool indicatorcolor= true;
  TextEditingController msgboxCtr = TextEditingController();
  FocusNode msgboxFcs = FocusNode();

  bool isChecked = false;

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked; // Toggle the checkbox state
    });
  }

  bool isToggled = false;
  void toggleButton() {
    setState(() {
      isToggled = !isToggled;
    });
  }


  Color buttonColor = Colors.transparent;
  Color buttontextColor = Colors.black;
  void changeColor() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor = Colors.black;
      buttontextColor = Colors.white;
    });
  }
  Color buttonColor2 = Colors.transparent;
  Color buttontextColor2 = Colors.black;
  void changeColor2() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor2 = Colors.black; // Change to your desired color
      buttontextColor2 = Colors.white;
    });
  }
  Color buttonColor3 = Colors.transparent;
  Color buttontextColor3 = Colors.black;
  void changeColor3() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor3 = Colors.black; // Change to your desired color
      buttontextColor3 = Colors.white;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UniversalBottomNav(),

      // backgroundColor: Color(0xffFAFBFB),
      backgroundColor: Color(0xffFAFAFA),
      // drawer: IsleDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff000000)),
        titleSpacing: 0,
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        elevation: 0,

        actions: [
          InkWell(
              onTap: (){
                Get.to(SearchScreen());
              },
              // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
              child: Image.asset(Images.search, height: 22, width: 22,)),
          SizedBox(width: 15),
          InkWell(
              onTap: (){
                Get.to(WishListPage());
              },
              child: Image.asset(Images.wish, height: 22, width: 22, color: Color(0xff000000),)),

          SizedBox(width: 10),

        ],
        leadingWidth: Get.width/3.5,
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
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              // color: Colors.red,
              height: Get.height/4,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: Get.width,
                    // color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(Images.brandcover, fit: BoxFit.fill,),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.to(WishListPage());
                          },
                          child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey.shade100,
                              child: Icon(Icons.star_border_purple500_sharp, size: 27, color: gold,)),
                        )
                      ],
                    ),),
                ],
              ),
            ),

            InkWell(
              onTap: (){
                Get.dialog(CustomDialog(title: "", desc: "The Alexander McQueen was a fashion vai.....\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",));
               // Get.dialog(CustomDialog(title: controller.notificationResponse!.notifications![index].title!, desc: controller.notificationResponse!.notifications![index].details!,));
              },
              child: Container(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Alexander McQueen", style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.w600),),
                      SizedBox(height: 8),
                      Text("The Alexander McQueen was a fashion vai.....", style: poppins.copyWith(fontSize: 11),),
                      SizedBox(height: 6),
                      Text("Read More".toUpperCase(), style: robotoMedium.copyWith(fontWeight: FontWeight.w600 ,color: gold,fontSize: 10, decoration: TextDecoration.underline),),
                      SizedBox(height: 0),

                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Container(
                // color: Colors.pinkAccent,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // itemCount: brandlist.length,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                child: InkWell(
                                  onTap: () {
                                   // Get.to(FilterScreen());
                                    changeColor();
                                    // Get.to(
                                    //   showModalBottomSheet(
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return InfoPopup();
                                    //     },
                                    //   ),
                                    // );
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    // width: 80,
                                    height: 40,
                                    // margin: EdgeInsets.all(10),
                                    // padding: EdgeInsets.all(5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4, right: 8, top: 2, bottom: 2),
                                      child: Center(child: Row(
                                        children: [
                                          Container(
                                            // color: Colors.blue,
                                              height: 35,
                                              width: 35,
                                              child: Image.asset(Images.filter, color: buttontextColor,)),
                                          SizedBox(width: 5),
                                          Text('Filter'.toUpperCase(), style: poppins.copyWith(color: buttontextColor, fontSize: 12, fontWeight: FontWeight.w600),),
                                          // Text('${brandlist[index]}'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black, fontSize: 10),),
                                        ],
                                      )),
                                    ),
                                    decoration: BoxDecoration(
                                      // color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(3),
                                        color: buttonColor,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                child: InkWell(
                                  onTap: (){
                                    changeColor2();
                                    setState(() {
                                    });
                                    Get.to(
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return PeopleSortPopup();
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    // width: 80,
                                    height: 40,
                                    // margin: EdgeInsets.all(10),
                                    // padding: EdgeInsets.all(5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4, right: 8, top: 2, bottom: 2),
                                      child: Center(child: Row(
                                        children: [
                                          Container(
                                            // color: Colors.blue,
                                              height: 20,
                                              width: 30,
                                              child: Image.asset(Images.swap, color: buttontextColor2,)),
                                          SizedBox(width: 5),
                                          Text('Sort'.toUpperCase(), style: poppins.copyWith(color: buttontextColor2, fontSize: 12, fontWeight: FontWeight.w600),),
                                          // Text('${brandlist[index]}'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black, fontSize: 10),),
                                        ],
                                      )),
                                    ),
                                    decoration: BoxDecoration(
                                      // color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(3),
                                        color: buttonColor2,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                child: InkWell(
                                  onTap: () {
                                    changeColor3();
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    // width: 80,
                                    height: 40,
                                    // margin: EdgeInsets.all(10),
                                    // padding: EdgeInsets.all(5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
                                      child: Center(child: Text('Shoes'.toUpperCase(), style: poppins.copyWith(color: buttontextColor3, fontSize: 12, fontWeight: FontWeight.w600),)),
                                    ),
                                    decoration: BoxDecoration(
                                      // color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(3),
                                        color: buttonColor3,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                child: InkWell(
                                  child: Container(
                                    // width: 80,
                                    height: 40,
                                    // margin: EdgeInsets.all(10),
                                    // padding: EdgeInsets.all(5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
                                      child: Center(child: Text('Accossories'.toUpperCase(), style: poppins.copyWith(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),)),
                                    ),
                                    decoration: BoxDecoration(
                                      // color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                child: InkWell(
                                  child: Container(
                                    // width: 80,
                                    height: 40,
                                    // margin: EdgeInsets.all(10),
                                    // padding: EdgeInsets.all(5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
                                      child: Center(child: Text('Watchws'.toUpperCase(), style: poppins.copyWith(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),)),
                                    ),
                                    decoration: BoxDecoration(
                                      // color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Text("Showing 999+ results", style: poppins.copyWith(fontSize: 9, color: Colors.grey),),

            /// card
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true, // Set to true to make the GridView scrollable within SingleChildScrollView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    mainAxisSpacing: 15, // Spacing between rows
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.56// Spacing between columns
                ),
                itemCount: catagorysliderimage.length, // Number of items in the GridView
                itemBuilder: (context, index) {
                  return Container(
                    // color: Colors.blue,
                    // height: Get.height/2,
                    // width: Get.width/3,
                    child: InkWell(
                      highlightColor: Colors.grey,
                      splashColor: Colors.grey,
                      // focusColor: Colors.green,
                      // hoverColor: Colors.blue,
                      onTap: (){
                        Get.to(ProductDetailsPage( cartdetailsimage: widget.cardimage, productId: '',));
                        // showCustomSnackBar("Click Shop Cart");
                      },
                      child: Column(

                          children: [

                            Container(
                              // color: Colors.red,
                              height: Get.height/3.2,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  CarouselSlider.builder(
                                    options: CarouselOptions(
                                      autoPlay: false,
                                      disableCenter: true,
                                      viewportFraction: 1,

                                      autoPlayInterval: Duration(seconds: 7),
                                      height: Get.height/2.4,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) {
                                        setState((){
                                          // currentIndex=index;
                                        });
                                      },
                                    ),
                                    // itemCount: controller.productImage!.length,
                                    itemCount: 5,
                                    itemBuilder: (context, index, _) {

                                      return   Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: CustomImageCached(
                                          // image: '${Images.carusalimage}}',
                                          image: widget.cardimage,
                                          height: Get.height/3.7,
                                          isRound: false,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      );

                                    },
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    // right: 10,
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TabPageSelectorIndicator(
                                          // backgroundColor: index == currentIndex ? greenColor : Colors.white,
                                          backgroundColor: indicatorcolor ? gold : silvercolor,
                                          borderColor: gold,
                                          // size: index == currentIndex ? 7 : 7,
                                          size: 7,
                                        ),
                                        TabPageSelectorIndicator(
                                          // backgroundColor: index == currentIndex ? greenColor : Colors.white,
                                          backgroundColor: indicatorcolor ? gold : silvercolor,
                                          borderColor: gold,
                                          // size: index == currentIndex ? 7 : 7,
                                          size: 7,
                                        ),
                                        TabPageSelectorIndicator(
                                          // backgroundColor: index == currentIndex ? greenColor : Colors.white,
                                          backgroundColor: indicatorcolor ? gold : silvercolor,
                                          borderColor: gold,
                                          // size: index == currentIndex ? 7 : 7,
                                          size: 7,
                                        ),
                                      ],
                                    ),),
                                  Positioned(
                                      bottom: 0,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          /// orginal color
                                          // color: Color(0xffF2F2F2),
                                          color: Colors.grey.shade300,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                            child: Text("New Season".toUpperCase(),
                                              style: poppins.copyWith(color: Colors.black, fontSize: 9),),
                                          ),
                                        ),
                                      )
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: InkWell(
                                      onTap: (){
                                        Get.to(WishListPage());
                                      },

                                      child: Container(
                                        // color: Colors.black,
                                        height: 30,
                                        width: 30,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Image.asset(Images.wish, color: silvercolor, height: 20, width: 20,),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: InkWell(
                                      onTap: () {
                                        // Get.to(
                                        //   showModalBottomSheet(
                                        //     context: context,
                                        //     builder: (BuildContext context) {
                                        //       return SimilarPopup();
                                        //     },
                                        //   ),
                                        // );
                                      },

                                      child: Container(
                                        // color: Colors.black,
                                        height: 30,
                                        width: 30,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 8),
                            Text("${categorysliderName[index]}",
                              style: railway.copyWith( fontSize: 12, fontWeight: FontWeight.w600),),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Text("Cross Crewneck Sweatshirt in Organic Cotton",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: poppins.copyWith( fontWeight: FontWeight.w100, fontSize: 10.5),),
                            ),
                            SizedBox(height: 5),
                            Text("100 BDT",
                              style: railway.copyWith(fontWeight: FontWeight.w600, color: gold, fontSize: 11),),

                          ]
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),);
  }




}
