/*
class HomePageAllDataResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  HomePageAllDataResponse(
      {this.statusCode, this.status, this.message, this.data});

  HomePageAllDataResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sectionType;
  String? banner;
  String? buttonTxt;
  Page? page;
  int? pageId;
  int? sortOrder;
  String? shortDescription;
  String? title;
  List<SectionHomepageDetails>? sectionHomepageDetails;

  Data(
      {this.sectionType,
        this.banner,
        this.buttonTxt,
        this.page,
        this.pageId,
        this.sortOrder,
        this.shortDescription,
        this.title,
        this.sectionHomepageDetails});

  Data.fromJson(Map<String, dynamic> json) {
    sectionType = json['section_type'];
    banner = json['banner'];
    buttonTxt = json['button_txt'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    pageId = json['page_id'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    title = json['title'];
    if (json['section_homepage_details'] != null) {
      sectionHomepageDetails = <SectionHomepageDetails>[];
      json['section_homepage_details'].forEach((v) {
        sectionHomepageDetails!.add(new SectionHomepageDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_type'] = this.sectionType;
    data['banner'] = this.banner;
    data['button_txt'] = this.buttonTxt;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    data['page_id'] = this.pageId;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['title'] = this.title;
    if (this.sectionHomepageDetails != null) {
      data['section_homepage_details'] =
          this.sectionHomepageDetails!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_title'] = this.pageTitle;
    return data;
  }
}

class SectionHomepageDetails {
  int? id;
  Section? section;
  int? sectionId;
  String? banner;
  String? buttonTxt;
  int? sortOrder;
  String? title;
  String? shortDescription;
  String? sectionType;
  int? sectionHomepageId;
  SubCategory? subCategory;
  int? subCategoryId;
  Brand? brand;
  int? brandId;
  ChildCategory? childCategory;
  int? childCategoryId;
  Category? category;
  int? categoryId;

  SectionHomepageDetails(
      {this.id,
        this.section,
        this.sectionId,
        this.banner,
        this.buttonTxt,
        this.sortOrder,
        this.title,
        this.shortDescription,
        this.sectionType,
        this.sectionHomepageId,
        this.subCategory,
        this.subCategoryId,
        this.brand,
        this.brandId,
        this.childCategory,
        this.childCategoryId,
        this.category,
        this.categoryId});

  SectionHomepageDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    section =
    json['section'] != null ? new Section.fromJson(json['section']) : null;
    sectionId = json['section_id'];
    banner = json['banner'];
    buttonTxt = json['button_txt'];
    sortOrder = json['sort_order'];
    title = json['title'];
    shortDescription = json['short_description'];
    sectionType = json['section_type'];
    sectionHomepageId = json['section_homepage_id'];
    subCategory = json['sub_category'] != null
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
    subCategoryId = json['sub_category_id'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    brandId = json['brand_id'];
    childCategory = json['child_category'] != null
        ? new ChildCategory.fromJson(json['child_category'])
        : null;
    childCategoryId = json['child_category_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
    data['section_id'] = this.sectionId;
    data['banner'] = this.banner;
    data['button_txt'] = this.buttonTxt;
    data['sort_order'] = this.sortOrder;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['section_type'] = this.sectionType;
    data['section_homepage_id'] = this.sectionHomepageId;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    data['sub_category_id'] = this.subCategoryId;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['brand_id'] = this.brandId;
    if (this.childCategory != null) {
      data['child_category'] = this.childCategory!.toJson();
    }
    data['child_category_id'] = this.childCategoryId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['category_id'] = this.categoryId;
    return data;
  }
}

class Section {
  int? id;
  int? pageId;
  String? sectionTypeMegamenu;
  String? sectionTypeHomepage;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? parentSectionId;

  Section(
      {this.id,
        this.pageId,
        this.sectionTypeMegamenu,
        this.sectionTypeHomepage,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.parentSectionId});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    sectionTypeMegamenu = json['section_type_megamenu'];
    sectionTypeHomepage = json['section_type_homepage'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentSectionId = json['parent_section_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['section_type_megamenu'] = this.sectionTypeMegamenu;
    data['section_type_homepage'] = this.sectionTypeHomepage;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_section_id'] = this.parentSectionId;
    return data;
  }
}

class SubCategory {
  int? id;
  int? categoryId;
  String? title;
  String? slug;
  int? sortOrder;
  String? details;
  String? shortDescription;
  String? banner;
  bool? status;
  String? createdAt;
  String? updatedAt;

  SubCategory(
      {this.id,
        this.categoryId,
        this.title,
        this.slug,
        this.sortOrder,
        this.details,
        this.shortDescription,
        this.banner,
        this.status,
        this.createdAt,
        this.updatedAt});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    details = json['details'];
    shortDescription = json['short_description'];
    banner = json['banner'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['details'] = this.details;
    data['short_description'] = this.shortDescription;
    data['banner'] = this.banner;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Brand {
  int? id;
  String? slug;
  String? brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id,
        this.slug,
        this.brandCategoryId,
        this.brandCode,
        this.name,
        this.details,
        this.logo,
        this.banner,
        this.isFeatured,
        this.status,
        this.createdAt,
        this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    brandCategoryId = json['brand_category_id'];
    brandCode = json['brand_code'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['brand_category_id'] = this.brandCategoryId;
    data['brand_code'] = this.brandCode;
    data['name'] = this.name;
    data['details'] = this.details;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['is_featured'] = this.isFeatured;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ChildCategory {
  int? id;
  int? subCategoryId;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  bool? status;
  String? createdAt;
  String? updatedAt;

  ChildCategory(
      {this.id,
        this.subCategoryId,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.status,
        this.createdAt,
        this.updatedAt});

  ChildCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_category_id'] = this.subCategoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  int? id;
  int? pageId;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  bool? status;
  bool? isBrandShow;
  bool? isFooterShow;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.pageId,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.status,
        this.isBrandShow,
        this.isFooterShow,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    status = json['status'];
    isBrandShow = json['is_brand_show'];
    isFooterShow = json['is_footer_show'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['status'] = this.status;
    data['is_brand_show'] = this.isBrandShow;
    data['is_footer_show'] = this.isFooterShow;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
*/

class HomePageAllDataResponse {
  int? statusCode;
  String? status;
  String? message;
  List<HomePageData>? data;

  HomePageAllDataResponse(
      {this.statusCode, this.status, this.message, this.data});

  HomePageAllDataResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomePageData>[];
      json['data'].forEach((v) {
        data!.add(HomePageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomePageData {
  String? sectionType;
  String? banner;
  String? buttonTxt;
  Page? page;
  int? pageId;
  int? sortOrder;
  String? shortDescription;
  String? title;
  List<SectionHomepageDetails>? sectionHomepageDetails;

  HomePageData(
      {this.sectionType,
        this.banner,
        this.buttonTxt,
        this.page,
        this.pageId,
        this.sortOrder,
        this.shortDescription,
        this.title,
        this.sectionHomepageDetails});

  HomePageData.fromJson(Map<String, dynamic> json) {
    sectionType = json['section_type'];
    banner = json['banner'];
    buttonTxt = json['button_txt'];
    page = json['page'] != null ? Page.fromJson(json['page']) : null;
    pageId = json['page_id'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    title = json['title'];
    if (json['section_homepage_details'] != null) {
      sectionHomepageDetails = <SectionHomepageDetails>[];
      json['section_homepage_details'].forEach((v) {
        sectionHomepageDetails!.add(SectionHomepageDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section_type'] = sectionType;
    data['banner'] = banner;
    data['button_txt'] = buttonTxt;
    if (page != null) {
      data['page'] = page!.toJson();
    }
    data['page_id'] = pageId;
    data['sort_order'] = sortOrder;
    data['short_description'] = shortDescription;
    data['title'] = title;
    if (sectionHomepageDetails != null) {
      data['section_homepage_details'] =
          sectionHomepageDetails!.map((v) => v.toJson()).toList();
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

class SectionHomepageDetails {
  int? id;
  Section? section;
  int? sectionId;
  String? banner;
  String? buttonTxt;
  int? sortOrder;
  String? title;
  String? shortDescription;
  String? sectionType;
  int? sectionHomepageId;
  Brand? brand;
  int? brandId;
  int? vendorId;
  int? seasonId;
  String? sizeTypeId;
  String? productCode;
  String? isleProductCode;
  String? name;
  String? vat;
  String? vatType;
  String? mrpPrice;
  int? price;
  String? discountType;
  String? discount;
  String? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  CategoryProduct? categoryProduct;
  List<Pages>? pages;
  List<Categories>? categories;
  List<SubCategories>? subCategories;
  List<ChildCategories>? childCategories;
  Season? season;
  List<Tags>? tags;
  List<ProductColorVariants>? productColorVariants;
  ChildCategory? childCategory;
  int? childCategoryId;
  Category? category;
  int? categoryId;

  SectionHomepageDetails(
      {this.id,
        this.section,
        this.sectionId,
        this.banner,
        this.buttonTxt,
        this.sortOrder,
        this.title,
        this.shortDescription,
        this.sectionType,
        this.sectionHomepageId,
        this.brand,
        this.brandId,
        this.vendorId,
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
        this.categoryProduct,
        this.pages,
        this.categories,
        this.subCategories,
        this.childCategories,
        this.season,
        this.tags,
        this.productColorVariants,
        this.childCategory,
        this.childCategoryId,
        this.category,
        this.categoryId});

  SectionHomepageDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    section =
    json['section'] != null ? Section.fromJson(json['section']) : null;
    sectionId = json['section_id'];
    banner = json['banner'];
    buttonTxt = json['button_txt'];
    sortOrder = json['sort_order'];
    title = json['title'];
    shortDescription = json['short_description'];
    sectionType = json['section_type'];
    sectionHomepageId = json['section_homepage_id'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    brandId = json['brand_id'];
    vendorId = json['vendor_id'];
    seasonId = json['season_id'];
    sizeTypeId = json['size_type_id'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = json['vat'].toString();
    vatType = json['vat_type'];
    mrpPrice = json['mrp_price'].toString();
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'].toString();
    discountedPrice = json['discounted_price'].toString();
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryProduct = json['category_product'] != null
        ? CategoryProduct.fromJson(json['category_product'])
        : null;
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
    season =
    json['season'] != null ? Season.fromJson(json['season']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(ProductColorVariants.fromJson(v));
      });
    }
    childCategory = json['child_category'] != null
        ? ChildCategory.fromJson(json['child_category'])
        : null;
    childCategoryId = json['child_category_id'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (section != null) {
      data['section'] = section!.toJson();
    }
    data['section_id'] = sectionId;
    data['banner'] = banner;
    data['button_txt'] = buttonTxt;
    data['sort_order'] = sortOrder;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['section_type'] = sectionType;
    data['section_homepage_id'] = sectionHomepageId;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['brand_id'] = brandId;
    data['vendor_id'] = vendorId;
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
    if (categoryProduct != null) {
      data['category_product'] = categoryProduct!.toJson();
    }
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
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (productColorVariants != null) {
      data['product_color_variants'] =
          productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (childCategory != null) {
      data['child_category'] = childCategory!.toJson();
    }
    data['child_category_id'] = childCategoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['category_id'] = categoryId;
    return data;
  }
}

class Section {
  int? id;
  int? pageId;
  String? sectionTypeMegamenu;
  String? sectionTypeHomepage;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? parentSectionId;

  Section(
      {this.id,
        this.pageId,
        this.sectionTypeMegamenu,
        this.sectionTypeHomepage,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.parentSectionId});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    sectionTypeMegamenu = json['section_type_megamenu'];
    sectionTypeHomepage = json['section_type_homepage'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentSectionId = json['parent_section_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['page_id'] = pageId;
    data['section_type_megamenu'] = sectionTypeMegamenu;
    data['section_type_homepage'] = sectionTypeHomepage;
    data['title'] = title;
    data['slug'] = slug;
    data['sort_order'] = sortOrder;
    data['short_description'] = shortDescription;
    data['details'] = details;
    data['banner'] = banner;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['parent_section_id'] = parentSectionId;
    return data;
  }
}

class Brand {
  int? id;
  String? slug;
  String? brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  String? isMegaMenu;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id,
        this.slug,
        this.brandCategoryId,
        this.brandCode,
        this.name,
        this.details,
        this.logo,
        this.banner,
        this.isFeatured,
        this.isMegaMenu,
        this.status,
        this.createdAt,
        this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    brandCategoryId = json['brand_category_id'].toString();
    brandCode = json['brand_code'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    isMegaMenu = json['is_mega_menu'].toString();
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['brand_category_id'] = brandCategoryId;
    data['brand_code'] = brandCode;
    data['name'] = name;
    data['details'] = details;
    data['logo'] = logo;
    data['banner'] = banner;
    data['is_featured'] = isFeatured;
    data['is_mega_menu'] = isMegaMenu;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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

class Season {
  int? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Season({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    if (productInventories != null) {
      data['product_inventories'] =
          productInventories!.map((v) => v.toJson()).toList();
    }
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

class ChildCategory {
  int? id;
  int? subCategoryId;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  bool? status;
  String? createdAt;
  String? updatedAt;

  ChildCategory(
      {this.id,
        this.subCategoryId,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.status,
        this.createdAt,
        this.updatedAt});

  ChildCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sub_category_id'] = subCategoryId;
    data['title'] = title;
    data['slug'] = slug;
    data['sort_order'] = sortOrder;
    data['short_description'] = shortDescription;
    data['details'] = details;
    data['banner'] = banner;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Category2 {
  int? id;
  int? pageId;
  int? sizeTypeId;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  bool? status;
  bool? isBrandShow;
  bool? isFooterShow;
  String? createdAt;
  String? updatedAt;

  Category2(
      {this.id,
        this.pageId,
        this.sizeTypeId,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.status,
        this.isBrandShow,
        this.isFooterShow,
        this.createdAt,
        this.updatedAt});

  Category2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    sizeTypeId = json['size_type_id'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    status = json['status'];
    isBrandShow = json['is_brand_show'];
    isFooterShow = json['is_footer_show'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['page_id'] = pageId;
    data['size_type_id'] = sizeTypeId;
    data['title'] = title;
    data['slug'] = slug;
    data['sort_order'] = sortOrder;
    data['short_description'] = shortDescription;
    data['details'] = details;
    data['banner'] = banner;
    data['status'] = status;
    data['is_brand_show'] = isBrandShow;
    data['is_footer_show'] = isFooterShow;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}