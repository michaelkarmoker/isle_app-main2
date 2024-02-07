
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/forgot_password_controller/forgot_password_controller.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/my_text_field.dart';

class CustomDialog extends StatelessWidget {
 /* final Subjects subjects;
  final int selectedLanguage;*/
  const CustomDialog({super.key,
  /*  required this.subjects,
    required this.selectedLanguage*/
  });


  @override
  Widget build(BuildContext context) {
    TextEditingController subscribeCtr = TextEditingController();
    FocusNode subscribeFcs = FocusNode();
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
          insetPadding: EdgeInsets.all(15),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10,top: 10),
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(Images.error,height: 20,width: 20,)),
                ) ,
                // SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Reset Your Password',style: robotoBlack.copyWith(fontSize: 20)),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text("To retrieve your password, please enter your Email / mobile number below and click 'Send Reset Link'.", style: robotoMedium.copyWith(color: Colors.grey, fontSize: 11),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text('A password reset link will then be sent to you by email / Phone.',
                      style: robotoMedium.copyWith(color: Colors.grey, fontSize: 11)),
                ),
                SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyTextField(
              height: 45,
              titlesize: 11,
              controller: subscribeCtr,
              focusNode: subscribeFcs,
              hintText: "Enter Your Phone / Email",
              title: "Enter Your Gmail / Phone Number",
              // titlesize: ,
              hintStyle: robotoRegular.copyWith(fontSize: 11),
            ),
          ),


                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomButton(
                      height: 45,
                      fontSize: 13,
                      buttontextcolor: Colors.white,
                      radius: 0,
                      onPressed: (){
                /*        controller.getOTPRequest(
                            phone: phone,
                            email: email
                        );*/
                      },
                      buttonText: "Set Resent Link".toUpperCase()
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        );
      }
    );
  }
}
