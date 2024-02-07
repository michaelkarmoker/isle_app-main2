import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/data/model/body/login_body.dart';
import 'package:isletestapp/helper/route_helper.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/custom_popup_design.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/checkout/checkout_page.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';



class LoginRegisterPage extends StatefulWidget {
  final bool isFromCart;
  final bool? isbottomSheet;
  final bool isBack;
  const LoginRegisterPage({Key? key, required this.isFromCart, this.isBack = true,  this.isbottomSheet}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  /// for login
  bool isSearchClick=false;
  FocusNode emailFcs = new FocusNode();
  FocusNode passFcs = new FocusNode();

  /// for register
  TextEditingController phoneCtr2 = new TextEditingController();
  FocusNode phoneFcs2 = new FocusNode();
  TextEditingController emailCtr2 = new TextEditingController();
  FocusNode emailFcs2 = new FocusNode();
  TextEditingController passCtr2 = new TextEditingController();
  FocusNode passFcs2 = new FocusNode();
  TextEditingController conpassCtr2 = new TextEditingController();
  FocusNode conpassFcs2 = new FocusNode();
  TextEditingController firstnameCtr2 = new TextEditingController();
  FocusNode firstnameFcs2 = new FocusNode();
  TextEditingController lastnameCtr2 = new TextEditingController();
  FocusNode lastnameFcs2 = new FocusNode();
  TextEditingController cityCtr2 = new TextEditingController();
  FocusNode cityFcs2 = new FocusNode();
  TextEditingController stateCtr2 = new TextEditingController();
  FocusNode stateFcs2 = new FocusNode();
  TextEditingController zipCtr2 = new TextEditingController();
  FocusNode zipFcs2 = new FocusNode();
  TextEditingController countryCtr2 = new TextEditingController();
  FocusNode countryFcs2 = new FocusNode();
  TextEditingController addressCtr2 = new TextEditingController();
  FocusNode addressFcs2 = new FocusNode();

  XFile? result_profile_pic=null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {

          // Get.find<ProductDetailsController>().getBagPageCartData(widget.corelationId);
              Get.find<MainPageController>().memberShipInfo();
              Get.find<MainPageController>().memberShipBenifitInfo();
              Get.find<AuthController>().setuserName();
              Get.find<AuthController>().getUserName().isNotEmpty?
              Get.find<AuthController>().isActiveRememberMe=true:Get.find<AuthController>().isActiveRememberMe=false;
              Get.find<AuthController>().update();
        }
    );

  }



  // Color tabColor= Colors.redAccent;
  // Color tabColor= Color(0xff0b1d6f);
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Scaffold(
              bottomNavigationBar: widget.isbottomSheet== true ? UniversalBottomNav() : SizedBox.shrink(),
              appBar: AppBar(
                /// back logic
/*                leading: InkWell(
                    onTap: () {
                      if(widget.isBack == false){
                        Get.offAll(()=> Dashboard(pageIndex: 0));
                      } else{
                        Get.back();
                      }

                    },
                    child: Icon(Icons.arrow_back)),*/
                elevation: 0,
                iconTheme: IconThemeData(color: Color(0xff000000)),
                backgroundColor: Color(0xffFFFFFF),
              ),
              // backgroundColor: Color(0xffEBEFF3),
              backgroundColor: Color(0xffFFFFFF),
              body:  Column(
                children: [
                  /// Tab Bar Part
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      // color: Colors.green,
                      height: 35,
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
                       /*     onTap: (index) {
                              setState(() {
                                if(index==0) {tabColor = Color(0xff25d55f);}
                                if(index==1) {tabColor = Colors.redAccent;}
                              });
                              print(index);
                            },*/
                            // indicator: BoxDecoration(color: tabColor,borderRadius: BorderRadius.circular(8)),
                            // dividerColor: Colors.black,

                            /* indicator: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft:
                                Radius.circular(10),topRight: Radius.circular(10)),
                                color: tabColor
                            ),*/
                            indicatorColor: Color(0xffb89600),
                            indicatorWeight: 2.5,
                            tabs: [
                              Tab(
                                  child: Text(
                                    'Login'.toUpperCase(),
                                    style: robotoBlack.copyWith(
                                        color: Colors.black54, fontSize: 13),
                                  )),
                              Tab(
                                  child: Text(
                                    'Register'.toUpperCase(),
                                    style: robotoBlack.copyWith(
                                        color: Colors.black54, fontSize: 13),
                                  )),
                            ]),
                      ),
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                        children: [
                          /// 1 st TAB
                          RefreshIndicator(
                              onRefresh: () async{
                                // showCustomSnackBar("1");
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [

                                    SizedBox(height: 20),
                                    Text("Welcome".toUpperCase(), style: robotoBold.copyWith(fontSize: 25),),
                                    SizedBox(height: 1),
                                    Text("Login your Account", style: robotoRegular.copyWith(fontSize: 15),),
                                    SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(
                                        isPadding: true,
                                        hintText: 'Enter your number or email',
                                        controller: controller.emailCtr,
                                        nextFocus: passFcs,
                                        onSubmit: () {},
                                        focusNode: emailFcs,
                                        height: 45,
                                        // color: Colors.grey,
                                        title: " Number or E-mail",
                                        isRequired: true,
                                        hintStyle: railway.copyWith(fontSize: 12),

                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(

                                        hintText: 'Enter your password',
                                        controller: controller.passCtr,
                                        nextFocus: null,
                                        inputAction: TextInputAction.done,
                                        onSubmit: () {},
                                        focusNode: passFcs,
                                        height: 45,
                                        title: "Password",
                                        isRequired: true,
                                        isPassword: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          /*Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: authController.isActiveRememberMe,
                                            onChanged: (bool? isChecked) => authController.isActiveRememberMe=isChecked!,
                                          ),
                                          Text('Remember me',style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: textPurpale),),
                                        ],
                                      ),*/
                                          Transform.scale(
                                            scale: 0.8,
                                            child: CupertinoSwitch(
                                              activeColor: gold,
                                              value: controller.isActiveRememberMe,
                                              thumbColor: Theme.of(context).primaryColor,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  controller.isActiveRememberMe = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Save Me',
                                            style: robotoRegular.copyWith(color: Colors.black),
                                          ),
                                          /*Spacer(),
                                      Text('Forgot password?',style: robotoRegular.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,color: textPurpale),),*/
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 30),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: InkWell(
                                        onTap: () {
                                          controller.loginVerification();
                                          // loginVerification(controller, widget.isFromCart);
                                        },
                                        child: controller.isLoading?
                                        Center(child: CircularProgressIndicator(color: gold,))
                                            :
                                        CustomButton(
                                          height: Dimensions.BUTTON_HEIGHT,
                                          width: Get.width,
                                          buttonText: 'LOG IN',
                                          myfontweight: FontWeight.bold,
                                          buttontextcolor: Colors.white,
                                          buttoncolor: Colors.black,
                                          fontSize: 14,
                                          radius: 0,
                                          onPressed: () {
                                            controller.loginVerification();
                                          },
                                        ),
                                      ),
                                    ),

                                /*    SizedBox(height: 40),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: CustomButton(
                                        height: 45,
                                        fontSize: 14,
                                        radius: 0,
                                          buttontextcolor: Colors.white,
                                          onPressed: (){
                                            loginVerification(controller, widget.isFromCart);
                                          },
                                          buttonText: "Log In".toUpperCase()
                                      ),
                                    ),*/

                                    SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Get.dialog(CustomDialog());
                                                // Get.toNamed(RouteHelper.getForgotPassRoute());
                                              },
                                              child: Text(
                                                'Forgot Password'.tr,
                                                style: robotoRegular.copyWith(
                                                    color: gold),
                                              )),
                                        ],
                                      ),
                                    ),
                             /// guest
                                    Get.find<AuthController>().isLoggedInGuest()? SizedBox() :
                                    SizedBox(height: 15),
                                    widget.isFromCart?
                                    Get.find<AuthController>().isLoggedInGuest()? SizedBox() :
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: CustomButton(
                                        height: Dimensions.BUTTON_HEIGHT,
                                        width: Get.width,
                                        buttonText: 'GUEST LOGIN',
                                        myfontweight: FontWeight.bold,
                                        buttontextcolor: Colors.white,
                                        buttoncolor: Colors.black,
                                        fontSize: 14,
                                        radius: 0,
                                        onPressed: () {
                                          controller.guestLogin();
                                          Get.back();
                                      /*    Get.to(()=>CheckOutPage(
                                            orderPlaceRequest:controller.orderPlaceRequest,
                                            isleCoupon: controller.islecouponCtr.text, brandCoupon: controller.brandcouponCtr.text,));*/
                                          // controller.loginVerification();
                                        },
                                      ),
                                    )
                                    : SizedBox(),
                                    SizedBox(height: 30),
                                    Get.find<MainPageController>().membershipInfoResponse!= null ?
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
                                                      image: '${AppConstants.BASE_URL}${Get.find<MainPageController>().membershipInfoResponse?.data?.banner ?? ""}',
                                                      // fit: BoxFit.fitHeight,
                                                      // height: 70, width: 110,
                                                      fit: BoxFit.fill,
                                                      // height: Get.height/5.5,
                                                    ),
                                                  ),
                                                  SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 4, right: 8, top: 8),
                                                          child: Text("${Get.find<MainPageController>().membershipInfoResponse?.data?.rawTitle??""}",
                                                              // textAlign: TextAlign.center,
                                                              style: railwaybold.copyWith(fontSize: 15)),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 4, right: 8, top: 0),
                                                          child: Text("${Get.find<MainPageController>().membershipInfoResponse?.data?.subRawTitle??""}",
                                                              // textAlign: TextAlign.center,
                                                              style: railway.copyWith(fontSize: 12)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Get.find<MainPageController>().membershipBenifitInfoResponse!= null?
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Membership Benefits", style: railwaybold.copyWith(fontSize: 16),),
                                                  SizedBox(height: 15),
                                                  ListView.builder(
                                                      itemCount: Get.find<MainPageController>().membershipBenifitInfoResponse!.data!.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return Padding(
                                                          padding: const EdgeInsets.only(top : 4, bottom: 4),
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              CustomImageCached(
                                                                image: "${AppConstants.BASE_URL}${Get.find<MainPageController>().membershipBenifitInfoResponse!.data![index]!.img??""}",
                                                                height: 22,
                                                                width: 22,
                                                              ),
                                                              SizedBox(width: 12),
                                                              Expanded(child: Text("${Get.find<MainPageController>().membershipBenifitInfoResponse?.data?[index]?.title??""}",
                                                                style: railway.copyWith(fontSize: 12),))
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                  )
                                                ],
                                              )
                                                  : SizedBox()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ) : SizedBox(),


                                    SizedBox(height: 50)

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
                                    SizedBox(height: 30),
                                    Text("Hello".toUpperCase(), style: robotoBold.copyWith(fontSize: 25),),
                                    SizedBox(height: 1),
                                    Text("Register an account.", style: robotoRegular.copyWith(fontSize: 15),),
                                 /*   SizedBox(height: 12),

                                    Stack(
                                      children: [
                                        Container(
                                          height: 110,
                                          width: 110,
                                          decoration: BoxDecoration(
                                              // color: Colors.purpleAccent,
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(300)),
                                              border: Border.all(width: 1,color: gold)
                                          ),
                                          alignment: Alignment.center,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(300),
                                            child: result_profile_pic==null?Image.asset("assets/image/imagePlaceholder.png"):
                                            Image.file(File(result_profile_pic!.path),fit: BoxFit.fill,),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 4,
                                            right: 6,
                                            child: InkWell(
                                              onTap: () async {
                                                try {
                                                  result_profile_pic = await ImagePicker().pickImage(
                                                      maxHeight: 1000,
                                                      maxWidth: 1000,
                                                      source: ImageSource.gallery
                                                  ).whenComplete(() {
                                                    controller.update();
                                                  });
                                                  //print(result!.path);
                                                }catch(e){
                                                  print(e.toString());
                                                  showCustomSnackBar("som_error".tr);
                                                }
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[400],
                                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                                  ),
                                                  padding:EdgeInsets.all(8),child: Icon(Icons.camera_alt,color: Colors.black,size: 18,)),
                                            ))
                                      ],
                                    ),

                                    SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),

                                      child: MyTextField(
                                        height: 45,
                                        controller: firstnameCtr2,
                                        focusNode: firstnameFcs2,
                                        nextFocus: lastnameFcs2,
                                        title: "First Name",
                                        hintText: "First Name",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),

                                      child: MyTextField(
                                        height: 45,
                                        controller: lastnameCtr2,
                                        focusNode: lastnameFcs2,
                                        nextFocus: emailFcs2,
                                        title: "Last Name",
                                        hintText: "Last Name",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),
*/
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),

                                      child: MyTextField(
                                        height: 45,
                                        controller: emailCtr2,
                                        focusNode: emailFcs2,
                                        nextFocus: phoneFcs2,
                                        title: "Email",
                                        hintText: "Enter your email",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),

                                 /*   SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),

                                      child: MyTextField(
                                        height: 45,
                                        controller: phoneCtr2,
                                        focusNode: phoneFcs2,
                                        nextFocus: passFcs2,
                                        title: "Mobile Number",
                                        hintText: "Mobile Number",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),*/
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(
                                        height: 45,
                                        controller: passCtr2,
                                        focusNode: passFcs2,
                                        nextFocus: conpassFcs2,
                                        title: "Password",
                                        hintText: "Enter your password",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        isPassword: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),
                                  /*  SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(
                                        height: 45,
                                        controller: conpassCtr2,
                                        focusNode: conpassFcs2,
                                        title: "Confirm Password",
                                        hintText: "Enter your confirm password",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        isPassword: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),*/
                                    SizedBox(height: 40),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: InkWell(
                                        onTap: () {
                                          signupValidation(controller);

                                          // dataValidataion(controller);
                                        },
                                        child:  controller.isLoading?
                                        Center(child: CircularProgressIndicator())
                                            :
                                        CustomButton(
                                          height: Dimensions.BUTTON_HEIGHT,
                                          width: Get.width,
                                          buttonText: 'CREATE ACCOUNT',
                                          myfontweight: FontWeight.bold,
                                          buttontextcolor: Colors.white,
                                          buttoncolor: Colors.black,
                                          fontSize: 14,
                                          radius: 0,
                                          onPressed: () {
                                            signupValidation(controller);
                                          },
                                        ),
                                      ),
                                    ),



                                   /* Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: CustomButton(
                                          height: 45,
                                          fontSize: 14,
                                          radius: 0,
                                          buttontextcolor: Colors.white,
                                          onPressed: (){

                                          },
                                          buttonText: "Create Account".toUpperCase()
                                      ),
                                    ),*/

                                    SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [

                                        Container(
                                          height: 25,
                                          width: 25,
                                          child: Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: gold,
                                            // fillColor: MaterialStateProperty.resolveWith(getColor),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                     /*   Container(
                                          height: 20,
                                          width: 20,
                                          child: Checkbox(
                                            activeColor: Color(0xff082032),
                                            // value: controller.isActiveRememberMe,
                                            value: true,
                                            // onChanged: (bool? isChecked) => controller.isActiveRememberMe=isChecked!,
                                            onChanged: (bool? isChecked) => controller.isActiveRememberMe=isChecked!,
                                          ),
                                        ),*/
                                        SizedBox(width: 8),
                                        Flexible(child: Text('Receive announcements, recommendations, and updates about Isle'.tr,style: TextStyle(fontSize: Dimensions.fontSizeDefault),)),
                                      ],
                                    ),
                                  ),
                           /*       SizedBox(width: 5),
                                  InkWell(
                                      onTap: () {
                                        // Get.toNamed(RouteHelper.getForgotPassRoute());
                                      },
                                      child: Text(
                                        'forgot_password'.tr,
                                        style: robotoRegular.copyWith(
                                            color: Color(0xffF4BE32)),
                                      )),*/
                                ],
                              ),
                            ),
                                    SizedBox(height: 30),

                                    Get.find<MainPageController>().membershipInfoResponse!= null ?
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
                                                      image: '${AppConstants.BASE_URL}${Get.find<MainPageController>().membershipInfoResponse?.data?.banner ?? ""}',
                                                      // fit: BoxFit.fitHeight,
                                                      // height: 70, width: 110,
                                                      fit: BoxFit.fill,
                                                      // height: Get.height/5.5,
                                                    ),
                                                  ),
                                                  SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 4, right: 8, top: 8),
                                                          child: Text("${Get.find<MainPageController>().membershipInfoResponse?.data?.rawTitle??""}",
                                                              // textAlign: TextAlign.center,
                                                              style: railwaybold.copyWith(fontSize: 15)),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 4, right: 8, top: 0),
                                                          child: Text("${Get.find<MainPageController>().membershipInfoResponse?.data?.subRawTitle??""}",
                                                              // textAlign: TextAlign.center,
                                                              style: railway.copyWith(fontSize: 12)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Get.find<MainPageController>().membershipBenifitInfoResponse!= null?
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Membership Benefits", style: railwaybold.copyWith(fontSize: 16),),
                                                  SizedBox(height: 15),
                                                  ListView.builder(
                                                      itemCount: Get.find<MainPageController>().membershipBenifitInfoResponse!.data!.length,
                                                      shrinkWrap: true,
                                                      physics: NeverScrollableScrollPhysics(),
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return Padding(
                                                          padding: const EdgeInsets.only(top : 4, bottom: 4),
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              CustomImageCached(
                                                                image: "${AppConstants.BASE_URL}${Get.find<MainPageController>().membershipBenifitInfoResponse!.data![index]!.img??""}",
                                                                height: 22,
                                                                width: 22,
                                                              ),
                                                              SizedBox(width: 12),
                                                              Expanded(child: Text("${Get.find<MainPageController>().membershipBenifitInfoResponse?.data?[index]?.title??""}",
                                                                style: railway.copyWith(fontSize: 12),))
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                  )
                                                ],
                                              )
                                                  : SizedBox()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ) : SizedBox(),


                                    SizedBox(height: 50)
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
        );
      }
    );
  }

/*
  void loginVerification(AuthController controller,bool isFromCart) async {
    String _email = controller.emailCtr.text.trim();
    String _password = controller.passCtr.text.trim();

    if (_email.isEmpty) {
      showCustomSnackBar('Enter username');
    } else if (_password.isEmpty) {
      showCustomSnackBar('Enter password');
    } else if (_password.length < 5) {
      showCustomSnackBar('The Password must be at least 5 Characters');
    } else {
      controller.login(LoginBody(user_name: _email, password: _password),isFromCart);

    }

  }*/


  void signupValidation(AuthController controller) {
    if (emailCtr2.text.toString().isNotEmpty) {
      if (passCtr2.text.toString().isNotEmpty) {
        controller.signup(
          email: emailCtr2.text,
          password: passCtr2.text,
        );
      }
      else {
        showCustomSnackBar("Please Enter Password");
      }
    }
    else {
      showCustomSnackBar("Please Enter Email");
    }
  }



/*void dataValidataion(AuthController controller){
    // if(result_profile_pic!=null) {
    //   if (firstnameCtr2.text.toString().isNotEmpty) {
    //     if (lastnameCtr2.text.toString().isNotEmpty) {
          // if (phoneCtr2.text.toString().isNotEmpty) {
            if (emailCtr2.text.toString().isNotEmpty) {
              if (passCtr2.text.toString().isNotEmpty) {
                // if (conpassCtr2.text.toString().isNotEmpty) {
                //   if (passCtr2.text == conpassCtr2.text){
                    // if (cityCtr.text.toString().isNotEmpty) {
                    //   if (stateCtr.text.toString().isNotEmpty) {
                    //     if (zipCtr.text.isNotEmpty){
                    //       if (countryCtr.text.toString().isNotEmpty) {
                    //         if (addressCtr2.text.toString().isNotEmpty) {
                              controller.registration(
                                  firstName: firstnameCtr2.text,
                                  lastName: lastnameCtr2.text,
                                  phone: phoneCtr2.text,
                                  email: emailCtr2.text,
                                  password: passCtr2.text,
                                  confirmationPassword: conpassCtr2.text,
                                  // city: cityCtr.text,
                                  // zip: zipCtr.text,
                                  // state: stateCtr.text,
                                  // country: countryCtr.text,
                                  // address: addressCtr2.text,
                                  photo: result_profile_pic!
                              );
                            // } else {
                            //   showCustomSnackBar("Please enter your address");
                            // }
                          // } else {
                          //   showCustomSnackBar(
                          //       "Please enter your country name");
                          // }
                        // }else{
                        //   showCustomSnackBar("Please enter your Zip/Postal/Pin name");
                        // }
                      // } else {
                      //   showCustomSnackBar("Please enter your state name");
                      // }
                    // } else {
                    //   showCustomSnackBar("Please enter your city name");
                    // }
                  // }
                  // else {
                  //   showCustomSnackBar("Confirm password doesn't match");
                  // }
                // } else {
                //   showCustomSnackBar("Please enter your Confirm password");
                // }
              } else {
                showCustomSnackBar("Please enter your password");
              }
            } else {
              showCustomSnackBar("Please enter your email");
            }
          // } else {
          //   showCustomSnackBar("Please enter your phone");
          // }
        // } else {
        //   showCustomSnackBar("Please enter your last name");
        // }
      // }
      // else{
      //   showCustomSnackBar("Please choose your first name");
      // }
    // }
    // else{
    //   showCustomSnackBar("Please choose your profile image");
    // }
  }*/













}
