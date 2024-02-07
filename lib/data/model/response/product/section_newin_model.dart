class SectionNewInModel {
  int? statusCode;
  String? status;
  String? message;
  SectionNewInData? data;

  SectionNewInModel({this.statusCode, this.status, this.message, this.data});

  SectionNewInModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SectionNewInData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SectionNewInData {
  List<SectionNewInResult>? result;
  Pagination? pagination;

  SectionNewInData({this.result, this.pagination});

  SectionNewInData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <SectionNewInResult>[];
      json['result'].forEach((v) {
        result!.add(SectionNewInResult.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class SectionNewInResult {
  int? id;
  int? vendorId;
  int? brandId;
  int? seasonId;
  int? sizeTypeId;
  String? vendorProductCode;
  String? productCode;
  String? isleProductCode;
  String? name;
  double? vat;
  String? vatType;
  double? mrpPrice;
  int? price;
  String? discountType;
  int? discount;
  int? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Pages>? pages;
  List<Categories>? categories;
  List<SubCategories>? subCategories;
  List<ChildCategories>? childCategories;
  List<Sections>? sections;
  Brand? brand;
  Season? season;
  List<Tags>? tags;
  Vendor? vendor;
  List<ProductColorVariants>? productColorVariants;
  List<Wishlists>? wishlists;

  SectionNewInResult(
      {this.id,
        this.vendorId,
        this.brandId,
        this.seasonId,
        this.sizeTypeId,
        this.vendorProductCode,
        this.productCode,
        this.isleProductCode,
        this.name,
        this.vat,
        this.vatType,
        this.mrpPrice,
        this.price,
        this.discountType,
        this.discount,
        this.discountedPrice,
        this.isPublish,
        this.sizeGuide,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.pages,
        this.categories,
        this.subCategories,
        this.childCategories,
        this.sections,
        this.brand,
        this.season,
        this.tags,
        this.vendor,
        this.productColorVariants,
        this.wishlists});

  SectionNewInResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    sizeTypeId = json['size_type_id'];
    vendorProductCode = json['vendor_product_code'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = json['vat'].toDouble();
    vatType = json['vat_type'];
    mrpPrice = json['mrp_price'].toDouble();
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountedPrice = json['discounted_price'];
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(Pages.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(SubCategories.fromJson(v));
      });
    }
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(ChildCategories.fromJson(v));
      });
    }
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? Season.fromJson(json['season']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    vendor =
    json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(ProductColorVariants.fromJson(v));
      });
    }
    if (json['wishlists'] != null) {
      wishlists = <Wishlists>[];
      json['wishlists'].forEach((v) {
        wishlists!.add(Wishlists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vendor_id'] = vendorId;
    data['brand_id'] = brandId;
    data['season_id'] = seasonId;
    data['size_type_id'] = sizeTypeId;
    data['vendor_product_code'] = vendorProductCode;
    data['product_code'] = productCode;
    data['isle_product_code'] = isleProductCode;
    data['name'] = name;
    data['vat'] = vat;
    data['vat_type'] = vatType;
    data['mrp_price'] = mrpPrice;
    data['price'] = price;
    data['discount_type'] = discountType;
    data['discount'] = discount;
    data['discounted_price'] = discountedPrice;
    data['is_publish'] = isPublish;
    data['size_guide'] = sizeGuide;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (subCategories != null) {
      data['sub_categories'] =
          subCategories!.map((v) => v.toJson()).toList();
    }
    if (childCategories != null) {
      data['child_categories'] =
          childCategories!.map((v) => v.toJson()).toList();
    }
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    if (productColorVariants != null) {
      data['product_color_variants'] =
          productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (wishlists != null) {
      data['wishlists'] = wishlists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? id;
  String? title;
  PageProduct? pageProduct;

  Pages({this.id, this.title, this.pageProduct});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    pageProduct = json['page_product'] != null
        ? PageProduct.fromJson(json['page_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (pageProduct != null) {
      data['page_product'] = pageProduct!.toJson();
    }
    return data;
  }
}

class PageProduct {
  int? productId;
  int? pageId;

  PageProduct({this.productId, this.pageId});

  PageProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    pageId = json['page_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['page_id'] = pageId;
    return data;
  }
}

class Categories {
  String? categoryTitle;
  Page? page;
  CategoryProduct? categoryProduct;

  Categories({this.categoryTitle, this.page, this.categoryProduct});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryTitle = json['category_title'];
    page = json['page'] != null ? Page.fromJson(json['page']) : null;
    categoryProduct = json['category_product'] != null
        ? CategoryProduct.fromJson(json['category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_title'] = categoryTitle;
    if (page != null) {
      data['page'] = page!.toJson();
    }
    if (categoryProduct != null) {
      data['category_product'] = categoryProduct!.toJson();
    }
    return data;
  }
}

class Page {
  String? pageTitle;

  Page({this.pageTitle});

  Page.fromJson(Map<String, dynamic> json) {
    pageTitle = json['page_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page_title'] = pageTitle;
    return data;
  }
}

class CategoryProduct {
  int? productId;
  int? categoryId;

  CategoryProduct({this.productId, this.categoryId});

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['category_id'] = categoryId;
    return data;
  }
}

class SubCategories {
  String? subCategoryTitle;
  Category? category;
  SubCategoryProduct? subCategoryProduct;

  SubCategories(
      {this.subCategoryTitle, this.category, this.subCategoryProduct});

  SubCategories.fromJson(Map<String, dynamic> json) {
    subCategoryTitle = json['sub_category_title'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    subCategoryProduct = json['sub_category_product'] != null
        ? SubCategoryProduct.fromJson(json['sub_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_category_title'] = subCategoryTitle;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subCategoryProduct != null) {
      data['sub_category_product'] = subCategoryProduct!.toJson();
    }
    return data;
  }
}

class Category {
  String? categoryTitle;
  Page? page;

  Category({this.categoryTitle, this.page});

  Category.fromJson(Map<String, dynamic> json) {
    categoryTitle = json['category_title'];
    page = json['page'] != null ? Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_title'] = categoryTitle;
    if (page != null) {
      data['page'] = page!.toJson();
    }
    return data;
  }
}

class SubCategoryProduct {
  int? productId;
  int? subCategoryId;

  SubCategoryProduct({this.productId, this.subCategoryId});

  SubCategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    subCategoryId = json['sub_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['sub_category_id'] = subCategoryId;
    return data;
  }
}

class ChildCategories {
  String? childCategoryTitle;
  SubCategory? subCategory;
  ChildCategoryProduct? childCategoryProduct;

  ChildCategories(
      {this.childCategoryTitle, this.subCategory, this.childCategoryProduct});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    childCategoryTitle = json['child_category_title'];
    subCategory = json['sub_category'] != null
        ? SubCategory.fromJson(json['sub_category'])
        : null;
    childCategoryProduct = json['child_category_product'] != null
        ? ChildCategoryProduct.fromJson(json['child_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['child_category_title'] = childCategoryTitle;
    if (subCategory != null) {
      data['sub_category'] = subCategory!.toJson();
    }
    if (childCategoryProduct != null) {
      data['child_category_product'] = childCategoryProduct!.toJson();
    }
    return data;
  }
}

class SubCategory {
  String? subCategoryTitle;
  Category? category;

  SubCategory({this.subCategoryTitle, this.category});

  SubCategory.fromJson(Map<String, dynamic> json) {
    subCategoryTitle = json['sub_category_title'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_category_title'] = subCategoryTitle;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class ChildCategoryProduct {
  int? productId;
  int? childCategoryId;

  ChildCategoryProduct({this.productId, this.childCategoryId});

  ChildCategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    childCategoryId = json['child_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['child_category_id'] = childCategoryId;
    return data;
  }
}

class Sections {
  int? id;
  int? pageId;
  String? assignType;
  String? assignDay;
  String? assignBrandId;
  String? assignCategoryId;
  String? assignSubCategoryId;
  String? assignChildCategoryId;
  String? assignSeasonId;
  String? assignSizeId;
  String? assignDiscountType;
  int? assignDiscount;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  String? hoverBanner;
  bool? status;
  String? buttonText;
  String? landingPageTitle;
  String? createdAt;
  String? updatedAt;
  int? parentSectionId;
  ProductSection? productSection;

  Sections(
      {this.id,
        this.pageId,
        this.assignType,
        this.assignDay,
        this.assignBrandId,
        this.assignCategoryId,
        this.assignSubCategoryId,
        this.assignChildCategoryId,
        this.assignSeasonId,
        this.assignSizeId,
        this.assignDiscountType,
        this.assignDiscount,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.hoverBanner,
        this.status,
        this.buttonText,
        this.landingPageTitle,
        this.createdAt,
        this.updatedAt,
        this.parentSectionId,
        this.productSection});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    assignType = json['assign_type'];
    assignDay = json['assign_day'];
    assignBrandId = json['assign_brand_id'];
    assignCategoryId = json['assign_category_id'];
    assignSubCategoryId = json['assign_sub_category_id'];
    assignChildCategoryId = json['assign_child_category_id'];
    assignSeasonId = json['assign_season_id'];
    assignSizeId = json['assign_size_id'];
    assignDiscountType = json['assign_discount_type'];
    assignDiscount = json['assign_discount'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    hoverBanner = json['hover_banner'];
    status = json['status'];
    buttonText = json['button_text'];
    landingPageTitle = json['landing_page_title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentSectionId = json['parent_section_id'];
    productSection = json['product_section'] != null
        ? ProductSection.fromJson(json['product_section'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['page_id'] = pageId;
    data['assign_type'] = assignType;
    data['assign_day'] = assignDay;
    data['assign_brand_id'] = assignBrandId;
    data['assign_category_id'] = assignCategoryId;
    data['assign_sub_category_id'] = assignSubCategoryId;
    data['assign_child_category_id'] = assignChildCategoryId;
    data['assign_season_id'] = assignSeasonId;
    data['assign_size_id'] = assignSizeId;
    data['assign_discount_type'] = assignDiscountType;
    data['assign_discount'] = assignDiscount;
    data['title'] = title;
    data['slug'] = slug;
    data['sort_order'] = sortOrder;
    data['short_description'] = shortDescription;
    data['details'] = details;
    data['banner'] = banner;
    data['hover_banner'] = hoverBanner;
    data['status'] = status;
    data['button_text'] = buttonText;
    data['landing_page_title'] = landingPageTitle;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['parent_section_id'] = parentSectionId;
    if (productSection != null) {
      data['product_section'] = productSection!.toJson();
    }
    return data;
  }
}

class ProductSection {
  int? productId;
  int? sectionId;
  String? createdAt;
  String? updatedAt;

  ProductSection(
      {this.productId, this.sectionId, this.createdAt, this.updatedAt});

  ProductSection.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    sectionId = json['section_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['section_id'] = sectionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Brand {
  String? brandName;

  Brand({this.brandName});

  Brand.fromJson(Map<String, dynamic> json) {
    brandName = json['brand_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_name'] = brandName;
    return data;
  }
}

class Season {
  String? seasonName;

  Season({this.seasonName});

  Season.fromJson(Map<String, dynamic> json) {
    seasonName = json['season_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season_name'] = seasonName;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;
  ProductTag? productTag;

  Tags(
      {this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.productTag});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productTag = json['product_tag'] != null
        ? ProductTag.fromJson(json['product_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (productTag != null) {
      data['product_tag'] = productTag!.toJson();
    }
    return data;
  }
}

class ProductTag {
  int? productId;
  int? tagId;

  ProductTag({this.productId, this.tagId});

  ProductTag.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['tag_id'] = tagId;
    return data;
  }
}

class Vendor {
  String? vendorName;
  String? vendorShopName;

  Vendor({this.vendorName, this.vendorShopName});

  Vendor.fromJson(Map<String, dynamic> json) {
    vendorName = json['vendor_name'];
    vendorShopName = json['vendor_shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendor_name'] = vendorName;
    data['vendor_shop_name'] = vendorShopName;
    return data;
  }
}

class ProductColorVariants {
  int? id;
  int? productId;
  int? colorId;
  String? profilePhoto;
  String? frontPhoto;
  String? backsidePhoto;
  String? details1Photo;
  String? details2Photo;
  String? outfitPhoto;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Color? color;
  List<ProductInventories>? productInventories;

  ProductColorVariants(
      {this.id,
        this.productId,
        this.colorId,
        this.profilePhoto,
        this.frontPhoto,
        this.backsidePhoto,
        this.details1Photo,
        this.details2Photo,
        this.outfitPhoto,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.color,
        this.productInventories});

  ProductColorVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    colorId = json['color_id'];
    profilePhoto = json['profile_photo'];
    frontPhoto = json['front_photo'];
    backsidePhoto = json['backside_photo'];
    details1Photo = json['details1_photo'];
    details2Photo = json['details2_photo'];
    outfitPhoto = json['outfit_photo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    color = json['color'] != null ? Color.fromJson(json['color']) : null;
    if (json['product_inventories'] != null) {
      productInventories = <ProductInventories>[];
      json['product_inventories'].forEach((v) {
        productInventories!.add(ProductInventories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['color_id'] = colorId;
    data['profile_photo'] = profilePhoto;
    data['front_photo'] = frontPhoto;
    data['backside_photo'] = backsidePhoto;
    data['details1_photo'] = details1Photo;
    data['details2_photo'] = details2Photo;
    data['outfit_photo'] = outfitPhoto;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (color != null) {
      data['color'] = color!.toJson();
    }
    if (productInventories != null) {
      data['product_inventories'] =
          productInventories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Color {
  int? id;
  String? name;
  String? colorCode;
  String? defaultColor;
  bool? isMulti;
  String? multiColor1;
  String? multiColor2;
  String? multiColor3;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Color(
      {this.id,
        this.name,
        this.colorCode,
        this.defaultColor,
        this.isMulti,
        this.multiColor1,
        this.multiColor2,
        this.multiColor3,
        this.status,
        this.createdAt,
        this.updatedAt});

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    defaultColor = json['default_color'];
    isMulti = json['is_multi'];
    multiColor1 = json['multi_color_1'];
    multiColor2 = json['multi_color_2'];
    multiColor3 = json['multi_color_3'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color_code'] = colorCode;
    data['default_color'] = defaultColor;
    data['is_multi'] = isMulti;
    data['multi_color_1'] = multiColor1;
    data['multi_color_2'] = multiColor2;
    data['multi_color_3'] = multiColor3;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProductInventories {
  int? id;
  int? colorVariantId;
  int? sizeTypeId;
  int? sizeId;
  int? stockQty;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Size? size;

  ProductInventories(
      {this.id,
        this.colorVariantId,
        this.sizeTypeId,
        this.sizeId,
        this.stockQty,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.size});

  ProductInventories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorVariantId = json['color_variant_id'];
    sizeTypeId = json['size_type_id'];
    sizeId = json['size_id'];
    stockQty = json['stock_qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['color_variant_id'] = colorVariantId;
    data['size_type_id'] = sizeTypeId;
    data['size_id'] = sizeId;
    data['stock_qty'] = stockQty;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (size != null) {
      data['size'] = size!.toJson();
    }
    return data;
  }
}

class Size {
  int? id;
  int? typeId;
  String? sizeCode;
  bool? status;

  Size({this.id, this.typeId, this.sizeCode, this.status});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    sizeCode = json['size_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type_id'] = typeId;
    data['size_code'] = sizeCode;
    data['status'] = status;
    return data;
  }
}

class Wishlists {
  int? id;

  Wishlists({this.id});

  Wishlists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? currentPageLimit;
  int? total;
  int? totalPage;
  String? prevPage;
  String? prevPageLimit;
  int? nextPage;
  int? nextPageLimit;

  Pagination(
      {this.currentPage,
        this.currentPageLimit,
        this.total,
        this.totalPage,
        this.prevPage,
        this.prevPageLimit,
        this.nextPage,
        this.nextPageLimit});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    currentPageLimit = json['currentPageLimit'];
    total = json['total'];
    totalPage = json['totalPage'];
    prevPage = json['prevPage'];
    prevPageLimit = json['prevPageLimit'];
    nextPage = json['nextPage'];
    nextPageLimit = json['nextPageLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['currentPageLimit'] = currentPageLimit;
    data['total'] = total;
    data['totalPage'] = totalPage;
    data['prevPage'] = prevPage;
    data['prevPageLimit'] = prevPageLimit;
    data['nextPage'] = nextPage;
    data['nextPageLimit'] = nextPageLimit;
    return data;
  }
}
