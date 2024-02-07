import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';

class CustomLogo extends StatefulWidget {
  final Function()? onPressed;
  const CustomLogo({Key? key,  this.onPressed}) : super(key: key);

  @override
  State<CustomLogo> createState() => _CustomLogoState();
}

class _CustomLogoState extends State<CustomLogo> {

  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<MainPageController>().getGeneralSettingData();
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return
          controller.generalSettingResponse!= null? controller.generalSettingResponse?.data?.logo!=null?
          InkWell(
            onTap: () {
              Get.offAll(Dashboard(pageIndex: 0));
            },
            child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.zero,
            width: 80,
            // color: Color(0xff800080),
            child: Column(
              children: [
                SizedBox(height: 8),
                CustomImageCached(image: '${AppConstants.BASE_URL}${controller.generalSettingResponse?.data?.logo?? ""}',
                  // fit: BoxFit.fitHeight,
                  isRound: false,
                  height: 50, width: 75, fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Container(
                      width: 80,
                      // color: Colors.white,
                      child: Center(child: Text("${controller.generalSettingResponse?.data?.tagLine??""}", style: railway.copyWith(fontSize: 9,  color: Color(0xff000000)),))),
                )
              ],
            ),
        ),
          )
        : SizedBox() : SizedBox();
      }
    );
  }
}
