import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';

import '../../../controller/main page/main_page_controller.dart';
import '../../../controller/product/product_controller.dart';


enum ShortingTitle {all, isle, newest, wishlisted, low, heigh }

class PeopleSortPopup extends StatefulWidget {
  final int? pageId;
  final List<int>? sectionId;
  const PeopleSortPopup({
    super.key,
    this.pageId,
    this.sectionId
  });

  @override
  State<PeopleSortPopup> createState() => _PeopleSortPopupState();
}

class _PeopleSortPopupState extends State<PeopleSortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (mainController) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      mainController.getMultisectionProduct(
                        pageId: widget.pageId,
                        sectionId: widget.sectionId,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      mainController.getMultisectionProduct(
                          pageId: widget.pageId,
                          sectionId: widget.sectionId,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      mainController.getMultisectionProduct(
                          pageId: widget.pageId,
                          sectionId: widget.sectionId,
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      mainController.getMultisectionProduct(
                        pageId: widget.pageId,
                        sectionId: widget.sectionId,
                        priceOrder: 'esc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      mainController.getMultisectionProduct(
                          pageId: widget.pageId,
                          sectionId: widget.sectionId,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}


class SectionSortPopup extends StatefulWidget {
  final String? id;
  final int? pageId;
  final List<int>? sectionId;
  const SectionSortPopup({
    super.key,
    this.id,
    this.pageId,
    this.sectionId
  });

  @override
  State<SectionSortPopup> createState() => _SectionSortPopupState();
}

class _SectionSortPopupState extends State<SectionSortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionProductData(
                        id: widget.id,
                        pageId: widget.pageId,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionProductData(
                        id: widget.id,
                        pageId: widget.pageId,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionProductData(
                          id: widget.id,
                          pageId: widget.pageId,
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionProductData(
                          id: widget.id,
                          pageId: widget.pageId,
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionProductData(
                          id: widget.id,
                          pageId: widget.pageId,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}


class NewInSortPopup extends StatefulWidget {
  final String? id;
  final int? pageId;
  final String? limit;
  const NewInSortPopup({
    super.key,
    this.id,
    this.pageId,
    this.limit
  });

  @override
  State<NewInSortPopup> createState() => _NewInSortPopupState();
}

class _NewInSortPopupState extends State<NewInSortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionNewInData(
                        id: widget.id,
                        pageId: widget.pageId,
                        limit: '50'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionNewInData(
                        id: widget.id,
                        pageId: widget.pageId,
                        limit: '50'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionNewInData(
                          id: widget.id,
                          pageId: widget.pageId,
                          limit: '50',
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionNewInData(
                          id: widget.id,
                          pageId: widget.pageId,
                          limit: '50',
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSectionNewInData(
                          id: widget.id,
                          pageId: widget.pageId,
                          priceOrder: 'desc',
                          limit: '50'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}


class CategorySortPopup extends StatefulWidget {
  final String? id;
  const CategorySortPopup({
    super.key,
    this.id,
  });

  @override
  State<CategorySortPopup> createState() => _CategorySortPopupState();
}

class _CategorySortPopupState extends State<CategorySortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getCategoryProductData(
                        categoryId: widget.id,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getCategoryProductData(
                        categoryId: widget.id,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getCategoryProductData(
                          categoryId: widget.id.toString(),
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getCategoryProductData(
                          categoryId: widget.id,
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getCategoryProductData(
                          categoryId: widget.id,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}


class BrandTypeSortPopup extends StatefulWidget {
  final String? id;
  const BrandTypeSortPopup({
    super.key,
    this.id,
  });

  @override
  State<BrandTypeSortPopup> createState() => _BrandTypeSortPopupState();
}

class _BrandTypeSortPopupState extends State<BrandTypeSortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandTypeProductData(
                        id: widget.id,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandTypeProductData(
                        id: widget.id,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandTypeProductData(
                          id: widget.id.toString(),
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandTypeProductData(
                          id: widget.id,
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandTypeProductData(
                          id: widget.id,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}



class ChildCategorySortPopup extends StatefulWidget {
  final String? id;
  const ChildCategorySortPopup({
    super.key,
    this.id,
  });

  @override
  State<ChildCategorySortPopup> createState() => _ChildCategorySortPopupState();
}

class _ChildCategorySortPopupState extends State<ChildCategorySortPopup> {

  ShortingTitle _site = ShortingTitle.all;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('All Product', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.all,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getChildCategoryProductData(
                        childCategoryId: widget.id,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getChildCategoryProductData(
                        childCategoryId: widget.id,
                        sectionType: 'isle-pick'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getChildCategoryProductData(
                        childCategoryId: widget.id,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getChildCategoryProductData(
                          childCategoryId: widget.id.toString(),
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getChildCategoryProductData(
                          childCategoryId: widget.id,
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getChildCategoryProductData(
                          childCategoryId: widget.id,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}

class SellSortPopup extends StatefulWidget {
  final int? pageId;
  const SellSortPopup({
    super.key,
    this.pageId,
  });

  @override
  State<SellSortPopup> createState() => _SellSortPopupState();
}

class _SellSortPopupState extends State<SellSortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSellProductData(
                          genderId: widget.pageId,
                          sectionType: 'isle-pick'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSellProductData(
                        genderId: widget.pageId,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSellProductData(
                          genderId: widget.pageId,
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSellProductData(
                          genderId: widget.pageId,
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSellProductData(
                          genderId: widget.pageId,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}


class BrandCategorySortPopup extends StatefulWidget {
  final String? id;
  const BrandCategorySortPopup({
    super.key,
    this.id,
  });

  @override
  State<BrandCategorySortPopup> createState() => _BrandCategorySortPopupState();
}

class _BrandCategorySortPopupState extends State<BrandCategorySortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandProductData(
                          id: widget.id,
                          sectionType: 'isle-pick'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandProductData(
                        id: widget.id,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandProductData(
                          id: widget.id,
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandProductData(
                          id: widget.id,
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getBrandProductData(
                          id: widget.id,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}


class SearchSortPopup extends StatefulWidget {
  final String? searchCon;
  const SearchSortPopup({
    super.key,
    this.searchCon,
  });

  @override
  State<SearchSortPopup> createState() => _SearchSortPopupState();
}

class _SearchSortPopupState extends State<SearchSortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSearchProductData(
                          searchTerm: widget.searchCon,
                          pageId: 1,
                          sectionType: 'isle-pick'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSearchProductData(
                        searchTerm: widget.searchCon,
                        pageId: 1,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSearchProductData(
                          searchTerm: widget.searchCon,
                          pageId: 1,
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSearchProductData(
                          searchTerm: widget.searchCon,
                          pageId: 1,
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getSearchProductData(
                          searchTerm: widget.searchCon,
                          pageId: 1,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}


class MostPopularSortPopup extends StatefulWidget {
  final String? id;
  const MostPopularSortPopup({
    super.key,
    this.id,
  });

  @override
  State<MostPopularSortPopup> createState() => _MostPopularSortPopupState();
}

class _MostPopularSortPopupState extends State<MostPopularSortPopup> {

  ShortingTitle _site = ShortingTitle.isle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          // You can customize the content of the bottom sheet here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              ListTile(
                title: Text('Short By', style: railway.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),),
                trailing: Text("Close", style: railway.copyWith(fontSize: 12,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),),
                onTap: () {
                  // Add functionality for sharing
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Isle Picks', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.isle,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getMostPopularProductData(
                          id: widget.id,
                          sectionType: 'isle-pick'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),

              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Newest', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.newest,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getMostPopularProductData(
                        id: widget.id,
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Most WishListed', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.wishlisted,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getMostPopularProductData(
                          id: widget.id,
                          isMostWishList: true
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Lowest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.low,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getMostPopularProductData(
                          id: widget.id,
                          priceOrder: 'asc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 0),
              SizedBox(
                // color: Colors.pink,
                height: 55,
                child: ListTile(
                  title: Text('Highest Price', style: railway.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500,),),
                  trailing: Radio(
                    activeColor: gold,
                    value: ShortingTitle.heigh,
                    groupValue: _site,
                    onChanged: (ShortingTitle? value) {
                      setState(() {
                        _site = value!;
                      });
                      controller.getMostPopularProductData(
                          id: widget.id,
                          priceOrder: 'desc'
                      ).whenComplete(() => Get.back());
                    },
                  ),
                ),
              ),
              const SizedBox(height: 0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 0.5,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    });
  }
}


// class SortPopup extends StatefulWidget {
//   @override
//   State<SortPopup> createState() => _InfoPopupState();
// }
//
// class _InfoPopupState extends State<SortPopup> {
//   ShortingTitle _site = ShortingTitle.isle;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<MainPageController>(builder: (mainController) {
//       return SingleChildScrollView(
//         child: SizedBox(
//           // You can customize the content of the bottom sheet here
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const SizedBox(height: 8),
//               ListTile(
//                 title: Text('Short By', style: railway.copyWith(
//                     fontSize: 20, fontWeight: FontWeight.bold),),
//                 trailing: Text("Close", style: railway.copyWith(fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline),),
//                 onTap: () {
//                   // Add functionality for sharing
//                   Navigator.pop(context);
//                 },
//               ),
//               const SizedBox(height: 0),
//               SizedBox(
//                 // color: Colors.pink,
//                 height: 55,
//                 child: ListTile(
//                   title: Text('Isle Picks', style: railway.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w500,),),
//                   trailing: Radio(
//                     activeColor: gold,
//                     value: ShortingTitle.isle,
//                     groupValue: _site,
//                     onChanged: (ShortingTitle? value) {
//                       setState(() {
//                         _site = value!;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 0),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 child: Divider(
//                   color: Colors.grey,
//                   thickness: 0.5,
//                   height: 0.5,
//                 ),
//               ),
//               const SizedBox(height: 0),
//               Container(
//                 // color: Colors.pink,
//                 height: 55,
//                 child: ListTile(
//                   title: Text('Newest', style: railway.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w500,),),
//                   trailing: Radio(
//                     activeColor: gold,
//                     value: ShortingTitle.newest,
//                     groupValue: _site,
//                     onChanged: (ShortingTitle? value) {
//                       setState(() {
//                         _site = value!;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 0),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 child: Divider(
//                   color: Colors.grey,
//                   thickness: 0.5,
//                   height: 0.5,
//                 ),
//               ),
//               const SizedBox(height: 0),
//               Container(
//                 // color: Colors.pink,
//                 height: 55,
//                 child: ListTile(
//                   title: Text('Most WishListed', style: railway.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w500,),),
//                   trailing: Radio(
//                     activeColor: gold,
//                     value: ShortingTitle.wishlisted,
//                     groupValue: _site,
//                     onChanged: (ShortingTitle? value) {
//                       setState(() {
//                         _site = value!;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 0),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 child: Divider(
//                   color: Colors.grey,
//                   thickness: 0.5,
//                   height: 0.5,
//                 ),
//               ),
//               const SizedBox(height: 0),
//               SizedBox(
//                 // color: Colors.pink,
//                 height: 55,
//                 child: ListTile(
//                   title: Text('Lowest Price', style: railway.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w500,),),
//                   trailing: Radio(
//                     activeColor: gold,
//                     value: ShortingTitle.low,
//                     groupValue: _site,
//                     onChanged: (ShortingTitle? value) {
//                       setState(() {
//                         _site = value!;
//                       });
//                       mainController.getMultisectionProduct(
//                         pageId: widget.pageId,
//                         sectionId: selectSection != null ? [selectSection!] : widget.sectionId,
//                         sizeId: selectedSizeIds,
//                         brandId: selectedBrandsIds,
//                         colorId: selectedColorIds,
//                         minPrice: minAmountCon.text.trim(),
//                         maxPrice: maxAmountCon.text.trim(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 0),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 child: Divider(
//                   color: Colors.grey,
//                   thickness: 0.5,
//                   height: 0.5,
//                 ),
//               ),
//               const SizedBox(height: 0),
//               Container(
//                 // color: Colors.pink,
//                 height: 55,
//                 child: ListTile(
//                   title: Text('Highest Price', style: railway.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w500,),),
//                   trailing: Radio(
//                     activeColor: gold,
//                     value: ShortingTitle.heigh,
//                     groupValue: _site,
//                     onChanged: (ShortingTitle? value) {
//                       setState(() {
//                         _site = value!;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 0),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 child: Divider(
//                   color: Colors.grey,
//                   thickness: 0.5,
//                   height: 0.5,
//                 ),
//               ),
//               const SizedBox(height: 50),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
