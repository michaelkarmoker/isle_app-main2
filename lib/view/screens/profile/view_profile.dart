import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
import 'package:isletestapp/view/screens/checkout/manual_shipping_form.dart';
import 'package:isletestapp/view/screens/profile/addressbook%20edit/addressbook_edit.dart';
import 'package:isletestapp/view/screens/profile/landing%20pages/profile_details_and_edit.dart';
import 'package:isletestapp/view/screens/profile/profile%20edit/profile_edit.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({Key? key,}) : super(key: key);
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  bool isExpanded5 = false;
  bool isExpanded6 = false;
  bool isExpanded7 = false;
  bool isExpandedSize = false;

  bool childexp1 = false;
  bool childexp2 = false;
  bool childexp3 = false;
  bool childexp4 = false;
  bool childexp5 = false;
  bool childexp6 = false;
  @override
  State<ViewProfile> createState() => _WishListPageState();
}
class _WishListPageState extends State<ViewProfile> {

  PageController? _pageController;
  bool isOpen=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserProfileController>().dataInitializeForViewProfile();
    }
    );
  }

  Color tabColor = gold;
  Color button1Color = gold;
  Color button2Color = gold;
  Color button3Color = gold;
  // Color button3Color = gold;

  // Color button3Color = Colors.grey;

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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      builder: (controller) {
        return DefaultTabController(
          length: 1,
          child: Scaffold(
            // bottomNavigationBar: UniversalBottomNav(),
            bottomNavigationBar:  InkWell(
              onTap: (){
                if(Get.find<AuthController>().isLoggedIn()){
                  Get.find<AuthController>().signOut();
                } else if(Get.find<AuthController>().isLoggedInGuest()) {
                  Get.find<AuthController>().signOutGuest();
                }
              },
              /// back logic
 /*             onTap: () async{
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                final logout = await prefs.setBool(AppConstants.isLogInKey, false);
                if(logout){
                  Get.offAll(LoginRegisterPage(isFromCart: false, isBack: false,));
                } else{
                  showCustomSnackBar('Unsuccessful');
                }
              },*/
              child: Container(
                  // color: Color(0xffFFFFFF),
                  color: gold,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Image.asset(Images.logout, height: 19, width: 19, color: Colors.white,),
                            ),

                       SizedBox(width: 8),
                        Text("LOG OUT",  style: poppins.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          // color: gold,
                          color: Colors.white,
                        ),),

                      ],
                    ),
                  )
              ),
            ),
            appBar: AppBar(
              title: Text("Personal information", style: railway.copyWith(fontSize: 18, color: Colors.black),),
              iconTheme: IconThemeData(color: Color(0xff000000)),
              titleSpacing: 0,
              backgroundColor: Color(0xffFFFFFF),
              centerTitle: true,
              elevation: 0,
              leadingWidth: Get.width / 3.5,
              // toolbarHeight: 62,
              /*   title: Container(
            // color: Colors.red,
              height: 35, width: 100,
              child: Image.asset(Images.logo, height: 35, width: 100)),*/
            ),
            // backgroundColor: Color(0xffEBEFF3),
            backgroundColor: Color(0xffFFFFFF),
            body: Column(
              children: [

                SizedBox(height: 0),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 8),
                  child:
                  controller.userProfileResponse!= null?
                  InkWell(
                    onTap : () {
                      Get.to(UserProfileDtails());
                    },
                    child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 1,
                        color: Colors.white,
                        child: Container(
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right:0,top: 2, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Image.asset(Images.profile, height: 100, width: 100),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: CustomImageCached(
                                    placeholder: Images.profile,
                                    image: '${AppConstants.BASE_URL}${controller.userProfileResponse!.data!.photo??""}',
                                    height: 75,
                                    width: 75,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, ),
                                  child: Column(
                                    children: [
                                      Text('${controller.userProfileResponse?.data?.firstName??""}',
                                        maxLines: 2,overflow: TextOverflow.ellipsis,
                                        style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.w600),),

                                      SizedBox(height: 02),
                                      Text('${controller.userProfileResponse?.data?.email??""}',
                                        maxLines: 2,overflow: TextOverflow.ellipsis,
                                        style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.w500,),),
                                      SizedBox(height: 4),
                                      InkWell(
                                        onTap: () {
                                          Get.to(UserProfileEdit());
                                        },
                                        child: Text('Edit'.toUpperCase(),
                                          maxLines: 2,overflow: TextOverflow.ellipsis,
                                          style: railwaybold.copyWith(fontSize: 14, decoration: TextDecoration.underline, color: gold),),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  )
                  : SizedBox(),
                ),
                SizedBox(height: Get.height/70),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    // color: Color(0xffFFFFFF),
                    height: 35,
                    child: Container(
                      // color: tabColor,
                      // color: Color(0xffFFFFFF),
                      child: TabBar(
                          indicatorPadding: EdgeInsets.symmetric(horizontal: 120),
                          /*   onTap: (index) {
                          setState(() {
                            if (index == 0) {
                              tabColor = Color(0xff0b1d6f);
                            }
                            if (index == 1) {
                              tabColor = Color(0xff410f57);
                            }
                          });
                          print(index);
                        },*/
                          indicatorColor: tabColor,
                          indicatorWeight: 2.5,
                          tabs: [
                            Tab(
                                child:
                               controller.userAddressBookResponse!=null? controller.userAddressBookResponse!.data!.length>0?
                                Text(
                                  'My Address (${controller.userAddressBookResponse?.data?.length??0})',
                                  style: poppins.copyWith(
                                      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                                ) : Text("( 0 )") : Text("( 0 )")
                            ),
                 /*           Tab(
                                child: Text(
                                  'My Wallet (0)',
                                  style: railway.copyWith(
                                      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                                )),*/
                    /*        Tab(
                                child: Text(
                                  'Store Credit (0)',
                                  style: railway.copyWith(
                                      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                                )),*/
                          ]),
                    ),
                  ),
                ),

                Expanded(
                  child: TabBarView(children: [
                    /// 1st TAB
                    RefreshIndicator(
                        onRefresh: () async {
                          // showCustomSnackBar("2");
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(
                                height: 10,
                                thickness: 10,
                                color: Color(0xffF2F6F9),
                                // color: Colors.pink,
                              ),
                              Column(
                                children: [
                                  controller.userAddressBookResponse!=null?
                                  controller.userAddressBookResponse!.data!.length>0?
                                  ListView.builder(
                                     itemCount: controller.userAddressBookResponse!.data!.length??0,
                                      shrinkWrap: true,
                                      reverse: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                       return  Padding(
                                         padding: const EdgeInsets.only(left: 12, top: 5, right: 12,bottom: 5),
                                         child: Container(
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(5),
                                             border: Border.all(
                                               color: gold,
                                               width: 0.5,
                                               // style: BorderStyle.solid,
                                             ),
                                           ),
                                           child: Padding(
                                             padding: const EdgeInsets.only(left: 12, top: 0, right: 6,bottom: 8),
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 SizedBox(height: 8),
                                                 Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children: [
                                                     Text("Address Type: ${controller.userAddressBookResponse?.data?[index]?.addressType??""}", style: railwaybold.copyWith(fontSize: 14)),
                                                     Row(
                                                       children: [
                                                         InkWell(
                                                           onTap: () {
                                                             Get.to(EditAddressBook(id: controller.userAddressBookResponse!.data![index]!.id!,));
                                                           },
                                                           child: Text("Edit",
                                                               style: railwaybold.copyWith(fontSize: 12,
                                                                   color: gold,
                                                                   decoration: TextDecoration.underline
                                                               )),
                                                         ),
                                                         SizedBox(width: 8),
                                                         InkWell(
                                                             onTap: (){
                                                               Get.dialog( CustomAlerDialogForPermission(
                                                                 iconString: Images.delete,
                                                                 title: 'Remove Item',
                                                                 description: 'Do you really want to remove from address Book?',
                                                                 yesBtntap: () {
                                                                   Get.back();
                                                                 },
                                                                 noBtntap: (){
                                                                   Get.back();
                                                                   controller.deleteAddressBook(controller.userAddressBookResponse?.data?[index]?.id?.toString()??"");
                                                                 },
                                                                 noBtnText: "YES",
                                                                 yesBtnText: "NO",
                                                               ));
                                                               // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());
                                                           },
                                                           child: Text("Delete",
                                                               style: railwaybold.copyWith(fontSize: 12,
                                                                   color: gold,
                                                                   decoration: TextDecoration.underline
                                                               )),
                                                         ),
                                                       ],
                                                     ),
                                                   ],
                                                 ),
                                                 SizedBox(height: 6),
                                                 Row(
                                                   children: [
                                                     Text("Name: ", style: railwaybold.copyWith(fontSize: 11)),
                                                     Text("${controller.userAddressBookResponse!.data![index]!.firstName??""} ${controller.userAddressBookResponse!.data![index]!.lastName??""}", style: railway.copyWith(fontSize: 11)),
                                                   ],
                                                 ),
                                                 SizedBox(height: 4),
                                                 Row(
                                                   children: [
                                                     Text("Phone Number: ", style: railwaybold.copyWith(fontSize: 11)),
                                                     Text("${controller.userAddressBookResponse!.data![index]!.phone??""}", style: railway.copyWith(fontSize: 11)),
                                                   ],
                                                 ),
                                                 SizedBox(height: 4),
                                                 Row(
                                                   children: [
                                                     Text("Address: ", style: railwaybold.copyWith(fontSize: 11)),
                                                     Text("${controller.userAddressBookResponse!.data![index]!.address??""}", style: railway.copyWith(fontSize: 11)),
                                                   ],
                                                 ),
                                                 SizedBox(height: 4),
                                               ],
                                             ),
                                           ),
                                         ),
                                       );
                                      }
                                  )
                                  :   Container(
                            height: 120,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("There are no saved Address",
                                    textAlign: TextAlign.center,
                                    style: railway.copyWith(fontSize: 15, color: Colors.black),),
                                ),
                              ],
                            ))
                                  : SizedBox(),
                                ],
                              ),
                              SizedBox(height: 5),
                       /*       Divider(
                                height: 2,
                                thickness: 2,
                                color: Color(0xffF2F6F9),
                                // color: Colors.pink,
                              ),*/
                              Padding(
                                padding: const EdgeInsets.only(left: 12, right: 12),
                                child: InkWell(
                                  onTap: () {
                                      Get.to(ManualForm(isFromProfile: false ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffF2F6F9),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                      // color: Color(0xffFFFFFF),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            /*    Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Image.asset(Images.addnew, height: 22, width: 22, color: Colors.black54,),
                                                    )
                                                ),*/
                                            Text("Add new Address",  style: railway.copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),),
                                            Icon(Icons.add, size: 22,  color: Colors.black,)
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                    /*          Divider(
                                thickness: 15,
                                height: 15,
                                color: Color(0xffF2F6F9),
                              ),*/
                            ],
                          ),
                        )),

                    /// 2nd TAB
                 /*   RefreshIndicator(
                        onRefresh: () async {
                          // showCustomSnackBar("2");
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(
                                height: 5,
                                thickness: 5,
                                color: Color(0xffF2F6F9),
                                // color: Colors.pink,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("Payment Method", style: railwaybold.copyWith(fontSize: 14)),
                                  ),
                                  // SizedBox(height: 12),

                                  // controller.userAddressBookResponse!=null?
                                  ListView.builder(
                                      itemCount: 1,
                                      // itemCount: controller.userAddressBookResponse!.data!.length??0,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return  Padding(
                                          padding: const EdgeInsets.only(left: 12, top: 15, right: 12,bottom: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                color: gold,
                                                width: 0.5,
                                                // style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 12, top: 0, right: 6,bottom: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 15, left: 30),
                                                    child: Image.asset(Images.bkash, height: 50, width: 50),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(height: 15),

                                                      Text("017xxxxxxxx", style: railwaybold.copyWith(fontSize: 14)),
                                                      SizedBox(height: 8),
                                                      Text("Saved by Bkash", style: railwaybold.copyWith(fontSize: 14)),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                  )
                                      // :   Container(
                                      // height: 120,
                                      //
                                      // child: Row(
                                      //   children: [
                                      //     Padding(
                                      //       padding: const EdgeInsets.only(left: 15),
                                      //       child: Text("There are no saved Address",
                                      //         textAlign: TextAlign.center,
                                      //         style: railway.copyWith(fontSize: 15, color: Colors.black),),
                                      //     ),
                                      //   ],
                                      // )),
                                ],
                              ),
                              Divider(
                                height: 2,
                                thickness: 2,
                                color: Color(0xffF2F6F9),
                                // color: Colors.pink,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.to(WardrobName());
                                },
                                child: Container(
                                    color: Color(0xffFFFFFF),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          *//*    Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 0),
                                                    child: Image.asset(Images.addnew, height: 22, width: 22, color: Colors.black54,),
                                                  )
                                              ),*//*
                                          Text("Add new wallet",  style: railway.copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),),

                                          Icon(Icons.add, size: 22,  color: Colors.black54,)
                                        ],
                                      ),
                                    )
                                ),
                              ),
                              Divider(
                                thickness: 15,
                                height: 15,
                                color: Color(0xffF2F6F9),
                              ),

                            ],
                          ),
                        )),*/

                    /// 3 rd TAB
                /*    RefreshIndicator(
                        onRefresh: () async {
                          // showCustomSnackBar("2");
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(
                                height: 5,
                                thickness: 5,
                                color: Color(0xffF2F6F9),
                                // color: Colors.pink,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Available Balance", style: railwaybold.copyWith(fontSize: 14)),
                                        Text("1000 BDT", style: poppins.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: gold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                    child: Text("TRANSACTIONS".toUpperCase(), style: railway.copyWith(fontSize: 15)),
                                  ),
                                  // SizedBox(height: 20),
                                  // controller.userAddressBookResponse!=null?
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                                    child: Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: Colors.white,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Container(
                                          width: Get.width,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Divider(
                                                height: 1,
                                                thickness: 1,
                                                color: gold,
                                              ),
                                              ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:  NeverScrollableScrollPhysics(),
                                                  // scrollDirection: Axis.vertical,
                                                  itemCount: 1,
                                                  // itemCount: controller.jobCardResponse!.cardDetails!.length,
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                      ),

                                                      child: Padding(
                                                        padding: EdgeInsets.only(top: 0, bottom: 0),
                                                        child: Row(
                                                          // mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              height: 40,
                                                              width: 1,
                                                              color: gold,
                                                              child: Text(""),
                                                            ),
                                                            Expanded(
                                                                flex: 2,
                                                                child: Center(
                                                                  child: Text(
                                                                    'Date',
                                                                    style: railwaybold.copyWith(
                                                                        color: Colors.black,
                                                                        fontSize: 11),
                                                                  ),
                                                                )),
                                                            Container(
                                                              height: 40,
                                                              width: 1,
                                                              color: gold,
                                                              child: Text(""),
                                                            ),
                                                            Expanded(
                                                                flex: 2,
                                                                child: Center(
                                                                  child: Text(
                                                                    'Order ID /\nInvoice ID	',
                                                                   style: railwaybold.copyWith(
                                                                        fontSize: 11),
                                                                  ),
                                                                )),
                                                            Container(
                                                              height: 40,
                                                              width: 1,
                                                              color: gold,
                                                              child: Text(""),
                                                            ),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Center(
                                                                  child: Text(
                                                                    'Credit (Total amount\nof this specific order)',
                                                                    // textAlign: TextAlign.left,
                                                                    style: railwaybold.copyWith(
                                                                      // color: Colors.yellow,
                                                                        fontSize: 11
                                                                    ),
                                                                  ),
                                                                )),
                                                            Container(
                                                              height: 40,
                                                              width: 1,
                                                              color: gold,
                                                              child: Text(""),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                              Divider(
                                                height: 1,
                                                thickness: 1,
                                                color: gold,
                                              ),
                                              SizedBox(height: 4),

                                              // controller.recentOrdersReturnsListResponse!.data!.length>0?
                                              ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics:  NeverScrollableScrollPhysics(),
                                                  scrollDirection: Axis.vertical,
                                                  itemCount: 2,
                                                  // itemCount: controller.recentOrdersReturnsListResponse!.data!.length??0,
                                                  itemBuilder: (context, index) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(0xffF2F0EB),
                                                        // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                      ),

                                                      child: Padding(
                                                        padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child: Text(
                                                                  // '${DateConverter.stringToLocalDateOnly(controller.recentOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                  '8 May 2023',
                                                                  style: poppins.copyWith(
                                                                      color: Colors.black,
                                                                      // color: textPurpale,
                                                                      fontSize: 10),
                                                                )),

                                                            Expanded(
                                                                flex: 2,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Raspberry Plum",
                                                                 // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                    style: poppins.copyWith(
                                                                        fontSize: 10
                                                                    ),
                                                                  ),
                                                                )),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Center(
                                                                  child: Text(
                                                                  "2000 BDT",
                                                                    textAlign: TextAlign.left,
                                                                    style: poppins.copyWith(
                                                                      // color: Colors.yellow,
                                                                        fontSize: 10
                                                                    ),
                                                                  ),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  })
                                             *//*     : SizedBox(),
                                              SizedBox(height: 20,),*//*
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  // :   Container(
                                  // height: 120,
                                  //
                                  // child: Row(
                                  //   children: [
                                  //     Padding(
                                  //       padding: const EdgeInsets.only(left: 15),
                                  //       child: Text("There are no saved Address",
                                  //         textAlign: TextAlign.center,
                                  //         style: railway.copyWith(fontSize: 15, color: Colors.black),),
                                  //     ),
                                  //   ],
                                  // )),
                                ],
                              ),
                              SizedBox(height: 20),
                              Divider(
                                height: 2,
                                thickness: 2,
                                color: Color(0xffF2F6F9),
                                // color: Colors.pink,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.to(WardrobName());
                                },
                                child: Container(
                                    color: Color(0xffFFFFFF),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          *//*    Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 0),
                                                    child: Image.asset(Images.addnew, height: 22, width: 22, color: Colors.black54,),
                                                  )
                                              ),*//*
                                          Text("Add new Credit",  style: railway.copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),),

                                          Icon(Icons.add, size: 22,  color: Colors.black54,)
                                        ],
                                      ),
                                    )
                                ),
                              ),
                              Divider(
                                thickness: 15,
                                height: 15,
                                color: Color(0xffF2F6F9),
                              ),

                            ],
                          ),
                        )),*/
                    
                  ]),
                ),
              ],
            ),
          ),
        );
      }
    );
  }



}
