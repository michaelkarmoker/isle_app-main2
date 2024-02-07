import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import 'package:isletestapp/view/screens/brand_page/brand_page.dart';
import 'package:isletestapp/view/screens/category/categories.dart';
import 'package:isletestapp/view/screens/discover/discover_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:isletestapp/view/screens/profile/profile.dart';
import 'widgets/bottom_nav_item.dart';
import 'widgets/bottom_nav_item_for_cart.dart';


class Dashboard extends StatefulWidget {
  final int pageIndex;

  const Dashboard({Key? key, required this.pageIndex,}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<Dashboard> {

  PageController? _pageController;
  bool isOpen=false;
  int _pageIndex = 0;
  List<Widget> _screens=[];

  bool _canExit =  false;

/*  bool _canExit = false;
  int index = 1;
  PageController? _pageController;*/

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.pageIndex;
    _pageController = PageController(initialPage: widget.pageIndex);
    // CategoryPageController categoryPageController = Get.find<CategoryPageController>();
    _screens = [
      MainScreen(),
      // DiscoverPage(),
      const Discover(selectedCatIndex: 0,),
      CategoryScreen(selectedCatIndex: 0, isfromDash: true, selectedIndex: 0),
      // BrandPage(),
      const BrandScreen(tabBar: true),
      BagPage(),
      // BagPage(),
      Get.find<AuthController>().isLoggedIn()?
      UserInfo()
      : LoginRegisterPage(isFromCart: false),
      // LoginRegisterPage(),

    ];
    /// black owl cilo
    // Get.find<CartController>().getCartList(true);
    /*if(GetPlatform.isMobile) {
      NetworkInfo.checkConnectivity(_scaffoldKey.currentContext);
    }*/
  }

/*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage:0);
  }*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          if(_canExit) {
            return true;
          }else {
            return false;
            //  print("djkfj");
          /*  if(_drawerscaffoldkey.currentState!.isDrawerOpen){
              print("djkfj");
              Navigator.pop(context);
              return Future.value(false);
            }else {
              // print("djkffgfgfgfj");
       *//*       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Back Press Again To Exit',
                    style: TextStyle(color: Colors.white)),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).accentColor,
                duration: Duration(seconds: 2),
                margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              ));
              _canExit = true;
              Timer(Duration(seconds: 2), () {
                _canExit = false;
              });*//*
              return false;
            }*/
          }
        }
      },
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 5,
          notchMargin: 5,
          shape: const CircularNotchedRectangle(),

          // margin: EdgeInsets.zero,
          // elevation: 10,
          child: Container(
            // color: Colors.red,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(children: [
                BottomNavItem(title: "Home", iconData: Images.home,  isSelected: _pageIndex == 0, onTap: () => _setPage(0),height: 20,),
                BottomNavItem(title: "Discover",iconData: Images.discover,  isSelected: _pageIndex == 1, onTap: () => _setPage(1),height: 20),
                BottomNavItem(title: "Category",iconData: Images.category, isSelected: _pageIndex == 2, onTap: () => _setPage(2),height: 20),
                BottomNavItem(title: "Brands",iconData: Images.az, isSelected: _pageIndex == 3, onTap: () => _setPage(3),height: 20),
                BottomNavItemForCart(title: "Bag", iconData: Images.bag, isSelected: _pageIndex == 4, onTap: () => _setPage(4),height: 20),
               // BottomNavItemForCart( title: "Bag" ,iconData: Images.bag, isSelected: _pageIndex == 4, onTap: () => _setPage(4),height: 20,),
                BottomNavItem( title: "Menu",iconData: Images.more, isSelected: _pageIndex == 5, onTap: () => _setPage(5),height: 20),

              ]),
            ),
          ),


        ),
      ),
    );
  }
  void _setPage(int pageIndex) {
    /*pageIndex==4?Get.to(CartPage()):*/
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }







}
