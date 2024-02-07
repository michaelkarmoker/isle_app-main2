// class OrderTrackresponse {
//   int? statusCode;
//   String? status;
//   String? message;
//   List<Data>? data;
//
//   OrderTrackresponse({this.statusCode, this.status, this.message, this.data});
//
//   OrderTrackresponse.fromJson(Map<String, dynamic> json) {
//     statusCode = json['statusCode'];
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['statusCode'] = this.statusCode;
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   String? packageName;
//   int? orderId;
//   int? vendorId;
//   int? deliveryTypeId;
//   String? packageTypeId;
//   int? price;
//   int? calculatedDiscount;
//   double? calculatedVat;
//   int? deliveryCharge;
//   String? couponId;
//   String? brandCouponDiscount;
//   double? finalPrice;
//   String? packageStatus;
//   String? rejectCause;
//   String? createdAt;
//   String? updatedAt;
//   DeliveryType? deliveryType;
//   DeliveryType? vendor;
//   Order? order;
//   List<OrderDetails>? orderDetails;
//
//   Data(
//       {this.id,
//         this.packageName,
//         this.orderId,
//         this.vendorId,
//         this.deliveryTypeId,
//         this.packageTypeId,
//         this.price,
//         this.calculatedDiscount,
//         this.calculatedVat,
//         this.deliveryCharge,
//         this.couponId,
//         this.brandCouponDiscount,
//         this.finalPrice,
//         this.packageStatus,
//         this.rejectCause,
//         this.createdAt,
//         this.updatedAt,
//         this.deliveryType,
//         this.vendor,
//         this.order,
//         this.orderDetails});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     packageName = json['package_name'];
//     orderId = json['order_id'];
//     vendorId = json['vendor_id'];
//     deliveryTypeId = json['delivery_type_id'];
//     packageTypeId = json['package_type_id'];
//     price = json['price'];
//     calculatedDiscount = json['calculated_discount'];
//     calculatedVat = double.parse(json['calculated_vat'].toString());
//     deliveryCharge = json['delivery_charge'];
//     couponId = json['coupon_id'];
//     brandCouponDiscount = json['brand_coupon_discount'];
//     finalPrice = double.parse(json['final_price'].toString());
//     packageStatus = json['package_status'];
//     rejectCause = json['reject_cause'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     deliveryType = json['delivery_type'] != null
//         ? new DeliveryType.fromJson(json['delivery_type'])
//         : null;
//     vendor = json['vendor'] != null
//         ? new DeliveryType.fromJson(json['vendor'])
//         : null;
//     order = json['order'] != null ? new Order.fromJson(json['order']) : null;
//     if (json['order_details'] != null) {
//       orderDetails = <OrderDetails>[];
//       json['order_details'].forEach((v) {
//         orderDetails!.add(new OrderDetails.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['package_name'] = this.packageName;
//     data['order_id'] = this.orderId;
//     data['vendor_id'] = this.vendorId;
//     data['delivery_type_id'] = this.deliveryTypeId;
//     data['package_type_id'] = this.packageTypeId;
//     data['price'] = this.price;
//     data['calculated_discount'] = this.calculatedDiscount;
//     data['calculated_vat'] = this.calculatedVat;
//     data['delivery_charge'] = this.deliveryCharge;
//     data['coupon_id'] = this.couponId;
//     data['brand_coupon_discount'] = this.brandCouponDiscount;
//     data['final_price'] = this.finalPrice;
//     data['package_status'] = this.packageStatus;
//     data['reject_cause'] = this.rejectCause;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     if (this.deliveryType != null) {
//       data['delivery_type'] = this.deliveryType!.toJson();
//     }
//     if (this.vendor != null) {
//       data['vendor'] = this.vendor!.toJson();
//     }
//     if (this.order != null) {
//       data['order'] = this.order!.toJson();
//     }
//     if (this.orderDetails != null) {
//       data['order_details'] =
//           this.orderDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class DeliveryType {
//   int? id;
//   String? name;
//
//   DeliveryType({this.id, this.name});
//
//   DeliveryType.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }
//
// class Order {
//   String? orderNo;
//
//   Order({this.orderNo});
//
//   Order.fromJson(Map<String, dynamic> json) {
//     orderNo = json['order_no'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['order_no'] = this.orderNo;
//     return data;
//   }
// }
//
// class OrderDetails {
//   int? id;
//   int? orderId;
//   int? vendorId;
//   int? orderPackageId;
//   int? productId;
//   int? colorVariantId;
//   int? productInventoryId;
//   int? quantity;
//   int? price;
//   int? calculatedDiscount;
//   double? calculatedVat;
//   double? finalPrice;
//   bool? status;
//   String? createdAt;
//   String? updatedAt;
//   Product? product;
//   ProductColorVariant? productColorVariant;
//   ProductInventory? productInventory;
//
//   OrderDetails(
//       {this.id,
//         this.orderId,
//         this.vendorId,
//         this.orderPackageId,
//         this.productId,
//         this.colorVariantId,
//         this.productInventoryId,
//         this.quantity,
//         this.price,
//         this.calculatedDiscount,
//         this.calculatedVat,
//         this.finalPrice,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.product,
//         this.productColorVariant,
//         this.productInventory});
//
//   OrderDetails.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     orderId = json['order_id'];
//     vendorId = json['vendor_id'];
//     orderPackageId = json['order_package_id'];
//     productId = json['product_id'];
//     colorVariantId = json['color_variant_id'];
//     productInventoryId = json['product_inventory_id'];
//     quantity = json['quantity'];
//     price = json['price'];
//     calculatedDiscount = json['calculated_discount'];
//     calculatedVat = double.parse(json['calculated_vat'].toString());
//     finalPrice = double.parse(json['final_price'].toString());
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     product =
//     json['product'] != null ? new Product.fromJson(json['product']) : null;
//     productColorVariant = json['product_color_variant'] != null
//         ? new ProductColorVariant.fromJson(json['product_color_variant'])
//         : null;
//     productInventory = json['product_inventory'] != null
//         ? new ProductInventory.fromJson(json['product_inventory'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['order_id'] = this.orderId;
//     data['vendor_id'] = this.vendorId;
//     data['order_package_id'] = this.orderPackageId;
//     data['product_id'] = this.productId;
//     data['color_variant_id'] = this.colorVariantId;
//     data['product_inventory_id'] = this.productInventoryId;
//     data['quantity'] = this.quantity;
//     data['price'] = this.price;
//     data['calculated_discount'] = this.calculatedDiscount;
//     data['calculated_vat'] = this.calculatedVat;
//     data['final_price'] = this.finalPrice;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.product != null) {
//       data['product'] = this.product!.toJson();
//     }
//     if (this.productColorVariant != null) {
//       data['product_color_variant'] = this.productColorVariant!.toJson();
//     }
//     if (this.productInventory != null) {
//       data['product_inventory'] = this.productInventory!.toJson();
//     }
//     return data;
//   }
// }
//
// class Product {
//   int? id;
//   int? vendorId;
//   int? brandId;
//   int? seasonId;
//   String? sizeTypeId;
//   String? productCode;
//   String? isleProductCode;
//   String? name;
//   double? vat;
//   String? vatType;
//   double? mrpPrice;
//   int? price;
//   String? discountType;
//   int? discount;
//   double? discountedPrice;
//   bool? isPublish;
//   String? sizeGuide;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//   DeliveryType? brand;
//
//   Product(
//       {this.id,
//         this.vendorId,
//         this.brandId,
//         this.seasonId,
//         this.sizeTypeId,
//         this.productCode,
//         this.isleProductCode,
//         this.name,
//         this.vat,
//         this.vatType,
//         this.mrpPrice,
//         this.price,
//         this.discountType,
//         this.discount,
//         this.discountedPrice,
//         this.isPublish,
//         this.sizeGuide,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.brand});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     vendorId = json['vendor_id'];
//     brandId = json['brand_id'];
//     seasonId = json['season_id'];
//     sizeTypeId = json['size_type_id'];
//     productCode = json['product_code'];
//     isleProductCode = json['isle_product_code'];
//     name = json['name'];
//     vat = double.parse(json['vat'].toString());
//     vatType = json['vat_type'];
//     mrpPrice = double.parse(json['mrp_price'].toString());
//     price = json['price'];
//     discountType = json['discount_type'];
//     discount = json['discount'];
//     discountedPrice = double.parse(json['discounted_price'].toString());
//     isPublish = json['is_publish'];
//     sizeGuide = json['size_guide'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     brand =
//     json['brand'] != null ? new DeliveryType.fromJson(json['brand']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['vendor_id'] = this.vendorId;
//     data['brand_id'] = this.brandId;
//     data['season_id'] = this.seasonId;
//     data['size_type_id'] = this.sizeTypeId;
//     data['product_code'] = this.productCode;
//     data['isle_product_code'] = this.isleProductCode;
//     data['name'] = this.name;
//     data['vat'] = this.vat;
//     data['vat_type'] = this.vatType;
//     data['mrp_price'] = this.mrpPrice;
//     data['price'] = this.price;
//     data['discount_type'] = this.discountType;
//     data['discount'] = this.discount;
//     data['discounted_price'] = this.discountedPrice;
//     data['is_publish'] = this.isPublish;
//     data['size_guide'] = this.sizeGuide;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.brand != null) {
//       data['brand'] = this.brand!.toJson();
//     }
//     return data;
//   }
// }
//
// class ProductColorVariant {
//   int? id;
//   int? productId;
//   int? colorId;
//   String? profilePhoto;
//   String? frontPhoto;
//   String? backsidePhoto;
//   String? details1Photo;
//   String? details2Photo;
//   String? outfitPhoto;
//   bool? status;
//   String? createdAt;
//   String? updatedAt;
//   Color? color;
//
//   ProductColorVariant(
//       {this.id,
//         this.productId,
//         this.colorId,
//         this.profilePhoto,
//         this.frontPhoto,
//         this.backsidePhoto,
//         this.details1Photo,
//         this.details2Photo,
//         this.outfitPhoto,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.color});
//
//   ProductColorVariant.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     colorId = json['color_id'];
//     profilePhoto = json['profile_photo'];
//     frontPhoto = json['front_photo'];
//     backsidePhoto = json['backside_photo'];
//     details1Photo = json['details1_photo'];
//     details2Photo = json['details2_photo'];
//     outfitPhoto = json['outfit_photo'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     color = json['color'] != null ? new Color.fromJson(json['color']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['color_id'] = this.colorId;
//     data['profile_photo'] = this.profilePhoto;
//     data['front_photo'] = this.frontPhoto;
//     data['backside_photo'] = this.backsidePhoto;
//     data['details1_photo'] = this.details1Photo;
//     data['details2_photo'] = this.details2Photo;
//     data['outfit_photo'] = this.outfitPhoto;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.color != null) {
//       data['color'] = this.color!.toJson();
//     }
//     return data;
//   }
// }
//
// class Color {
//   int? id;
//   String? name;
//   String? colorCode;
//   String? defaultColor;
//   bool? status;
//   String? createdAt;
//   String? updatedAt;
//
//   Color(
//       {this.id,
//         this.name,
//         this.colorCode,
//         this.defaultColor,
//         this.status,
//         this.createdAt,
//         this.updatedAt});
//
//   Color.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     colorCode = json['color_code'];
//     defaultColor = json['default_color'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['color_code'] = this.colorCode;
//     data['default_color'] = this.defaultColor;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class ProductInventory {
//   int? id;
//   int? colorVariantId;
//   int? sizeTypeId;
//   int? sizeId;
//   bool? status;
//   String? createdAt;
//   String? updatedAt;
//   Size? size;
//
//   ProductInventory(
//       {this.id,
//         this.colorVariantId,
//         this.sizeTypeId,
//         this.sizeId,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.size});
//
//   ProductInventory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     colorVariantId = json['color_variant_id'];
//     sizeTypeId = json['size_type_id'];
//     sizeId = json['size_id'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     size = json['size'] != null ? new Size.fromJson(json['size']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['color_variant_id'] = this.colorVariantId;
//     data['size_type_id'] = this.sizeTypeId;
//     data['size_id'] = this.sizeId;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.size != null) {
//       data['size'] = this.size!.toJson();
//     }
//     return data;
//   }
// }
//
// class Size {
//   int? id;
//   int? typeId;
//   String? sizeCode;
//   bool? status;
//
//   Size({this.id, this.typeId, this.sizeCode, this.status});
//
//   Size.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     typeId = json['type_id'];
//     sizeCode = json['size_code'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type_id'] = this.typeId;
//     data['size_code'] = this.sizeCode;
//     data['status'] = this.status;
//     return data;
//   }
// }
//
