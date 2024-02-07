import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:isletestapp/controller/multi%20page%20controller/multi_page_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/coustom_searching.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_dropdown.dart';
import 'package:isletestapp/view/base/custom_dropdown_menu.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/checkout/thank_you_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/design%20backup/search_sunny.dart';
import 'package:isletestapp/view/screens/wardrob/wardrob_name.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _WardrobNameState();
}

class _WardrobNameState extends State<Contactus> {

  FocusNode emailFcs = FocusNode();
  FocusNode firstnameFcs = FocusNode();
  FocusNode lastnameFcs = FocusNode();
  FocusNode phoneFcs = FocusNode();
  FocusNode subjectFcs = FocusNode();
  FocusNode msgFcs = FocusNode();
  FocusNode orderidFcs = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<MultiPageController>().dataForEnquiry();

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<MultiPageController>().dataClearForEnquiry();
  }


  String? selectedEnquiry= "Select Inquiry";
  String? selectedEnquirys;
  int selectedEnquiryIndex=-1;



  @override
  Widget build(BuildContext context) {
    return GetBuilder<MultiPageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${controller.contactusResponse?.data?.title??""}", style: railwaybold.copyWith(fontSize: 18, color: Colors.black),),
            iconTheme: IconThemeData(color: Color(0xff000000)),
            titleSpacing: 0,
            backgroundColor: Color(0xffFFFFFF),
            centerTitle: true,
            elevation: 0,
            leadingWidth: Get.width / 3.5,
            /*   title: Container(
                // color: Colors.red,
                  height: 35, width: 100,
                  child: Image.asset(Images.logo, height: 35, width: 100)),*/
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Divider(
                  thickness: 15,
                  height: 15,
                  color: Color(0xffF2F6F9),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     SizedBox(height: 12),

                      InkWell(
                          onTap: () {
                            Get.dialog(
                              barrierDismissible: false,
                              CustomSearching(
                                title: 'Search Enquiry',
                                hint: 'Searching...',
                                datalist: controller.selectEnquiry!,
                                onSelect: (value) async {
                                  Get.back();
                                  selectedEnquiryIndex = value;
                                  selectedEnquiry = controller.selectEnquiry![value];
                                  controller.update();
                                },
                                onClose: () {
                                  Get.back();
                                  // Get.to(controller.coverageAreas);
                                },
                              ),
                            );
                          },
                          child: CustomDropDown(
                            isRequired: true,
                            text: selectedEnquiry!,
                            title: 'Type of inquiry',
                          )),
                      SizedBox(height: 12),
                      MyTextField(
                        controller: controller.emailCtr,
                        focusNode: emailFcs,
                        nextFocus: firstnameFcs,
                        title: "Email",
                        hintText: "example@gmail.com",
                        isRequired: true,
                        titlesize: 14,
                        // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                        myfontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 12),
                      MyTextField(
                        controller: controller.firstnameCtr,
                        focusNode: firstnameFcs,
                        nextFocus: lastnameFcs,
                        title: "First Name",
                        hintText: "",
                        isRequired: true,
                        titlesize: 14,
                        // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                        myfontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 12),
                      MyTextField(
                        controller: controller.lastnameCtr,
                        focusNode: lastnameFcs,
                        nextFocus: phoneFcs,
                        title: "Last Name",
                        isRequired: true,
                        titlesize: 14,
                        // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                        myfontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 12),

                      MyTextField(
                        controller: controller.phoneCtr,
                        focusNode: phoneFcs,
                        nextFocus: subjectFcs,
                        title: "Phone Number",
                        hintText: "+88017XXXXXXXX",
                        isRequired: true,
                        titlesize: 14,
                        // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                        myfontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 12),

                      // Text.rich(
                      //   TextSpan(
                      //     children: [
                      //       TextSpan(text: "Phone Number",style: railway.copyWith(fontSize: 14)),
                      //       TextSpan(
                      //         text: '*',
                      //         style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 5),
                      // Container(
                      //   height: 60,
                      //   child:  IntlPhoneField(
                      //     controller: controller.phoneCtr,
                      //     focusNode: phoneFcs,
                      //     decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.only(top:0, bottom:2,left: 0),
                      //       // labelText: 'Phone Number',
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide(),
                      //       ),
                      //     ),
                      //     initialCountryCode: 'BD',
                      //     onChanged: (phone) {
                      //       print(phone.completeNumber);
                      //     },
                      //   ),
                      // ),

                      // SizedBox(height: 12),
                      MyTextField(
                        controller: controller.subjectCtr,
                        focusNode: subjectFcs,
                        nextFocus: msgFcs,
                        title: "Your subject",
                        isRequired: true,
                        titlesize: 14,
                        // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                        myfontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 12),
                      MyTextField(
                        height: 80,
                        controller: controller.msgCtr,
                        focusNode: msgFcs,
                        title: "Your Message",
                        maxLines: 5,
                        minLines: 3,
                        // isRequired: true,
                        titlesize: 14,
                        // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                        myfontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 12),
                      MyTextField(
                        controller: controller.orderidCtr,
                        focusNode: orderidFcs,
                        title: "Order Id",
                        isRequired: true,
                        titlesize: 14,
                        // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                        myfontWeight: FontWeight.bold,
                      ),

                      SizedBox(height: 30),
                      CustomButton(
                          height: 45,
                          width: Get.width / 1,
                          buttoncolor: gold,
                          color: Colors.white,
                          buttontextcolor: Colors.white,
                          radius: 0,
                          fontSize: 15,
                          onPressed: () {
                            if (selectedEnquiry != null) {
                              if (controller.emailCtr.text.toString().isNotEmpty) {
                                if (controller.firstnameCtr.text.toString().isNotEmpty) {
                                  if (controller.lastnameCtr.text.toString().isNotEmpty) {
                                    if (controller.phoneCtr.text.toString().isNotEmpty) {
                                      if (controller.subjectCtr.text.toString().isNotEmpty) {
                                        if (controller.orderidCtr.text.toString().isNotEmpty) {
                                          controller.enquirySubmit(
                                            enquiry_type_id: controller.enquiryResponse!.data![selectedEnquiryIndex].id!.toString(),
                                            email: controller.emailCtr.text,
                                            first_name: controller.firstnameCtr.text,
                                            last_name: controller.lastnameCtr.text,
                                            phone: controller.phoneCtr.text,
                                            subject: controller.subjectCtr.text,
                                            message: controller.subjectCtr.text,
                                            order_no: controller.orderidCtr.text,
                                          );
                                        } else {
                                          showCustomSnackBar("Please Enter Order Id");
                                        }
                                      } else {
                                        showCustomSnackBar("Please Enter Subject");
                                      }
                                    } else {
                                      showCustomSnackBar("Please Enter Phone Number");
                                    }
                                  } else {
                                    showCustomSnackBar("Please Enter Last Name");
                                  }
                                } else {
                                  showCustomSnackBar("Please Enter First Name");
                                }
                              } else {
                                showCustomSnackBar("Please Enter Email");
                              }
                            } else {
                              showCustomSnackBar("Please select Enquiry");
                            }
                          },
                          buttonText: "Send".toUpperCase()),

                    ],
                  ),
                ),
                Divider(
                  thickness: 25,
                  height: 25,
                  color: Color(0xffF2F6F9),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 8),
                  child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      color: Colors.white,
                      child: Container(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right:0,top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${controller.contactusResponse?.data?.title??""}',
                                    style: railway.copyWith(fontSize: 25, fontWeight: FontWeight.w600),),

                                  SizedBox(height: 8),
                                  Text('${controller.contactusResponse?.data?.shortDescription??""}',
                                    maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: robotoMedium.copyWith(fontSize: 13),),
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  AppConstants.launchUrls(urls: "${controller.contactusResponse?.data?.mobileNumber??""}" );
                                  // AppConstants.launchUrls(urls: "https://web.whatsapp.com/"
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0,30,0,20),
                                  child: Column(
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Image.asset(Images.whatsapp, height: 30, width: 30, color: Colors.black,),
                                            SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("WhatsApp", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                                SizedBox(height: 8),
                                                Text("Chat with us and share media file by adding\n${controller.contactusResponse?.data?.mobileNumber??""}", style: poppins.copyWith(height: 1.5,fontWeight: FontWeight.w300,fontSize: 12,),),
                                              ],
                                            )
                                          ],),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                height: 2,
                                color: Color(0xffF2F6F9),
                              ),
                              InkWell(
                                onTap: (){
                                  launchUrl(Uri.parse("tel:${controller.contactusResponse?.data?.mobileNumber??""}"));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0,30,0,20),
                                  child: Column(
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            // Icon(Icons.edit, size: 25),
                                            Image.asset(Images.call, height: 30, width: 30, color: Colors.black,),
                                            SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Phone call", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                                SizedBox(height: 8),
                                                Text("BD toll-free phone number ${controller.contactusResponse?.data?.mobileNumber??""}", style: poppins.copyWith(height: 1.5,fontWeight: FontWeight.w300,fontSize: 12,),),
                                              ],
                                            )
                                          ],),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                height: 2,
                                color: Color(0xffF2F6F9),
                              ),
                              InkWell(
                                onTap: (){
                                  AppConstants.launchUrlsemail(urls: "${controller.contactusResponse?.data?.email?? ""}");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0,30,0,20),
                                  child: Column(
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            // Icon(Icons.edit, size: 25),
                                            Image.asset(Images.email, height: 30, width: 30, color: Colors.black,),
                                            SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("E-mail", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                                SizedBox(height: 8),
                                                Text("${controller.contactusResponse?.data?.email??""}\nWe will reply to you in 12 hours", style: poppins.copyWith(height: 1.5,fontWeight: FontWeight.w300,fontSize: 12,),),
                                              ],
                                            )
                                          ],),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                height: 2,
                                color: Color(0xffF2F6F9),
                              ),
                              SizedBox(height: 30)

                            ],
                          ),
                        ),
                      )),
                ),

              ],
            ),
          ),
        );
      }
    );
  }
}
