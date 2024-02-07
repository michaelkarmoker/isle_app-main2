import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';

class WishButtonWidget extends StatefulWidget {
  final double? textsize;
  final double? radius;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final Function()? onPressed;
  const WishButtonWidget({Key? key,  this.onPressed, this.radius, this.top, this.left, this.right, this.bottom, this.textsize}) : super(key: key);

  @override
  State<WishButtonWidget> createState() => _CustomLogoState();
}

class _CustomLogoState extends State<WishButtonWidget> {
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<MainPageController>().getWishlistData();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return controller.getWishlistResponse.value != null
            ? InkWell(
          onTap: () {
            Get.to(WishListPage());
          },
          child: Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Images.wish,
                    height: 22,
                    width: 22,
                    color: Color(0xff000000),
                  ),
                ),
                Positioned(
                  top: widget.top != null ? widget.top : 4,
                  right: widget.right != null ? widget.right : 3,
                  child: CircleAvatar(
                    radius: widget.radius != null ? widget.radius : 8,
                    backgroundColor: gold,
                    child: Center(
                      child: Obx(
                            () => Text(
                          "${controller.wishlistCount.value??0}",
                          style: railwaybold.copyWith(
                            fontSize: widget.textsize != null
                                ? widget.textsize : 9,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
            : SizedBox();
      },
    );
  }
}
