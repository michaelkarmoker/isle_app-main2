
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';

class RegistrationSuccessScreen extends StatefulWidget {

  const RegistrationSuccessScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessScreen> createState() => _RegistrationSuccessScreenState();
}

class _RegistrationSuccessScreenState extends State<RegistrationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container(child: Center(child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icon/regisucc.png",height: 150,),
          Text("Registration Successful!",style: railway.copyWith(fontSize: 28,color: Theme.of(context).primaryColor),),
          SizedBox(height: 20,),
          Text("A verification link send to your mail..!",style: railway.copyWith(fontSize: Dimensions.fontSizeLarge),),
          Text("Please verify then login",style: railway.copyWith(fontSize: Dimensions.fontSizeLarge),),
          SizedBox(height: 20,),
          CustomButton(onPressed: (){
            Get.back();
          }, buttonText: "Continue")
        ],
      ),
    )),)));
  }
}

