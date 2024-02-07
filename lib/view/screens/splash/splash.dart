import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:isletestapp/controller/splash_controller.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:package_info/package_info.dart';

class SplashScreen extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}
class _splashState extends State<SplashScreen> {

  // GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  // late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  @override
  void initState() {
    super.initState();
    // bool _firstTime = true;
    // _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if(!_firstTime) {
    //     bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
    //     isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: isNotConnected ? Colors.red : Colors.green,
    //       duration: Duration(seconds: isNotConnected ? 6000 : 3),
    //       content: Text(
    //         isNotConnected ? 'no_connection'.tr : 'connected'.tr,
    //         textAlign: TextAlign.center,
    //       ),
    //     ));
    //     if(!isNotConnected) {
    //       _route();
    //     }
    //   }
    //   _firstTime = false;
    // });

       Get.find<SplashController>().initSharedData();
    _route();
  }
  @override
  Widget build(BuildContext context) {
    // _controller!.forward();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        child: FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot)  {
              if(snapshot.hasData)
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Version: "+snapshot.data!.version, style: robotoMedium,)),
                );
              return Container();
            },
      ),
        ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Container(
              // height: Get.height/3.5,
              child: FadeIn(
                child: Image.asset(Images.splash),
                // Optional paramaters
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              ),
            )
        ),

      ],
    ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _controller!.dispose();
    super.dispose();
  }
  void _route() {
    Timer(Duration(seconds: 3), () async {



      /// Main code
    /*  if (Get.find<AuthController>().isLoggedIn()) {
        Get.offAll(Home());
      } else {
        // if (!Get.find<SplashController>().showIntro()!) {
        if (Get.find<SplashController>().showIntro()!) {
          Get.offAll(OnBoardingScreen());
        } else {
          Get.offAll(Home());
        }
      }*/


    });
  }
}


