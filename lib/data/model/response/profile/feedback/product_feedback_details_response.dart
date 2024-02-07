/// statusCode : 200
/// status : "success"
/// message : "order get successfully"
/// data : [{"id":1,"client_corelation_id":"web-f7526ec7abd620594e421f06ffded095","customer_id":39,"is_guest":false,"order_no":"isle2311274467","first_name":"MD","last_name":" Riaz","phone":"+8801852148425","email":"","state_id":1,"district_id":2,"sub_district_id":3,"address":"Kalabagan , 25/2","price":3044,"calculated_discount":0,"calculated_vat":243.52,"delivery_charge":250,"final_price":3287.52,"coupon_id":null,"coupon_or_isle_discount":0,"first_order_discount":0,"redeem_point":0,"redeem_reward":0,"gift_note":"","special_note":"","payment_method":"cod","payment_status":"unpaid","order_status":"pending","customer_care_status":"pending","dmd_status":null,"forwarded_to_seller":false,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2023-12-27T11:02:02.251Z","action_by":"customer"}],"status":true,"billing_address":false,"created_at":"2023-12-27T05:27:23.000Z","updated_at":"2023-12-27T05:27:23.000Z","order_details":[{"id":1,"order_id":1,"vendor_id":21,"order_package_id":1,"product_id":40,"color_variant_id":39,"product_inventory_id":55,"quantity":1,"price":1795,"calculated_discount":0,"calculated_vat":143.6,"final_price":1938.6,"status":true,"created_at":"2023-12-27T05:27:23.000Z","updated_at":"2023-12-27T05:27:23.000Z","product":{"id":40,"vendor_id":21,"brand_id":19,"season_id":2,"vendor_product_code":"","product_code":"BEXIM-2023120352131","isle_product_code":"ISLE-2023120377724","name":"Men's Casual Shirts","vat":8,"vat_type":"percent","mrp_price":1938.6,"price":1795,"discount_type":null,"discount":null,"discounted_price":1795,"is_publish":false,"size_guide":"/public/uploads/size-guide-qM7HDC5Xe.webp","status":"active","created_at":"2023-12-03T04:29:44.000Z","updated_at":"2024-01-07T12:52:09.000Z","brand":{"id":19,"name":"Yellow"}},"product_color_variant":{"id":39,"product_id":40,"color_id":8,"profile_photo":"/public/uploads/1-d8UYZjdmu.webp","front_photo":"/public/uploads/2--2hvAG5KcW.webp","backside_photo":"/public/uploads/3-8WB1EFgsmA.webp","details1_photo":"/public/uploads/5-5o6MlQanS5.webp","details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-03T04:29:44.000Z","updated_at":"2024-01-07T12:52:09.000Z","color":{"id":8,"name":"Navy","color_code":"#053676","default_color":"#000000","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-12-01T05:44:38.000Z","updated_at":"2023-12-15T04:27:41.000Z"}},"product_inventory":{"id":55,"color_variant_id":39,"size_type_id":1,"size_id":3,"status":true,"created_at":"2023-12-03T06:21:17.000Z","updated_at":"2023-12-27T08:14:13.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}},{"id":2,"order_id":1,"vendor_id":23,"order_package_id":2,"product_id":44,"color_variant_id":43,"product_inventory_id":61,"quantity":1,"price":1249,"calculated_discount":0,"calculated_vat":99.92,"final_price":1348.92,"status":true,"created_at":"2023-12-27T05:27:23.000Z","updated_at":"2023-12-27T05:27:23.000Z","product":{"id":44,"vendor_id":23,"brand_id":20,"season_id":2,"vendor_product_code":"","product_code":"WAVER-2023120446251","isle_product_code":"ISLE-2023120455289","name":"Intense Performance T-shirt","vat":8,"vat_type":"percent","mrp_price":1348.92,"price":1249,"discount_type":null,"discount":null,"discounted_price":1249,"is_publish":false,"size_guide":"/public/uploads/size-guide-erZCuSCIS.webp","status":"active","created_at":"2023-12-04T03:36:38.000Z","updated_at":"2023-12-26T10:49:49.000Z","brand":{"id":20,"name":"Turag Active"}},"product_color_variant":{"id":43,"product_id":44,"color_id":5,"profile_photo":"/public/uploads/pic1-0BPyn9FJb9.webp","front_photo":"/public/uploads/pic2-3CExfZWXHU.webp","backside_photo":"/public/uploads/pic3-uAyscz2FiQ.webp","details1_photo":"/public/uploads/pic4-TisnEtXDri.webp","details2_photo":"/public/uploads/pic5-SR4jF5kCsX.webp","outfit_photo":null,"status":true,"created_at":"2023-12-04T03:36:39.000Z","updated_at":"2023-12-26T10:49:49.000Z","color":{"id":5,"name":"Turquise","color_code":"#06dbb0","default_color":"#007cdb","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:38.000Z","updated_at":"2023-12-15T04:27:05.000Z"}},"product_inventory":{"id":61,"color_variant_id":43,"size_type_id":1,"size_id":3,"status":true,"created_at":"2023-12-04T03:40:37.000Z","updated_at":"2023-12-04T03:40:37.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}}]}]

class ProductFeedbackDetailsResponse {
  ProductFeedbackDetailsResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  ProductFeedbackDetailsResponse.fromJson(dynamic json) {
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

/// id : 1
/// client_corelation_id : "web-f7526ec7abd620594e421f06ffded095"
/// customer_id : 39
/// is_guest : false
/// order_no : "isle2311274467"
/// first_name : "MD"
/// last_name : " Riaz"
/// phone : "+8801852148425"
/// email : ""
/// state_id : 1
/// district_id : 2
/// sub_district_id : 3
/// address : "Kalabagan , 25/2"
/// price : 3044
/// calculated_discount : 0
/// calculated_vat : 243.52
/// delivery_charge : 250
/// final_price : 3287.52
/// coupon_id : null
/// coupon_or_isle_discount : 0
/// first_order_discount : 0
/// redeem_point : 0
/// redeem_reward : 0
/// gift_note : ""
/// special_note : ""
/// payment_method : "cod"
/// payment_status : "unpaid"
/// order_status : "pending"
/// customer_care_status : "pending"
/// dmd_status : null
/// forwarded_to_seller : false
/// forwarded_to_3pl : false
/// reject_cause : null
/// order_log : [{"log":"Order placed","date":"2023-12-27T11:02:02.251Z","action_by":"customer"}]
/// status : true
/// billing_address : false
/// created_at : "2023-12-27T05:27:23.000Z"
/// updated_at : "2023-12-27T05:27:23.000Z"
/// order_details : [{"id":1,"order_id":1,"vendor_id":21,"order_package_id":1,"product_id":40,"color_variant_id":39,"product_inventory_id":55,"quantity":1,"price":1795,"calculated_discount":0,"calculated_vat":143.6,"final_price":1938.6,"status":true,"created_at":"2023-12-27T05:27:23.000Z","updated_at":"2023-12-27T05:27:23.000Z","product":{"id":40,"vendor_id":21,"brand_id":19,"season_id":2,"vendor_product_code":"","product_code":"BEXIM-2023120352131","isle_product_code":"ISLE-2023120377724","name":"Men's Casual Shirts","vat":8,"vat_type":"percent","mrp_price":1938.6,"price":1795,"discount_type":null,"discount":null,"discounted_price":1795,"is_publish":false,"size_guide":"/public/uploads/size-guide-qM7HDC5Xe.webp","status":"active","created_at":"2023-12-03T04:29:44.000Z","updated_at":"2024-01-07T12:52:09.000Z","brand":{"id":19,"name":"Yellow"}},"product_color_variant":{"id":39,"product_id":40,"color_id":8,"profile_photo":"/public/uploads/1-d8UYZjdmu.webp","front_photo":"/public/uploads/2--2hvAG5KcW.webp","backside_photo":"/public/uploads/3-8WB1EFgsmA.webp","details1_photo":"/public/uploads/5-5o6MlQanS5.webp","details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-03T04:29:44.000Z","updated_at":"2024-01-07T12:52:09.000Z","color":{"id":8,"name":"Navy","color_code":"#053676","default_color":"#000000","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-12-01T05:44:38.000Z","updated_at":"2023-12-15T04:27:41.000Z"}},"product_inventory":{"id":55,"color_variant_id":39,"size_type_id":1,"size_id":3,"status":true,"created_at":"2023-12-03T06:21:17.000Z","updated_at":"2023-12-27T08:14:13.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}},{"id":2,"order_id":1,"vendor_id":23,"order_package_id":2,"product_id":44,"color_variant_id":43,"product_inventory_id":61,"quantity":1,"price":1249,"calculated_discount":0,"calculated_vat":99.92,"final_price":1348.92,"status":true,"created_at":"2023-12-27T05:27:23.000Z","updated_at":"2023-12-27T05:27:23.000Z","product":{"id":44,"vendor_id":23,"brand_id":20,"season_id":2,"vendor_product_code":"","product_code":"WAVER-2023120446251","isle_product_code":"ISLE-2023120455289","name":"Intense Performance T-shirt","vat":8,"vat_type":"percent","mrp_price":1348.92,"price":1249,"discount_type":null,"discount":null,"discounted_price":1249,"is_publish":false,"size_guide":"/public/uploads/size-guide-erZCuSCIS.webp","status":"active","created_at":"2023-12-04T03:36:38.000Z","updated_at":"2023-12-26T10:49:49.000Z","brand":{"id":20,"name":"Turag Active"}},"product_color_variant":{"id":43,"product_id":44,"color_id":5,"profile_photo":"/public/uploads/pic1-0BPyn9FJb9.webp","front_photo":"/public/uploads/pic2-3CExfZWXHU.webp","backside_photo":"/public/uploads/pic3-uAyscz2FiQ.webp","details1_photo":"/public/uploads/pic4-TisnEtXDri.webp","details2_photo":"/public/uploads/pic5-SR4jF5kCsX.webp","outfit_photo":null,"status":true,"created_at":"2023-12-04T03:36:39.000Z","updated_at":"2023-12-26T10:49:49.000Z","color":{"id":5,"name":"Turquise","color_code":"#06dbb0","default_color":"#007cdb","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:38.000Z","updated_at":"2023-12-15T04:27:05.000Z"}},"product_inventory":{"id":61,"color_variant_id":43,"size_type_id":1,"size_id":3,"status":true,"created_at":"2023-12-04T03:40:37.000Z","updated_at":"2023-12-04T03:40:37.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}}]

class Data {
  Data({
      this.id, 
      this.clientCorelationId, 
      this.customerId, 
      this.isGuest, 
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
      this.firstOrderDiscount, 
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
      this.orderDetails,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    clientCorelationId = json['client_corelation_id'];
    customerId = json['customer_id'];
    isGuest = json['is_guest'];
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
    calculatedVat = json['calculated_vat'];
    deliveryCharge = json['delivery_charge'];
    finalPrice = json['final_price'];
    couponId = json['coupon_id'];
    couponOrIsleDiscount = json['coupon_or_isle_discount'];
    firstOrderDiscount = json['first_order_discount'];
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
      orderLog = [];
      json['order_log'].forEach((v) {
        orderLog?.add(OrderLog.fromJson(v));
      });
    }
    status = json['status'];
    billingAddress = json['billing_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['order_details'] != null) {
      orderDetails = [];
      json['order_details'].forEach((v) {
        orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
  }
  num? id;
  String? clientCorelationId;
  num? customerId;
  bool? isGuest;
  String? orderNo;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  num? stateId;
  num? districtId;
  num? subDistrictId;
  String? address;
  num? price;
  num? calculatedDiscount;
  num? calculatedVat;
  num? deliveryCharge;
  num? finalPrice;
  dynamic couponId;
  num? couponOrIsleDiscount;
  num? firstOrderDiscount;
  num? redeemPoint;
  num? redeemReward;
  String? giftNote;
  String? specialNote;
  String? paymentMethod;
  String? paymentStatus;
  String? orderStatus;
  String? customerCareStatus;
  dynamic dmdStatus;
  bool? forwardedToSeller;
  bool? forwardedTo3pl;
  dynamic rejectCause;
  List<OrderLog>? orderLog;
  bool? status;
  bool? billingAddress;
  String? createdAt;
  String? updatedAt;
  List<OrderDetails>? orderDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['client_corelation_id'] = clientCorelationId;
    map['customer_id'] = customerId;
    map['is_guest'] = isGuest;
    map['order_no'] = orderNo;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['state_id'] = stateId;
    map['district_id'] = districtId;
    map['sub_district_id'] = subDistrictId;
    map['address'] = address;
    map['price'] = price;
    map['calculated_discount'] = calculatedDiscount;
    map['calculated_vat'] = calculatedVat;
    map['delivery_charge'] = deliveryCharge;
    map['final_price'] = finalPrice;
    map['coupon_id'] = couponId;
    map['coupon_or_isle_discount'] = couponOrIsleDiscount;
    map['first_order_discount'] = firstOrderDiscount;
    map['redeem_point'] = redeemPoint;
    map['redeem_reward'] = redeemReward;
    map['gift_note'] = giftNote;
    map['special_note'] = specialNote;
    map['payment_method'] = paymentMethod;
    map['payment_status'] = paymentStatus;
    map['order_status'] = orderStatus;
    map['customer_care_status'] = customerCareStatus;
    map['dmd_status'] = dmdStatus;
    map['forwarded_to_seller'] = forwardedToSeller;
    map['forwarded_to_3pl'] = forwardedTo3pl;
    map['reject_cause'] = rejectCause;
    if (orderLog != null) {
      map['order_log'] = orderLog?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['billing_address'] = billingAddress;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (orderDetails != null) {
      map['order_details'] = orderDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// order_id : 1
/// vendor_id : 21
/// order_package_id : 1
/// product_id : 40
/// color_variant_id : 39
/// product_inventory_id : 55
/// quantity : 1
/// price : 1795
/// calculated_discount : 0
/// calculated_vat : 143.6
/// final_price : 1938.6
/// status : true
/// created_at : "2023-12-27T05:27:23.000Z"
/// updated_at : "2023-12-27T05:27:23.000Z"
/// product : {"id":40,"vendor_id":21,"brand_id":19,"season_id":2,"vendor_product_code":"","product_code":"BEXIM-2023120352131","isle_product_code":"ISLE-2023120377724","name":"Men's Casual Shirts","vat":8,"vat_type":"percent","mrp_price":1938.6,"price":1795,"discount_type":null,"discount":null,"discounted_price":1795,"is_publish":false,"size_guide":"/public/uploads/size-guide-qM7HDC5Xe.webp","status":"active","created_at":"2023-12-03T04:29:44.000Z","updated_at":"2024-01-07T12:52:09.000Z","brand":{"id":19,"name":"Yellow"}}
/// product_color_variant : {"id":39,"product_id":40,"color_id":8,"profile_photo":"/public/uploads/1-d8UYZjdmu.webp","front_photo":"/public/uploads/2--2hvAG5KcW.webp","backside_photo":"/public/uploads/3-8WB1EFgsmA.webp","details1_photo":"/public/uploads/5-5o6MlQanS5.webp","details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-03T04:29:44.000Z","updated_at":"2024-01-07T12:52:09.000Z","color":{"id":8,"name":"Navy","color_code":"#053676","default_color":"#000000","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-12-01T05:44:38.000Z","updated_at":"2023-12-15T04:27:41.000Z"}}
/// product_inventory : {"id":55,"color_variant_id":39,"size_type_id":1,"size_id":3,"status":true,"created_at":"2023-12-03T06:21:17.000Z","updated_at":"2023-12-27T08:14:13.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}

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

/// id : 55
/// color_variant_id : 39
/// size_type_id : 1
/// size_id : 3
/// status : true
/// created_at : "2023-12-03T06:21:17.000Z"
/// updated_at : "2023-12-27T08:14:13.000Z"
/// size : {"id":3,"type_id":1,"size_code":"M","status":true}

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

/// id : 3
/// type_id : 1
/// size_code : "M"
/// status : true

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

/// id : 39
/// product_id : 40
/// color_id : 8
/// profile_photo : "/public/uploads/1-d8UYZjdmu.webp"
/// front_photo : "/public/uploads/2--2hvAG5KcW.webp"
/// backside_photo : "/public/uploads/3-8WB1EFgsmA.webp"
/// details1_photo : "/public/uploads/5-5o6MlQanS5.webp"
/// details2_photo : null
/// outfit_photo : null
/// status : true
/// created_at : "2023-12-03T04:29:44.000Z"
/// updated_at : "2024-01-07T12:52:09.000Z"
/// color : {"id":8,"name":"Navy","color_code":"#053676","default_color":"#000000","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-12-01T05:44:38.000Z","updated_at":"2023-12-15T04:27:41.000Z"}

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
  String? details1Photo;
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

/// id : 8
/// name : "Navy"
/// color_code : "#053676"
/// default_color : "#000000"
/// is_multi : false
/// multi_color_1 : ""
/// multi_color_2 : ""
/// multi_color_3 : ""
/// status : true
/// created_at : "2023-12-01T05:44:38.000Z"
/// updated_at : "2023-12-15T04:27:41.000Z"

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

/// id : 40
/// vendor_id : 21
/// brand_id : 19
/// season_id : 2
/// vendor_product_code : ""
/// product_code : "BEXIM-2023120352131"
/// isle_product_code : "ISLE-2023120377724"
/// name : "Men's Casual Shirts"
/// vat : 8
/// vat_type : "percent"
/// mrp_price : 1938.6
/// price : 1795
/// discount_type : null
/// discount : null
/// discounted_price : 1795
/// is_publish : false
/// size_guide : "/public/uploads/size-guide-qM7HDC5Xe.webp"
/// status : "active"
/// created_at : "2023-12-03T04:29:44.000Z"
/// updated_at : "2024-01-07T12:52:09.000Z"
/// brand : {"id":19,"name":"Yellow"}

class Product {
  Product({
      this.id, 
      this.vendorId, 
      this.brandId, 
      this.seasonId, 
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

/// id : 19
/// name : "Yellow"

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

/// log : "Order placed"
/// date : "2023-12-27T11:02:02.251Z"
/// action_by : "customer"

class OrderLog {
  OrderLog({
      this.log, 
      this.date, 
      this.actionBy,});

  OrderLog.fromJson(dynamic json) {
    log = json['log'];
    date = json['date'];
    actionBy = json['action_by'];
  }
  String? log;
  String? date;
  String? actionBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['log'] = log;
    map['date'] = date;
    map['action_by'] = actionBy;
    return map;
  }

}