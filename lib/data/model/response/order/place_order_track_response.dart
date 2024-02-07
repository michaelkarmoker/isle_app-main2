class PlaceOrderTrackResponse {
  PlaceOrderTrackResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  PlaceOrderTrackResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.packageName, 
      this.orderId, 
      this.vendorId, 
      this.deliveryTypeId, 
      this.packageTypeId, 
      this.price, 
      this.calculatedDiscount, 
      this.calculatedVat, 
      this.deliveryCharge, 
      this.couponId, 
      this.brandCouponDiscount, 
      this.finalPrice, 
      this.packageStatus, 
      this.rejectCause, 
      this.createdAt, 
      this.updatedAt, 
      this.deliveryType, 
      this.vendor, 
      this.order, 
      this.orderDetails,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    packageName = json['package_name'];
    orderId = json['order_id'];
    vendorId = json['vendor_id'];
    deliveryTypeId = json['delivery_type_id'];
    packageTypeId = json['package_type_id'];
    price = json['price'];
    calculatedDiscount = json['calculated_discount'];
    calculatedVat = json['calculated_vat'];
    deliveryCharge = json['delivery_charge'];
    couponId = json['coupon_id'];
    brandCouponDiscount = json['brand_coupon_discount'];
    finalPrice = json['final_price'];
    packageStatus = json['package_status'];
    rejectCause = json['reject_cause'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deliveryType = json['delivery_type'] != null ? DeliveryType.fromJson(json['delivery_type']) : null;
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['order_details'] != null) {
      orderDetails = [];
      json['order_details'].forEach((v) {
        orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
  }
  num? id;
  String? packageName;
  num? orderId;
  num? vendorId;
  num? deliveryTypeId;
  dynamic packageTypeId;
  num? price;
  num? calculatedDiscount;
  num? calculatedVat;
  num? deliveryCharge;
  dynamic couponId;
  num? brandCouponDiscount;
  num? finalPrice;
  String? packageStatus;
  dynamic rejectCause;
  String? createdAt;
  String? updatedAt;
  DeliveryType? deliveryType;
  Vendor? vendor;
  Order? order;
  List<OrderDetails>? orderDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['package_name'] = packageName;
    map['order_id'] = orderId;
    map['vendor_id'] = vendorId;
    map['delivery_type_id'] = deliveryTypeId;
    map['package_type_id'] = packageTypeId;
    map['price'] = price;
    map['calculated_discount'] = calculatedDiscount;
    map['calculated_vat'] = calculatedVat;
    map['delivery_charge'] = deliveryCharge;
    map['coupon_id'] = couponId;
    map['brand_coupon_discount'] = brandCouponDiscount;
    map['final_price'] = finalPrice;
    map['package_status'] = packageStatus;
    map['reject_cause'] = rejectCause;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (deliveryType != null) {
      map['delivery_type'] = deliveryType?.toJson();
    }
    if (vendor != null) {
      map['vendor'] = vendor?.toJson();
    }
    if (order != null) {
      map['order'] = order?.toJson();
    }
    if (orderDetails != null) {
      map['order_details'] = orderDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrderDetails {
  OrderDetails({
      this.id, 
      this.orderId, 
      this.vendorId, 
      this.orderPackageId, 
      this.productId, 
      this.colorVariantId, 
      this.productInventoryId, 
      this.quantity, 
      this.price, 
      this.calculatedDiscount, 
      this.calculatedVat, 
      this.finalPrice, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.product, 
      this.productColorVariant, 
      this.productInventory,});

  OrderDetails.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['order_id'];
    vendorId = json['vendor_id'];
    orderPackageId = json['order_package_id'];
    productId = json['product_id'];
    colorVariantId = json['color_variant_id'];
    productInventoryId = json['product_inventory_id'];
    quantity = json['quantity'];
    price = json['price'];
    calculatedDiscount = json['calculated_discount'];
    calculatedVat = json['calculated_vat'];
    finalPrice = json['final_price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    productColorVariant = json['product_color_variant'] != null ? ProductColorVariant.fromJson(json['product_color_variant']) : null;
    productInventory = json['product_inventory'] != null ? ProductInventory.fromJson(json['product_inventory']) : null;
  }
  num? id;
  num? orderId;
  num? vendorId;
  num? orderPackageId;
  num? productId;
  num? colorVariantId;
  num? productInventoryId;
  num? quantity;
  num? price;
  num? calculatedDiscount;
  num? calculatedVat;
  num? finalPrice;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Product? product;
  ProductColorVariant? productColorVariant;
  ProductInventory? productInventory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order_id'] = orderId;
    map['vendor_id'] = vendorId;
    map['order_package_id'] = orderPackageId;
    map['product_id'] = productId;
    map['color_variant_id'] = colorVariantId;
    map['product_inventory_id'] = productInventoryId;
    map['quantity'] = quantity;
    map['price'] = price;
    map['calculated_discount'] = calculatedDiscount;
    map['calculated_vat'] = calculatedVat;
    map['final_price'] = finalPrice;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    if (productColorVariant != null) {
      map['product_color_variant'] = productColorVariant?.toJson();
    }
    if (productInventory != null) {
      map['product_inventory'] = productInventory?.toJson();
    }
    return map;
  }

}

class ProductInventory {
  ProductInventory({
      this.id, 
      this.colorVariantId, 
      this.sizeTypeId, 
      this.sizeId, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.size,});

  ProductInventory.fromJson(dynamic json) {
    id = json['id'];
    colorVariantId = json['color_variant_id'];
    sizeTypeId = json['size_type_id'];
    sizeId = json['size_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }
  num? id;
  num? colorVariantId;
  num? sizeTypeId;
  num? sizeId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Size? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['color_variant_id'] = colorVariantId;
    map['size_type_id'] = sizeTypeId;
    map['size_id'] = sizeId;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (size != null) {
      map['size'] = size?.toJson();
    }
    return map;
  }

}

class Size {
  Size({
      this.id, 
      this.typeId, 
      this.sizeCode, 
      this.status,});

  Size.fromJson(dynamic json) {
    id = json['id'];
    typeId = json['type_id'];
    sizeCode = json['size_code'];
    status = json['status'];
  }
  num? id;
  num? typeId;
  String? sizeCode;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type_id'] = typeId;
    map['size_code'] = sizeCode;
    map['status'] = status;
    return map;
  }

}

class ProductColorVariant {
  ProductColorVariant({
      this.id, 
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
      this.color,});

  ProductColorVariant.fromJson(dynamic json) {
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
  }
  num? id;
  num? productId;
  num? colorId;
  String? profilePhoto;
  String? frontPhoto;
  String? backsidePhoto;
  dynamic details1Photo;
  dynamic details2Photo;
  dynamic outfitPhoto;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Color? color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['color_id'] = colorId;
    map['profile_photo'] = profilePhoto;
    map['front_photo'] = frontPhoto;
    map['backside_photo'] = backsidePhoto;
    map['details1_photo'] = details1Photo;
    map['details2_photo'] = details2Photo;
    map['outfit_photo'] = outfitPhoto;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (color != null) {
      map['color'] = color?.toJson();
    }
    return map;
  }

}

class Color {
  Color({
      this.id, 
      this.name, 
      this.colorCode, 
      this.defaultColor, 
      this.isMulti, 
      this.multiColor1, 
      this.multiColor2, 
      this.multiColor3, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Color.fromJson(dynamic json) {
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
  num? id;
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['color_code'] = colorCode;
    map['default_color'] = defaultColor;
    map['is_multi'] = isMulti;
    map['multi_color_1'] = multiColor1;
    map['multi_color_2'] = multiColor2;
    map['multi_color_3'] = multiColor3;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Product {
  Product({
      this.id, 
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
      this.brand,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    sizeTypeId = json['size_type_id'];
    vendorProductCode = json['vendor_product_code'];
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
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }
  num? id;
  num? vendorId;
  num? brandId;
  num? seasonId;
  dynamic sizeTypeId;
  String? vendorProductCode;
  String? productCode;
  String? isleProductCode;
  String? name;
  num? vat;
  String? vatType;
  num? mrpPrice;
  num? price;
  dynamic discountType;
  dynamic discount;
  num? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  Brand? brand;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
    map['brand_id'] = brandId;
    map['season_id'] = seasonId;
    map['size_type_id'] = sizeTypeId;
    map['vendor_product_code'] = vendorProductCode;
    map['product_code'] = productCode;
    map['isle_product_code'] = isleProductCode;
    map['name'] = name;
    map['vat'] = vat;
    map['vat_type'] = vatType;
    map['mrp_price'] = mrpPrice;
    map['price'] = price;
    map['discount_type'] = discountType;
    map['discount'] = discount;
    map['discounted_price'] = discountedPrice;
    map['is_publish'] = isPublish;
    map['size_guide'] = sizeGuide;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    return map;
  }

}

class Brand {
  Brand({
      this.id, 
      this.name,});

  Brand.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class Order {
  Order({
      this.orderNo,});

  Order.fromJson(dynamic json) {
    orderNo = json['order_no'];
  }
  String? orderNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_no'] = orderNo;
    return map;
  }

}

class Vendor {
  Vendor({
      this.id, 
      this.name, 
      this.phone,});

  Vendor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
  num? id;
  String? name;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }

}

class DeliveryType {
  DeliveryType({
      this.id, 
      this.name,});

  DeliveryType.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}