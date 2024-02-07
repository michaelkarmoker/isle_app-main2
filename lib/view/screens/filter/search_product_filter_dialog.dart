import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/model/response/filter/category_product_filter_term_model.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../controller/product/product_controller.dart';
import '../../../../util/styles.dart';
import '../../../../view/screens/filter/people_filter_dialog.dart';
import '../../../data/model/response/filter/search_product_filter_term_model.dart';
import '../../../util/color.dart';

class SearchFilterPageDialog extends StatefulWidget {
  final SearchPoductFilterTermModel? filterModel;
  final String? id;
  final String? searchCon;
  // final int? pageId;

  const SearchFilterPageDialog({
    super.key,
    required this.filterModel,
    this.id,
    this.searchCon
    // this.pageId,
  });

  @override
  State<SearchFilterPageDialog> createState() => _SearchFilterPageDialogState();
}

class _SearchFilterPageDialogState extends State<SearchFilterPageDialog> {

  int isClick = 0;
  TextEditingController minAmountCon = TextEditingController();
  TextEditingController maxAmountCon = TextEditingController();

  List<String> itemList = [
    'Section',
    'Size\nTypes',
    'Brand',
    'Colour',
    'Discount',
    'New In',
    'Lifestyle/\nEvents',
    'Price',
  ];

  int? selectSection;
  void onSectionSelected(int sectionId) {
    log("====/@ Section ID: $sectionId");
    setState(() {
      selectSection = sectionId;
    });
  }

  List<int> selectedSizeIds = [];
  void onSizeSelected(int sizeId, bool isSelected) {
    log("====/@ Size ID: $sizeId, Selected: $isSelected");
    setState(() {
      if(isSelected){
        selectedSizeIds.add(sizeId);
      } else{
        selectedSizeIds.remove(sizeId);
      }
    });
  }

  List<int> selectedBrandsIds = [];
  void onBrandSelected(int brandId, bool isSelected) {
    log("====/@ Brand ID: $brandId, Selected: $isSelected");
    setState(() {
      if(isSelected){
        selectedBrandsIds.add(brandId);
      } else{
        selectedBrandsIds.remove(brandId);
      }
    });
  }

  List<int> selectedColorIds = [];
  void onColorSelected(int colorId, bool isSelected) {
    log("====/@ Brand ID: $colorId, Selected: $isSelected");
    setState(() {
      if(isSelected){
        selectedColorIds.add(colorId);
      } else{
        selectedColorIds.remove(colorId);
      }
    });
  }

  int? selectedDiscount;

  void onDiscountSelected(int discount) {
    log("====/@ Discount Selected: $discount");
    setState(() {
      selectedDiscount = discount;
    });
  }

  void savePrice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.minPrice, minAmountCon.text.trim());
    prefs.setString(AppConstants.maxPrice, maxAmountCon.text.trim());

    log('Min Price: ${minAmountCon.text.trim()}');
    log('Max Price: ${maxAmountCon.text.trim()}');

    setState(() {});
  }

  Future<void> loadPrices() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      minAmountCon.text = prefs.getString(AppConstants.minPrice) ?? '';
      maxAmountCon.text = prefs.getString(AppConstants.maxPrice) ?? '';
    });
  }

  void removePrices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstants.minPrice);
    prefs.remove(AppConstants.maxPrice);

    // Log statements to confirm removal (optional)
    log('Min Price removed ${minAmountCon.text.trim()}');
    log('Max Price removed ${maxAmountCon.text.trim()}');

    setState(() {}); // Trigger a rebuild to update the UI
  }

  Future<bool> arePricesStored() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final minPrice = prefs.getString(AppConstants.minPrice);
    final maxPrice = prefs.getString(AppConstants.maxPrice);
    return minPrice != null && maxPrice != null;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPrices();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (productController) {
      return Material(
        elevation: 0,
        color: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10)
        // ),
        child: Padding(
          // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          padding: const EdgeInsets.only(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 30,
                      width: Get.width,
                    ),
                    Center(
                      child: Text("Apply Filters",
                          style: poppins.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                              Icons.close, color: Colors.black, size: 25)),
                    ),
                  ],
                ),
              ),

              FutureBuilder<bool>(
                future: arePricesStored(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // If the Future is still waiting, return a loading indicator or an empty container
                    return const SizedBox.shrink(); // or SizedBox.shrink();
                  } else if (snapshot.hasError) {
                    // If there's an error, handle it accordingly
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // If the Future is complete, conditionally build the black container
                    final bool pricesStored = snapshot.data ?? false;

                    return pricesStored
                        ? Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                removePrices();
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Row(
                                  children: [
                                    Text(
                                      '${minAmountCon.text.trim()} - ${maxAmountCon.text.trim()}',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                        : const SizedBox.shrink(); // Hide the black container if prices are not stored
                  }
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      // color: Colors.blue.withOpacity(0.3),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: itemList.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isClick = index;
                                });
                              },
                              child: Container(
                                height: 65,
                                width: 100,
                                // margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: isClick == index
                                        ? Colors.transparent
                                        : Colors.blue.withOpacity(0.1),
                                    border: isClick == index
                                        ? Border.all(width: 1, color: gold)
                                        : Border.all(width: 0.5, color: Colors.grey.withOpacity(0.3))
                                    // color: isClick == index
                                    //     ? Colors.transparent
                                    //     : Colors.blue.withOpacity(0.1),
                                    // border: isClick == index ? Border(
                                    //     left: BorderSide(
                                    //         width: isClick == index ? 4 : 0,
                                    //         color: isClick == index
                                    //             ? Colors.brown
                                    //             : Colors.transparent)
                                    // ) : Border.all(width: 0.5,
                                    //     color: Colors.grey.withOpacity(0.3))
                                ),
                                child: Center(child: Text(itemList[index],
                                    textAlign: TextAlign.center)),
                              ),
                            );
                          }),
                    ),

                    const SizedBox(width: 10),
                    Expanded(
                        child: IndexedStack(
                          index: isClick,
                          children: [
                            // SectionSectionRightSiteWidget(
                            //   sections: widget.filterModel?.data?.categories ?? [],
                            //   onSectionSelected: onSectionSelected,
                            // ),
                            const SizedBox(height: 30, width: 80),
                            SearchSizeTypesRightSiteWidget(
                              sizedModel: widget.filterModel?.data?.sizes ?? [],
                              onSizeSelected: onSizeSelected,
                            ),
                            SearchBrandRightSiteWidget(
                              brandModel: widget.filterModel?.data?.brands ?? [],
                              onSizeSelected: onBrandSelected,
                            ),
                            SearchColorRightSiteWidget(
                              colorModel: widget.filterModel?.data?.colors ?? [],
                              onSizeSelected: onColorSelected,
                            ),
                            // SectionDiscountRightSiteWidget(
                            //   discountModel: widget.filterModel!.data!.discount,
                            //   onDiscountSelected: onDiscountSelected,
                            // ),
                            const SizedBox(height: 30, width: 80),
                            const SizedBox(height: 30, width: 80),
                            const SizedBox(height: 30, width: 80),
                            SearchPriceRightSiteWidget(
                              maxAmountCon: maxAmountCon,
                              minAmountCon: minAmountCon,
                              onSavePrice: savePrice,
                            )
                          ],
                        )),

                  ],
                ),
              ),

              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(-4, -4),
                          blurRadius: 4
                      )
                    ]
                ),
                child: Column(
                  children: [
                    // const SizedBox(height: 20),
                    // const Text('618 items found',
                    //     style: TextStyle(
                    //         color: Colors.black
                    //     )
                    // ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white.withOpacity(0.1),
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                child: const Text('RESET', style: TextStyle(
                                    color: Colors.grey
                                ),),
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // savePrice();
                                  productController.getSearchProductData(
                                      searchTerm: widget.searchCon,
                                      pageId: 1,
                                      sizeId: selectedSizeIds,
                                      brandId: selectedBrandsIds,
                                      colorId: selectedColorIds,
                                      minPrice: minAmountCon.text.trim(),
                                      maxPrice: maxAmountCon.text.trim(),
                                      discount: selectedDiscount.toString()
                                  );
                                  Get.back();
                                  /// ==
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.grey.withOpacity(0.3),
                                  backgroundColor: Colors.black.withOpacity(0.7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                child: const Text('Done', style: TextStyle(
                                    color: Colors.white
                                ),),
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}


class SectionSectionRightSiteWidget extends StatefulWidget {
  final List<CategoryProductCategories> sections;
  final Function onSectionSelected;

  const SectionSectionRightSiteWidget({
    super.key,
    required this.sections,
    required this.onSectionSelected
  });

  @override
  State<SectionSectionRightSiteWidget> createState() => _SectionSectionRightSiteWidgetState();
}

class _SectionSectionRightSiteWidgetState extends State<SectionSectionRightSiteWidget> {

  int isClick = -1;

  @override
  Widget build(BuildContext context) {
    return widget.sections != null && widget.sections.isNotEmpty ? ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.sections.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.onSectionSelected(widget.sections[index].id ?? 0);
              });
            },
            child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(widget.sections[index].title?.toUpperCase() ?? '',
                          textAlign: TextAlign.center),
                      Text(' (${widget.sections[index].productCount} Item)',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey
                          )
                      ),
                      // const Expanded(child: SizedBox()),
                      // GestureDetector(
                      //   onTap: (){
                      //     setState(() {
                      //       isClick = isClick == index ? -1 : index;
                      //     });
                      //   },
                      //     child: isClick == index
                      //         ? const Icon(Icons.keyboard_arrow_up_outlined, color: Colors.grey)
                      //         : const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey)),
                      // const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(height: 0.5, width: Get.width, color: Colors.grey,),
                  const SizedBox(height: 10)
                  // isClick == index ? const SizedBox(height: 10) : const SizedBox.shrink(),
                  // isClick == index ? ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: widget.sections[index].children?.length ?? 0,
                  //     itemBuilder: (ctx, sectionIndex){
                  //       return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             widget.onSectionSelected(widget.sections[index].children?[sectionIndex].id ?? 0);
                  //           });
                  //         },
                  //         child: SizedBox(
                  //           child: Column(
                  //             children: [
                  //               const SizedBox(height: 10),
                  //               Row(
                  //                 children: [
                  //                   const SizedBox(width: 40),
                  //                   Text(widget.sections[index].children?[sectionIndex].title ?? '',
                  //                     textAlign: TextAlign.center),
                  //                   Text(' (${widget.sections[index].children?[sectionIndex].productCount} Item)',
                  //                       style: const TextStyle(
                  //                           fontSize: 13,
                  //                           color: Colors.grey
                  //                       )
                  //                   ),
                  //                 ],
                  //               ),
                  //               const SizedBox(height: 10),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     }
                  // ) : const SizedBox.shrink()
                ],
              ),
            ),
          );
        }
    ) : const SizedBox.shrink();
  }
}


class SearchSizeTypesRightSiteWidget extends StatefulWidget {
  final List<SearchPoductFilterTermSizes> sizedModel;
  final Function onSizeSelected;


  const SearchSizeTypesRightSiteWidget({
    Key? key,
    required this.sizedModel,
    required this.onSizeSelected
  }) : super(key: key);

  @override
  State<SearchSizeTypesRightSiteWidget> createState() =>
      _SearchSizeTypesRightSiteWidgetState();
}

class _SearchSizeTypesRightSiteWidgetState extends State<SearchSizeTypesRightSiteWidget> {

  Map<int, bool> selectedSizes = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.sizedModel.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 30),
            // Text(
            //   widget.sizedModel[index].typeName ?? '',
            //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            widget.sizedModel != null && widget.sizedModel.isNotEmpty ?
            ListView.builder(
              itemCount: widget.sizedModel[index].sizes?.length ?? 0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, sizeIndex) {
                int sizedId = widget.sizedModel[index].sizes?[sizeIndex].id ?? 0;
                return Column(
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                            const BorderSide(width: 1.0, color: Colors.grey),
                          ),
                          value: selectedSizes[sizedId] ?? false,
                          onChanged: (val) {
                            setState(() {
                              selectedSizes[sizedId] = val ?? false;
                              widget.onSizeSelected(sizedId, val ?? false);
                            });
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.sizedModel[index].sizes?[sizeIndex].sizeCode ?? '',
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black
                                )
                            ),
                            // Text('(${widget.sizedModel[index].sizes?[sizeIndex].productCount} Item)',
                            //     style: const TextStyle(
                            //         fontSize: 13,
                            //         color: Colors.grey
                            //     )
                            // ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 0.5, width: Get.width, color: Colors.grey,)
                  ],
                );
              },
            ) : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}


/// ================================================================


class SearchBrandRightSiteWidget extends StatefulWidget {
  final List<SearchPoductFilterTermBrands> brandModel;
  final Function onSizeSelected;
  const SearchBrandRightSiteWidget({
    super.key,
    required this.brandModel,
    required this.onSizeSelected
  });

  @override
  State<SearchBrandRightSiteWidget> createState() => _SearchBrandRightSiteWidgetState();
}

class _SearchBrandRightSiteWidgetState extends State<SearchBrandRightSiteWidget> {

  Map<int, bool> selectedBrands = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.brandModel != null && widget.brandModel.isNotEmpty ?
          ListView.builder(
            itemCount: widget.brandModel.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, brandIndex) {
              int sizedId = widget.brandModel[brandIndex].id ?? 0;
              return Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                          const BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        value: selectedBrands[sizedId] ?? false,
                        onChanged: (val) {
                          setState(() {
                            selectedBrands[sizedId] = val ?? false;
                            widget.onSizeSelected(sizedId, val ?? false);
                          });
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.brandModel[brandIndex].name ?? '',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black
                              )
                          ),
                          // Text('(${widget.brandModel[brandIndex].productCount} Item)',
                          //     style: const TextStyle(
                          //         fontSize: 13,
                          //         color: Colors.grey
                          //     )
                          // ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 0.5, width: Get.width, color: Colors.grey,)
                ],
              );
            },
          ) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}


class SearchColorRightSiteWidget extends StatefulWidget {
  final List<SearchPoductFilterTermColors> colorModel;
  final Function onSizeSelected;

  const SearchColorRightSiteWidget({
    super.key,
    required this.colorModel,
    required this.onSizeSelected
  });

  @override
  State<SearchColorRightSiteWidget> createState() => _SearchColorRightSiteWidgetState();
}

class _SearchColorRightSiteWidgetState extends State<SearchColorRightSiteWidget> {

  Map<int, bool> selectedColor = {};

// Add a new method to parse color codes
  Color? parseColor(String colorCode) {
    try {
      // Parse the hexadecimal color code and return a Color object
      return Color(int.parse(colorCode.replaceAll("#", ""), radix: 16) + 0xFF000000);
    } catch (e) {
      // Handle any parsing errors, you can return a default color if needed
      log("Error parsing color code: $colorCode");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.colorModel != null && widget.colorModel.isNotEmpty ?
          ListView.builder(
            itemCount: widget.colorModel.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, colorIndex) {
              int sizedId = widget.colorModel[colorIndex].id ?? 0;
              return Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                          const BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        value: selectedColor[sizedId] ?? false,
                        onChanged: (val) {
                          setState(() {
                            selectedColor[sizedId] = val ?? false;
                            widget.onSizeSelected(sizedId, val ?? false);
                          });
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.colorModel[colorIndex].name ?? '',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black
                              )
                          ),
                          // Text('(${widget.colorModel[colorIndex].productCount} Item)',
                          //     style: const TextStyle(
                          //         fontSize: 13,
                          //         color: Colors.grey
                          //     )
                          // ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: parseColor(widget.colorModel[colorIndex].colorCode ?? ''),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 0.5, width: Get.width, color: Colors.grey,)
                ],
              );
            },
          ) : const SizedBox.shrink()

        ],
      ),
    );
  }
}


class SearchPriceRightSiteWidget extends StatefulWidget {

  final TextEditingController minAmountCon;
  final TextEditingController maxAmountCon;
  final Function onSavePrice;

  const SearchPriceRightSiteWidget({
    super.key,
    required this.minAmountCon,
    required this.maxAmountCon,
    required this.onSavePrice,
  });

  @override
  State<SearchPriceRightSiteWidget> createState() => _SearchPriceRightSiteWidgetState();
}

class _SearchPriceRightSiteWidgetState extends State<SearchPriceRightSiteWidget> {

  final FocusNode _minAmountFocusNode = FocusNode();
  final FocusNode _maxAmountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MINIMUM AMOUNT',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
              )
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('BDT',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    controller: widget.minAmountCon,
                    focusNode: _minAmountFocusNode,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        fontSize: 14
                    ),
                    decoration: priceDecoration.copyWith(
                      contentPadding: const EdgeInsets.only(top: 10, left: 5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text('(MIN)',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 0.5, width: Get.width, color: Colors.grey,),
          const SizedBox(height: 20),
          const Text('MAXIMUM AMOUNT',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
              )
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('BDT',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    controller: widget.maxAmountCon,
                    focusNode: _maxAmountFocusNode,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        fontSize: 14
                    ),
                    decoration: priceDecoration.copyWith(
                      contentPadding: const EdgeInsets.only(top: 10, left: 5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text('(MAX)',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 10),
          Container(
              height: 0.5, width: Get.width, color: Colors.grey),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                widget.onSavePrice();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.grey.withOpacity(0.3),
                backgroundColor: Colors.black.withOpacity(0.7),
                maximumSize: Size(Get.width, 35),
                minimumSize: Size(Get.width, 35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              child: const Text('Apply', style: TextStyle(
                  color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }
}

class SectionDiscountRightSiteWidget extends StatefulWidget {
  final CategoryProductDiscount? discountModel;
  final Function(int) onDiscountSelected;

  const SectionDiscountRightSiteWidget({
    super.key,
    required this.discountModel,
    required this.onDiscountSelected,
  });

  @override
  State<SectionDiscountRightSiteWidget> createState() =>
      _SectionDiscountRightSiteWidgetState();
}

class _SectionDiscountRightSiteWidgetState
    extends State<SectionDiscountRightSiteWidget> {
  int? selectedDiscount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          widget.discountModel?.discount10 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 10,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 10 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '10%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount10 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          widget.discountModel?.discount20 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 20,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 20 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '20%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount20 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          widget.discountModel?.discount30 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 30,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 30 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '30%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount30 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          widget.discountModel?.discount40 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 40,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 40 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '40%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount40 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          widget.discountModel?.discount50 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 50,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 50 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '50%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount50 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          widget.discountModel?.discount60 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 60,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 60 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '60%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount60 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          widget.discountModel?.discount70 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 70,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 70 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '70%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount70 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),

          widget.discountModel?.discount80 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 80,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 80 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text('80%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount80 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          widget.discountModel?.discount90 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 90,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 90 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '90%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount90 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          widget.discountModel?.discount100 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 100,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 100 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '100%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount100 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

