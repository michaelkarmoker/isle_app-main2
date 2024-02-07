class SubCategoryModel {
  int? statusCode;
  String? status;
  String? message;
  SubCategoryData? data;

  SubCategoryModel({this.statusCode, this.status, this.message, this.data});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SubCategoryData.fromJson(json['data']) : null;
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

class SubCategoryData {
  List<SubCategoryResult>? result;
  Pagination? pagination;

  SubCategoryData({this.result, this.pagination});

  SubCategoryData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <SubCategoryResult>[];
      json['result'].forEach((v) {
        result!.add(SubCategoryResult.fromJson(v));
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

class SubCategoryResult {
  int? id;
  int? vendorId;
  int? brandId;
  int? seasonId;
  String? sizeTypeId;
  String? productCode;
  String? isleProductCode;
  String? name;
  double? vat;
  String? vatType;
  double? mrpPrice;
  int? price;
  String? discountType;
  int? discount;
  double? discountedPrice;
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

  SubCategoryResult(
      {this.id,
        this.vendorId,
        this.brandId,
        this.seasonId,
        this.sizeTypeId,
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
        this.productColorVariants});

  SubCategoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    sizeTypeId = json['size_type_id'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = json['vat'].toDouble();
    vatType = json['vat_type'];
    mrpPrice = double.parse(json['mrp_price'].toString());
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountedPrice = double.parse(json['discounted_price'].toString());
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vendor_id'] = vendorId;
    data['brand_id'] = brandId;
    data['season_id'] = seasonId;
    data['size_type_id'] = sizeTypeId;
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
    return data;
  }
}

class Pages {
  String? pageTitle;
  PageProduct? pageProduct;

  Pages({this.pageTitle, this.pageProduct});

  Pages.fromJson(Map<String, dynamic> json) {
    pageTitle = json['page_title'];
    pageProduct = json['page_product'] != null
        ? PageProduct.fromJson(json['page_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page_title'] = pageTitle;
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
  int? id;
  String? categoryTitle;
  Category? category;
  SubCategoryProduct? subCategoryProduct;

  SubCategories(
      {this.subCategoryTitle,
        this.id,
        this.categoryTitle,
        this.category,
        this.subCategoryProduct});

  SubCategories.fromJson(Map<String, dynamic> json) {
    subCategoryTitle = json['sub_category_title'];
    id = json['id'];
    categoryTitle = json['category_title'];
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
    data['id'] = id;
    data['category_title'] = categoryTitle;
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
  String? sectionTitle;
  ProductSection? productSection;

  Sections({this.sectionTitle, this.productSection});

  Sections.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['section_title'];
    productSection = json['product_section'] != null
        ? ProductSection.fromJson(json['product_section'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section_title'] = sectionTitle;
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
  String? colorName;
  String? colorCode;

  Color({this.colorName, this.colorCode});

  Color.fromJson(Map<String, dynamic> json) {
    colorName = json['color_name'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color_name'] = colorName;
    data['color_code'] = colorCode;
    return data;
  }
}

class ProductInventories {
  int? id;
  int? colorVariantId;
  int? stockQty;
  Size? size;

  ProductInventories({this.id, this.colorVariantId, this.stockQty, this.size});

  ProductInventories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorVariantId = json['color_variant_id'];
    stockQty = json['stock_qty'];
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['color_variant_id'] = colorVariantId;
    data['stock_qty'] = stockQty;
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









/*
class SubCategoryResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  SubCategoryResponse({this.statusCode, this.status, this.message, this.data});

  SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Result>? result;
  Pagination? pagination;

  Data({this.result, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  int? vendorId;
  int? brandId;
  int? pageId;
  int? categoryId;
  int? subCategoryId;
  int? childCategoryId;
  int? seasonId;
  String? productCode;
  String? isleProductCode;
  String? name;
  String? shortDetails;
  int? vat;
  String? vatType;
  double? mrpPrice;
  int? price;
  String? discountType;
  int? discount;
  double? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<ProductColorVariants>? productColorVariants;
  Brand? brand;
  Season? season;

  Result(
      {this.id,
        this.vendorId,
        this.brandId,
        this.pageId,
        this.categoryId,
        this.subCategoryId,
        this.childCategoryId,
        this.seasonId,
        this.productCode,
        this.isleProductCode,
        this.name,
        this.shortDetails,
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
        this.productColorVariants,
        this.brand,
        this.season});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    pageId = json['page_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    childCategoryId = json['child_category_id'];
    seasonId = json['season_id'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    shortDetails = json['short_details'];
    vat = json['vat'];
    vatType = json['vat_type'];
    mrpPrice = double.parse(json['mrp_price'].toString());
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountedPrice = double.parse(json['discounted_price'].toString());
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(new ProductColorVariants.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? new Season.fromJson(json['season']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['brand_id'] = this.brandId;
    data['page_id'] = this.pageId;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['child_category_id'] = this.childCategoryId;
    data['season_id'] = this.seasonId;
    data['product_code'] = this.productCode;
    data['isle_product_code'] = this.isleProductCode;
    data['name'] = this.name;
    data['short_details'] = this.shortDetails;
    data['vat'] = this.vat;
    data['vat_type'] = this.vatType;
    data['mrp_price'] = this.mrpPrice;
    data['price'] = this.price;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['discounted_price'] = this.discountedPrice;
    data['is_publish'] = this.isPublish;
    data['size_guide'] = this.sizeGuide;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productColorVariants != null) {
      data['product_color_variants'] =
          this.productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
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
        this.updatedAt});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['color_id'] = this.colorId;
    data['profile_photo'] = this.profilePhoto;
    data['front_photo'] = this.frontPhoto;
    data['backside_photo'] = this.backsidePhoto;
    data['details1_photo'] = this.details1Photo;
    data['details2_photo'] = this.details2Photo;
    data['outfit_photo'] = this.outfitPhoto;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Brand {
  String? name;

  Brand({this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season_name'] = this.seasonName;
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
  String? nextPage;
  String? nextPageLimit;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['currentPageLimit'] = this.currentPageLimit;
    data['total'] = this.total;
    data['totalPage'] = this.totalPage;
    data['prevPage'] = this.prevPage;
    data['prevPageLimit'] = this.prevPageLimit;
    data['nextPage'] = this.nextPage;
    data['nextPageLimit'] = this.nextPageLimit;
    return data;
  }
}
*/
