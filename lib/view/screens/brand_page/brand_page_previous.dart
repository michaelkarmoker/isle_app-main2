import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/home/home_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/screens/design%20backup/search_sunny.dart';


class BrandPage extends StatefulWidget {
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
  State<BrandPage> createState() => _IsleDrawerState();
}

class _IsleDrawerState extends State<BrandPage> {
  Color tabColor= gold;

  Color button1Color = gold;
  Color button2Color = gold;
  Color button3Color = gold;

  void changeColor(int buttonNumber) {
    setState(() {
      switch (buttonNumber) {
        case 1:
          button1Color = gold;
          button2Color = gold;
          button3Color = gold;
          break;
        case 2:
          button1Color = gold;
          button2Color = gold;
          button3Color = gold;
          break;
        case 3:
          button1Color = gold;
          button2Color = gold;
          button3Color = gold;
          break;
      }
    });
  }


  TextEditingController searchCtr = TextEditingController();
  FocusNode searchFcs=FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(

      // width: Get.width/1.18,
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
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
            // backgroundColor: Color(0xffEBEFF3),
            backgroundColor: Color(0xffFFFFFF),
            body:  Column(
              children: [
                
                /// Tab Bar Part
                Container(
                  // color: Color(0xffFFFFFF),
                  height: 40,
                  /*      decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(4, 8), // changes position of shadow
                      ),
                    ],
                  ),*/
                  child: Container(
                    // color: tabColor,
                    // color: Color(0xffFFFFFF),
                    child: TabBar(
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                        onTap: (index) {
                          setState(() {

                            if(index==0) { tabColor = gold;}
                            if(index==1) {tabColor = gold;}
                            if(index==2) {tabColor = gold;}
                          });
                          print(index);
                        },
                        // indicator: BoxDecoration(color: tabColor,borderRadius: BorderRadius.circular(8)),
                        // dividerColor: Colors.black,

                        /* indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft:
                            Radius.circular(10),topRight: Radius.circular(10)),
                            color: tabColor
                        ),*/
                        // indicatorColor: Color(0xffb89600),
                        indicatorColor: tabColor,
                        indicatorWeight: 2.5,
                        tabs: [
                          Tab(
                              child: Text(
                                'Men',
                                style: railway.copyWith(
                                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Tab(
                              child: Text(
                                'Women',
                                style: railway.copyWith(
                                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          Tab(
                              child: Text(
                                'Kids',
                                style: railway.copyWith(
                                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                        ]),
                  ),
                ),
SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    // color: Colors.pinkAccent,
                    height: 50,
                    child: Row(
                      children: [
                        /*InkWell(

                          child: Container(
                            // width: 80,
                            height: 50,
                            // margin: EdgeInsets.all(10),
                            // padding: EdgeInsets.all(5),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                              child: Center(

                                  child:    Icon(Icons.star, color: Colors.white, size: 20,)

                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.black87,
                                border: Border.all(
                                  // color: Colors.black,
                                  width: 1,
                                )),
                          ),
                        ),*/
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: brandlist.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                child: InkWell(

                                  child: Container(
                                    // width: 80,
                                    height: 50,
                                    // margin: EdgeInsets.all(10),
                                    // padding: EdgeInsets.all(5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                                      child: Center(child: Text('${brandlist[index]}', style: robotoRegular.copyWith(color: Colors.white, fontSize: 11),)),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                        color: Colors.black87,
                                        border: Border.all(
                                          // color: Colors.black,
                                          width: 1,
                                        )),
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

                Padding(
                  padding: const EdgeInsets.only(top: 20 ,left: 8, right: 8 ),
                  child: CustomOnlyTextFieldWithBorder(
                    height: 35,
                    prefixIcon: Images.search,
                    controller: searchCtr,
                    focusNode: searchFcs,
                    hintText: "Search from 351 designers",
                    hintStyle: railway.copyWith(fontSize: 10),
                    color: Colors.grey,

                  ),
                ),

                Expanded(
                  child: TabBarView(
                      children: [
                        /// 1 st TAB
                        RefreshIndicator(
                            onRefresh: () async{
                              // showCustomSnackBar("2");
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    children: [

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
                                                  itemCount: alphabet.length,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                                      child: InkWell(

                                                        child: Container(
                                                          // width: 80,
                                                          height: 40,
                                                          // margin: EdgeInsets.all(10),
                                                          // padding: EdgeInsets.all(5),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                                            child: Center(child: Text('${alphabet[index]}', style: robotoRegular.copyWith(color: Colors.black, fontSize: 15),)),
                                                          ),
                                                     /*     decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(2),
                                                              // color: Colors.black87,
                                                              border: Border.all(
                                                                // color: Colors.black,
                                                                width: 1,
                                                              )),*/
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

                                      SizedBox(height: 15),



                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("0-9",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("001 skincare london",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                        // Image.asset(Images.star, color: gold, height: 15, width: 15,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("1017 ALYX 9SM",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("7 Days Active",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("8-bit",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),

                                      /// A
                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("A",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("A Bathing Ape",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Adidas",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Armani",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Acne Studios",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),

                                      /// B
                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("B",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Blue Sky In",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("BOSS",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Burberry",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Bluemint",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),


                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),

                        /// 2nd TAB
                        RefreshIndicator(
                            onRefresh: () async{
                              // showCustomSnackBar("2");
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    children: [

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
                                                  itemCount: alphabet.length,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                                      child: InkWell(

                                                        child: Container(
                                                          // width: 80,
                                                          height: 40,
                                                          // margin: EdgeInsets.all(10),
                                                          // padding: EdgeInsets.all(5),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                                            child: Center(child: Text('${alphabet[index]}', style: robotoRegular.copyWith(color: Colors.black, fontSize: 15),)),
                                                          ),
                                                          /*     decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(2),
                                                              // color: Colors.black87,
                                                              border: Border.all(
                                                                // color: Colors.black,
                                                                width: 1,
                                                              )),*/
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

                                      SizedBox(height: 15),



                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("0-9",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("001 skincare london",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                        // Image.asset(Images.star, color: gold, height: 15, width: 15,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("1017 ALYX 9SM",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("7 Days Active",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("8-bit",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),

                                      /// A
                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("A",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("A Bathing Ape",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Adidas",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Armani",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Acne Studios",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),

                                      /// B
                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("B",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Blue Sky In",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("BOSS",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Burberry",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Bluemint",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),


                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),

                        /// 3rd TAB
                        RefreshIndicator(
                            onRefresh: () async{
                              // showCustomSnackBar("2");
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    children: [

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
                                                  itemCount: alphabet.length,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(left: 3, right: 3), // Add some spacing between items
                                                      child: InkWell(

                                                        child: Container(
                                                          // width: 80,
                                                          height: 40,
                                                          // margin: EdgeInsets.all(10),
                                                          // padding: EdgeInsets.all(5),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                                                            child: Center(child: Text('${alphabet[index]}', style: robotoRegular.copyWith(color: Colors.black, fontSize: 15),)),
                                                          ),
                                                          /*     decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(2),
                                                              // color: Colors.black87,
                                                              border: Border.all(
                                                                // color: Colors.black,
                                                                width: 1,
                                                              )),*/
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

                                      SizedBox(height: 15),



                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("0-9",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("001 skincare london",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                        // Image.asset(Images.star, color: gold, height: 15, width: 15,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("1017 ALYX 9SM",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("7 Days Active",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("8-bit",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),

                                      /// A
                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("A",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("A Bathing Ape",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Adidas",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Armani",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Acne Studios",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),

                                      /// B
                                      Container(
                                        color: Colors.grey.shade200  ,
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Row(
                                            children: [
                                              Text("B",
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: 1,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [

                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Blue Sky In",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("BOSS",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Burberry",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star_border, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.teal,
                                                  height: 30,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Bluemint",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: poppins.copyWith(fontSize: 12),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Icon(Icons.star, color: gold, size: 20,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                      ),


                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
