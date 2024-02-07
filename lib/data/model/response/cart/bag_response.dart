class BagePageCartResponse {
  int? statusCode;
  String? status;
  String? message;
  List<BagePageCartData>? data;

  BagePageCartResponse({this.statusCode, this.status, this.message, this.data});

  BagePageCartResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BagePageCartData>[];
      json['data'].forEach((v) {
        data!.add(new BagePageCartData.fromJson(v));
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

class BagePageCartData {
  int? id;
  String? clientCorelationId;
  int? customerId;
  int? productId;
  int stock=0;
  double totalPrice=0;
  double totalDiscountedPrice=0;
  int? colorVariantId;
  int? productInventoryId;
  int? quantity;
  Product? product;
  ProductColorVariant? productColorVariant;
  ProductInventory? productInventory;

  BagePageCartData(
      {this.id,
        this.clientCorelationId,
        this.customerId,
        this.productId,
        this.colorVariantId,
        this.productInventoryId,
        this.quantity,
        this.product,
        this.productColorVariant,
        this.productInventory});

  BagePageCartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientCorelationId = json['client_corelation_id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    colorVariantId = json['color_variant_id'];
    productInventoryId = json['product_inventory_id'];
    quantity = json['quantity'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    productColorVariant = json['product_color_variant'] != null
        ? new ProductColorVariant.fromJson(json['product_color_variant'])
        : null;
    productInventory = json['product_inventory'] != null
        ? new ProductInventory.fromJson(json['product_inventory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_corelation_id'] = this.clientCorelationId;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['color_variant_id'] = this.colorVariantId;
    data['product_inventory_id'] = this.productInventoryId;
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.productColorVariant != null) {
      data['product_color_variant'] = this.productColorVariant!.toJson();
    }
    if (this.productInventory != null) {
      data['product_inventory'] = this.productInventory!.toJson();
    }
    return data;
  }
}

class Product {
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
  double? price;
  String? discountType;
  double? discount;
  double? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Pages>? pages;
  Vendor? vendor;
  Vendor? brand;
  Vendor? season;
  List<ProductWarehouses>? productWarehouses;
  List<ProductVendorWarehouses>? productVendorWarehouses;

  Product(
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
        this.vendor,
        this.brand,
        this.season,
        this.productWarehouses,
        this.productVendorWarehouses});

  Product.fromJson(Map<String, dynamic> json) {
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
    price = double.parse(json['price'].toString());
    discountType = json['discount_type'];
    discount = double.parse(json['discount']?.toString()??"0");
    discountedPrice = double.parse(json['discounted_price'].toString());
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    brand = json['brand'] != null ? new Vendor.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? new Vendor.fromJson(json['season']) : null;
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
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    if (this.productWarehouses != null) {
      data['product_warehouses'] =
          this.productWarehouses!.map((v) => v.toJson()).toList();
    }
    if (this.productVendorWarehouses != null) {
      data['product_vendor_warehouses'] =
          this.productVendorWarehouses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? id;
  String? title;
  String? slug;
  PageProduct? pageProduct;

  Pages({this.id, this.title, this.slug, this.pageProduct});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    pageProduct = json['page_product'] != null
        ? new PageProduct.fromJson(json['page_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
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

class Vendor {
  int? id;
  String? name;

  Vendor({this.id, this.name});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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

class ProductColorVariant {
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

  ProductColorVariant(
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
        this.color});

  ProductColorVariant.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Color {
  String? name;
  String? colorCode;

  Color({this.name, this.colorCode});

  Color.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color_code'] = this.colorCode;
    return data;
  }
}

class ProductInventory {
  int? id;
  int? colorVariantId;
  int? sizeTypeId;
  int? sizeId;
  int? stockQty;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Size? size;

  ProductInventory(
      {this.id,
        this.colorVariantId,
        this.sizeTypeId,
        this.sizeId,
        this.stockQty,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.size});

  ProductInventory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorVariantId = json['color_variant_id'];
    sizeTypeId = json['size_type_id'];
    sizeId = json['size_id'];
    stockQty = json['stock_qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_variant_id'] = this.colorVariantId;
    data['size_type_id'] = this.sizeTypeId;
    data['size_id'] = this.sizeId;
    data['stock_qty'] = this.stockQty;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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





/*
class BagePageCartResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  BagePageCartResponse({this.statusCode, this.status, this.message, this.data});

  BagePageCartResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? clientCorelationId;
  String? customerId;
  int? productId;
  String? size;
  int? quantity;
  double? mrpPrice;
  double? price;
  double? discount;
  double? discounted_price;
  double totalPrice=0;
  int stock=0;
  double? finalPrice;
  int? colorVariantId;
  int? productInventoryId;
  Product? product;
  ProductColorVariant? productColorVariant;
  ProductInventory? productInventory;

  Data(
      {this.id,
        this.clientCorelationId,
        this.customerId,
        this.productId,
        this.size,
        this.quantity,
        this.mrpPrice,
        this.price,
        this.discount,
        this.finalPrice,
        this.colorVariantId,
        this.productInventoryId,
        this.product,
        this.productColorVariant,
        this.productInventory});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientCorelationId = json['client_corelation_id'];
    customerId = json['customer_id'].toString();
    productId = json['product_id'];
    size = json['size'];
    quantity = json['quantity'];
    mrpPrice = json['mrp_price'];
    price = json['price'];
    discount = json['discount'];
    finalPrice = json['final_price'];
    colorVariantId = json['color_variant_id'];
    productInventoryId = json['product_inventory_id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    productColorVariant = json['product_color_variant'] != null
        ? new ProductColorVariant.fromJson(json['product_color_variant'])
        : null;
    productInventory = json['product_inventory'] != null
        ? new ProductInventory.fromJson(json['product_inventory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_corelation_id'] = this.clientCorelationId;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['size'] = this.size;
    data['quantity'] = this.quantity;
    data['mrp_price'] = this.mrpPrice;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['final_price'] = this.finalPrice;
    data['color_variant_id'] = this.colorVariantId;
    data['product_inventory_id'] = this.productInventoryId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.productColorVariant != null) {
      data['product_color_variant'] = this.productColorVariant!.toJson();
    }
    if (this.productInventory != null) {
      data['product_inventory'] = this.productInventory!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? vendorId;
  int? brandId;
  int? seasonId;
  String? sizeTypeId;
  String? productCode;
  String? isleProductCode;
  String? name;
  int? vat;
  String? vatType;
  double? mrpPrice;
  double? price;
  String? discountType;
  String? discount;
  double? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  Brand? brand;
  List<Null>? productWarehouses;
  List<ProductVendorWarehouses>? productVendorWarehouses;

  Product(
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
        this.brand,
        this.productWarehouses,
        this.productVendorWarehouses});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    sizeTypeId = json['size_type_id'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = json['vat'];
    vatType = json['vat_type'];
    mrpPrice = double.parse(json['mrp_price'].toString());
    price =double.parse(json['price'].toString());
    discountType = json['discount_type'];
    discount = json['discount'].toString();
    discountedPrice = double.parse(json['discounted_price'].toString());
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;

    if (json['product_vendor_warehouses'] != null) {
      productVendorWarehouses = <ProductVendorWarehouses>[];
      json['product_vendor_warehouses'].forEach((v) {
        productVendorWarehouses!.add(new ProductVendorWarehouses.fromJson(v));
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
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }

    if (this.productVendorWarehouses != null) {
      data['product_vendor_warehouses'] =
          this.productVendorWarehouses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brand {
  int? id;
  String? name;

  Brand({this.id, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductVendorWarehouses {
  int? id;
  int? productId;
  int? vendorWarehouseId;
  bool? isExpress;
  bool? isSuperExpress;
  bool? status;
  String? createdAt;
  String? updatedAt;

  ProductVendorWarehouses(
      {this.id,
        this.productId,
        this.vendorWarehouseId,
        this.isExpress,
        this.isSuperExpress,
        this.status,
        this.createdAt,
        this.updatedAt});

  ProductVendorWarehouses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    vendorWarehouseId = json['vendor_warehouse_id'];
    isExpress = json['is_express'];
    isSuperExpress = json['is_super_express'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['vendor_warehouse_id'] = this.vendorWarehouseId;
    data['is_express'] = this.isExpress;
    data['is_super_express'] = this.isSuperExpress;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductColorVariant {
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

  ProductColorVariant(
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
        this.color});

  ProductColorVariant.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Color {
  String? name;
  String? colorCode;

  Color({this.name, this.colorCode});

  Color.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color_code'] = this.colorCode;
    return data;
  }
}

class ProductInventory {
  int? id;
  int? colorVariantId;
  int? sizeTypeId;
  int? sizeId;
  int? stockQty;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Size? size;

  ProductInventory(
      {this.id,
        this.colorVariantId,
        this.sizeTypeId,
        this.sizeId,
        this.stockQty,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.size});

  ProductInventory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorVariantId = json['color_variant_id'];
    sizeTypeId = json['size_type_id'];
    sizeId = json['size_id'];
    stockQty = json['stock_qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_variant_id'] = this.colorVariantId;
    data['size_type_id'] = this.sizeTypeId;
    data['size_id'] = this.sizeId;
    data['stock_qty'] = this.stockQty;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
}*/
