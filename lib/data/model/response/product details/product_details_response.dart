class ProductDetailsResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ProductDetailsResponse(
      {this.statusCode, this.status, this.message, this.data});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? vendorId;
  int? brandId;
  int? seasonId;
  int? qty;
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
  String? sizeType;
  List<ProductWarehouses>? productWarehouses;
  List<ProductVendorWarehouses>? productVendorWarehouses;
  List<IsleAdvices>? isleAdvices;
  List<DesignDetails>? designDetails;
  List<MaterialCompositions>? materialCompositions;
  List<CareInstructions>? careInstructions;
  List<DeliveryReturns>? deliveryReturns;

  Data(
      {this.id,
        this.vendorId,
        this.brandId,
        this.seasonId,
        this.qty,
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
        this.productColorVariants,
        this.sizeType,
        this.productWarehouses,
        this.productVendorWarehouses,
        this.isleAdvices,
        this.designDetails,
        this.materialCompositions,
        this.careInstructions,
        this.deliveryReturns});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    sizeTypeId = json['size_type_id'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = double.parse(json['vat'].toString());
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
        pages!.add(new Pages.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(new ChildCategories.fromJson(v));
      });
    }
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? new Season.fromJson(json['season']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(new ProductColorVariants.fromJson(v));
      });
    }
    sizeType = json['size_type'];
    if (json['product_warehouses'] != null) {
      productWarehouses = <ProductWarehouses>[];
      json['product_warehouses'].forEach((v) {
        productWarehouses!.add(new ProductWarehouses.fromJson(v));
      });
    }
    if (json['product_vendor_warehouses'] != null) {
      productVendorWarehouses = <ProductVendorWarehouses>[];
      json['product_vendor_warehouses'].forEach((v) {
        productVendorWarehouses!.add(new ProductVendorWarehouses.fromJson(v));
      });
    }
    if (json['isle_advices'] != null) {
      isleAdvices = <IsleAdvices>[];
      json['isle_advices'].forEach((v) {
        isleAdvices!.add(new IsleAdvices.fromJson(v));
      });
    }
    if (json['design_details'] != null) {
      designDetails = <DesignDetails>[];
      json['design_details'].forEach((v) {
        designDetails!.add(new DesignDetails.fromJson(v));
      });
    }
    if (json['material_compositions'] != null) {
      materialCompositions = <MaterialCompositions>[];
      json['material_compositions'].forEach((v) {
        materialCompositions!.add(new MaterialCompositions.fromJson(v));
      });
    }
    if (json['care_instructions'] != null) {
      careInstructions = <CareInstructions>[];
      json['care_instructions'].forEach((v) {
        careInstructions!.add(new CareInstructions.fromJson(v));
      });
    }
    if (json['delivery_returns'] != null) {
      deliveryReturns = <DeliveryReturns>[];
      json['delivery_returns'].forEach((v) {
        deliveryReturns!.add(new DeliveryReturns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['brand_id'] = this.brandId;
    data['season_id'] = this.seasonId;
    data['size_type_id'] = this.sizeTypeId;
    data['product_code'] = this.productCode;
    data['isle_product_code'] = this.isleProductCode;
    data['name'] = this.name;
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
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    if (this.childCategories != null) {
      data['child_categories'] =
          this.childCategories!.map((v) => v.toJson()).toList();
    }
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.productColorVariants != null) {
      data['product_color_variants'] =
          this.productColorVariants!.map((v) => v.toJson()).toList();
    }
    data['size_type'] = this.sizeType;
    if (this.productWarehouses != null) {
      data['product_warehouses'] =
          this.productWarehouses!.map((v) => v.toJson()).toList();
    }
    if (this.productVendorWarehouses != null) {
      data['product_vendor_warehouses'] =
          this.productVendorWarehouses!.map((v) => v.toJson()).toList();
    }
    if (this.isleAdvices != null) {
      data['isle_advices'] = this.isleAdvices!.map((v) => v.toJson()).toList();
    }
    if (this.designDetails != null) {
      data['design_details'] =
          this.designDetails!.map((v) => v.toJson()).toList();
    }
    if (this.materialCompositions != null) {
      data['material_compositions'] =
          this.materialCompositions!.map((v) => v.toJson()).toList();
    }
    if (this.careInstructions != null) {
      data['care_instructions'] =
          this.careInstructions!.map((v) => v.toJson()).toList();
    }
    if (this.deliveryReturns != null) {
      data['delivery_returns'] =
          this.deliveryReturns!.map((v) => v.toJson()).toList();
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
        ? new PageProduct.fromJson(json['page_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_title'] = this.pageTitle;
    if (this.pageProduct != null) {
      data['page_product'] = this.pageProduct!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['page_id'] = this.pageId;
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
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    categoryProduct = json['category_product'] != null
        ? new CategoryProduct.fromJson(json['category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_title'] = this.categoryTitle;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.categoryProduct != null) {
      data['category_product'] = this.categoryProduct!.toJson();
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

class CategoryProduct {
  int? productId;
  int? categoryId;

  CategoryProduct({this.productId, this.categoryId});

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
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
        ? new Category.fromJson(json['category'])
        : null;
    subCategoryProduct = json['sub_category_product'] != null
        ? new SubCategoryProduct.fromJson(json['sub_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_title'] = this.subCategoryTitle;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategoryProduct != null) {
      data['sub_category_product'] = this.subCategoryProduct!.toJson();
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
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_title'] = this.categoryTitle;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['sub_category_id'] = this.subCategoryId;
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
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
    childCategoryProduct = json['child_category_product'] != null
        ? new ChildCategoryProduct.fromJson(json['child_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_category_title'] = this.childCategoryTitle;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    if (this.childCategoryProduct != null) {
      data['child_category_product'] = this.childCategoryProduct!.toJson();
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
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_title'] = this.subCategoryTitle;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['child_category_id'] = this.childCategoryId;
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
        ? new ProductSection.fromJson(json['product_section'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_title'] = this.sectionTitle;
    if (this.productSection != null) {
      data['product_section'] = this.productSection!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['section_id'] = this.sectionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_name'] = this.brandName;
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
        ? new ProductTag.fromJson(json['product_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productTag != null) {
      data['product_tag'] = this.productTag!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['tag_id'] = this.tagId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_name'] = this.vendorName;
    data['vendor_shop_name'] = this.vendorShopName;
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
  ColorModel? color;
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
    color = json['color'] != null ? new ColorModel.fromJson(json['color']) : null;
    if (json['product_inventories'] != null) {
      productInventories = <ProductInventories>[];
      json['product_inventories'].forEach((v) {
        productInventories!.add(new ProductInventories.fromJson(v));
      });
    }
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
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.productInventories != null) {
      data['product_inventories'] =
          this.productInventories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorModel {
  String? colorName;
  String? colorCode;

  ColorModel({this.colorName, this.colorCode});

  ColorModel.fromJson(Map<String, dynamic> json) {
    colorName = json['color_name'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_name'] = this.colorName;
    data['color_code'] = this.colorCode;
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
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_variant_id'] = this.colorVariantId;
    data['stock_qty'] = this.stockQty;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['size_code'] = this.sizeCode;
    data['status'] = this.status;
    return data;
  }
}

class ProductWarehouses {
  int? id;
  int? productId;
  int? warehouseId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<ProductWarehouseDeliveryTypes>? productWarehouseDeliveryTypes;

  ProductWarehouses(
      {this.id,
        this.productId,
        this.warehouseId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.productWarehouseDeliveryTypes});

  ProductWarehouses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    warehouseId = json['warehouse_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['product_warehouse_delivery_types'] != null) {
      productWarehouseDeliveryTypes = <ProductWarehouseDeliveryTypes>[];
      json['product_warehouse_delivery_types'].forEach((v) {
        productWarehouseDeliveryTypes!
            .add(new ProductWarehouseDeliveryTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['warehouse_id'] = this.warehouseId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productWarehouseDeliveryTypes != null) {
      data['product_warehouse_delivery_types'] =
          this.productWarehouseDeliveryTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductWarehouseDeliveryTypes {
  int? id;
  int? productWarehouseId;
  int? deliveryTypeId;
  String? createdAt;
  String? updatedAt;
  DeliveryType? deliveryType;

  ProductWarehouseDeliveryTypes(
      {this.id,
        this.productWarehouseId,
        this.deliveryTypeId,
        this.createdAt,
        this.updatedAt,
        this.deliveryType});

  ProductWarehouseDeliveryTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productWarehouseId = json['product_warehouse_id'];
    deliveryTypeId = json['delivery_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated-at'];
    deliveryType = json['delivery_type'] != null
        ? new DeliveryType.fromJson(json['delivery_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_warehouse_id'] = this.productWarehouseId;
    data['delivery_type_id'] = this.deliveryTypeId;
    data['created_at'] = this.createdAt;
    data['updated-at'] = this.updatedAt;
    if (this.deliveryType != null) {
      data['delivery_type'] = this.deliveryType!.toJson();
    }
    return data;
  }
}

class DeliveryType {
  int? id;
  String? name;
  String? shortDescription;
  String? description;
  String? icon;
  bool? alwaysAvailable;
  bool? availableCity;
  int? deliveryChargeCity;
  bool? availableOutsideCity;
  double? deliveryChargeOutsideCity;
  String? createdAt;
  String? updatedAt;

  DeliveryType(
      {this.id,
        this.name,
        this.shortDescription,
        this.description,
        this.icon,
        this.alwaysAvailable,
        this.availableCity,
        this.deliveryChargeCity,
        this.availableOutsideCity,
        this.deliveryChargeOutsideCity,
        this.createdAt,
        this.updatedAt});

  DeliveryType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    icon = json['icon'];
    alwaysAvailable = json['always_available'];
    availableCity = json['available_city'];
    deliveryChargeCity = json['delivery_charge_city'];
    availableOutsideCity = json['available_outside_city'];
    deliveryChargeOutsideCity = double.parse(json['delivery_charge_outside_city'].toString());
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['always_available'] = this.alwaysAvailable;
    data['available_city'] = this.availableCity;
    data['delivery_charge_city'] = this.deliveryChargeCity;
    data['available_outside_city'] = this.availableOutsideCity;
    data['delivery_charge_outside_city'] = this.deliveryChargeOutsideCity;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class ProductVendorWarehouses {
  int? id;
  int? productId;
  int? vendorWarehouseId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<ProductVendorWarehouseDeliveryTypes>?
  productVendorWarehouseDeliveryTypes;

  ProductVendorWarehouses(
      {this.id,
        this.productId,
        this.vendorWarehouseId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.productVendorWarehouseDeliveryTypes});

  ProductVendorWarehouses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    vendorWarehouseId = json['vendor_warehouse_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['product_vendor_warehouse_delivery_types'] != null) {
      productVendorWarehouseDeliveryTypes =
      <ProductVendorWarehouseDeliveryTypes>[];
      json['product_vendor_warehouse_delivery_types'].forEach((v) {
        productVendorWarehouseDeliveryTypes!
            .add(new ProductVendorWarehouseDeliveryTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['vendor_warehouse_id'] = this.vendorWarehouseId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productVendorWarehouseDeliveryTypes != null) {
      data['product_vendor_warehouse_delivery_types'] = this
          .productVendorWarehouseDeliveryTypes!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class ProductVendorWarehouseDeliveryTypes {
  int? id;
  int? productVendorWarehouseId;
  int? deliveryTypeId;
  String? createdAt;
  String? updatedAt;
  DeliveryType? deliveryType;

  ProductVendorWarehouseDeliveryTypes(
      {this.id,
        this.productVendorWarehouseId,
        this.deliveryTypeId,
        this.createdAt,
        this.updatedAt,
        this.deliveryType});

  ProductVendorWarehouseDeliveryTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productVendorWarehouseId = json['product_vendor_warehouse_id'];
    deliveryTypeId = json['delivery_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated-at'];
    deliveryType = json['delivery_type'] != null
        ? new DeliveryType.fromJson(json['delivery_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_vendor_warehouse_id'] = this.productVendorWarehouseId;
    data['delivery_type_id'] = this.deliveryTypeId;
    data['created_at'] = this.createdAt;
    data['updated-at'] = this.updatedAt;
    if (this.deliveryType != null) {
      data['delivery_type'] = this.deliveryType!.toJson();
    }
    return data;
  }
}

class IsleAdvices {
  int? id;
  int? instructionFieldId;
  String? fieldName;
  String? value;
  int? productId;
  String? instructionType;

  IsleAdvices(
      {this.id,
        this.instructionFieldId,
        this.fieldName,
        this.value,
        this.productId,
        this.instructionType});

  IsleAdvices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instruction_field_id'] = this.instructionFieldId;
    data['field_name'] = this.fieldName;
    data['value'] = this.value;
    data['product_id'] = this.productId;
    data['instruction_type'] = this.instructionType;
    return data;
  }
}

class DesignDetails {
  int? id;
  int? instructionFieldId;
  String? fieldName;
  String? value;
  int? productId;
  String? instructionType;
  bool isDrop= false;

  DesignDetails(
      {this.id,
        this.instructionFieldId,
        this.fieldName,
        this.value,
        this.productId,
        this.instructionType});

  DesignDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instruction_field_id'] = this.instructionFieldId;
    data['field_name'] = this.fieldName;
    data['value'] = this.value;
    data['product_id'] = this.productId;
    data['instruction_type'] = this.instructionType;
    return data;
  }
}

class MaterialCompositions {
  int? id;
  int? instructionFieldId;
  String? fieldName;
  String? value;
  int? productId;
  String? instructionType;
  bool isDrop= false;

  MaterialCompositions(
      {this.id,
        this.instructionFieldId,
        this.fieldName,
        this.value,
        this.productId,
        this.instructionType});

  MaterialCompositions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instruction_field_id'] = this.instructionFieldId;
    data['field_name'] = this.fieldName;
    data['value'] = this.value;
    data['product_id'] = this.productId;
    data['instruction_type'] = this.instructionType;
    return data;
  }
}

class CareInstructions {
  int? id;
  int? instructionFieldId;
  String? fieldName;
  String? value;
  int? productId;
  String? instructionType;
  bool isDrop= false;

  CareInstructions(
      {this.id,
        this.instructionFieldId,
        this.fieldName,
        this.value,
        this.productId,
        this.instructionType});

  CareInstructions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instruction_field_id'] = this.instructionFieldId;
    data['field_name'] = this.fieldName;
    data['value'] = this.value;
    data['product_id'] = this.productId;
    data['instruction_type'] = this.instructionType;
    return data;
  }
}

class DeliveryReturns {
  int? id;
  int? instructionFieldId;
  String? fieldName;
  String? value;
  int? productId;
  String? instructionType;
  bool isDrop= false;

  DeliveryReturns(
      {this.id,
        this.instructionFieldId,
        this.fieldName,
        this.value,
        this.productId,
        this.instructionType});

  DeliveryReturns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instruction_field_id'] = this.instructionFieldId;
    data['field_name'] = this.fieldName;
    data['value'] = this.value;
    data['product_id'] = this.productId;
    data['instruction_type'] = this.instructionType;
    return data;
  }
}














































/*class IsleAdvices {
  int? id;
  int? instructionFieldId;
  String? fieldName;
  String? value;
  int? productId;
  String? instructionType;
  bool isDrop= false;

  IsleAdvices(
      {this.id,
        this.instructionFieldId,
        this.fieldName,
        this.value,
        this.productId,
        this.instructionType});

  IsleAdvices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instruction_field_id'] = this.instructionFieldId;
    data['field_name'] = this.fieldName;
    data['value'] = this.value;
    data['product_id'] = this.productId;
    data['instruction_type'] = this.instructionType;
    return data;
  }
}*/


















/// 1st
/*
class ProductDetailsResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ProductDetailsResponse(
      {this.statusCode, this.status, this.message, this.data});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  int? mrpPrice;
  int? price;
  String? discountType;
  int? discount;
  int? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  Page? page;
  Brand? brand;
  Season? season;
  SubCategory? subCategory;
  ChildCategory? childCategory;
  List<ProductColorVariants>? productColorVariants;
  List<Tags>? tags;
  Category? category;
  IsleAdvice? isleAdvice;
  DesignDetail? designDetail;
  MaterialComposition? materialComposition;
  CareInstruction? careInstruction;
  DeliveryReturn? deliveryReturn;
  List<Sections>? sections;

  Data(
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
        this.page,
        this.brand,
        this.season,
        this.subCategory,
        this.childCategory,
        this.productColorVariants,
        this.tags,
        this.category,
        this.isleAdvice,
        this.designDetail,
        this.materialComposition,
        this.careInstruction,
        this.deliveryReturn,
        this.sections});

  Data.fromJson(Map<String, dynamic> json) {
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
    mrpPrice = json['mrp_price'];
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountedPrice = json['discounted_price'];
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? new Season.fromJson(json['season']) : null;
    subCategory = json['sub_category'] != null
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
    childCategory = json['child_category'] != null
        ? new ChildCategory.fromJson(json['child_category'])
        : null;
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(new ProductColorVariants.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    isleAdvice = json['isle_advice'] != null
        ? new IsleAdvice.fromJson(json['isle_advice'])
        : null;
    designDetail = json['design_detail'] != null
        ? new DesignDetail.fromJson(json['design_detail'])
        : null;
    materialComposition = json['material_composition'] != null
        ? new MaterialComposition.fromJson(json['material_composition'])
        : null;
    careInstruction = json['care_instruction'] != null
        ? new CareInstruction.fromJson(json['care_instruction'])
        : null;
    deliveryReturn = json['delivery_return'] != null
        ? new DeliveryReturn.fromJson(json['delivery_return'])
        : null;
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
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
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    if (this.childCategory != null) {
      data['child_category'] = this.childCategory!.toJson();
    }
    if (this.productColorVariants != null) {
      data['product_color_variants'] =
          this.productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.isleAdvice != null) {
      data['isle_advice'] = this.isleAdvice!.toJson();
    }
    if (this.designDetail != null) {
      data['design_detail'] = this.designDetail!.toJson();
    }
    if (this.materialComposition != null) {
      data['material_composition'] = this.materialComposition!.toJson();
    }
    if (this.careInstruction != null) {
      data['care_instruction'] = this.careInstruction!.toJson();
    }
    if (this.deliveryReturn != null) {
      data['delivery_return'] = this.deliveryReturn!.toJson();
    }
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
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

class Brand {
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;

  Brand({this.brandCode, this.name, this.details, this.logo, this.banner});

  Brand.fromJson(Map<String, dynamic> json) {
    brandCode = json['brand_code'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_code'] = this.brandCode;
    data['name'] = this.name;
    data['details'] = this.details;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
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

class SubCategory {
  String? subCategoryTitle;

  SubCategory({this.subCategoryTitle});

  SubCategory.fromJson(Map<String, dynamic> json) {
    subCategoryTitle = json['sub_category_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_title'] = this.subCategoryTitle;
    return data;
  }
}

class ChildCategory {
  String? childCategoryTitle;

  ChildCategory({this.childCategoryTitle});

  ChildCategory.fromJson(Map<String, dynamic> json) {
    childCategoryTitle = json['child_category_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_category_title'] = this.childCategoryTitle;
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
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    if (json['product_inventories'] != null) {
      productInventories = <ProductInventories>[];
      json['product_inventories'].forEach((v) {
        productInventories!.add(new ProductInventories.fromJson(v));
      });
    }
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
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.productInventories != null) {
      data['product_inventories'] =
          this.productInventories!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_name'] = this.colorName;
    data['color_code'] = this.colorCode;
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
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_variant_id'] = this.colorVariantId;
    data['stock_qty'] = this.stockQty;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    return data;
  }
}

class Size {
  int? id;
  String? type;
  String? sizeCode;

  Size({this.id, this.type, this.sizeCode});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    sizeCode = json['size_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['size_code'] = this.sizeCode;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  ProductTag? productTag;

  Tags({this.id, this.name, this.productTag});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productTag = json['product_tag'] != null
        ? new ProductTag.fromJson(json['product_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.productTag != null) {
      data['product_tag'] = this.productTag!.toJson();
    }
    return data;
  }
}

class ProductTag {
  int? productId;
  int? tagId;
  String? createdAt;
  String? updatedAt;

  ProductTag({this.productId, this.tagId, this.createdAt, this.updatedAt});

  ProductTag.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    tagId = json['tag_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['tag_id'] = this.tagId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  String? categoryTitle;

  Category({this.categoryTitle});

  Category.fromJson(Map<String, dynamic> json) {
    categoryTitle = json['category_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_title'] = this.categoryTitle;
    return data;
  }
}

class IsleAdvice {
  int? id;
  int? productId;
  String? seasonToCelebrate;
  String? occasionToWear;
  String? eventsToParticipant;
  String? lifestyleToUse;
  String? createdAt;
  String? updatedAt;

  IsleAdvice(
      {this.id,
        this.productId,
        this.seasonToCelebrate,
        this.occasionToWear,
        this.eventsToParticipant,
        this.lifestyleToUse,
        this.createdAt,
        this.updatedAt});

  IsleAdvice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    seasonToCelebrate = json['season_to_celebrate'];
    occasionToWear = json['occasion_to_wear'];
    eventsToParticipant = json['events_to_participant'];
    lifestyleToUse = json['lifestyle_to_use'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['season_to_celebrate'] = this.seasonToCelebrate;
    data['occasion_to_wear'] = this.occasionToWear;
    data['events_to_participant'] = this.eventsToParticipant;
    data['lifestyle_to_use'] = this.lifestyleToUse;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DesignDetail {
  int? id;
  int? productId;
  String? usp;
  String? fit;
  String? color;
  String? pattern;
  String? embelishment;
  String? sleeveLegs;
  String? neckCollarDetails;
  String? createdAt;
  String? updatedAt;

  DesignDetail(
      {this.id,
        this.productId,
        this.usp,
        this.fit,
        this.color,
        this.pattern,
        this.embelishment,
        this.sleeveLegs,
        this.neckCollarDetails,
        this.createdAt,
        this.updatedAt});

  DesignDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    usp = json['usp'];
    fit = json['fit'];
    color = json['color'];
    pattern = json['pattern'];
    embelishment = json['embelishment'];
    sleeveLegs = json['sleeve/legs'];
    neckCollarDetails = json['neck/collar/details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['usp'] = this.usp;
    data['fit'] = this.fit;
    data['color'] = this.color;
    data['pattern'] = this.pattern;
    data['embelishment'] = this.embelishment;
    data['sleeve/legs'] = this.sleeveLegs;
    data['neck/collar/details'] = this.neckCollarDetails;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class MaterialComposition {
  int? id;
  int? productId;
  String? fabric;
  String? finish;
  String? weight;
  String? createdAt;
  String? updatedAt;

  MaterialComposition(
      {this.id,
        this.productId,
        this.fabric,
        this.finish,
        this.weight,
        this.createdAt,
        this.updatedAt});

  MaterialComposition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    fabric = json['fabric'];
    finish = json['finish'];
    weight = json['weight'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['fabric'] = this.fabric;
    data['finish'] = this.finish;
    data['weight'] = this.weight;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CareInstruction {
  int? id;
  int? productId;
  String? wash;
  String? bleach;
  String? tumbleDry;
  String? iron;
  String? dryClean;
  String? createdAt;
  String? updatedAt;

  CareInstruction(
      {this.id,
        this.productId,
        this.wash,
        this.bleach,
        this.tumbleDry,
        this.iron,
        this.dryClean,
        this.createdAt,
        this.updatedAt});

  CareInstruction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    wash = json['wash'];
    bleach = json['bleach'];
    tumbleDry = json['tumble_dry'];
    iron = json['iron'];
    dryClean = json['dry_clean'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['wash'] = this.wash;
    data['bleach'] = this.bleach;
    data['tumble_dry'] = this.tumbleDry;
    data['iron'] = this.iron;
    data['dry_clean'] = this.dryClean;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DeliveryReturn {
  int? id;
  int? productId;
  String? superExpress;
  String? express;
  String? standard;
  String? createdAt;
  String? updatedAt;

  DeliveryReturn(
      {this.id,
        this.productId,
        this.superExpress,
        this.express,
        this.standard,
        this.createdAt,
        this.updatedAt});

  DeliveryReturn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    superExpress = json['super_express'];
    express = json['express'];
    standard = json['standard'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['super_express'] = this.superExpress;
    data['express'] = this.express;
    data['standard'] = this.standard;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Sections {
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
  ProductSection? productSection;

  Sections(
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
        this.parentSectionId,
        this.productSection});

  Sections.fromJson(Map<String, dynamic> json) {
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
    productSection = json['product_section'] != null
        ? new ProductSection.fromJson(json['product_section'])
        : null;
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
    if (this.productSection != null) {
      data['product_section'] = this.productSection!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['section_id'] = this.sectionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
*/






/*
class ProductDetailsResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ProductDetailsResponse(
      {this.statusCode, this.status, this.message, this.data});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? vendorId;
  int? brandId;
  int? seasonId;
  String? productCode;
  String? isleProductCode;
  String? name;
  int? vat;
  String? vatType;
  double? mrpPrice;
  int? price;
  String? discountType;
  int? discount;
  double? discountedPrice;
  bool? isPublish;
  Null? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Pages>? pages;
  List<Categories>? categories;
  List<SubCategories>? subCategories;
  List<ChildCategories>? childCategories;
  Brand? brand;
  Season? season;
  Vendor? vendor;
  List<ProductColorVariants>? productColorVariants;
  List<Sections>? sections;
  List<Tags>? tags;
  List<IsleAdvices>? isleAdvices;
  List<DesignDetails>? designDetails;
  List<MaterialCompositions>? materialCompositions;
  List<CareInstructions>? careInstructions;
  List<DeliveryReturns>? deliveryReturns;

  Data(
      {this.id,
        this.vendorId,
        this.brandId,
        this.seasonId,
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
        this.brand,
        this.season,
        this.vendor,
        this.productColorVariants,
        this.sections,
        this.tags,
        this.isleAdvices,
        this.designDetails,
        this.materialCompositions,
        this.careInstructions,
        this.deliveryReturns});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = json['vat'];
    vatType = json['vat_type'];
    mrpPrice = json['mrp_price'];
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
        pages!.add(new Pages.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(new ChildCategories.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? new Season.fromJson(json['season']) : null;
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(new ProductColorVariants.fromJson(v));
      });
    }
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    if (json['isle_advices'] != null) {
      isleAdvices = <IsleAdvices>[];
      json['isle_advices'].forEach((v) {
        isleAdvices!.add(new IsleAdvices.fromJson(v));
      });
    }
    if (json['design_details'] != null) {
      designDetails = <DesignDetails>[];
      json['design_details'].forEach((v) {
        designDetails!.add(new DesignDetails.fromJson(v));
      });
    }
    if (json['material_compositions'] != null) {
      materialCompositions = <MaterialCompositions>[];
      json['material_compositions'].forEach((v) {
        materialCompositions!.add(new MaterialCompositions.fromJson(v));
      });
    }
    if (json['care_instructions'] != null) {
      careInstructions = <CareInstructions>[];
      json['care_instructions'].forEach((v) {
        careInstructions!.add(new CareInstructions.fromJson(v));
      });
    }
    if (json['delivery_returns'] != null) {
      deliveryReturns = <DeliveryReturns>[];
      json['delivery_returns'].forEach((v) {
        deliveryReturns!.add(new DeliveryReturns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['brand_id'] = this.brandId;
    data['season_id'] = this.seasonId;
    data['product_code'] = this.productCode;
    data['isle_product_code'] = this.isleProductCode;
    data['name'] = this.name;
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
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    if (this.childCategories != null) {
      data['child_categories'] =
          this.childCategories!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.productColorVariants != null) {
      data['product_color_variants'] =
          this.productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.isleAdvices != null) {
      data['isle_advices'] = this.isleAdvices!.map((v) => v.toJson()).toList();
    }
    if (this.designDetails != null) {
      data['design_details'] =
          this.designDetails!.map((v) => v.toJson()).toList();
    }
    if (this.materialCompositions != null) {
      data['material_compositions'] =
          this.materialCompositions!.map((v) => v.toJson()).toList();
    }
    if (this.careInstructions != null) {
      data['care_instructions'] =
          this.careInstructions!.map((v) => v.toJson()).toList();
    }
    if (this.deliveryReturns != null) {
      data['delivery_returns'] =
          this.deliveryReturns!.map((v) => v.toJson()).toList();
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
        ? new PageProduct.fromJson(json['page_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_title'] = this.pageTitle;
    if (this.pageProduct != null) {
      data['page_product'] = this.pageProduct!.toJson();
    }
    return data;
  }
}

class PageProduct {
  int? productId;
  int? pageId;
  String? createdAt;
  String? updatedAt;

  PageProduct({this.productId, this.pageId, this.createdAt, this.updatedAt});

  PageProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    pageId = json['page_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['page_id'] = this.pageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    categoryProduct = json['category_product'] != null
        ? new CategoryProduct.fromJson(json['category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_title'] = this.categoryTitle;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.categoryProduct != null) {
      data['category_product'] = this.categoryProduct!.toJson();
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

class CategoryProduct {
  int? productId;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  CategoryProduct(
      {this.productId, this.categoryId, this.createdAt, this.updatedAt});

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
        ? new Category.fromJson(json['category'])
        : null;
    subCategoryProduct = json['sub_category_product'] != null
        ? new SubCategoryProduct.fromJson(json['sub_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_title'] = this.subCategoryTitle;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategoryProduct != null) {
      data['sub_category_product'] = this.subCategoryProduct!.toJson();
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
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_title'] = this.categoryTitle;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    return data;
  }
}

class SubCategoryProduct {
  int? productId;
  int? subCategoryId;
  String? createdAt;
  String? updatedAt;

  SubCategoryProduct(
      {this.productId, this.subCategoryId, this.createdAt, this.updatedAt});

  SubCategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    subCategoryId = json['sub_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['sub_category_id'] = this.subCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
    childCategoryProduct = json['child_category_product'] != null
        ? new ChildCategoryProduct.fromJson(json['child_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_category_title'] = this.childCategoryTitle;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    if (this.childCategoryProduct != null) {
      data['child_category_product'] = this.childCategoryProduct!.toJson();
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
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_title'] = this.subCategoryTitle;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class ChildCategoryProduct {
  int? productId;
  int? childCategoryId;
  String? createdAt;
  String? updatedAt;

  ChildCategoryProduct(
      {this.productId, this.childCategoryId, this.createdAt, this.updatedAt});

  ChildCategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    childCategoryId = json['child_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['child_category_id'] = this.childCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_name'] = this.brandName;
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

class Vendor {
  String? vendorName;
  String? vendorShopName;

  Vendor({this.vendorName, this.vendorShopName});

  Vendor.fromJson(Map<String, dynamic> json) {
    vendorName = json['vendor_name'];
    vendorShopName = json['vendor_shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_name'] = this.vendorName;
    data['vendor_shop_name'] = this.vendorShopName;
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
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    if (json['product_inventories'] != null) {
      productInventories = <ProductInventories>[];
      json['product_inventories'].forEach((v) {
        productInventories!.add(new ProductInventories.fromJson(v));
      });
    }
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
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.productInventories != null) {
      data['product_inventories'] =
          this.productInventories!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_name'] = this.colorName;
    data['color_code'] = this.colorCode;
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
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_variant_id'] = this.colorVariantId;
    data['stock_qty'] = this.stockQty;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['size_code'] = this.sizeCode;
    data['status'] = this.status;
    return data;
  }
}

class Sections {
  int? id;
  int? pageId;
  String? sectionTypeMegamenu;
  Null? sectionTypeHomepage;
  String? title;
  Null? slug;
  int? sortOrder;
  Null? shortDescription;
  String? details;
  Null? banner;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Null? parentSectionId;
  ProductSection? productSection;

  Sections(
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
        this.parentSectionId,
        this.productSection});

  Sections.fromJson(Map<String, dynamic> json) {
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
    productSection = json['product_section'] != null
        ? new ProductSection.fromJson(json['product_section'])
        : null;
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
    if (this.productSection != null) {
      data['product_section'] = this.productSection!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['section_id'] = this.sectionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
        ? new ProductTag.fromJson(json['product_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productTag != null) {
      data['product_tag'] = this.productTag!.toJson();
    }
    return data;
  }
}

class ProductTag {
  int? productId;
  int? tagId;
  String? createdAt;
  String? updatedAt;

  ProductTag({this.productId, this.tagId, this.createdAt, this.updatedAt});

  ProductTag.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    tagId = json['tag_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['tag_id'] = this.tagId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class IsleAdvices {
  int? id;
  int? instructionFieldId;
  String? fieldName;
  String? value;
  int? productId;
  String? instructionType;

  IsleAdvices(
      {this.id,
        this.instructionFieldId,
        this.fieldName,
        this.value,
        this.productId,
        this.instructionType});

  IsleAdvices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instruction_field_id'] = this.instructionFieldId;
    data['field_name'] = this.fieldName;
    data['value'] = this.value;
    data['product_id'] = this.productId;
    data['instruction_type'] = this.instructionType;
    return data;
  }
}
class DesignDetails {
  DesignDetails({
    required this.id,
    required this.instructionFieldId,
    required this.fieldName,
    required this.value,
    required this.productId,
    required this.instructionType,
  });
  late final int id;
  late final int instructionFieldId;
  late final String fieldName;
  late final String value;
  late final int productId;
  late final String instructionType;

  DesignDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['instruction_field_id'] = instructionFieldId;
    _data['field_name'] = fieldName;
    _data['value'] = value;
    _data['product_id'] = productId;
    _data['instruction_type'] = instructionType;
    return _data;
  }
}

class MaterialCompositions {
  MaterialCompositions({
    required this.id,
    required this.instructionFieldId,
    required this.fieldName,
    required this.value,
    required this.productId,
    required this.instructionType,
  });
  late final int id;
  late final int instructionFieldId;
  late final String fieldName;
  late final String value;
  late final int productId;
  late final String instructionType;

  MaterialCompositions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['instruction_field_id'] = instructionFieldId;
    _data['field_name'] = fieldName;
    _data['value'] = value;
    _data['product_id'] = productId;
    _data['instruction_type'] = instructionType;
    return _data;
  }
}

class CareInstructions {
  CareInstructions({
    required this.id,
    required this.instructionFieldId,
    required this.fieldName,
    required this.value,
    required this.productId,
    required this.instructionType,
  });
  late final int id;
  late final int instructionFieldId;
  late final String fieldName;
  late final String value;
  late final int productId;
  late final String instructionType;

  CareInstructions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['instruction_field_id'] = instructionFieldId;
    _data['field_name'] = fieldName;
    _data['value'] = value;
    _data['product_id'] = productId;
    _data['instruction_type'] = instructionType;
    return _data;
  }
}

class DeliveryReturns {
  DeliveryReturns({
    required this.id,
    required this.instructionFieldId,
    required this.fieldName,
    required this.value,
    required this.productId,
    required this.instructionType,
  });

  late final int id;
  late final int instructionFieldId;
  late final String fieldName;
  late final String value;
  late final int productId;
  late final String instructionType;

  DeliveryReturns.fromJson(Map<String, dynamic> json){
    id = json['id'];
    instructionFieldId = json['instruction_field_id'];
    fieldName = json['field_name'];
    value = json['value'];
    productId = json['product_id'];
    instructionType = json['instruction_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['instruction_field_id'] = instructionFieldId;
    _data['field_name'] = fieldName;
    _data['value'] = value;
    _data['product_id'] = productId;
    _data['instruction_type'] = instructionType;
    return _data;
  }
}
*/
