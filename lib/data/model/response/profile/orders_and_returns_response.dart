class OrdersReturnsListResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  OrdersReturnsListResponse(
      {this.statusCode, this.status, this.message, this.data});

  OrdersReturnsListResponse.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  String? orderNo;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  int? stateId;
  int? districtId;
  int? subDistrictId;
  String? address;
  int? price;
  int? calculatedDiscount;
  double? calculatedVat;
  int? deliveryCharge;
  double? finalPrice;
  int? couponId;
  double? couponOrIsleDiscount;
  int? redeemPoint;
  int? redeemReward;
  String? giftNote;
  String? specialNote;
  String? paymentMethod;
  String? paymentStatus;
  String? orderStatus;
  String? customerCareStatus;
  String? dmdStatus;
  bool? forwardedToSeller;
  bool? forwardedTo3pl;
  String? rejectCause;
  List<OrderLog>? orderLog;
  bool? status;
  bool? billingAddress;
  String? createdAt;
  String? updatedAt;
  List<OrderPackages>? orderPackages;

  Data(
      {this.id,
        this.clientCorelationId,
        this.customerId,
        this.orderNo,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.stateId,
        this.districtId,
        this.subDistrictId,
        this.address,
        this.price,
        this.calculatedDiscount,
        this.calculatedVat,
        this.deliveryCharge,
        this.finalPrice,
        this.couponId,
        this.couponOrIsleDiscount,
        this.redeemPoint,
        this.redeemReward,
        this.giftNote,
        this.specialNote,
        this.paymentMethod,
        this.paymentStatus,
        this.orderStatus,
        this.customerCareStatus,
        this.dmdStatus,
        this.forwardedToSeller,
        this.forwardedTo3pl,
        this.rejectCause,
        this.orderLog,
        this.status,
        this.billingAddress,
        this.createdAt,
        this.updatedAt,
        this.orderPackages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientCorelationId = json['client_corelation_id'];
    customerId = json['customer_id'];
    orderNo = json['order_no'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    price = json['price'];
    calculatedDiscount = json['calculated_discount'];
    calculatedVat = double.parse(json['calculated_vat'].toString());
    deliveryCharge = json['delivery_charge'];
    finalPrice = double.parse(json['final_price'].toString());
    couponId = json['coupon_id'];
    couponOrIsleDiscount = double.parse(json['coupon_or_isle_discount'].toString());
    redeemPoint = json['redeem_point'];
    redeemReward = json['redeem_reward'];
    giftNote = json['gift_note'];
    specialNote = json['special_note'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    customerCareStatus = json['customer_care_status'];
    dmdStatus = json['dmd_status'];
    forwardedToSeller = json['forwarded_to_seller'];
    forwardedTo3pl = json['forwarded_to_3pl'];
    rejectCause = json['reject_cause'];
    if (json['order_log'] != null) {
      orderLog = <OrderLog>[];
      json['order_log'].forEach((v) {
        orderLog!.add(new OrderLog.fromJson(v));
      });
    }
    status = json['status'];
    billingAddress = json['billing_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_packages'] != null) {
      orderPackages = <OrderPackages>[];
      json['order_packages'].forEach((v) {
        orderPackages!.add(new OrderPackages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_corelation_id'] = this.clientCorelationId;
    data['customer_id'] = this.customerId;
    data['order_no'] = this.orderNo;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['sub_district_id'] = this.subDistrictId;
    data['address'] = this.address;
    data['price'] = this.price;
    data['calculated_discount'] = this.calculatedDiscount;
    data['calculated_vat'] = this.calculatedVat;
    data['delivery_charge'] = this.deliveryCharge;
    data['final_price'] = this.finalPrice;
    data['coupon_id'] = this.couponId;
    data['coupon_or_isle_discount'] = this.couponOrIsleDiscount;
    data['redeem_point'] = this.redeemPoint;
    data['redeem_reward'] = this.redeemReward;
    data['gift_note'] = this.giftNote;
    data['special_note'] = this.specialNote;
    data['payment_method'] = this.paymentMethod;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['customer_care_status'] = this.customerCareStatus;
    data['dmd_status'] = this.dmdStatus;
    data['forwarded_to_seller'] = this.forwardedToSeller;
    data['forwarded_to_3pl'] = this.forwardedTo3pl;
    data['reject_cause'] = this.rejectCause;
    if (this.orderLog != null) {
      data['order_log'] = this.orderLog!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['billing_address'] = this.billingAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.orderPackages != null) {
      data['order_packages'] =
          this.orderPackages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderLog {
  String? log;
  String? date;
  String? actionBy;

  OrderLog({this.log, this.date, this.actionBy});

  OrderLog.fromJson(Map<String, dynamic> json) {
    log = json['log'];
    date = json['date'];
    actionBy = json['action_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['log'] = this.log;
    data['date'] = this.date;
    data['action_by'] = this.actionBy;
    return data;
  }
}

class OrderPackages {
  int? id;
  String? packageName;
  int? orderId;
  int? vendorId;
  int? deliveryTypeId;
  String? packageTypeId;
  int? price;
  int? calculatedDiscount;
  double? calculatedVat;
  int? deliveryCharge;
  int? couponId;
  int? brandCouponDiscount;
  double? finalPrice;
  String? packageStatus;
  String? sellerStatus;
  String? logisticStatus;
  String? rejectCause;
  String? createdAt;
  String? updatedAt;
  DeliveryType? deliveryType;
  String? packageType;
  Vendor? vendor;
  List<OrderDetails>? orderDetails;

  OrderPackages(
      {this.id,
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
        this.sellerStatus,
        this.logisticStatus,
        this.rejectCause,
        this.createdAt,
        this.updatedAt,
        this.deliveryType,
        this.packageType,
        this.vendor,
        this.orderDetails});

  OrderPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    orderId = json['order_id'];
    vendorId = json['vendor_id'];
    deliveryTypeId = json['delivery_type_id'];
    packageTypeId = json['package_type_id'];
    price = json['price'];
    calculatedDiscount = json['calculated_discount'];
    calculatedVat = double.parse(json['calculated_vat'].toString());
    deliveryCharge = json['delivery_charge'];
    couponId = json['coupon_id'];
    brandCouponDiscount = json['brand_coupon_discount'];
    finalPrice = double.parse(json['final_price'].toString());
    packageStatus = json['package_status'];
    sellerStatus = json['seller_status'];
    logisticStatus = json['logistic_status'];
    rejectCause = json['reject_cause'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deliveryType = json['delivery_type'] != null
        ? new DeliveryType.fromJson(json['delivery_type'])
        : null;
    packageType = json['package_type'];
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_name'] = this.packageName;
    data['order_id'] = this.orderId;
    data['vendor_id'] = this.vendorId;
    data['delivery_type_id'] = this.deliveryTypeId;
    data['package_type_id'] = this.packageTypeId;
    data['price'] = this.price;
    data['calculated_discount'] = this.calculatedDiscount;
    data['calculated_vat'] = this.calculatedVat;
    data['delivery_charge'] = this.deliveryCharge;
    data['coupon_id'] = this.couponId;
    data['brand_coupon_discount'] = this.brandCouponDiscount;
    data['final_price'] = this.finalPrice;
    data['package_status'] = this.packageStatus;
    data['seller_status'] = this.sellerStatus;
    data['logistic_status'] = this.logisticStatus;
    data['reject_cause'] = this.rejectCause;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.deliveryType != null) {
      data['delivery_type'] = this.deliveryType!.toJson();
    }
    data['package_type'] = this.packageType;
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
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

class OrderDetails {
  int? id;
  int? orderId;
  int? vendorId;
  int? orderPackageId;
  int? productId;
  int? colorVariantId;
  int? productInventoryId;
  int? quantity;
  int? price;
  int? calculatedDiscount;
  double? calculatedVat;
  double? finalPrice;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Product? product;
  Vendor? vendor;
  ProductColorVariant? productColorVariant;
  ProductInventory? productInventory;

  OrderDetails(
      {this.id,
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
        this.vendor,
        this.productColorVariant,
        this.productInventory});

  OrderDetails.fromJson(Map<String, dynamic> json) {
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
    calculatedVat = double.parse(json['calculated_vat'].toString());
    finalPrice = double.parse(json['final_price'].toString());
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
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
    data['order_id'] = this.orderId;
    data['vendor_id'] = this.vendorId;
    data['order_package_id'] = this.orderPackageId;
    data['product_id'] = this.productId;
    data['color_variant_id'] = this.colorVariantId;
    data['product_inventory_id'] = this.productInventoryId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['calculated_discount'] = this.calculatedDiscount;
    data['calculated_vat'] = this.calculatedVat;
    data['final_price'] = this.finalPrice;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
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
  String? vat;
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
  Vendor? brand;
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
    vat = json['vat'].toString();
    vatType = json['vat_type'];
    mrpPrice = double.parse(json['mrp_price'].toString());
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountedPrice = json['discounted_price'];
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? new Vendor.fromJson(json['brand']) : null;
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
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
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

class ProductWarehouses {
  int? id;
  int? productId;
  int? warehouseId;
  bool? status;
  String? createdAt;
  String? updatedAt;

  ProductWarehouses(
      {this.id,
        this.productId,
        this.warehouseId,
        this.status,
        this.createdAt,
        this.updatedAt});

  ProductWarehouses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    warehouseId = json['warehouse_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['warehouse_id'] = this.warehouseId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

  ProductVendorWarehouses(
      {this.id,
        this.productId,
        this.vendorWarehouseId,
        this.status,
        this.createdAt,
        this.updatedAt});

  ProductVendorWarehouses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    vendorWarehouseId = json['vendor_warehouse_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['vendor_warehouse_id'] = this.vendorWarehouseId;
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
  int? id;
  String? name;
  String? colorCode;
  String? defaultColor;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Color(
      {this.id,
        this.name,
        this.colorCode,
        this.defaultColor,
        this.status,
        this.createdAt,
        this.updatedAt});

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    defaultColor = json['default_color'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color_code'] = this.colorCode;
    data['default_color'] = this.defaultColor;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
