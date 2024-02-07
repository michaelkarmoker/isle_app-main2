import 'dart:convert';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/html_tag_remover.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/no_result_found.dart';
import 'package:isletestapp/view/screens/all_popup/feedback_popup.dart';
import 'package:isletestapp/view/screens/all_popup/sort_popup.dart';
import 'package:isletestapp/view/screens/all_popup/custom_discover_dialog.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/filter/people_filter_dialog.dart';
import 'package:isletestapp/view/screens/filter/sub_category_filter_dialog.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:isletestapp/view/screens/product%20page/product_shimmer.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/category/category_page_controller.dart';
import '../../../data/model/response/category page/nested_section_response.dart';
import '../filter/brand_type_filter_dialog.dart';
import '../filter/most_popular_filter_dialog.dart';
import '../../../data/model/response/filter/sell_product_filter_term_model.dart';
import '../filter/brand_filter_dialog.dart';
import '../filter/category_filter_dialog.dart';
import '../filter/child_category_filter_dialog.dart';
import '../filter/search_product_filter_dialog.dart';
import '../filter/section_filter_dialog.dart';
import '../filter/section_newin_filter_page_dialog.dart';
import '../filter/sell_section_filter_dialog.dart';

class MenuModel{
  final String? img;
  final String? text;

  MenuModel({required this.img, required this.text});

}

class ProductPage extends StatefulWidget {
  final MainPageController? controller2;
  final int? newinleangth;
  final String? image;
  final String? title;
  final String? details;
  final String? sectiontype;

  final String? discountText;
  final String? brandText;
  final String? sizeText;
  final String? categoryText;


  final String? id;

  /* final String? categoryId;
  final String? subCategoryId;
  final String? childCategoryId;
  final String? sectionId;
  final String? brandId;*/
  //final String? affordId;
  final int page;
  final int? indexId;

  final String? searchCon;
  final String? mainImage;
  final String? mainTitle;
  final String? mainDesc;

  final int? pageId;
  final int? parentId;
  final List<int>? sectionId;

  ProductPage({
    Key? key,
    /* this.categoryId,
     this.subCategoryId,
     this.childCategoryId,
     this.sectionId,
     this.brandId,*/
    // this.affordId,
    required this.page,
    this.indexId,

    this.searchCon,
    this.mainImage,
    this.mainTitle,
    this.mainDesc,
    this.image,
    this.title,
    this.pageId,
    this.parentId,
    this.sectionId,
    this.discountText,
    this.brandText,
    this.sizeText,
    this.categoryText,
    this.details, this.sectiontype, this.controller2, this.newinleangth, this.id,

  }) : super(key: key);

  @override
  State<ProductPage> createState() => _IsleHomeScreenState();
}

class _IsleHomeScreenState extends State<ProductPage> {
  ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) {
      retrieveButtonState(); // Retrieve the stored state of the button when the page loads
      // Load the stored wish statuses when the page loads
      retrieveWishStatus();
      print(widget.sectiontype);
      // Get.find<ProductListController>().getGeneralSettingData();
      // Get.find<CategoryPageController>().dataInitialize();
      if (widget.page == AppConstants.SECTION ||
          widget.page == AppConstants.SUBSECTION ||
          widget.page == AppConstants.CHILDSECTION) {
        // Get.find<ProductListController>().getSectionNewInData(id: widget.id);
        /*if(widget.indexId == 2){
          Get.find<ProductListController>().getSectionNewInData(id: widget.id, limit: '50', pageId: widget.pageId,);
          Get.find<ProductListController>().getSectionNewInFilter(id: widget.id, pageId: widget.pageId);
        }*/ /*if(widget.indexId == 4){
          Get.find<ProductListController>().getSellProductData(
            pageId: widget.pageId,
            genderId: widget.pageId,
            discount: widget.discountText ?? '',
            brandText: widget.brandText ?? '',
            sizeText: widget.sizeText ?? '',
            categoryText: widget.categoryText ?? '',
            limit: '50'
          );
          Get.find<ProductListController>().getSellProductFilterTerm(genderId: widget.pageId.toString());
        } else{
          Get.find<ProductListController>().getSectionProductData(id: widget.id, pageId: widget.pageId);
          Get.find<ProductListController>().getSectionProductFilter(id: widget.id, parentId: widget.parentId.toString());
        }*/
        Get.find<ProductListController>().getSectionProductData(id: widget.id, pageId: widget.pageId);
        Get.find<ProductListController>().getSectionProductFilter(id: widget.id, parentId: widget.parentId.toString());
        // if(widget.page == AppConstants.newIn){
        //   Get.find<ProductListController>().getSectionNewInData(id: widget.id);
        //   // Get.find<ProductListController>().getSectionProductFilter(id: widget.id, parentId: widget.parentId.toString());
        // }
        // else{
        //   Get.find<ProductListController>().getSectionNewInData(id: widget.id);
        //   Get.find<ProductListController>().getSectionProductData(id: widget.id);
        //   Get.find<ProductListController>().getSectionProductFilter(id: widget.id, parentId: widget.parentId.toString());
        // }

      } else if (widget.page == AppConstants.newIn) {
        Get.find<ProductListController>().getSectionNewInData(id: widget.id, limit: '50', pageId: widget.pageId,);
        Get.find<ProductListController>().getSectionNewInFilter(id: widget.id, pageId: widget.pageId);
      } else if (widget.page == AppConstants.CATEGORY) {
        Get.find<ProductListController>().getCategoryProductData(categoryId: widget.id, limit: '50', pageId: widget.pageId);
        // Get.find<ProductListController>().getCategoryProductFilter(id: widget.id, parentId: widget.parentId.toString());
        Get.find<ProductListController>().getCategoryProductFilter(id: widget.id, parentId: widget.parentId.toString());
      } else if (widget.page == AppConstants.search) {
        Get.find<ProductListController>().getSearchProductData(searchTerm: widget.searchCon, pageId: 1, limit: '50');
        Get.find<ProductListController>().getSearchProductFilterTerm(pageId: 1.toString(), searchTerm: widget.searchCon);
      } else if (widget.page == AppConstants.SUBCATEGORY) {
        Get.find<ProductListController>().getSubCategoryProductData(subCategoryId: widget.id);
        Get.find<ProductListController>().getSubCategoryProductFilter(id: widget.id, parentId: widget.parentId.toString());
      } else if (widget.page == AppConstants.CHILDCATEGORY) {
        Get.find<ProductListController>().getChildCategoryProductData(childCategoryId: widget.id, pageId: widget.pageId);
        Get.find<ProductListController>().getChildCategoryProductFilter(id: widget.id, parentId: widget.parentId.toString());
      } else if (widget.page == AppConstants.brandType) {
        Get.find<ProductListController>().getBrandTypeProductData(id: widget.id, pageId: widget.pageId, genderId: widget.pageId, limit: '50');
        Get.find<ProductListController>().getBrandTypeProductFilterTerm(id: widget.id, genderId: widget.pageId);
      } else if (widget.page == AppConstants.mostPopular) {
        Get.find<ProductListController>().getMostPopularProductData(id: widget.id, pageId: widget.pageId);
        Get.find<ProductListController>().getMostPopularFilter(id: widget.id);
      } else if (widget.page == AppConstants.BRAND) {
        Get.find<ProductListController>().getBrandProductData(id: widget.id, pageId: widget.pageId, genderId: widget.pageId, limit: '50');
        Get.find<ProductListController>().getBrandProductFilter(id: widget.id, genderId: widget.pageId.toString());
      } /* else if (widget.page == AppConstants.NEW_IN) {
        Get.find<MainPageController>().dataInitializeForHome();
      }*/ else if (widget.page == AppConstants.menShop) {
        Get.find<MainPageController>().getMultisectionProductFilter(sectionId: widget.sectionId!);
        Get.find<MainPageController>().getMultisectionProduct(pageId: widget.pageId!, sectionId: widget.sectionId!);
      }
    });
    super.initState();
    _scrollController.addListener(_handleScroll);
  }
  void _handleScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      // Scrolling down, show the FloatingActionButton
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      // Scrolling up, hide the FloatingActionButton
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    Get.find<ProductListController>().dataClear();
  }




  bool isHeartRed = false; // Initially, assuming the heart icon is not red
  Future<void> retrieveButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isHeartRed = prefs.getBool('isHeartRed') ??
          false; // Get the saved value, defaulting to false
    });
  }

  Map<String, bool> productWishStatus = {
  }; // Map to store product IDs and wish status
  Future<void> retrieveWishStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      productWishStatus = Map<String, bool>.from(
        prefs.getString('productWishStatus') != null
            ? json.decode(prefs.getString('productWishStatus')!)
            : {},
      );
    });
  }

  void saveWishStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('productWishStatus', json.encode(productWishStatus));
  }

  TextEditingController searchCtr = TextEditingController();
  bool isSearchClick = false;
  TextEditingController subscribeCtr = TextEditingController();
  FocusNode subscribeFcs = FocusNode();

  bool indicatorcolor = true;
  TextEditingController msgboxCtr = TextEditingController();
  FocusNode msgboxFcs = FocusNode();

  bool isChecked = false;

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked; // Toggle the checkbox state
    });
  }

  bool isToggled = false;

  void toggleButton() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  Color buttonColor = Colors.transparent;
  Color buttontextColor = Colors.black;

  void changeColor() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor = Colors.black;
      buttontextColor = Colors.white;
    });
  }

  Color buttonColor2 = Colors.transparent;
  Color buttontextColor2 = Colors.black;

  void changeColor2() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor2 = Colors.black; // Change to your desired color
      buttontextColor2 = Colors.white;
    });
  }

  Color buttonColor3 = Colors.transparent;
  Color buttontextColor3 = Colors.black;

  void changeColor3() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor3 = Colors.black; // Change to your desired color
      buttontextColor3 = Colors.white;
    });
  }

  int currentIndex = 1; // Add this variable to track the current index

  int menuClick = 0;
  List<MenuModel> menuList = [
    MenuModel(img: Images.filter, text: 'Filter'),
    MenuModel(img: Images.swap, text: 'Isle Picks'),
  ];




  @override
  Widget build(BuildContext context) {

    return GetBuilder<ProductListController>(builder: (controller) {
      log('====================@ Controleler${widget.controller2}');
      return GetBuilder<MainPageController>(builder: (mainController) {
        return Scaffold(
          floatingActionButton: _isVisible
              ? Container(
            height: 42,
            width: 42,
            padding: EdgeInsets.zero,
            child: FloatingActionButton(
              backgroundColor: gold,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (
                      BuildContext context) {
                    // return ProductReviewPopup(id: controller?.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                    return FeedbackPopup();
                    // return FeedbackPopup(id: controller.productDetailsResponse!.data!.id!,);
                  },
                );
              },
              child: Icon(Icons.feedback_outlined, color: Colors.white, size: 22),
            ),
          )
              : null,
          bottomNavigationBar: const UniversalBottomNav(),

          // backgroundColor: Color(0xffFAFBFB),
          backgroundColor: const Color(0xffFAFAFA),
          // drawer: IsleDrawer(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Color(0xff000000)),
            titleSpacing: 0,
            backgroundColor: const Color(0xffFFFFFF),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 62,
            actions: [
              InkWell(
                  onTap: (){
                    Get.to(SearchScreen());
                  },
                  // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                  child: Image.asset(Images.search, height: 22, width: 22,)),
              const SizedBox(width: 2),
              const WishButtonWidget(),
              const SizedBox(width: 4),
            ],
            leadingWidth: Get.width / 3.5,
            title: const CustomLogo(),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [

                /// Top BANNER
                widget.image != null ?
                Column(
                  children: [
                    widget.image != ''
                        ? Container(
                      height: Get.height / 2.5,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: CustomImageCached(
                                image: widget.image ?? "",
                                isRound: false,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(WishListPage());
                                  },
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey.shade100,
                                    child: Icon(Icons.star_border_purple500_sharp,
                                        size: 27, color: gold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                        : const SizedBox.shrink(), // Show SizedBox if widget.image is null
                    InkWell(
                      onTap: () {
                        Get.dialog(CustomDialog(title: widget.title!, desc: widget.details!));
                      },
                      child: Container(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.title ?? "",
                                style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 8),
                              widget.details != null
                                  ? Text(
                                '${HtmlTags.removeTag(htmlString: widget.details ?? "")}',
                                style: poppins.copyWith(fontSize: 11),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                                  : const SizedBox(),
                              const SizedBox(height: 6),
                              Text(
                                "Read More".toUpperCase(),
                                style: railwaybold.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: gold,
                                    fontSize: 10,
                                    decoration: TextDecoration.underline),
                              ),
                              const SizedBox(height: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                )
                    : const SizedBox(),

                //// =============================================

                const SizedBox(height: 10),
                GetBuilder<CategoryPageController>(
                  autoRemove: false,
                    builder: (catetoryController) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: SizedBox(
                      // color: Colors.pinkAccent,
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, right: 3),
                                      // Add some spacing between items
                                      child: InkWell(
                                        onTap: () {
                                          if (widget.page == AppConstants.SECTION ||
                                              widget.page == AppConstants.SUBSECTION ||
                                              widget.page == AppConstants.CHILDSECTION) {
                                            /*if(widget.indexId == 2){
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx){
                                                    return SectionNewInFilterPageDialog(
                                                      filterModel: controller.sectionNewInProductFilterModel,
                                                      id: widget.id,
                                                      pageId: widget.pageId,
                                                      title: widget.title,
                                                    );
                                                  }
                                              );
                                            } else*/
                                            /*if(widget.indexId == 4){
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx){
                                                    return SellSectionFilterPageDialog(
                                                      filterModel: controller.sellProductFilterTermModel,
                                                      id: widget.id,
                                                      pageId: widget.pageId,
                                                      discountText: widget.discountText,
                                                      sizeText: widget.sizeText,
                                                      brandText: widget.brandText,
                                                      categoryText: widget.categoryText,
                                                    );
                                                  }
                                              );
                                            }
                                            else{
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx){
                                                    return SectionFilterPageDialog(
                                                        filterModel: controller.sectionProductFilterModel,
                                                        id: widget.id,
                                                        pageId: widget.pageId,
                                                        title: widget.title
                                                    );
                                                  }
                                              );
                                            }*/
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return SectionFilterPageDialog(
                                                      filterModel: controller.sectionProductFilterModel,
                                                      id: widget.id,
                                                      pageId: widget.pageId,
                                                      title: widget.title
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.mostPopular) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return MostPupularFilterPageDialog(
                                                    filterModel: controller.mostPopularFilterTermModel,
                                                    id: widget.id,
                                                    // pageId: widget.pageId,
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.search) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return SearchFilterPageDialog(
                                                    filterModel: controller.searchPoductFilterTermModel,
                                                    searchCon: widget.searchCon,                                                    // pageId: widget.pageId,
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.newIn) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return SectionNewInFilterPageDialog(
                                                    filterModel: controller.sectionNewInProductFilterModel,
                                                    id: widget.id,
                                                    pageId: widget.pageId,
                                                    title: widget.title,
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.CATEGORY) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return CategoryFilterPageDialog(
                                                    filterModel: controller.categoryProductFilterTermModel,
                                                    id: widget.id,
                                                    title: widget.title,
                                                    // pageId: widget.pageId,
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.menShop) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return PeopleFilterPageDialog(
                                                    filterModel: mainController.multipleSectionProductFilterModel,
                                                    pageId: widget.pageId,
                                                    sectionId: widget.sectionId,
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.SUBCATEGORY) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return SubCategoryFilterPageDialog(
                                                    filterModel: controller.subCategoryProductFilterModel,
                                                    id: widget.id,
                                                    title: widget.title,
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.brandType) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return BrandTypeFilterPageDialog(
                                                    filterModel: controller.brandTypeProductFilterModel,
                                                    id: widget.id,
                                                    pageId: widget.pageId,
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.CHILDCATEGORY) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return ChildCategoryFilterPageDialog(
                                                    filterModel: controller.childCategoryProductFilterModel,
                                                    id: widget.id,
                                                    title: widget.title,
                                                  );
                                                }
                                            );
                                          }

                                          else if (widget.page == AppConstants.BRAND) {
                                            showDialog(
                                                context: context,
                                                builder: (ctx){
                                                  return BrandFilterPageDialog(
                                                    filterModel: controller.brandProductFilterTermModel,
                                                    id: widget.id,
                                                    pageId: widget.pageId,
                                                  );
                                                }
                                            );
                                          }

                                          changeColor();
                                          setState(() {});
                                        },
                                        child: Container(
                                          // width: 80,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            // color: Colors.greenAccent,
                                              borderRadius:
                                              BorderRadius.circular(3),
                                              color: buttonColor,
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                              )),
                                          // margin: EdgeInsets.all(10),
                                          // padding: EdgeInsets.all(5),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4,
                                                right: 8,
                                                top: 2,
                                                bottom: 2),
                                            child: Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      // color: Colors.blue,
                                                        height: 35,
                                                        width: 35,
                                                        child: Image.asset(
                                                          Images.filter,
                                                          color: buttontextColor,
                                                        )),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      'Filter'.toUpperCase(),
                                                      style: poppins.copyWith(
                                                          color: buttontextColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                    // Text('${brandlist[index]}'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black, fontSize: 10),),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, right: 3),
                                      // Add some spacing between items
                                      child: InkWell(
                                        onTap: () {
                                          if (widget.page == AppConstants.SECTION ||
                                              widget.page == AppConstants.SUBSECTION ||
                                              widget.page == AppConstants.CHILDSECTION) {
                                            /*if(widget.indexId == 2){
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return NewInSortPopup(
                                                      id: widget.id,
                                                      pageId: widget.pageId
                                                  );
                                                },
                                              );
                                            }*/
                                            // if(widget.indexId == 4){
                                            //   showModalBottomSheet(
                                            //     context: context,
                                            //     builder: (BuildContext context) {
                                            //       return SellSortPopup(
                                            //         pageId: widget.pageId,
                                            //       );
                                            //     },
                                            //   );
                                            // } else{
                                            //   showModalBottomSheet(
                                            //     context: context,
                                            //     builder: (BuildContext context) {
                                            //       return SectionSortPopup(
                                            //           id: widget.id,
                                            //           pageId: widget.pageId,
                                            //           sectionId: widget.sectionId
                                            //       );
                                            //     },
                                            //   );
                                            // }
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return SectionSortPopup(
                                                    id: widget.id,
                                                    pageId: widget.pageId,
                                                    sectionId: widget.sectionId
                                                );
                                              },
                                            );
                                          }

                                          else if (widget.page == AppConstants.newIn) {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return NewInSortPopup(
                                                    id: widget.id,
                                                    pageId: widget.pageId,
                                                );
                                              },
                                            );
                                          }

                                          else if (widget.page == AppConstants.menShop) {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return PeopleSortPopup(
                                                    pageId: widget.pageId,
                                                    sectionId: widget.sectionId
                                                );
                                              },
                                            );
                                          }

                                          else if(widget.page == AppConstants.CATEGORY){
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CategorySortPopup(
                                                  id: widget.id,
                                                );
                                              },
                                            );
                                          }

                                          else if(widget.page == AppConstants.mostPopular){
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return MostPopularSortPopup(
                                                  id: widget.id,
                                                );
                                              },
                                            );
                                          }

                                          else if (widget.page == AppConstants.CHILDCATEGORY) {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ChildCategorySortPopup(
                                                  id: widget.id,
                                                );
                                              },
                                            );
                                          }

                                          else if (widget.page == AppConstants.BRAND) {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return BrandCategorySortPopup(
                                                  id: widget.id,
                                                );
                                              },
                                            );
                                          }

                                          else if (widget.page == AppConstants.search) {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return SearchSortPopup(
                                                  searchCon: widget.searchCon,
                                                );
                                              },
                                            );
                                          }

                                          else if(widget.page == AppConstants.brandType){
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CategorySortPopup(
                                                  id: widget.id,
                                                );
                                              },
                                            );
                                          }

                                          changeColor2();
                                          setState(() {});
                                        },
                                        child: Container(
                                          // width: 80,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            // color: Colors.greenAccent,
                                              borderRadius:
                                              BorderRadius.circular(3),
                                              color: buttonColor2,
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                              )),
                                          // margin: EdgeInsets.all(10),
                                          // padding: EdgeInsets.all(5),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4,
                                                right: 8,
                                                top: 2,
                                                bottom: 2),
                                            child: Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      // color: Colors.blue,
                                                        height: 20,
                                                        width: 30,
                                                        child: Image.asset(
                                                          Images.swap,
                                                          color: buttontextColor2,
                                                        )),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      'Sort'.toUpperCase(),
                                                      style: poppins.copyWith(
                                                          color: buttontextColor2,
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                    // Text('${brandlist[index]}'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black, fontSize: 10),),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       left: 3, right: 3),
                                    //   // Add some spacing between items
                                    //   child: InkWell(
                                    //     onTap: () {
                                    //       changeColor3();
                                    //       setState(() {});
                                    //     },
                                    //     child: Container(
                                    //       // width: 80,
                                    //       height: 40,
                                    //       decoration: BoxDecoration(
                                    //         // color: Colors.greenAccent,
                                    //           borderRadius:
                                    //           BorderRadius.circular(3),
                                    //           color: buttonColor3,
                                    //           border: Border.all(
                                    //             color: Colors.grey,
                                    //             width: 1,
                                    //           )),
                                    //       // margin: EdgeInsets.all(10),
                                    //       // padding: EdgeInsets.all(5),
                                    //       child: Padding(
                                    //         padding: const EdgeInsets.only(
                                    //             left: 15,
                                    //             right: 15,
                                    //             top: 2,
                                    //             bottom: 2),
                                    //         child: Center(
                                    //             child: Text(
                                    //               'Shoes'.toUpperCase(),
                                    //               style: poppins.copyWith(
                                    //                   color: buttontextColor3,
                                    //                   fontSize: 12,
                                    //                   fontWeight: FontWeight
                                    //                       .w600),
                                    //             )),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       left: 3, right: 3),
                                    //   // Add some spacing between items
                                    //   child: InkWell(
                                    //     child: Container(
                                    //       // width: 80,
                                    //       height: 40,
                                    //       decoration: BoxDecoration(
                                    //         // color: Colors.greenAccent,
                                    //           borderRadius:
                                    //           BorderRadius.circular(3),
                                    //           color: Colors.transparent,
                                    //           border: Border.all(
                                    //             color: Colors.grey,
                                    //             width: 1,
                                    //           )),
                                    //       // margin: EdgeInsets.all(10),
                                    //       // padding: EdgeInsets.all(5),
                                    //       child: Padding(
                                    //         padding: const EdgeInsets.only(
                                    //             left: 15,
                                    //             right: 15,
                                    //             top: 2,
                                    //             bottom: 2),
                                    //         child: Center(
                                    //             child: Text(
                                    //               'Accossories'.toUpperCase(),
                                    //               style: poppins.copyWith(
                                    //                   color: Colors.black,
                                    //                   fontSize: 12,
                                    //                   fontWeight: FontWeight
                                    //                       .w600),
                                    //             )),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       left: 3, right: 3),
                                    //   // Add some spacing between items
                                    //   child: InkWell(
                                    //     child: Container(
                                    //       // width: 80,
                                    //       height: 40,
                                    //       decoration: BoxDecoration(
                                    //         // color: Colors.greenAccent,
                                    //           borderRadius:
                                    //           BorderRadius.circular(3),
                                    //           color: Colors.transparent,
                                    //           border: Border.all(
                                    //             color: Colors.grey,
                                    //             width: 1,
                                    //           )),
                                    //       // margin: EdgeInsets.all(10),
                                    //       // padding: EdgeInsets.all(5),
                                    //       child: Padding(
                                    //         padding: const EdgeInsets.only(
                                    //             left: 15,
                                    //             right: 15,
                                    //             top: 2,
                                    //             bottom: 2),
                                    //         child: Center(
                                    //             child: Text(
                                    //               'Watchws'.toUpperCase(),
                                    //               style: poppins.copyWith(
                                    //                   color: Colors.black,
                                    //                   fontSize: 12,
                                    //                   fontWeight: FontWeight
                                    //                       .w600),
                                    //             )),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 10),

                /// ====/@ Body

                if (widget.page == AppConstants.SECTION ||
                    widget.page == AppConstants.SUBSECTION ||
                    widget.page == AppConstants.CHILDSECTION) ...{

                  /// ====/@ Section Page View @/====

                  if(controller.isLoading) const ProductShimmer()
                  else
                    if(controller.productsFound)
                      Column(
                        children: [
                          Text(
                            "Showing ${controller?.sectionHomepageList.length ?? 0} results",
                            style: poppins.copyWith(
                                fontSize: 10, color: Colors.grey),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.52,
                                ),
                                itemCount: controller?.sectionHomepageList.length ?? 0,
                                // Since you want only one item per GridView, set itemCount to 1
                                itemBuilder: (BuildContext context,
                                    int index) {

                                  List<String> productImage=[];
                                    String? pic1= controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                    String? pic2=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                    String? pic3=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                    String? pic4=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                    String? pic5=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

                                  if(pic1!=null){
                                    productImage.add(pic1!);
                                  }

                                  if(pic2!=null){
                                    productImage.add(pic2!);
                                  }
                                  if(pic3!=null){
                                    productImage.add(pic3!);
                                  }
                                  if(pic4!=null){
                                    productImage.add(pic4!);
                                  }
                                  if(pic5!=null){
                                    productImage.add(pic5!);
                                  }

                                  return Container(
                                    // color: Colors.deepPurpleAccent,
                                    color: const Color(0xffFAFBFB),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(ProductDetailsPage(
                                          productId: controller!.sectionHomepageList[index].id.toString(),
                                          brandId: controller.sectionHomepageList[index]?.brandId?.toString(),
                                          childCategorieId: mainController.sectionHomepageList?.map<int>((item){
                                            return item.childCategories?[index]?.childCategoryProduct?.childCategoryId ?? 0;
                                          }).toList(),
                                          // childCategorieId: controller.sectionHomepageList[index].childCategories?[0].childCategoryProduct?.childCategoryId ?? 0,
                                          pageId: controller.sectionHomepageList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                        ));
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: Get.height / 3.2,
                                            child: Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                CarouselSlider(
                                                  items: productImage.map((i) {
                                                    return Builder(
                                                      builder: (BuildContextcontext) {
                                                        return Container(
                                                          decoration: const BoxDecoration(
                                                            color: Color(0xffFBFBFB),),
                                                          child: ClipRRect(
                                                            child: CustomImageCached(
                                                              image: '${AppConstants.BASE_URL}$i',
                                                              fit: BoxFit.fill,
                                                              isRound: false,),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }).toList(),
                                                  options: CarouselOptions(
                                                    disableCenter: true,
                                                    viewportFraction: 1,
                                                    autoPlayInterval:
                                                    const Duration(seconds: 7),
                                                    height: Get.height / 2.4,
                                                    scrollDirection: Axis.horizontal,
                                                    onPageChanged: (index, reason) {
                                                      setState(() {
                                                        currentIndex = index; // If you want to track carousel index separately
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 20,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      for (int i = 0; i < productImage.length; i++)
                                                        TabPageSelectorIndicator(
                                                          backgroundColor: i == currentIndex ? silvercolor : gold,
                                                          borderColor: i == currentIndex ? silvercolor : gold,
                                                          size: 7,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Container(
                                                      color: Colors.grey.shade300,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                        child: controller?.sectionHomepageList[index].season != null ?
                                                        Text((controller?.sectionHomepageList[index].season?.seasonName ?? "").toUpperCase(),
                                                          style: poppins.copyWith(
                                                              color: Colors.black,
                                                              fontSize: 9
                                                          ),
                                                        ) : const SizedBox(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 10,
                                                  right: 10,
                                                  child: buildProductWishButton(
                                                      controller?.sectionHomepageList[index].id?.toString()),
                                                ),
                                                Positioned(
                                                  top: 10,
                                                  left: 10,
                                                  child: InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                        context: context,
                                                        builder: (
                                                            BuildContext context) {
                                                          return SimilarPopup(id: controller?.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                        },
                                                      );
                                                    },
                                                    child: SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Image.asset(Images.similar,
                                                            color: silvercolor,
                                                            height: 20,
                                                            width: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 25),
                                            child: Text(
                                              (controller?.sectionHomepageList[index].brand?.brandName ?? "").toUpperCase(),
                                              maxLines: 1,
                                              style: railway.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Text(
                                              controller?.sectionHomepageList[index].name ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: poppins.copyWith(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 12,
                                                  color: Colors.black
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),

                                          /// main
                                          controller?.sectionHomepageList[index].discount == null || controller?.sectionHomepageList[index].discount == 0
                                              ? Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Text(
                                              "${controller?.sectionHomepageList[index].price ?? ''} BDT",
                                              style: poppins.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: gold,
                                                  fontSize: 12
                                              ),
                                            ),
                                          )
                                              : Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${controller?.sectionHomepageList[index].discountedPrice ?? ''} BDT",
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.w600,
                                                      color: gold,
                                                      fontSize: 12
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  "${controller?.sectionHomepageList[index].price ?? ''} BDT",
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.w600,
                                                      decoration: TextDecoration.lineThrough,
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                          ),
                        ],
                      )
                    else
                      const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))


                  /// ==/@ Section NewIn Page View
                  // if(widget.indexId == 2)
                  //   if(controller.isLoading) const ProductShimmer()
                  //   else
                  //     if(controller.productsFound)
                  //       Column(
                  //         children: [
                  //           Text(
                  //             "Showing ${controller?.sectionNewInList.length ?? 0} results",
                  //             style: poppins.copyWith(
                  //                 fontSize: 10, color: Colors.grey),
                  //           ),
                  //           const SizedBox(height: 12),
                  //           Padding(
                  //               padding: const EdgeInsets.only(
                  //                   left: 12, right: 12),
                  //               child: GridView.builder(
                  //                 physics: const NeverScrollableScrollPhysics(),
                  //                 shrinkWrap: true,
                  //                 gridDelegate:
                  //                 const SliverGridDelegateWithFixedCrossAxisCount(
                  //                   crossAxisCount: 2,
                  //                   mainAxisSpacing: 15,
                  //                   crossAxisSpacing: 10,
                  //                   childAspectRatio: 0.52,
                  //                 ),
                  //                 itemCount: controller?.sectionNewInList.length ?? 0,
                  //                 // Since you want only one item per GridView, set itemCount to 1
                  //                 itemBuilder: (BuildContext context, int index) {
                  //                   return Container(
                  //                     // color: Colors.deepPurpleAccent,
                  //                     color: const Color(0xffFAFBFB),
                  //                     child: InkWell(
                  //                       onTap: () {
                  //                         Get.to(ProductDetailsPage(
                  //                           productId: controller!.sectionNewInList[index].id.toString(),
                  //                           brandId: controller.sectionNewInList[index]?.brandId?.toString(),
                  //                           pageId: controller.sectionNewInList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                  //                         ));
                  //                       },
                  //                       child: Column(
                  //                         mainAxisAlignment: MainAxisAlignment.center,
                  //                         crossAxisAlignment: CrossAxisAlignment.center,
                  //                         children: [
                  //                           SizedBox(
                  //                             height: Get.height / 3.2,
                  //                             child: Stack(
                  //                               alignment: Alignment.topCenter,
                  //                               children: [
                  //                                 CarouselSlider(
                  //                                   items: [
                  //                                     // ... Your carousel items
                  //                                     // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                  //                                     controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].frontPhoto,
                  //                                     controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].backsidePhoto,
                  //                                     controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].details1Photo,
                  //                                     controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].details2Photo,
                  //                                     controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].outfitPhoto,
                  //                                   ].map((i) {
                  //                                     return Builder(
                  //                                       builder: (BuildContextcontext) {
                  //                                         return Container(
                  //                                           decoration: const BoxDecoration(
                  //                                             color: Color(0xffFBFBFB),),
                  //                                           child: ClipRRect(
                  //                                             child: CustomImageCached(
                  //                                               image: '${AppConstants.BASE_URL}$i',
                  //                                               fit: BoxFit.fill,
                  //                                               isRound: false,),
                  //                                           ),
                  //                                         );
                  //                                       },
                  //                                     );
                  //                                   }).toList(),
                  //                                   options: CarouselOptions(
                  //                                     disableCenter: true,
                  //                                     viewportFraction: 1,
                  //                                     autoPlayInterval:
                  //                                     const Duration(seconds: 7),
                  //                                     height: Get.height / 2.4,
                  //                                     scrollDirection: Axis.horizontal,
                  //                                     onPageChanged: (index, reason) {
                  //                                       setState(() {
                  //                                         currentIndex = index; // If you want to track carousel index separately
                  //                                       });
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   bottom: 20,
                  //                                   child: Row(
                  //                                     mainAxisAlignment: MainAxisAlignment.center,
                  //                                     children: [
                  //                                       for (int i = 0; i < currentIndex; i++)
                  //                                         TabPageSelectorIndicator(
                  //                                           backgroundColor: i == currentIndex ? silvercolor : gold,
                  //                                           borderColor: i == currentIndex ? silvercolor : gold,
                  //                                           size: 7,
                  //                                         ),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   bottom: 0,
                  //                                   child: Align(
                  //                                     alignment: Alignment.bottomCenter,
                  //                                     child: Container(
                  //                                       color: Colors.grey.shade300,
                  //                                       child: Padding(
                  //                                         padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                  //                                         child: controller?.sectionNewInList[index].season != null ?
                  //                                         Text((controller?.sectionNewInList[index].season?.seasonName ?? "").toUpperCase(),
                  //                                           style: poppins.copyWith(
                  //                                               color: Colors.black,
                  //                                               fontSize: 9
                  //                                           ),
                  //                                         ) : const SizedBox(),
                  //                                       ),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   top: 10,
                  //                                   right: 10,
                  //                                   child: buildProductWishButton(
                  //                                       controller?.sectionNewInList[index].id?.toString()),
                  //                                 ),
                  //                                 Positioned(
                  //                                   top: 10,
                  //                                   left: 10,
                  //                                   child: InkWell(
                  //                                     onTap: () {
                  //                                       showModalBottomSheet(
                  //                                         context: context,
                  //                                         builder: (
                  //                                             BuildContext context) {
                  //                                           return SimilarPopup(id: controller?.sectionNewInList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                  //                                         },
                  //                                       );
                  //                                     },
                  //                                     child: SizedBox(
                  //                                       height: 30,
                  //                                       width: 30,
                  //                                       child: Padding(
                  //                                         padding: const EdgeInsets.all(5),
                  //                                         child: Image.asset(Images.similar,
                  //                                             color: silvercolor,
                  //                                             height: 20,
                  //                                             width: 20),
                  //                                       ),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 8),
                  //                           Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 25),
                  //                             child: Text(
                  //                               (controller?.sectionNewInList[index].brand?.brandName ?? "").toUpperCase(),
                  //                               maxLines: 1,
                  //                               style: railway.copyWith(
                  //                                   fontSize: 16,
                  //                                   fontWeight: FontWeight.w600),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 5),
                  //                           Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Text(
                  //                               controller?.sectionNewInList[index].name ?? "",
                  //                               overflow: TextOverflow.ellipsis,
                  //                               maxLines: 1,
                  //                               style: poppins.copyWith(
                  //                                   fontWeight: FontWeight.w200,
                  //                                   fontSize: 12,
                  //                                   color: Colors.black
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 5),
                  //
                  //                           /// main
                  //                           controller?.sectionNewInList[index].discount == null || controller?.sectionNewInList[index].discount == 0
                  //                               ? Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Text(
                  //                               "${controller?.sectionNewInList[index].price ?? ''} BDT",
                  //                               style: poppins.copyWith(
                  //                                   fontWeight: FontWeight.w600,
                  //                                   color: gold,
                  //                                   fontSize: 12
                  //                               ),
                  //                             ),
                  //                           )
                  //                               : Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Column(
                  //                               children: [
                  //                                 Text(
                  //                                   "${controller?.sectionNewInList[index].discountedPrice ?? ''} BDT",
                  //                                   style: poppins.copyWith(
                  //                                       fontWeight: FontWeight.w600,
                  //                                       color: gold,
                  //                                       fontSize: 12
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(height: 4),
                  //                                 Text(
                  //                                   "${controller?.sectionNewInList[index].price ?? ''} BDT",
                  //                                   style: poppins.copyWith(
                  //                                       fontWeight: FontWeight.w600,
                  //                                       decoration: TextDecoration.lineThrough,
                  //                                       color: Colors.red,
                  //                                       fontSize: 12),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               )
                  //           ),
                  //         ],
                  //       )
                  //     else
                  //       const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))

                  /// ==/@ Sell Page View
                  // if(widget.indexId == 4)
                  //   if(controller.isLoading) const ProductShimmer()
                  //   else
                  //     if(controller.productsFound)
                  //       Column(
                  //         children: [
                  //           Text("Showing ${controller?.sellProductList.length ?? 0} results",
                  //             style: poppins.copyWith(
                  //                 fontSize: 10, color: Colors.grey),
                  //           ),
                  //           const SizedBox(height: 12),
                  //           Padding(
                  //               padding: const EdgeInsets.only(
                  //                   left: 12, right: 12),
                  //               child: GridView.builder(
                  //                 physics: const NeverScrollableScrollPhysics(),
                  //                 shrinkWrap: true,
                  //                 gridDelegate:
                  //                 const SliverGridDelegateWithFixedCrossAxisCount(
                  //                   crossAxisCount: 2,
                  //                   mainAxisSpacing: 15,
                  //                   crossAxisSpacing: 10,
                  //                   childAspectRatio: 0.52,
                  //                 ),
                  //                 itemCount: controller?.sellProductList.length ?? 0,
                  //                 // Since you want only one item per GridView, set itemCount to 1
                  //                 itemBuilder: (BuildContext context,
                  //                     int index) {
                  //                   return Container(
                  //                     // color: Colors.deepPurpleAccent,
                  //                     color: const Color(0xffFAFBFB),
                  //                     child: InkWell(
                  //                       onTap: () {
                  //                         Get.to(ProductDetailsPage(
                  //                           productId: controller!.sellProductList[index].id.toString(),
                  //                           brandId: controller.sellProductList[index]?.brandId?.toString(),
                  //                           pageId: controller.sellProductList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                  //                         ));
                  //                       },
                  //                       child: Column(
                  //                         mainAxisAlignment: MainAxisAlignment.center,
                  //                         crossAxisAlignment: CrossAxisAlignment.center,
                  //                         children: [
                  //                           SizedBox(
                  //                             height: Get.height / 3.2,
                  //                             child: Stack(
                  //                               alignment: Alignment.topCenter,
                  //                               children: [
                  //                                 CarouselSlider(
                  //                                   items: [
                  //                                     // ... Your carousel items
                  //                                     // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                  //                                     controller
                  //                                         ?.sellProductList[index]
                  //                                         .productColorVariants?[controller
                  //                                         .sectedColorVAriantIndex]
                  //                                         .frontPhoto,
                  //                                     controller
                  //                                         ?.sellProductList[index]
                  //                                         .productColorVariants?[controller
                  //                                         .sectedColorVAriantIndex]
                  //                                         .backsidePhoto,
                  //                                     controller
                  //                                         ?.sellProductList[index]
                  //                                         .productColorVariants?[controller
                  //                                         .sectedColorVAriantIndex]
                  //                                         .details1Photo,
                  //                                     controller
                  //                                         ?.sellProductList[index]
                  //                                         .productColorVariants?[controller
                  //                                         .sectedColorVAriantIndex]
                  //                                         .details2Photo,
                  //                                     controller
                  //                                         ?.sellProductList[index]
                  //                                         .productColorVariants?[controller
                  //                                         .sectedColorVAriantIndex]
                  //                                         .outfitPhoto,
                  //                                   ].map((i) {
                  //                                     return Builder(
                  //                                       builder: (BuildContextcontext) {
                  //                                         return Container(
                  //                                           decoration: const BoxDecoration(
                  //                                             color: Color(
                  //                                                 0xffFBFBFB),),
                  //                                           child: ClipRRect(
                  //                                             child: CustomImageCached(
                  //                                               image: '${AppConstants
                  //                                                   .BASE_URL}$i',
                  //                                               fit: BoxFit
                  //                                                   .fill,
                  //                                               isRound: false,),
                  //                                           ),
                  //                                         );
                  //                                       },
                  //                                     );
                  //                                   }).toList(),
                  //                                   options: CarouselOptions(
                  //                                     disableCenter: true,
                  //                                     viewportFraction: 1,
                  //                                     autoPlayInterval:
                  //                                     const Duration(seconds: 7),
                  //                                     height: Get.height / 2.4,
                  //                                     scrollDirection: Axis.horizontal,
                  //                                     onPageChanged: (index, reason) {
                  //                                       setState(() {
                  //                                         currentIndex = index; // If you want to track carousel index separately
                  //                                       });
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   bottom: 20,
                  //                                   child: Row(
                  //                                     mainAxisAlignment: MainAxisAlignment.center,
                  //                                     children: [
                  //                                       for (int i = 0; i < currentIndex; i++)
                  //                                         TabPageSelectorIndicator(
                  //                                           backgroundColor: i == currentIndex ? silvercolor : gold,
                  //                                           borderColor: i == currentIndex ? silvercolor : gold,
                  //                                           size: 7,
                  //                                         ),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   bottom: 0,
                  //                                   child: Align(
                  //                                     alignment: Alignment.bottomCenter,
                  //                                     child: Container(
                  //                                       color: Colors.grey.shade300,
                  //                                       child: Padding(
                  //                                         padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                  //                                         child: controller?.sellProductList[index].season != null ?
                  //                                         Text((controller?.sellProductList[index].season?.seasonName ?? "").toUpperCase(),
                  //                                           style: poppins.copyWith(
                  //                                               color: Colors.black,
                  //                                               fontSize: 9
                  //                                           ),
                  //                                         ) : const SizedBox(),
                  //                                       ),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   top: 10,
                  //                                   right: 10,
                  //                                   child: buildProductWishButton(
                  //                                       controller?.sellProductList[index].id?.toString()),
                  //                                 ),
                  //                                 Positioned(
                  //                                   top: 10,
                  //                                   left: 10,
                  //                                   child: InkWell(
                  //                                     onTap: () {
                  //                                       showModalBottomSheet(
                  //                                         context: context,
                  //                                         builder: (
                  //                                             BuildContext context) {
                  //                                           return SimilarPopup(id: controller?.sellProductList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                  //                                         },
                  //                                       );
                  //                                     },
                  //                                     child: SizedBox(
                  //                                       height: 30,
                  //                                       width: 30,
                  //                                       child: Padding(
                  //                                         padding: const EdgeInsets.all(5),
                  //                                         child: Image.asset(Images.similar,
                  //                                             color: silvercolor,
                  //                                             height: 20,
                  //                                             width: 20),
                  //                                       ),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 8),
                  //                           Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 25),
                  //                             child: Text(
                  //                               (controller?.sellProductList[index].brand?.name ?? "").toUpperCase(),
                  //                               maxLines: 1,
                  //                               style: railway.copyWith(
                  //                                   fontSize: 16,
                  //                                   fontWeight: FontWeight
                  //                                       .w600),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 5),
                  //                           Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Text(
                  //                               controller?.sellProductList[index].name ?? "",
                  //                               overflow: TextOverflow.ellipsis,
                  //                               maxLines: 1,
                  //                               style: poppins.copyWith(
                  //                                   fontWeight: FontWeight.w200,
                  //                                   fontSize: 12,
                  //                                   color: Colors.black
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 5),
                  //
                  //                           /// main
                  //                           controller?.sellProductList[index].discount == null || controller?.sellProductList[index].discount == 0 ?
                  //                           Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Text(
                  //                               "${controller?.sellProductList[index].price ?? ''} BDT",
                  //                               style: poppins.copyWith(
                  //                                   fontWeight: FontWeight.w600,
                  //                                   color: gold,
                  //                                   fontSize: 12
                  //                               ),
                  //                             ),
                  //                           ) :
                  //                           Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Column(
                  //                               children: [
                  //                                 Text(
                  //                                   "${controller?.sellProductList[index].discountedPrice ?? ''} BDT",
                  //                                   style: poppins.copyWith(
                  //                                       fontWeight: FontWeight
                  //                                           .w600,
                  //                                       color: gold,
                  //                                       fontSize: 12
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(height: 4),
                  //                                 Text(
                  //                                   "${controller?.sellProductList[index].price ?? ''} BDT",
                  //                                   style: poppins.copyWith(
                  //                                       fontWeight: FontWeight
                  //                                           .w600,
                  //                                       decoration: TextDecoration
                  //                                           .lineThrough,
                  //                                       color: Colors.red,
                  //                                       fontSize: 12),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               )
                  //           ),
                  //         ],
                  //       )
                  //     else
                  //       const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                  //
                  //
                  /// ==/@ Section Page View
                  //
                  // else
                  //   if(controller.isLoading) const ProductShimmer()
                  //   else
                  //     if(controller.productsFound)
                  //       Column(
                  //         children: [
                  //           Text(
                  //             "Showing ${controller?.sectionHomepageList.length ?? 0} results",
                  //             style: poppins.copyWith(
                  //                 fontSize: 10, color: Colors.grey),
                  //           ),
                  //           const SizedBox(height: 12),
                  //           Padding(
                  //               padding: const EdgeInsets.only(
                  //                   left: 12, right: 12),
                  //               child: GridView.builder(
                  //                 physics: const NeverScrollableScrollPhysics(),
                  //                 shrinkWrap: true,
                  //                 gridDelegate:
                  //                 const SliverGridDelegateWithFixedCrossAxisCount(
                  //                   crossAxisCount: 2,
                  //                   mainAxisSpacing: 15,
                  //                   crossAxisSpacing: 10,
                  //                   childAspectRatio: 0.52,
                  //                 ),
                  //                 itemCount: controller?.sectionHomepageList.length ?? 0,
                  //                 // Since you want only one item per GridView, set itemCount to 1
                  //                 itemBuilder: (BuildContext context,
                  //                     int index) {
                  //                   return Container(
                  //                     // color: Colors.deepPurpleAccent,
                  //                     color: const Color(0xffFAFBFB),
                  //                     child: InkWell(
                  //                       onTap: () {
                  //                         Get.to(ProductDetailsPage(
                  //                           productId: controller!.sectionHomepageList[index].id.toString(),
                  //                           brandId: controller.sectionHomepageList[index]?.brandId?.toString(),
                  //                           pageId: controller.sectionHomepageList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                  //                         ));
                  //                       },
                  //                       child: Column(
                  //                         mainAxisAlignment: MainAxisAlignment.center,
                  //                         crossAxisAlignment: CrossAxisAlignment.center,
                  //                         children: [
                  //                           SizedBox(
                  //                             height: Get.height / 3.2,
                  //                             child: Stack(
                  //                               alignment: Alignment.topCenter,
                  //                               children: [
                  //                                 CarouselSlider(
                  //                                   items: [
                  //                                     // ... Your carousel items
                  //                                     // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                  //                                     controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex].frontPhoto,
                  //                                     controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex].backsidePhoto,
                  //                                     controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex].details1Photo,
                  //                                     controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex].details2Photo,
                  //                                     controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex].outfitPhoto,
                  //                                   ].map((i) {
                  //                                     return Builder(
                  //                                       builder: (BuildContextcontext) {
                  //                                         return Container(
                  //                                           decoration: const BoxDecoration(
                  //                                             color: Color(0xffFBFBFB),),
                  //                                           child: ClipRRect(
                  //                                             child: CustomImageCached(
                  //                                               image: '${AppConstants.BASE_URL}$i',
                  //                                               fit: BoxFit.fill,
                  //                                               isRound: false,),
                  //                                           ),
                  //                                         );
                  //                                       },
                  //                                     );
                  //                                   }).toList(),
                  //                                   options: CarouselOptions(
                  //                                     disableCenter: true,
                  //                                     viewportFraction: 1,
                  //                                     autoPlayInterval:
                  //                                     const Duration(seconds: 7),
                  //                                     height: Get.height / 2.4,
                  //                                     scrollDirection: Axis.horizontal,
                  //                                     onPageChanged: (index, reason) {
                  //                                       setState(() {
                  //                                         currentIndex = index; // If you want to track carousel index separately
                  //                                       });
                  //                                     },
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   bottom: 20,
                  //                                   child: Row(
                  //                                     mainAxisAlignment: MainAxisAlignment.center,
                  //                                     children: [
                  //                                       for (int i = 0; i < currentIndex; i++)
                  //                                         TabPageSelectorIndicator(
                  //                                           backgroundColor: i == currentIndex ? silvercolor : gold,
                  //                                           borderColor: i == currentIndex ? silvercolor : gold,
                  //                                           size: 7,
                  //                                         ),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   bottom: 0,
                  //                                   child: Align(
                  //                                     alignment: Alignment.bottomCenter,
                  //                                     child: Container(
                  //                                       color: Colors.grey.shade300,
                  //                                       child: Padding(
                  //                                         padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                  //                                         child: controller?.sectionHomepageList[index].season != null ?
                  //                                         Text((controller?.sectionHomepageList[index].season?.seasonName ?? "").toUpperCase(),
                  //                                           style: poppins.copyWith(
                  //                                               color: Colors.black,
                  //                                               fontSize: 9
                  //                                           ),
                  //                                         ) : const SizedBox(),
                  //                                       ),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Positioned(
                  //                                   top: 10,
                  //                                   right: 10,
                  //                                   child: buildProductWishButton(
                  //                                       controller?.sectionHomepageList[index].id?.toString()),
                  //                                 ),
                  //                                 Positioned(
                  //                                   top: 10,
                  //                                   left: 10,
                  //                                   child: InkWell(
                  //                                     onTap: () {
                  //                                       showModalBottomSheet(
                  //                                         context: context,
                  //                                         builder: (
                  //                                             BuildContext context) {
                  //                                           return SimilarPopup(id: controller?.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                  //                                         },
                  //                                       );
                  //                                     },
                  //                                     child: SizedBox(
                  //                                       height: 30,
                  //                                       width: 30,
                  //                                       child: Padding(
                  //                                         padding: const EdgeInsets.all(5),
                  //                                         child: Image.asset(Images.similar,
                  //                                             color: silvercolor,
                  //                                             height: 20,
                  //                                             width: 20),
                  //                                       ),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 8),
                  //                           Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 25),
                  //                             child: Text(
                  //                               (controller?.sectionHomepageList[index].brand?.brandName ?? "").toUpperCase(),
                  //                               maxLines: 1,
                  //                               style: railway.copyWith(
                  //                                   fontSize: 16,
                  //                                   fontWeight: FontWeight.w600),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 5),
                  //                           Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Text(
                  //                               controller?.sectionHomepageList[index].name ?? "",
                  //                               overflow: TextOverflow.ellipsis,
                  //                               maxLines: 1,
                  //                               style: poppins.copyWith(
                  //                                   fontWeight: FontWeight.w200,
                  //                                   fontSize: 12,
                  //                                   color: Colors.black
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           const SizedBox(height: 5),
                  //
                  //                           /// main
                  //                           controller?.sectionHomepageList[index].discount == null || controller?.sectionHomepageList[index].discount == 0
                  //                               ? Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Text(
                  //                               "${controller?.sectionHomepageList[index].price ?? ''} BDT",
                  //                               style: poppins.copyWith(
                  //                                   fontWeight: FontWeight.w600,
                  //                                   color: gold,
                  //                                   fontSize: 12
                  //                               ),
                  //                             ),
                  //                           )
                  //                               : Padding(
                  //                             padding: const EdgeInsets.symmetric(horizontal: 4),
                  //                             child: Column(
                  //                               children: [
                  //                                 Text(
                  //                                   "${controller?.sectionHomepageList[index].discountedPrice ?? ''} BDT",
                  //                                   style: poppins.copyWith(
                  //                                       fontWeight: FontWeight.w600,
                  //                                       color: gold,
                  //                                       fontSize: 12
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(height: 4),
                  //                                 Text(
                  //                                   "${controller?.sectionHomepageList[index].price ?? ''} BDT",
                  //                                   style: poppins.copyWith(
                  //                                       fontWeight: FontWeight.w600,
                  //                                       decoration: TextDecoration.lineThrough,
                  //                                       color: Colors.red,
                  //                                       fontSize: 12),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               )
                  //           ),
                  //         ],
                  //       )
                  //     else
                  //       const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))



                }


                /// ====/@ Category Page View @/====
                else
                  if (widget.page == AppConstants.CATEGORY) ...{

                    if(controller.isLoading) const ProductShimmer()
                    else
                      if(controller.productsFound)
                        Column(
                          children: [
                            Text(
                              "Showing ${controller?.categoryProductList.length ?? 0} results",
                              style: poppins.copyWith(
                                  fontSize: 10, color: Colors.grey),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.52,
                                  ),
                                  itemCount: controller?.categoryProductList.length ?? 0,
                                  // Since you want only one item per GridView, set itemCount to 1
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    return Container(
                                      // color: Colors.deepPurpleAccent,
                                      color: const Color(0xffFAFBFB),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(ProductDetailsPage(
                                            productId: controller!.categoryProductList[index].id.toString(),
                                            brandId: controller.categoryProductList[index]?.brandId?.toString(),
                                            pageId: controller.categoryProductList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                          ));
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: Get.height / 3.2,
                                              child: Stack(
                                                alignment: Alignment.topCenter,
                                                children: [
                                                  CarouselSlider(
                                                    items: [
                                                      // ... Your carousel items
                                                      // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                      controller
                                                          ?.categoryProductList[index]
                                                          .productColorVariants?[controller
                                                          .sectedColorVAriantIndex]
                                                          .frontPhoto,
                                                      controller
                                                          ?.categoryProductList[index]
                                                          .productColorVariants?[controller
                                                          .sectedColorVAriantIndex]
                                                          .backsidePhoto,
                                                      controller
                                                          ?.categoryProductList[index]
                                                          .productColorVariants?[controller
                                                          .sectedColorVAriantIndex]
                                                          .details1Photo,
                                                      controller
                                                          ?.categoryProductList[index]
                                                          .productColorVariants?[controller
                                                          .sectedColorVAriantIndex]
                                                          .details2Photo,
                                                      controller
                                                          ?.categoryProductList[index]
                                                          .productColorVariants?[controller
                                                          .sectedColorVAriantIndex]
                                                          .outfitPhoto,
                                                    ].map((i) {
                                                      return Builder(
                                                        builder: (BuildContextcontext) {
                                                          return Container(
                                                            decoration: const BoxDecoration(
                                                              color: Color(
                                                                  0xffFBFBFB),),
                                                            child: ClipRRect(
                                                              child: CustomImageCached(
                                                                image: '${AppConstants
                                                                    .BASE_URL}$i',
                                                                fit: BoxFit
                                                                    .fill,
                                                                isRound: false,),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }).toList(),
                                                    options: CarouselOptions(
                                                      disableCenter: true,
                                                      viewportFraction: 1,
                                                      autoPlayInterval:
                                                      const Duration(seconds: 7),
                                                      height: Get.height / 2.4,
                                                      scrollDirection: Axis.horizontal,
                                                      onPageChanged: (index, reason) {
                                                        setState(() {
                                                          currentIndex = index; // If you want to track carousel index separately
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 20,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        for (int i = 0; i < currentIndex; i++)
                                                          TabPageSelectorIndicator(
                                                            backgroundColor: i == currentIndex ? silvercolor : gold,
                                                            borderColor: i == currentIndex ? silvercolor : gold,
                                                            size: 7,
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    child: Align(
                                                      alignment: Alignment.bottomCenter,
                                                      child: Container(
                                                        color: Colors.grey.shade300,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                          child: controller?.categoryProductList[index].season != null ?
                                                          Text((controller?.categoryProductList[index].season?.seasonName ?? "").toUpperCase(),
                                                            style: poppins.copyWith(
                                                                color: Colors.black,
                                                                fontSize: 9
                                                            ),
                                                          ) : const SizedBox(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 10,
                                                    right: 10,
                                                    child: buildProductWishButton(
                                                        widget.controller2?.sectionHomepageList[index].id?.toString()),
                                                  ),
                                                  Positioned(
                                                    top: 10,
                                                    left: 10,
                                                    child: InkWell(
                                                      onTap: () {
                                                        showModalBottomSheet(
                                                          context: context,
                                                          builder: (
                                                              BuildContext context) {
                                                            return SimilarPopup(id: controller?.categoryProductList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                          },
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        height: 30,
                                                        width: 30,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5),
                                                          child: Image.asset(Images.similar,
                                                              color: silvercolor,
                                                              height: 20,
                                                              width: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 25),
                                              child: Text(
                                                (controller?.categoryProductList[index].brand?.brandName ?? "").toUpperCase(),
                                                maxLines: 1,
                                                style: railway.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w600),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Text(
                                                controller?.categoryProductList[index].name ?? "",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: poppins.copyWith(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    color: Colors.black
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),

                                            /// main
                                            controller?.categoryProductList[index].discount == null || controller?.categoryProductList[index].discount == 0 ?
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Text(
                                                "${controller?.categoryProductList[index].price ?? ''} BDT",
                                                style: poppins.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: gold,
                                                    fontSize: 12
                                                ),
                                              ),
                                            )
                                                :
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${controller?.categoryProductList[index].discountedPrice ?? ''} BDT",
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        color: gold,
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    "${controller?.categoryProductList[index].price ?? ''} BDT",
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        color: Colors.red,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                            ),
                          ],
                        )
                      else
                        const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))

                  }

                  /// ====/@ New In Page View @/====
                  else
                    if (widget.page == AppConstants.newIn) ...{

                      if(controller.isLoading) const ProductShimmer()
                      else
                        if(controller.productsFound)
                          Column(
                            children: [
                              Text(
                                "Showing ${controller?.sectionNewInList.length ?? 0} results",
                                style: poppins.copyWith(
                                    fontSize: 10, color: Colors.grey),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 0.52,
                                    ),
                                    itemCount: controller?.sectionNewInList.length ?? 0,
                                    // Since you want only one item per GridView, set itemCount to 1
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        // color: Colors.deepPurpleAccent,
                                        color: const Color(0xffFAFBFB),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(ProductDetailsPage(
                                              productId: controller!.sectionNewInList[index].id.toString(),
                                              brandId: controller.sectionNewInList[index]?.brandId?.toString(),
                                              pageId: controller.sectionNewInList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                            ));
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Get.height / 3.2,
                                                child: Stack(
                                                  alignment: Alignment.topCenter,
                                                  children: [
                                                    CarouselSlider(
                                                      items: [
                                                        // ... Your carousel items
                                                        // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                        controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].frontPhoto,
                                                        controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].backsidePhoto,
                                                        controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].details1Photo,
                                                        controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].details2Photo,
                                                        controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex].outfitPhoto,
                                                      ].map((i) {
                                                        return Builder(
                                                          builder: (BuildContextcontext) {
                                                            return Container(
                                                              decoration: const BoxDecoration(
                                                                color: Color(0xffFBFBFB),),
                                                              child: ClipRRect(
                                                                child: CustomImageCached(
                                                                  image: '${AppConstants.BASE_URL}$i',
                                                                  fit: BoxFit.fill,
                                                                  isRound: false,),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }).toList(),
                                                      options: CarouselOptions(
                                                        disableCenter: true,
                                                        viewportFraction: 1,
                                                        autoPlayInterval:
                                                        const Duration(seconds: 7),
                                                        height: Get.height / 2.4,
                                                        scrollDirection: Axis.horizontal,
                                                        onPageChanged: (index, reason) {
                                                          setState(() {
                                                            currentIndex = index; // If you want to track carousel index separately
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 20,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          for (int i = 0; i < currentIndex; i++)
                                                            TabPageSelectorIndicator(
                                                              backgroundColor: i == currentIndex ? silvercolor : gold,
                                                              borderColor: i == currentIndex ? silvercolor : gold,
                                                              size: 7,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      child: Align(
                                                        alignment: Alignment.bottomCenter,
                                                        child: Container(
                                                          color: Colors.grey.shade300,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                            child: controller?.sectionNewInList[index].season != null ?
                                                            Text((controller?.sectionNewInList[index].season?.seasonName ?? "").toUpperCase(),
                                                              style: poppins.copyWith(
                                                                  color: Colors.black,
                                                                  fontSize: 9
                                                              ),
                                                            ) : const SizedBox(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      right: 10,
                                                      child: buildProductWishButton(
                                                          controller?.sectionNewInList[index].id?.toString()),
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      left: 10,
                                                      child: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return SimilarPopup(id: controller?.sectionNewInList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                            },
                                                          );
                                                        },
                                                        child: SizedBox(
                                                          height: 30,
                                                          width: 30,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(5),
                                                            child: Image.asset(Images.similar,
                                                                color: silvercolor,
                                                                height: 20,
                                                                width: 20),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                                child: Text(
                                                  (controller?.sectionNewInList[index].brand?.brandName ?? "").toUpperCase(),
                                                  maxLines: 1,
                                                  style: railway.copyWith(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  controller?.sectionNewInList[index].name ?? "",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.w200,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 5),

                                              /// main
                                              controller?.sectionNewInList[index].discount == null || controller?.sectionNewInList[index].discount == 0
                                                  ? Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  "${controller?.sectionNewInList[index].price ?? ''} BDT",
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.w600,
                                                      color: gold,
                                                      fontSize: 12
                                                  ),
                                                ),
                                              )
                                                  : Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${controller?.sectionNewInList[index].discountedPrice ?? ''} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          color: gold,
                                                          fontSize: 12
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      "${controller?.sectionNewInList[index].price ?? ''} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          decoration: TextDecoration.lineThrough,
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                              ),
                            ],
                          )
                        else
                          const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))

                    }


                  /// ====/@ Sub Category Page View @/====
                  else
                    if (widget.page == AppConstants.SUBCATEGORY) ...{

                      if(controller.isLoading) const ProductShimmer()
                      else
                        if(controller.productsFound)
                          Column(
                            children: [
                              Text(
                                "Showing ${controller?.subCategoryList.length ?? 0} results",
                                style: poppins.copyWith(
                                    fontSize: 10, color: Colors.grey),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 0.52,
                                    ),
                                    itemCount: controller?.subCategoryList.length ?? 0,
                                    // Since you want only one item per GridView, set itemCount to 1
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return Container(
                                        // color: Colors.deepPurpleAccent,
                                        color: const Color(0xffFAFBFB),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(ProductDetailsPage(
                                              productId: controller!.subCategoryList[index].id.toString(),
                                              brandId: controller.subCategoryList[index]?.brandId?.toString(),
                                              pageId: controller.subCategoryList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                            ));
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Get.height / 3.2,
                                                child: Stack(
                                                  alignment: Alignment.topCenter,
                                                  children: [
                                                    CarouselSlider(
                                                      items: [
                                                        // ... Your carousel items
                                                        // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                        controller
                                                            ?.subCategoryList[index]
                                                            .productColorVariants?[controller
                                                            .sectedColorVAriantIndex]
                                                            .frontPhoto,
                                                        controller
                                                            ?.subCategoryList[index]
                                                            .productColorVariants?[controller
                                                            .sectedColorVAriantIndex]
                                                            .backsidePhoto,
                                                        controller
                                                            ?.subCategoryList[index]
                                                            .productColorVariants?[controller
                                                            .sectedColorVAriantIndex]
                                                            .details1Photo,
                                                        controller
                                                            ?.subCategoryList[index]
                                                            .productColorVariants?[controller
                                                            .sectedColorVAriantIndex]
                                                            .details2Photo,
                                                        controller
                                                            ?.subCategoryList[index]
                                                            .productColorVariants?[controller
                                                            .sectedColorVAriantIndex]
                                                            .outfitPhoto,
                                                      ].map((i) {
                                                        return Builder(
                                                          builder: (BuildContextcontext) {
                                                            return Container(
                                                              decoration: const BoxDecoration(
                                                                color: Color(
                                                                    0xffFBFBFB),),
                                                              child: ClipRRect(
                                                                child: CustomImageCached(
                                                                  image: '${AppConstants
                                                                      .BASE_URL}$i',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  isRound: false,),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }).toList(),
                                                      options: CarouselOptions(
                                                        disableCenter: true,
                                                        viewportFraction: 1,
                                                        autoPlayInterval:
                                                        const Duration(seconds: 7),
                                                        height: Get.height / 2.4,
                                                        scrollDirection: Axis.horizontal,
                                                        onPageChanged: (index, reason) {
                                                          setState(() {
                                                            currentIndex = index; // If you want to track carousel index separately
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 20,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          for (int i = 0; i < currentIndex; i++)
                                                            TabPageSelectorIndicator(
                                                              backgroundColor: i == currentIndex ? silvercolor : gold,
                                                              borderColor: i == currentIndex ? silvercolor : gold,
                                                              size: 7,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      child: Align(
                                                        alignment: Alignment.bottomCenter,
                                                        child: Container(
                                                          color: Colors.grey.shade300,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                            child: controller?.subCategoryList[index].season != null ?
                                                            Text((controller?.subCategoryList[index].season?.seasonName ?? "").toUpperCase(),
                                                              style: poppins.copyWith(
                                                                  color: Colors.black,
                                                                  fontSize: 9
                                                              ),
                                                            ) : const SizedBox(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      right: 10,
                                                      child: buildProductWishButton(
                                                          controller?.subCategoryList[index].id?.toString()),
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      left: 10,
                                                      child: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                            context: context,
                                                            builder: (
                                                                BuildContext context) {
                                                              return SimilarPopup(id: controller?.subCategoryList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                            },
                                                          );
                                                        },
                                                        child: SizedBox(
                                                          height: 30,
                                                          width: 30,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(5),
                                                            child: Image.asset(Images.similar,
                                                                color: silvercolor,
                                                                height: 20,
                                                                width: 20),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                                child: Text(
                                                  (controller?.subCategoryList[index].brand?.brandName ?? "").toUpperCase(),
                                                  maxLines: 1,
                                                  style: railway.copyWith(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight
                                                          .w600),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  controller?.subCategoryList[index].name ?? "",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.w200,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 5),

                                              /// main
                                              controller?.subCategoryList[index].discount == null || controller?.subCategoryList[index].discount == 0 ?
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  "${controller?.subCategoryList[index].price ?? ''} BDT",
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.w600,
                                                      color: gold,
                                                      fontSize: 12
                                                  ),
                                                ),
                                              )
                                                  :
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${controller?.subCategoryList[index].discountedPrice ?? ''} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          color: gold,
                                                          fontSize: 12
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      "${controller?.subCategoryList[index].price ?? ''} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight
                                                              .w600,
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                              ),
                            ],
                          )
                        else
                          const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))

                    }


                    /// ====/@ Child Category Page View @/====
                    else
                      if (widget.page == AppConstants.CHILDCATEGORY) ...{
                        if(controller.isLoading) const ProductShimmer()
                        else
                          if(controller.productsFound)
                            Column(
                              children: [
                                Text(
                                  "Showing ${controller?.childCategoryList.length ?? 0} results",
                                  style: poppins.copyWith(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: GridView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.52,
                                      ),
                                      itemCount: controller?.childCategoryList.length ?? 0,
                                      // Since you want only one item per GridView, set itemCount to 1
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          // color: Colors.deepPurpleAccent,
                                          color: const Color(0xffFAFBFB),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(ProductDetailsPage(
                                                productId: controller!.childCategoryList[index].id.toString(),
                                                brandId: controller.childCategoryList[index]?.brandId?.toString(),
                                                pageId: controller.childCategoryList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                              ));
                                            },
                                            // child: Container(height: 100, width: 200, color: Colors.red,),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: Get.height / 3.2,
                                                  child: Stack(
                                                    alignment: Alignment.topCenter,
                                                    children: [
                                                      CarouselSlider(
                                                        items: [
                                                          // ... Your carousel items
                                                          // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                          controller
                                                              ?.childCategoryList[index]
                                                              .productColorVariants?[controller
                                                              .sectedColorVAriantIndex]
                                                              .frontPhoto,
                                                          controller
                                                              ?.childCategoryList[index]
                                                              .productColorVariants?[controller
                                                              .sectedColorVAriantIndex]
                                                              .backsidePhoto,
                                                          controller
                                                              ?.childCategoryList[index]
                                                              .productColorVariants?[controller
                                                              .sectedColorVAriantIndex]
                                                              .details1Photo,
                                                          controller
                                                              ?.childCategoryList[index]
                                                              .productColorVariants?[controller
                                                              .sectedColorVAriantIndex]
                                                              .details2Photo,
                                                          controller
                                                              ?.childCategoryList[index]
                                                              .productColorVariants?[controller
                                                              .sectedColorVAriantIndex]
                                                              .outfitPhoto,
                                                        ].map((i) {
                                                          return Builder(
                                                            builder: (BuildContextcontext) {
                                                              return Container(
                                                                decoration: const BoxDecoration(
                                                                  color: Color(
                                                                      0xffFBFBFB),),
                                                                child: ClipRRect(
                                                                  child: CustomImageCached(
                                                                    image: '${AppConstants
                                                                        .BASE_URL}$i',
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    isRound: false,),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }).toList(),
                                                        options: CarouselOptions(
                                                          disableCenter: true,
                                                          viewportFraction: 1,
                                                          autoPlayInterval:
                                                          const Duration(seconds: 7),
                                                          height: Get.height / 2.4,
                                                          scrollDirection: Axis.horizontal,
                                                          onPageChanged: (index, reason) {
                                                            setState(() {
                                                              currentIndex = index; // If you want to track carousel index separately
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 20,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            for (int i = 0; i < currentIndex; i++)
                                                              TabPageSelectorIndicator(
                                                                backgroundColor: i == currentIndex ? silvercolor : gold,
                                                                borderColor: i == currentIndex ? silvercolor : gold,
                                                                size: 7,
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 0,
                                                        child: Align(
                                                          alignment: Alignment.bottomCenter,
                                                          child: Container(
                                                            color: Colors.grey.shade300,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                              child: controller?.childCategoryList[index].season != null ?
                                                              Text((controller?.childCategoryList[index].season?.seasonName ?? "").toUpperCase(),
                                                                style: poppins.copyWith(
                                                                    color: Colors.black,
                                                                    fontSize: 9
                                                                ),
                                                              ) : const SizedBox(),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 10,
                                                        right: 10,
                                                        child: buildProductWishButton(
                                                            controller?.childCategoryList[index].id?.toString()),
                                                      ),
                                                      Positioned(
                                                        top: 10,
                                                        left: 10,
                                                        child: InkWell(
                                                          onTap: () {
                                                            showModalBottomSheet(
                                                              context: context,
                                                              builder: (
                                                                  BuildContext context) {
                                                                return SimilarPopup(id: controller?.childCategoryList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                              },
                                                            );
                                                          },
                                                          child: SizedBox(
                                                            height: 30,
                                                            width: 30,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(5),
                                                              child: Image.asset(Images.similar,
                                                                  color: silvercolor,
                                                                  height: 20,
                                                                  width: 20),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                                  child: Text(
                                                    (controller?.childCategoryList[index].brand?.brandName ?? "").toUpperCase(),
                                                    maxLines: 1,
                                                    style: railway.copyWith(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .w600),
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                                  child: Text(
                                                    controller?.childCategoryList[index].name ?? "",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight.w200,
                                                        fontSize: 12,
                                                        color: Colors.black
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 5),

                                                /// main
                                                controller?.childCategoryList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                                  child: Text(
                                                    "${controller?.childCategoryList[index].price ?? ''} BDT",
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight.w600,
                                                        color: gold,
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                )
                                                    :
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "${controller?.childCategoryList[index].discountedPrice ?? ''} BDT",
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                            color: gold,
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        "${controller?.childCategoryList[index].price ?? ''} BDT",
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                            decoration: TextDecoration.lineThrough,
                                                            color: Colors.red,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                ),
                              ],
                            )
                          else
                            const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                      }


                      /// ====/@ Brand Page View @/====
                      else
                        if (widget.page == AppConstants.BRAND) ...{
                          if(controller.isLoading) const ProductShimmer()
                          else
                            if(controller.productsFound)
                              Column(
                                children: [
                                  Text(
                                    "Showing ${controller?.brandProductList.length ?? 0} results",
                                    style: poppins.copyWith(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: GridView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 0.52,
                                        ),
                                        itemCount: controller?.brandProductList.length ?? 0,
                                        // Since you want only one item per GridView, set itemCount to 1
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
                                            // color: Colors.deepPurpleAccent,
                                            color: const Color(0xffFAFBFB),
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(ProductDetailsPage(
                                                  productId: controller!.brandProductList[index].id.toString(),
                                                  brandId: controller.brandProductList[index]?.brandId?.toString(),
                                                  pageId: controller.brandProductList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                ));
                                              },
                                              // child: Container(height: 100, width: 200, color: Colors.red,),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: Get.height / 3.2,
                                                    child: Stack(
                                                      alignment: Alignment.topCenter,
                                                      children: [
                                                        CarouselSlider(
                                                          items: [
                                                            // ... Your carousel items
                                                            // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                            controller
                                                                ?.brandProductList[index]
                                                                .productColorVariants?[controller
                                                                .sectedColorVAriantIndex]
                                                                .frontPhoto,
                                                            controller
                                                                ?.brandProductList[index]
                                                                .productColorVariants?[controller
                                                                .sectedColorVAriantIndex]
                                                                .backsidePhoto,
                                                            controller
                                                                ?.brandProductList[index]
                                                                .productColorVariants?[controller
                                                                .sectedColorVAriantIndex]
                                                                .details1Photo,
                                                            controller
                                                                ?.brandProductList[index]
                                                                .productColorVariants?[controller
                                                                .sectedColorVAriantIndex]
                                                                .details2Photo,
                                                            controller
                                                                ?.brandProductList[index]
                                                                .productColorVariants?[controller
                                                                .sectedColorVAriantIndex]
                                                                .outfitPhoto,
                                                          ].map((i) {
                                                            return Builder(
                                                              builder: (BuildContextcontext) {
                                                                return Container(
                                                                  decoration: const BoxDecoration(
                                                                    color: Color(
                                                                        0xffFBFBFB),),
                                                                  child: ClipRRect(
                                                                    child: CustomImageCached(
                                                                      image: '${AppConstants
                                                                          .BASE_URL}$i',
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      isRound: false,),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }).toList(),
                                                          options: CarouselOptions(
                                                            disableCenter: true,
                                                            viewportFraction: 1,
                                                            autoPlayInterval:
                                                            const Duration(seconds: 7),
                                                            height: Get.height / 2.4,
                                                            scrollDirection: Axis.horizontal,
                                                            onPageChanged: (index, reason) {
                                                              setState(() {
                                                                currentIndex = index; // If you want to track carousel index separately
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 20,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              for (int i = 0; i < currentIndex; i++)
                                                                TabPageSelectorIndicator(
                                                                  backgroundColor: i == currentIndex ? silvercolor : gold,
                                                                  borderColor: i == currentIndex ? silvercolor : gold,
                                                                  size: 7,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          child: Align(
                                                            alignment: Alignment.bottomCenter,
                                                            child: Container(
                                                              color: Colors.grey.shade300,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                                child: controller?.brandProductList[index].season != null ?
                                                                Text((controller?.brandProductList[index].season?.seasonName ?? "").toUpperCase(),
                                                                  style: poppins.copyWith(
                                                                      color: Colors.black,
                                                                      fontSize: 9
                                                                  ),
                                                                ) : const SizedBox(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 10,
                                                          right: 10,
                                                          child: buildProductWishButton(
                                                              controller?.brandProductList[index].id?.toString()),
                                                        ),
                                                        Positioned(
                                                          top: 10,
                                                          left: 10,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showModalBottomSheet(
                                                                context: context,
                                                                builder: (
                                                                    BuildContext context) {
                                                                  return SimilarPopup(id: controller?.brandProductList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                },
                                                              );
                                                            },
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(5),
                                                                child: Image.asset(Images.similar,
                                                                    color: silvercolor,
                                                                    height: 20,
                                                                    width: 20),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 25),
                                                    child: Text(
                                                      (controller?.brandProductList[index].brand?.brandName ?? "").toUpperCase(),
                                                      maxLines: 1,
                                                      style: railway.copyWith(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                                    child: Text(
                                                      controller?.brandProductList[index].name ?? "",
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w200,
                                                          fontSize: 12,
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),

                                                  /// main
                                                  controller?.brandProductList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                                    child: Text(
                                                      "${controller?.brandProductList[index].price ?? ''} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          color: gold,
                                                          fontSize: 12
                                                      ),
                                                    ),
                                                  )
                                                      :
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "${controller?.brandProductList[index].discountedPrice ?? ''} BDT",
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight.w600,
                                                              color: gold,
                                                              fontSize: 12
                                                          ),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          "${controller?.brandProductList[index].price ?? ''} BDT",
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight.w600,
                                                              decoration: TextDecoration.lineThrough,
                                                              color: Colors.red,
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                  ),
                                ],
                              )
                            else
                              const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                        }

                        /// ====/@ Search Page View @/====
                        else
                          if (widget.page == AppConstants.search) ...{
                            if(controller.isLoading) const ProductShimmer()
                            else
                              if(controller.productsFound)
                                Column(
                                  children: [
                                    Text(
                                      "Showing ${controller?.searchProductList.length ?? 0} results",
                                      style: poppins.copyWith(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: GridView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 15,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: 0.52,
                                          ),
                                          itemCount: controller?.searchProductList.length ?? 0,
                                          // Since you want only one item per GridView, set itemCount to 1
                                          itemBuilder: (BuildContext context, int index) {
                                            return Container(
                                              // color: Colors.deepPurpleAccent,
                                              color: const Color(0xffFAFBFB),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(ProductDetailsPage(
                                                    productId: controller!.searchProductList[index].id.toString(),
                                                    brandId: controller.searchProductList[index]?.brandId?.toString(),
                                                    pageId: controller.searchProductList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                  ));
                                                },
                                                // child: Container(height: 100, width: 200, color: Colors.red,),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: Get.height / 3.2,
                                                      child: Stack(
                                                        alignment: Alignment.topCenter,
                                                        children: [
                                                          CarouselSlider(
                                                            items: [
                                                              // ... Your carousel items
                                                              // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                              controller
                                                                  ?.searchProductList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .frontPhoto,
                                                              controller
                                                                  ?.searchProductList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .backsidePhoto,
                                                              controller
                                                                  ?.searchProductList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .details1Photo,
                                                              controller
                                                                  ?.searchProductList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .details2Photo,
                                                              controller
                                                                  ?.searchProductList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .outfitPhoto,
                                                            ].map((i) {
                                                              return Builder(
                                                                builder: (BuildContextcontext) {
                                                                  return Container(
                                                                    decoration: const BoxDecoration(
                                                                      color: Color(
                                                                          0xffFBFBFB),),
                                                                    child: ClipRRect(
                                                                      child: CustomImageCached(
                                                                        image: '${AppConstants
                                                                            .BASE_URL}$i',
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        isRound: false,),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }).toList(),
                                                            options: CarouselOptions(
                                                              disableCenter: true,
                                                              viewportFraction: 1,
                                                              autoPlayInterval:
                                                              const Duration(seconds: 7),
                                                              height: Get.height / 2.4,
                                                              scrollDirection: Axis.horizontal,
                                                              onPageChanged: (index, reason) {
                                                                setState(() {
                                                                  currentIndex = index; // If you want to track carousel index separately
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          Positioned(
                                                            bottom: 20,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                for (int i = 0; i < currentIndex; i++)
                                                                  TabPageSelectorIndicator(
                                                                    backgroundColor: i == currentIndex ? silvercolor : gold,
                                                                    borderColor: i == currentIndex ? silvercolor : gold,
                                                                    size: 7,
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            bottom: 0,
                                                            child: Align(
                                                              alignment: Alignment.bottomCenter,
                                                              child: Container(
                                                                color: Colors.grey.shade300,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                                  child: controller?.searchProductList[index].season != null ?
                                                                  Text((controller?.searchProductList[index].season?.seasonName ?? "").toUpperCase(),
                                                                    style: poppins.copyWith(
                                                                        color: Colors.black,
                                                                        fontSize: 9
                                                                    ),
                                                                  ) : const SizedBox(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            right: 10,
                                                            child: buildProductWishButton(
                                                                controller?.searchProductList[index].id?.toString()),
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            left: 10,
                                                            child: InkWell(
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                  context: context,
                                                                  builder: (
                                                                      BuildContext context) {
                                                                    return SimilarPopup(id: controller?.searchProductList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                  },
                                                                );
                                                              },
                                                              child: SizedBox(
                                                                height: 30,
                                                                width: 30,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(5),
                                                                  child: Image.asset(Images.similar,
                                                                      color: silvercolor,
                                                                      height: 20,
                                                                      width: 20),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 25),
                                                      child: Text(
                                                        (controller?.searchProductList[index].brand?.brandName ?? "").toUpperCase(),
                                                        maxLines: 1,
                                                        style: railway.copyWith(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .w600),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text(
                                                        controller?.searchProductList[index].name ?? "",
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w200,
                                                            fontSize: 12,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),

                                                    /// main
                                                    controller?.searchProductList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text(
                                                        "${controller?.searchProductList[index].price ?? ''} BDT",
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                            color: gold,
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                    )
                                                        :
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "${controller?.searchProductList[index].discountedPrice ?? ''} BDT",
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight.w600,
                                                                color: gold,
                                                                fontSize: 12
                                                            ),
                                                          ),
                                                          const SizedBox(height: 4),
                                                          Text(
                                                            "${controller?.searchProductList[index].price ?? ''} BDT",
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight.w600,
                                                                decoration: TextDecoration.lineThrough,
                                                                color: Colors.red,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                    ),
                                  ],
                                )
                              else
                                const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                          }

                        else
                          if (widget.page == AppConstants.mostPopular) ...{
                            if(controller.isLoading) const ProductShimmer()
                            else
                              if(controller.productsFound)
                                Column(
                                  children: [
                                    Text(
                                      "Showing ${controller?.mostPopularList.length ?? 0} results",
                                      style: poppins.copyWith(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: GridView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 15,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: 0.52,
                                          ),
                                          itemCount: controller?.mostPopularList.length ?? 0,
                                          // Since you want only one item per GridView, set itemCount to 1
                                          itemBuilder: (BuildContext context, int index) {
                                            return Container(
                                              // color: Colors.deepPurpleAccent,
                                              color: const Color(0xffFAFBFB),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(ProductDetailsPage(
                                                    productId: controller!.mostPopularList[index].id.toString(),
                                                    brandId: controller.mostPopularList[index]?.brandId?.toString(),
                                                    pageId: controller.mostPopularList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                  ));
                                                },
                                                // child: Container(height: 100, width: 200, color: Colors.red,),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: Get.height / 3.2,
                                                      child: Stack(
                                                        alignment: Alignment.topCenter,
                                                        children: [
                                                          CarouselSlider(
                                                            items: [
                                                              // ... Your carousel items
                                                              // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                              controller
                                                                  ?.mostPopularList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .frontPhoto,
                                                              controller
                                                                  ?.mostPopularList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .backsidePhoto,
                                                              controller
                                                                  ?.mostPopularList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .details1Photo,
                                                              controller
                                                                  ?.mostPopularList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .details2Photo,
                                                              controller
                                                                  ?.mostPopularList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .outfitPhoto,
                                                            ].map((i) {
                                                              return Builder(
                                                                builder: (BuildContextcontext) {
                                                                  return Container(
                                                                    decoration: const BoxDecoration(
                                                                      color: Color(
                                                                          0xffFBFBFB),),
                                                                    child: ClipRRect(
                                                                      child: CustomImageCached(
                                                                        image: '${AppConstants
                                                                            .BASE_URL}$i',
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        isRound: false,),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }).toList(),
                                                            options: CarouselOptions(
                                                              disableCenter: true,
                                                              viewportFraction: 1,
                                                              autoPlayInterval:
                                                              const Duration(seconds: 7),
                                                              height: Get.height / 2.4,
                                                              scrollDirection: Axis.horizontal,
                                                              onPageChanged: (index, reason) {
                                                                setState(() {
                                                                  currentIndex = index; // If you want to track carousel index separately
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          Positioned(
                                                            bottom: 20,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                for (int i = 0; i < currentIndex; i++)
                                                                  TabPageSelectorIndicator(
                                                                    backgroundColor: i == currentIndex ? silvercolor : gold,
                                                                    borderColor: i == currentIndex ? silvercolor : gold,
                                                                    size: 7,
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            bottom: 0,
                                                            child: Align(
                                                              alignment: Alignment.bottomCenter,
                                                              child: Container(
                                                                color: Colors.grey.shade300,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                                  child: controller?.mostPopularList[index].season != null ?
                                                                  Text((controller?.mostPopularList[index].season?.seasonName ?? "").toUpperCase(),
                                                                    style: poppins.copyWith(
                                                                        color: Colors.black,
                                                                        fontSize: 9
                                                                    ),
                                                                  ) : const SizedBox(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            right: 10,
                                                            child: buildProductWishButton(
                                                                controller?.mostPopularList[index].id?.toString()),
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            left: 10,
                                                            child: InkWell(
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                  context: context,
                                                                  builder: (
                                                                      BuildContext context) {
                                                                    return SimilarPopup(id: controller?.mostPopularList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                  },
                                                                );
                                                              },
                                                              child: SizedBox(
                                                                height: 30,
                                                                width: 30,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(5),
                                                                  child: Image.asset(Images.similar,
                                                                      color: silvercolor,
                                                                      height: 20,
                                                                      width: 20),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 25),
                                                      child: Text(
                                                        (controller?.mostPopularList[index].brand?.brandName ?? "").toUpperCase(),
                                                        maxLines: 1,
                                                        style: railway.copyWith(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .w600),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text(
                                                        controller?.mostPopularList[index].name ?? "",
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w200,
                                                            fontSize: 12,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),

                                                    /// main
                                                    controller?.mostPopularList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text(
                                                        "${controller?.mostPopularList[index].price ?? ''} BDT",
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                            color: gold,
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                    )
                                                        :
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "${controller?.mostPopularList[index].discountedPrice ?? ''} BDT",
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight.w600,
                                                                color: gold,
                                                                fontSize: 12
                                                            ),
                                                          ),
                                                          const SizedBox(height: 4),
                                                          Text(
                                                            "${controller?.mostPopularList[index].price ?? ''} BDT",
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight.w600,
                                                                decoration: TextDecoration.lineThrough,
                                                                color: Colors.red,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                    ),
                                  ],
                                )
                              else
                                const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                          }

                          else
                            if (widget.page == AppConstants.brandType) ...{
                              if(controller.isLoading) const ProductShimmer()
                              else
                                if(controller.productsFound)
                                  Column(
                                    children: [
                                      Text(
                                        "Showing ${controller?.brandTypeList.length ?? 0} results",
                                        style: poppins.copyWith(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      const SizedBox(height: 12),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12),
                                          child: GridView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 15,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 0.52,
                                            ),
                                            itemCount: controller?.brandTypeList.length ?? 0,
                                            // Since you want only one item per GridView, set itemCount to 1
                                            itemBuilder: (BuildContext context, int index) {
                                              return Container(
                                                // color: Colors.deepPurpleAccent,
                                                color: const Color(0xffFAFBFB),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(ProductDetailsPage(
                                                      productId: controller!.brandTypeList[index].id.toString(),
                                                      brandId: controller.brandTypeList[index]?.brandId?.toString(),
                                                      pageId: controller.brandTypeList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                    ));
                                                  },
                                                  // child: Container(height: 100, width: 200, color: Colors.red,),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        height: Get.height / 3.2,
                                                        child: Stack(
                                                          alignment: Alignment.topCenter,
                                                          children: [
                                                            CarouselSlider(
                                                              items: [
                                                                // ... Your carousel items
                                                                // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                                controller
                                                                    ?.brandTypeList[index]
                                                                    .productColorVariants?[controller
                                                                    .sectedColorVAriantIndex]
                                                                    .frontPhoto,
                                                                controller
                                                                    ?.brandTypeList[index]
                                                                    .productColorVariants?[controller
                                                                    .sectedColorVAriantIndex]
                                                                    .backsidePhoto,
                                                                controller
                                                                    ?.brandTypeList[index]
                                                                    .productColorVariants?[controller
                                                                    .sectedColorVAriantIndex]
                                                                    .details1Photo,
                                                                controller
                                                                    ?.brandTypeList[index]
                                                                    .productColorVariants?[controller
                                                                    .sectedColorVAriantIndex]
                                                                    .details2Photo,
                                                                controller
                                                                    ?.brandTypeList[index]
                                                                    .productColorVariants?[controller
                                                                    .sectedColorVAriantIndex]
                                                                    .outfitPhoto,
                                                              ].map((i) {
                                                                return Builder(
                                                                  builder: (BuildContextcontext) {
                                                                    return Container(
                                                                      decoration: const BoxDecoration(
                                                                        color: Color(
                                                                            0xffFBFBFB),),
                                                                      child: ClipRRect(
                                                                        child: CustomImageCached(
                                                                          image: '${AppConstants
                                                                              .BASE_URL}$i',
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          isRound: false,),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).toList(),
                                                              options: CarouselOptions(
                                                                disableCenter: true,
                                                                viewportFraction: 1,
                                                                autoPlayInterval:
                                                                const Duration(seconds: 7),
                                                                height: Get.height / 2.4,
                                                                scrollDirection: Axis.horizontal,
                                                                onPageChanged: (index, reason) {
                                                                  setState(() {
                                                                    currentIndex = index; // If you want to track carousel index separately
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            Positioned(
                                                              bottom: 20,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  for (int i = 0; i < currentIndex; i++)
                                                                    TabPageSelectorIndicator(
                                                                      backgroundColor: i == currentIndex ? silvercolor : gold,
                                                                      borderColor: i == currentIndex ? silvercolor : gold,
                                                                      size: 7,
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Positioned(
                                                              bottom: 0,
                                                              child: Align(
                                                                alignment: Alignment.bottomCenter,
                                                                child: Container(
                                                                  color: Colors.grey.shade300,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                                    child: controller?.brandTypeList[index].season != null ?
                                                                    Text((controller?.brandTypeList[index].season?.seasonName ?? "").toUpperCase(),
                                                                      style: poppins.copyWith(
                                                                          color: Colors.black,
                                                                          fontSize: 9
                                                                      ),
                                                                    ) : const SizedBox(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              top: 10,
                                                              right: 10,
                                                              child: buildProductWishButton(
                                                                  controller?.brandTypeList[index].id?.toString()),
                                                            ),
                                                            Positioned(
                                                              top: 10,
                                                              left: 10,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  showModalBottomSheet(
                                                                    context: context,
                                                                    builder: (
                                                                        BuildContext context) {
                                                                      return SimilarPopup(id: controller?.brandTypeList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                    },
                                                                  );
                                                                },
                                                                child: SizedBox(
                                                                  height: 30,
                                                                  width: 30,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(5),
                                                                    child: Image.asset(Images.similar,
                                                                        color: silvercolor,
                                                                        height: 20,
                                                                        width: 20),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 25),
                                                        child: Text(
                                                          (controller?.brandTypeList[index].brand?.brandName ?? "").toUpperCase(),
                                                          maxLines: 1,
                                                          style: railway.copyWith(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .w600),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: Text(
                                                          controller?.brandTypeList[index].name ?? "",
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 1,
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight.w200,
                                                              fontSize: 12,
                                                              color: Colors.black
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),

                                                      /// main
                                                      controller?.brandTypeList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: Text(
                                                          "${controller?.brandTypeList[index].price ?? ''} BDT",
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight.w600,
                                                              color: gold,
                                                              fontSize: 12
                                                          ),
                                                        ),
                                                      )
                                                          :
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "${controller?.brandTypeList[index].discountedPrice ?? ''} BDT",
                                                              style: poppins.copyWith(
                                                                  fontWeight: FontWeight.w600,
                                                                  color: gold,
                                                                  fontSize: 12
                                                              ),
                                                            ),
                                                            const SizedBox(height: 4),
                                                            Text(
                                                              "${controller?.brandTypeList[index].price ?? ''} BDT",
                                                              style: poppins.copyWith(
                                                                  fontWeight: FontWeight.w600,
                                                                  decoration: TextDecoration.lineThrough,
                                                                  color: Colors.red,
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                      ),
                                    ],
                                  )
                                else
                                  const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                            }


                        /// ====/@ Men Shop Page View @/====
                        else
                          if (widget.page == AppConstants.menShop) ...{
                            if(mainController.isLoading) const ProductShimmer()
                            else
                              if(mainController.productsFound)
                                Column(
                                  children: [
                                    Text(
                                      "Showing ${mainController?.sectionHomepageList
                                          .length ?? 0} results",
                                      style: poppins.copyWith(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: GridView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 15,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: 0.52,
                                          ),
                                          itemCount: mainController
                                              .sectionHomepageList.length ?? 0,
                                          // Since you want only one item per GridView, set itemCount to 1
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              // color: Colors.deepPurpleAccent,
                                              color: const Color(0xffFAFBFB),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(ProductDetailsPage(
                                                    childCategorieId: mainController.sectionHomepageList?.map<int>((item){
                                                      return item.childCategories?[index]?.childCategoryProduct?.childCategoryId ?? 0;
                                                    }).toList(),
                                                    page: mainController.sectionHomepageList?.map<int>((item){
                                                      return item.sections?[index]?.pageId ?? 0;
                                                    }).toList(),
                                                    // sectionId: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails?.map<int>((item){
                                                    //   return item.sectionId ?? 0;
                                                    // }).toList(),
                                                    productId: mainController!.sectionHomepageList[index].id.toString(),
                                                    brandId: mainController.sectionHomepageList[index]?.brandId?.toString(),
                                                    pageId: mainController.sectionHomepageList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                  ));
                                                },
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    SizedBox(
                                                      height: Get.height / 3.2,
                                                      child: Stack(
                                                        alignment: Alignment
                                                            .topCenter,
                                                        children: [
                                                          CarouselSlider(
                                                            items: [
                                                              // ... Your carousel items
                                                              // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                                                              mainController
                                                                  .sectionHomepageList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .frontPhoto,
                                                              mainController
                                                                  .sectionHomepageList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .backsidePhoto,
                                                              mainController
                                                                  .sectionHomepageList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .details1Photo,
                                                              mainController
                                                                  .sectionHomepageList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .details2Photo,
                                                              mainController
                                                                  .sectionHomepageList[index]
                                                                  .productColorVariants?[controller
                                                                  .sectedColorVAriantIndex]
                                                                  .outfitPhoto,
                                                            ].map((i) {
                                                              return Builder(
                                                                builder: (
                                                                    BuildContextcontext) {
                                                                  return Container(
                                                                    decoration: const BoxDecoration(
                                                                      color: Color(
                                                                          0xffFBFBFB),),
                                                                    child: ClipRRect(
                                                                      child: CustomImageCached(
                                                                        image: '${AppConstants
                                                                            .BASE_URL}$i',
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        isRound: false,),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }).toList(),
                                                            options: CarouselOptions(
                                                              disableCenter: true,
                                                              viewportFraction: 1,
                                                              autoPlayInterval:
                                                              const Duration(
                                                                  seconds: 7),
                                                              height: Get.height /
                                                                  2.4,
                                                              scrollDirection:
                                                              Axis.horizontal,
                                                              onPageChanged: (index,
                                                                  reason) {
                                                                setState(() {
                                                                  currentIndex =
                                                                      index; // If you want to track carousel index separately
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          Positioned(
                                                            bottom: 20,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                for (int i = 0; i <
                                                                    currentIndex; i++)
                                                                  TabPageSelectorIndicator(
                                                                    backgroundColor: i ==
                                                                        currentIndex
                                                                        ? silvercolor
                                                                        : gold,
                                                                    borderColor: i ==
                                                                        currentIndex
                                                                        ? silvercolor
                                                                        : gold,
                                                                    size: 7,
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            bottom: 0,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              child: Container(
                                                                color: Colors.grey
                                                                    .shade300,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 12,
                                                                      right: 12,
                                                                      top: 3,
                                                                      bottom: 3),
                                                                  child: mainController
                                                                      .sectionHomepageList[index]
                                                                      .season !=
                                                                      null ?
                                                                  Text(
                                                                    (mainController
                                                                        .sectionHomepageList[index]
                                                                        .season
                                                                        ?.seasonName ??
                                                                        "")
                                                                        .toUpperCase(),
                                                                    style: poppins
                                                                        .copyWith(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize: 9
                                                                    ),
                                                                  )
                                                                      : const SizedBox(),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            right: 10,
                                                            child: buildProductWishButton(
                                                                widget.controller2
                                                                    ?.sectionHomepageList[index]
                                                                    .id
                                                                    ?.toString()),
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            left: 10,
                                                            child: InkWell(
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                  context: context,
                                                                  builder: (
                                                                      BuildContext context) {
                                                                    return SimilarPopup(id: mainController.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                  },
                                                                );
                                                              },
                                                              child: SizedBox(
                                                                height: 30,
                                                                width: 30,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .all(5),
                                                                  child: Image
                                                                      .asset(
                                                                      Images
                                                                          .similar,
                                                                      color: silvercolor,
                                                                      height: 20,
                                                                      width: 20),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 25),
                                                      child: Text(
                                                        (mainController.sectionHomepageList[index].brand?.brandName ?? "").toUpperCase(),
                                                        maxLines: 1,
                                                        style: railway.copyWith(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .w600),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text(
                                                        mainController.sectionHomepageList[index].name ?? "",
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w200,
                                                            fontSize: 12,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),

                                                    /// main
                                                    mainController
                                                        ?.sectionHomepageList[index]
                                                        .discount == null ||
                                                        mainController
                                                            ?.sectionHomepageList[index]
                                                            .discount == 0 ?
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(horizontal: 4),
                                                      child: Text(
                                                        "${mainController
                                                            ?.sectionHomepageList[index]
                                                            .price ?? ''} BDT",
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            color: gold,
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                    )
                                                        :
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(horizontal: 4),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "${mainController
                                                                .sectionHomepageList[index]
                                                                .discountedPrice ??
                                                                ''} BDT",
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                                color: gold,
                                                                fontSize: 12
                                                            ),
                                                          ),
                                                          const SizedBox(height: 4),
                                                          Text(
                                                            "${mainController
                                                                .sectionHomepageList[index]
                                                                .price ?? ''} BDT",
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                                decoration: TextDecoration
                                                                    .lineThrough,
                                                                color: Colors.red,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                    ),
                                  ],
                                )
                              else
                                const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))},


                // /// ====/@ Page Not View @/====
                // else
                //   if (widget.page == AppConstants.NEW_IN) ...{
                //     widget.sectiontype == AppConstants.NEWIN ?
                //     Column(
                //       children: [
                //         Text(
                //           "Showing ${widget.controller2!.homePageAllDataResponse?.data?.length ?? "000"} results",
                //           style: poppins.copyWith(
                //               fontSize: 10, color: Colors.grey),
                //         ),
                //         const SizedBox(height: 12),
                //         Padding(
                //             padding: const EdgeInsets.only(
                //                 left: 12, right: 12),
                //             child: GridView.builder(
                //               physics: const NeverScrollableScrollPhysics(),
                //               shrinkWrap: true,
                //               gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //                 crossAxisCount: 2,
                //                 mainAxisSpacing: 15,
                //                 crossAxisSpacing: 10,
                //                 childAspectRatio: 0.52,
                //               ),
                //               itemCount: widget.newinleangth,
                //               // Since you want only one item per GridView, set itemCount to 1
                //               itemBuilder: (BuildContext context,
                //                   int index) {
                //                 return Container(
                //                   // color: Colors.deepPurpleAccent,
                //                   color: const Color(0xffFAFBFB),
                //                   child: InkWell(
                //                     onTap: () {
                //                       Get.to(ProductDetailsPage(
                //                         productId: widget.controller2!
                //                             .homePageAllDataResponse!
                //                             .data![index]
                //                             .sectionHomepageDetails![widget
                //                             .controller2!
                //                             .selectedGenderIndex].id!
                //                             .toString(),
                //                       ));
                //                     },
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment
                //                           .center,
                //                       crossAxisAlignment: CrossAxisAlignment
                //                           .center,
                //                       children: [
                //                         SizedBox(
                //                           height: Get.height / 3.2,
                //                           child: Stack(
                //                             alignment: Alignment
                //                                 .topCenter,
                //                             children: [
                //                               CarouselSlider(
                //                                 items: [
                //                                   // controller.brandSectionProductResponse!.data!.result![index].productColorVariants![0].profilePhoto,
                //                                   widget.controller2!
                //                                       .homePageAllDataResponse!
                //                                       .data![index]
                //                                       .sectionHomepageDetails![0]
                //                                       .productColorVariants![controller
                //                                       .sectedColorVAriantIndex]
                //                                       .frontPhoto ??
                //                                       "",
                //                                   widget.controller2!
                //                                       .homePageAllDataResponse!
                //                                       .data![index]
                //                                       .sectionHomepageDetails![0]
                //                                       .productColorVariants![controller
                //                                       .sectedColorVAriantIndex]
                //                                       .backsidePhoto ??
                //                                       "",
                //                                   widget.controller2!
                //                                       .homePageAllDataResponse!
                //                                       .data![index]
                //                                       .sectionHomepageDetails![0]
                //                                       .productColorVariants![controller
                //                                       .sectedColorVAriantIndex]
                //                                       .details1Photo ??
                //                                       "",
                //                                   widget.controller2!
                //                                       .homePageAllDataResponse!
                //                                       .data![index]
                //                                       .sectionHomepageDetails![0]
                //                                       .productColorVariants![controller
                //                                       .sectedColorVAriantIndex]
                //                                       .details2Photo ??
                //                                       "",
                //                                   widget.controller2!
                //                                       .homePageAllDataResponse!
                //                                       .data![index]
                //                                       .sectionHomepageDetails![0]
                //                                       .productColorVariants![controller
                //                                       .sectedColorVAriantIndex]
                //                                       .outfitPhoto ??
                //                                       "",
                //                                 ].map((i) {
                //                                   return Builder(
                //                                     builder: (
                //                                         BuildContext
                //                                         context) {
                //                                       return Container(
                //                                         decoration:
                //                                         const BoxDecoration(
                //                                           color: Color(
                //                                               0xffFBFBFB),
                //                                         ),
                //                                         child: ClipRRect(
                //                                           child:
                //                                           CustomImageCached(
                //                                             image: '${AppConstants
                //                                                 .BASE_URL}$i',
                //                                             fit: BoxFit
                //                                                 .fill,
                //                                             isRound: false,
                //                                           ),
                //                                         ),
                //                                       );
                //                                     },
                //                                   );
                //                                 }).toList(),
                //                                 options: CarouselOptions(
                //                                   disableCenter: true,
                //                                   viewportFraction: 1,
                //                                   autoPlayInterval:
                //                                   const Duration(
                //                                       seconds: 7),
                //                                   height: Get.height /
                //                                       2.4,
                //                                   scrollDirection:
                //                                   Axis.horizontal,
                //                                   onPageChanged:
                //                                       (index,
                //                                       reason) {
                //                                     setState(() {
                //                                       // currentIndex = index; // If you want to track carousel index separately
                //                                     });
                //                                   },
                //                                 ),
                //                               ),
                //                               Positioned(
                //                                 bottom: 20,
                //                                 child: Row(
                //                                   mainAxisAlignment:
                //                                   MainAxisAlignment
                //                                       .center,
                //                                   children: [
                //                                     for (int i = 0; i <
                //                                         5; i++)
                //                                       TabPageSelectorIndicator(
                //                                         backgroundColor: i ==
                //                                             currentIndex
                //                                             ? gold
                //                                             : silvercolor,
                //                                         borderColor: gold,
                //                                         size: 7,
                //                                       ),
                //                                   ],
                //                                 ),
                //                               ),
                //                               Positioned(
                //                                 bottom: 0,
                //                                 child: Align(
                //                                   alignment: Alignment
                //                                       .bottomCenter,
                //                                   child: Container(
                //                                     color: Colors.grey
                //                                         .shade300,
                //                                     child: Padding(
                //                                       padding: const EdgeInsets
                //                                           .only(
                //                                           left: 12,
                //                                           right: 12,
                //                                           top: 3,
                //                                           bottom: 3),
                //                                       child: widget
                //                                           .controller2!
                //                                           .homePageAllDataResponse!
                //                                           .data![index]
                //                                           .sectionHomepageDetails![widget
                //                                           .controller2!
                //                                           .selectedGenderIndex]
                //                                           .season !=
                //                                           null ?
                //                                       Text(
                //                                         (widget
                //                                             .controller2!
                //                                             .homePageAllDataResponse!
                //                                             .data![index]
                //                                             .sectionHomepageDetails![widget
                //                                             .controller2!
                //                                             .selectedGenderIndex]
                //                                             .season!
                //                                             .name ??
                //                                             "")
                //                                             .toUpperCase(),
                //                                         style: poppins
                //                                             .copyWith(
                //                                             color: Colors
                //                                                 .black,
                //                                             fontSize: 9
                //                                         ),
                //                                       )
                //                                           : const SizedBox(),
                //                                     ),
                //                                   ),
                //                                 ),
                //                               ),
                //                               Positioned(
                //                                 top: 10,
                //                                 right: 10,
                //                                 // child :  buildProductWishButton(controller.homePageAllDataResponse!.data!.result![index]!.id!.toString()),
                //                                 child: InkWell(
                //                                   onTap: () {
                //                                     Get.to(
                //                                         WishListPage());
                //                                   },
                //                                   child: SizedBox(
                //                                     height: 30,
                //                                     width: 30,
                //                                     child: Padding(
                //                                       padding: const EdgeInsets
                //                                           .all(5),
                //                                       child: Image
                //                                           .asset(
                //                                           Images.wish,
                //                                           color: silvercolor,
                //                                           height: 20,
                //                                           width: 20),
                //                                     ),
                //                                   ),
                //                                 ),
                //                               ),
                //                               Positioned(
                //                                 top: 10,
                //                                 left: 10,
                //                                 child: InkWell(
                //                                   onTap: () {
                //                                     Get.to(
                //                                       showModalBottomSheet(
                //                                         context: context,
                //                                         builder: (
                //                                             BuildContext context) {
                //                                           return SimilarPopup();
                //                                         },
                //                                       ),
                //                                     );
                //                                   },
                //                                   child: SizedBox(
                //                                     height: 30,
                //                                     width: 30,
                //                                     child: Padding(
                //                                       padding: const EdgeInsets
                //                                           .all(5),
                //                                       child: Image
                //                                           .asset(
                //                                           Images
                //                                               .similar,
                //                                           color: silvercolor,
                //                                           height: 20,
                //                                           width: 20),
                //                                     ),
                //                                   ),
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                         const SizedBox(height: 8),
                //                         Padding(
                //                           padding: const EdgeInsets
                //                               .symmetric(
                //                               horizontal: 25),
                //                           child: Text(
                //                             widget.controller2!
                //                                 .homePageAllDataResponse!
                //                                 .data![index]
                //                                 .sectionHomepageDetails![widget
                //                                 .controller2!
                //                                 .selectedGenderIndex]
                //                                 .brand!.name ??
                //                                 "".toUpperCase(),
                //                             maxLines: 1,
                //                             style: railway.copyWith(
                //                                 fontSize: 16,
                //                                 fontWeight: FontWeight
                //                                     .w600),
                //                           ),
                //                         ),
                //                         const SizedBox(height: 5),
                //                         Padding(
                //                           padding: const EdgeInsets
                //                               .symmetric(
                //                               horizontal: 4),
                //                           child: Text(
                //                             "rrrr",
                //                             overflow: TextOverflow
                //                                 .ellipsis,
                //                             maxLines: 1,
                //                             style: poppins.copyWith(
                //                                 fontWeight: FontWeight
                //                                     .w200,
                //                                 fontSize: 12
                //                             ),
                //                           ),
                //                         ),
                //                         const SizedBox(height: 5),
                //
                //                         /// main
                //                         controller
                //                             .brandSectionProductResponse!
                //                             .data!.result![index]
                //                             .discount == null ||
                //                             controller
                //                                 .brandSectionProductResponse!
                //                                 .data!.result![index]
                //                                 .discount == 0 ?
                //                         Padding(
                //                           padding: const EdgeInsets
                //                               .symmetric(
                //                               horizontal: 4),
                //                           child: Text(
                //                             "${controller
                //                                 .brandSectionProductResponse!
                //                                 .data!.result![index]
                //                                 .price} BDT",
                //                             style: poppins.copyWith(
                //                                 fontWeight: FontWeight
                //                                     .w600,
                //                                 color: gold,
                //                                 fontSize: 12
                //                             ),
                //                           ),
                //                         )
                //                             :
                //                         Padding(
                //                           padding: const EdgeInsets
                //                               .symmetric(
                //                               horizontal: 4),
                //                           child: Column(
                //                             children: [
                //                               Text(
                //                                 "${controller
                //                                     .brandSectionProductResponse!
                //                                     .data!
                //                                     .result![index]
                //                                     .discountedPrice} BDT",
                //                                 style: poppins
                //                                     .copyWith(
                //                                     fontWeight: FontWeight
                //                                         .w600,
                //                                     color: gold,
                //                                     fontSize: 12
                //                                 ),
                //                               ),
                //                               const SizedBox(
                //                                   height: 4),
                //                               Text(
                //                                 "${controller
                //                                     .brandSectionProductResponse!
                //                                     .data!
                //                                     .result![index]
                //                                     .price} BDT",
                //                                 style: poppins
                //                                     .copyWith(
                //                                     fontWeight: FontWeight
                //                                         .w600,
                //                                     decoration: TextDecoration
                //                                         .lineThrough,
                //                                     color: Colors.red,
                //                                     fontSize: 12),
                //                               ),
                //                             ],
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                   ),
                //                 );
                //               },
                //             )
                //         ),
                //       ],
                //     )
                //         : const ProductShimmer(),
                //   },

                const SizedBox(height: 10)
              ],
            ),
          ),
        );
      });
    });
  }


  Widget buildProductWishButton(String? productId,) {
    bool isWished = productWishStatus.containsKey(productId)
        ? productWishStatus[productId]!
        : false;

    return GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return InkWell(
            onTap: () async {
              try {
                var deviceID = await Get.find<AuthController>().getDeviceID();
                var customerID = await Get.find<AuthController>().getUserId();
                // Check if the product is already wishlisted
                // bool isProductWishlisted = // Perform logic to check if the product is wishlisted

                if (isWished) {
                  // Perform delete action
                  log('Product delete:$productId');
                  await controller.deleteWish(Get
                      .find<WishlistController>()
                      .getWishlistResponse!
                      .data![controller.sectedColorVAriantIndex].id!
                      .toString() ?? "");
                  setState(() {
                    productWishStatus[productId ?? ''] = false;
                  });
                } else {
                  // Perform add action
                  if (Get.find<AuthController>().isLoggedIn() == false) {
                    log('Product idugiu:$productId');
                    await controller.AddtoWishlistWithout(
                      product_id: productId!,
                      // customer_id: customerID,
                      corelation_id: deviceID,
                    );
                  } else {
                    log('Product id:$productId');
                    await controller.AddtoWishlist(
                      product_id: productId!,
                      customer_id: customerID,
                      corelation_id: deviceID,
                    );
                  }

                  setState(() {
                    productWishStatus[productId ?? ''] = true;
                  });
                }
                saveWishStatus(); // Save the updated wish status
              } catch (e) {
                // Handle any errors that might occur during the asynchronous operation
                print("Error: $e");
              }
            },

            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                isWished ? Images.unwished : Images.wish,
                height: 20,
                color: isWished ? gold : silvercolor,
              ),
            ),
          );
        }
    );
  }


}
