import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:isletestapp/view/screens/dashboard/widgets/bottom_nav_item.dart';
import 'package:isletestapp/view/screens/dashboard/widgets/bottom_nav_item_for_cart.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/bottom_nav_item_for_universal.dart';

import '../../../util/images.dart';
import '../dashboard/dashboard.dart';

class UniversalBottomNav extends StatelessWidget {
  const UniversalBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 5,
      notchMargin: 5,
      shape: CircularNotchedRectangle(),

      // margin: EdgeInsets.zero,
      // elevation: 10,
      child: Container(
        // color: Colors.red,
        height: 60,
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Row(children: [
            BottomNavItemForUniversal(title: "Home", iconData: Images.home,  onTap: (){
              Get.offAll(Dashboard(pageIndex: 0,));
            },height: 20,),
            BottomNavItemForUniversal(title: "Discover",iconData: Images.discover,   onTap: (){
              Get.offAll(Dashboard(pageIndex: 1,));
            },height: 20),
            BottomNavItemForUniversal(title: "Category",iconData: Images.category, onTap: (){
              Get.offAll(Dashboard(pageIndex: 2,));
            },height: 20),
            BottomNavItemForUniversal(title: "Brands",iconData: Images.az, onTap: (){
              Get.offAll(Dashboard(pageIndex: 3,));
            },height: 20),
            BottomNavItemForCart(title: "Bag", iconData: Images.bag,  onTap: (){
              Get.offAll(Dashboard(pageIndex: 4,));
            },height: 20),
           /* BottomNavItemForCart( title: "Bag" ,iconData: Images.bag, onTap: () {
              Get.offAll(Dashboard(pageIndex: 4,));
            },height: 20,),*/
            BottomNavItemForUniversal( title: "Menu",iconData: Images.more, onTap:(){
              Get.offAll(Dashboard(pageIndex: 5,));
            },height: 20),

            // BottomNavItemForCart( title: "Bag" ,iconData: Images.cart, isSelected: _pageIndex == 2, onTap: () => _setPage(2),height: 20,),
          ]),
        ),
      ),
    );
  }
}
