/// statusCode : 200
/// status : "success"
/// message : "order get successfully"
/// data : [{"id":196,"client_corelation_id":"web-f117ecb80ca2979e469e1025cadfd946","customer_id":31,"is_guest":false,"order_no":"isle24114407","first_name":"Md. NAYMUR Rahaman","last_name":"Sunny","phone":"+8801733424273","email":"sunny@gmail.com","state_id":1,"district_id":2,"sub_district_id":6,"address":"fghdfh","price":2800,"calculated_discount":0,"calculated_vat":224,"delivery_charge":150,"final_price":3024,"coupon_id":22,"coupon_or_isle_discount":10,"first_order_discount":0,"redeem_point":null,"redeem_reward":0,"gift_note":null,"special_note":"fgfd","payment_method":"cod","payment_status":"unpaid","order_status":"completed","customer_care_status":"pending","dmd_status":"pending","forwarded_to_seller":true,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2024-02-01T09:35:45.099Z","action_by":"customer"},{"log":"Order accepted by super-admin","date":"2024-02-01T12:56:20.804Z","action_by":"super-admin"},{"log":"Order forwarded to Delivery Department","date":"2024-02-01T12:56:24.494Z","action_by":"super-admin"},{"log":"Order forwarded to Seller","date":"2024-02-01T12:56:27.420Z","action_by":"super-admin"},{"log":"Order In Process seller","date":"2024-02-01T12:56:37.387Z","action_by":"super-admin"}],"status":true,"billing_address":false,"created_at":"2024-02-01T12:54:56.000Z","updated_at":"2024-02-01T13:03:00.000Z","order_packages":[{"id":247,"package_name":"Package-1-isle24114407","order_id":196,"vendor_id":24,"delivery_type_id":2,"package_type_id":null,"price":2800,"calculated_discount":0,"calculated_vat":224,"delivery_charge":150,"coupon_id":23,"brand_coupon_discount":10,"final_price":3024,"package_status":"delivered","seller_status":"delivered","logistic_status":"delivered","reject_cause":null,"createdAt":"2024-02-01T12:54:56.000Z","updatedAt":"2024-02-01T13:03:00.000Z","delivery_type":{"id":2,"name":"EXPRESS","short_description":"Delivery within 24 hours in Dhaka","description":"<ul><li>Order between 10am to 6pm</li><li>Delivery within 24 hours in Dhaka</li><li>Free Delivery over 10000tk order</li><li>150 tk Dhaka city delivery fee</li></ul>","icon":"/public/uploads/asset-6-y18BTh-Pp.png","always_available":false,"available_city":true,"delivery_charge_city":150,"available_outside_city":false,"delivery_charge_outside_city":1.7,"createdAt":"2023-12-24T07:10:32.000Z","updatedAt":"2024-01-14T06:55:23.000Z"},"package_type":null,"vendor":{"id":24,"name":"Ecstasy bd","phone":"01958-237701"},"order_details":[{"id":364,"order_id":196,"vendor_id":24,"order_package_id":247,"product_id":61,"color_variant_id":61,"product_inventory_id":116,"quantity":2,"price":2800,"calculated_discount":0,"calculated_vat":224,"final_price":3024,"status":true,"created_at":"2024-02-01T12:54:56.000Z","updated_at":"2024-02-01T12:54:56.000Z","product":{"id":61,"vendor_id":24,"brand_id":25,"season_id":5,"vendor_product_code":"","product_code":"undefined-2023121618057","isle_product_code":"ISLE-2024011319100","name":"Half sleeve weekend shirt","vat":8,"vat_type":"percent","mrp_price":1512,"price":1400,"discount_type":null,"discount":null,"discounted_price":1400,"is_publish":false,"size_guide":"/public/uploads/product-image-21655201690-NBgiE_nvy.jpg","status":"active","created_at":"2023-12-15T12:19:11.000Z","updated_at":"2024-01-13T02:34:02.000Z","brand":{"id":25,"name":"Tanjim"},"product_warehouses":[],"product_vendor_warehouses":[{"id":94,"product_id":61,"vendor_warehouse_id":30,"status":true,"created_at":"2024-01-13T02:34:02.000Z","updated_at":"2024-01-13T02:34:02.000Z"}]},"vendor":{"id":24,"name":"Ecstasy bd","phone":"01958-237701"},"product_color_variant":{"id":61,"product_id":61,"color_id":4,"profile_photo":"/public/uploads/product-image-11699332874-kwbxtoaym-JPGWUlYylA.jpg","front_photo":"/public/uploads/product-image-1699332874-hjmu5q7iax-xl669GaPS9.jpg","backside_photo":"/public/uploads/product-image-21655201690-FxET-Lcjfa.jpg","details1_photo":null,"details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-15T12:19:12.000Z","updated_at":"2024-01-13T02:34:02.000Z","color":{"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}},"product_inventory":{"id":116,"color_variant_id":61,"size_type_id":1,"size_id":3,"stock_qty":-6,"status":true,"created_at":"2023-12-15T12:20:11.000Z","updated_at":"2024-02-01T13:03:00.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}}]}]}]

class AccountProductFeedbackResponse {
  AccountProductFeedbackResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  AccountProductFeedbackResponse.fromJson(dynamic json) {
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

/// id : 196
/// client_corelation_id : "web-f117ecb80ca2979e469e1025cadfd946"
/// customer_id : 31
/// is_guest : false
/// order_no : "isle24114407"
/// first_name : "Md. NAYMUR Rahaman"
/// last_name : "Sunny"
/// phone : "+8801733424273"
/// email : "sunny@gmail.com"
/// state_id : 1
/// district_id : 2
/// sub_district_id : 6
/// address : "fghdfh"
/// price : 2800
/// calculated_discount : 0
/// calculated_vat : 224
/// delivery_charge : 150
/// final_price : 3024
/// coupon_id : 22
/// coupon_or_isle_discount : 10
/// first_order_discount : 0
/// redeem_point : null
/// redeem_reward : 0
/// gift_note : null
/// special_note : "fgfd"
/// payment_method : "cod"
/// payment_status : "unpaid"
/// order_status : "completed"
/// customer_care_status : "pending"
/// dmd_status : "pending"
/// forwarded_to_seller : true
/// forwarded_to_3pl : false
/// reject_cause : null
/// order_log : [{"log":"Order placed","date":"2024-02-01T09:35:45.099Z","action_by":"customer"},{"log":"Order accepted by super-admin","date":"2024-02-01T12:56:20.804Z","action_by":"super-admin"},{"log":"Order forwarded to Delivery Department","date":"2024-02-01T12:56:24.494Z","action_by":"super-admin"},{"log":"Order forwarded to Seller","date":"2024-02-01T12:56:27.420Z","action_by":"super-admin"},{"log":"Order In Process seller","date":"2024-02-01T12:56:37.387Z","action_by":"super-admin"}]
/// status : true
/// billing_address : false
/// created_at : "2024-02-01T12:54:56.000Z"
/// updated_at : "2024-02-01T13:03:00.000Z"
/// order_packages : [{"id":247,"package_name":"Package-1-isle24114407","order_id":196,"vendor_id":24,"delivery_type_id":2,"package_type_id":null,"price":2800,"calculated_discount":0,"calculated_vat":224,"delivery_charge":150,"coupon_id":23,"brand_coupon_discount":10,"final_price":3024,"package_status":"delivered","seller_status":"delivered","logistic_status":"delivered","reject_cause":null,"createdAt":"2024-02-01T12:54:56.000Z","updatedAt":"2024-02-01T13:03:00.000Z","delivery_type":{"id":2,"name":"EXPRESS","short_description":"Delivery within 24 hours in Dhaka","description":"<ul><li>Order between 10am to 6pm</li><li>Delivery within 24 hours in Dhaka</li><li>Free Delivery over 10000tk order</li><li>150 tk Dhaka city delivery fee</li></ul>","icon":"/public/uploads/asset-6-y18BTh-Pp.png","always_available":false,"available_city":true,"delivery_charge_city":150,"available_outside_city":false,"delivery_charge_outside_city":1.7,"createdAt":"2023-12-24T07:10:32.000Z","updatedAt":"2024-01-14T06:55:23.000Z"},"package_type":null,"vendor":{"id":24,"name":"Ecstasy bd","phone":"01958-237701"},"order_details":[{"id":364,"order_id":196,"vendor_id":24,"order_package_id":247,"product_id":61,"color_variant_id":61,"product_inventory_id":116,"quantity":2,"price":2800,"calculated_discount":0,"calculated_vat":224,"final_price":3024,"status":true,"created_at":"2024-02-01T12:54:56.000Z","updated_at":"2024-02-01T12:54:56.000Z","product":{"id":61,"vendor_id":24,"brand_id":25,"season_id":5,"vendor_product_code":"","product_code":"undefined-2023121618057","isle_product_code":"ISLE-2024011319100","name":"Half sleeve weekend shirt","vat":8,"vat_type":"percent","mrp_price":1512,"price":1400,"discount_type":null,"discount":null,"discounted_price":1400,"is_publish":false,"size_guide":"/public/uploads/product-image-21655201690-NBgiE_nvy.jpg","status":"active","created_at":"2023-12-15T12:19:11.000Z","updated_at":"2024-01-13T02:34:02.000Z","brand":{"id":25,"name":"Tanjim"},"product_warehouses":[],"product_vendor_warehouses":[{"id":94,"product_id":61,"vendor_warehouse_id":30,"status":true,"created_at":"2024-01-13T02:34:02.000Z","updated_at":"2024-01-13T02:34:02.000Z"}]},"vendor":{"id":24,"name":"Ecstasy bd","phone":"01958-237701"},"product_color_variant":{"id":61,"product_id":61,"color_id":4,"profile_photo":"/public/uploads/product-image-11699332874-kwbxtoaym-JPGWUlYylA.jpg","front_photo":"/public/uploads/product-image-1699332874-hjmu5q7iax-xl669GaPS9.jpg","backside_photo":"/public/uploads/product-image-21655201690-FxET-Lcjfa.jpg","details1_photo":null,"details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-15T12:19:12.000Z","updated_at":"2024-01-13T02:34:02.000Z","color":{"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}},"product_inventory":{"id":116,"color_variant_id":61,"size_type_id":1,"size_id":3,"stock_qty":-6,"status":true,"created_at":"2023-12-15T12:20:11.000Z","updated_at":"2024-02-01T13:03:00.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}}]}]

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
      this.orderPackages,});

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
    if (json['order_packages'] != null) {
      orderPackages = [];
      json['order_packages'].forEach((v) {
        orderPackages?.add(OrderPackages.fromJson(v));
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
  num? couponId;
  num? couponOrIsleDiscount;
  num? firstOrderDiscount;
  dynamic redeemPoint;
  num? redeemReward;
  dynamic giftNote;
  String? specialNote;
  String? paymentMethod;
  String? paymentStatus;
  String? orderStatus;
  String? customerCareStatus;
  String? dmdStatus;
  bool? forwardedToSeller;
  bool? forwardedTo3pl;
  dynamic rejectCause;
  List<OrderLog>? orderLog;
  bool? status;
  bool? billingAddress;
  String? createdAt;
  String? updatedAt;
  List<OrderPackages>? orderPackages;

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
    if (orderPackages != null) {
      map['order_packages'] = orderPackages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 247
/// package_name : "Package-1-isle24114407"
/// order_id : 196
/// vendor_id : 24
/// delivery_type_id : 2
/// package_type_id : null
/// price : 2800
/// calculated_discount : 0
/// calculated_vat : 224
/// delivery_charge : 150
/// coupon_id : 23
/// brand_coupon_discount : 10
/// final_price : 3024
/// package_status : "delivered"
/// seller_status : "delivered"
/// logistic_status : "delivered"
/// reject_cause : null
/// createdAt : "2024-02-01T12:54:56.000Z"
/// updatedAt : "2024-02-01T13:03:00.000Z"
/// delivery_type : {"id":2,"name":"EXPRESS","short_description":"Delivery within 24 hours in Dhaka","description":"<ul><li>Order between 10am to 6pm</li><li>Delivery within 24 hours in Dhaka</li><li>Free Delivery over 10000tk order</li><li>150 tk Dhaka city delivery fee</li></ul>","icon":"/public/uploads/asset-6-y18BTh-Pp.png","always_available":false,"available_city":true,"delivery_charge_city":150,"available_outside_city":false,"delivery_charge_outside_city":1.7,"createdAt":"2023-12-24T07:10:32.000Z","updatedAt":"2024-01-14T06:55:23.000Z"}
/// package_type : null
/// vendor : {"id":24,"name":"Ecstasy bd","phone":"01958-237701"}
/// order_details : [{"id":364,"order_id":196,"vendor_id":24,"order_package_id":247,"product_id":61,"color_variant_id":61,"product_inventory_id":116,"quantity":2,"price":2800,"calculated_discount":0,"calculated_vat":224,"final_price":3024,"status":true,"created_at":"2024-02-01T12:54:56.000Z","updated_at":"2024-02-01T12:54:56.000Z","product":{"id":61,"vendor_id":24,"brand_id":25,"season_id":5,"vendor_product_code":"","product_code":"undefined-2023121618057","isle_product_code":"ISLE-2024011319100","name":"Half sleeve weekend shirt","vat":8,"vat_type":"percent","mrp_price":1512,"price":1400,"discount_type":null,"discount":null,"discounted_price":1400,"is_publish":false,"size_guide":"/public/uploads/product-image-21655201690-NBgiE_nvy.jpg","status":"active","created_at":"2023-12-15T12:19:11.000Z","updated_at":"2024-01-13T02:34:02.000Z","brand":{"id":25,"name":"Tanjim"},"product_warehouses":[],"product_vendor_warehouses":[{"id":94,"product_id":61,"vendor_warehouse_id":30,"status":true,"created_at":"2024-01-13T02:34:02.000Z","updated_at":"2024-01-13T02:34:02.000Z"}]},"vendor":{"id":24,"name":"Ecstasy bd","phone":"01958-237701"},"product_color_variant":{"id":61,"product_id":61,"color_id":4,"profile_photo":"/public/uploads/product-image-11699332874-kwbxtoaym-JPGWUlYylA.jpg","front_photo":"/public/uploads/product-image-1699332874-hjmu5q7iax-xl669GaPS9.jpg","backside_photo":"/public/uploads/product-image-21655201690-FxET-Lcjfa.jpg","details1_photo":null,"details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-15T12:19:12.000Z","updated_at":"2024-01-13T02:34:02.000Z","color":{"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}},"product_inventory":{"id":116,"color_variant_id":61,"size_type_id":1,"size_id":3,"stock_qty":-6,"status":true,"created_at":"2023-12-15T12:20:11.000Z","updated_at":"2024-02-01T13:03:00.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}}]

class OrderPackages {
  OrderPackages({
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
      this.sellerStatus, 
      this.logisticStatus, 
      this.rejectCause, 
      this.createdAt, 
      this.updatedAt, 
      this.deliveryType, 
      this.packageType, 
      this.vendor, 
      this.orderDetails,});

  OrderPackages.fromJson(dynamic json) {
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
    sellerStatus = json['seller_status'];
    logisticStatus = json['logistic_status'];
    rejectCause = json['reject_cause'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deliveryType = json['delivery_type'] != null ? DeliveryType.fromJson(json['delivery_type']) : null;
    packageType = json['package_type'];
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
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
  num? couponId;
  num? brandCouponDiscount;
  num? finalPrice;
  String? packageStatus;
  String? sellerStatus;
  String? logisticStatus;
  dynamic rejectCause;
  String? createdAt;
  String? updatedAt;
  DeliveryType? deliveryType;
  dynamic packageType;
  Vendor? vendor;
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
    map['seller_status'] = sellerStatus;
    map['logistic_status'] = logisticStatus;
    map['reject_cause'] = rejectCause;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (deliveryType != null) {
      map['delivery_type'] = deliveryType?.toJson();
    }
    map['package_type'] = packageType;
    if (vendor != null) {
      map['vendor'] = vendor?.toJson();
    }
    if (orderDetails != null) {
      map['order_details'] = orderDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 364
/// order_id : 196
/// vendor_id : 24
/// order_package_id : 247
/// product_id : 61
/// color_variant_id : 61
/// product_inventory_id : 116
/// quantity : 2
/// price : 2800
/// calculated_discount : 0
/// calculated_vat : 224
/// final_price : 3024
/// status : true
/// created_at : "2024-02-01T12:54:56.000Z"
/// updated_at : "2024-02-01T12:54:56.000Z"
/// product : {"id":61,"vendor_id":24,"brand_id":25,"season_id":5,"vendor_product_code":"","product_code":"undefined-2023121618057","isle_product_code":"ISLE-2024011319100","name":"Half sleeve weekend shirt","vat":8,"vat_type":"percent","mrp_price":1512,"price":1400,"discount_type":null,"discount":null,"discounted_price":1400,"is_publish":false,"size_guide":"/public/uploads/product-image-21655201690-NBgiE_nvy.jpg","status":"active","created_at":"2023-12-15T12:19:11.000Z","updated_at":"2024-01-13T02:34:02.000Z","brand":{"id":25,"name":"Tanjim"},"product_warehouses":[],"product_vendor_warehouses":[{"id":94,"product_id":61,"vendor_warehouse_id":30,"status":true,"created_at":"2024-01-13T02:34:02.000Z","updated_at":"2024-01-13T02:34:02.000Z"}]}
/// vendor : {"id":24,"name":"Ecstasy bd","phone":"01958-237701"}
/// product_color_variant : {"id":61,"product_id":61,"color_id":4,"profile_photo":"/public/uploads/product-image-11699332874-kwbxtoaym-JPGWUlYylA.jpg","front_photo":"/public/uploads/product-image-1699332874-hjmu5q7iax-xl669GaPS9.jpg","backside_photo":"/public/uploads/product-image-21655201690-FxET-Lcjfa.jpg","details1_photo":null,"details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-15T12:19:12.000Z","updated_at":"2024-01-13T02:34:02.000Z","color":{"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}}
/// product_inventory : {"id":116,"color_variant_id":61,"size_type_id":1,"size_id":3,"stock_qty":-6,"status":true,"created_at":"2023-12-15T12:20:11.000Z","updated_at":"2024-02-01T13:03:00.000Z","size":{"id":3,"type_id":1,"size_code":"M","status":true}}

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
      this.vendor, 
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
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
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
  Vendor? vendor;
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
    if (vendor != null) {
      map['vendor'] = vendor?.toJson();
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

/// id : 116
/// color_variant_id : 61
/// size_type_id : 1
/// size_id : 3
/// stock_qty : -6
/// status : true
/// created_at : "2023-12-15T12:20:11.000Z"
/// updated_at : "2024-02-01T13:03:00.000Z"
/// size : {"id":3,"type_id":1,"size_code":"M","status":true}

class ProductInventory {
  ProductInventory({
      this.id, 
      this.colorVariantId, 
      this.sizeTypeId, 
      this.sizeId, 
      this.stockQty, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.size,});

  ProductInventory.fromJson(dynamic json) {
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
  num? id;
  num? colorVariantId;
  num? sizeTypeId;
  num? sizeId;
  num? stockQty;
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
    map['stock_qty'] = stockQty;
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

/// id : 61
/// product_id : 61
/// color_id : 4
/// profile_photo : "/public/uploads/product-image-11699332874-kwbxtoaym-JPGWUlYylA.jpg"
/// front_photo : "/public/uploads/product-image-1699332874-hjmu5q7iax-xl669GaPS9.jpg"
/// backside_photo : "/public/uploads/product-image-21655201690-FxET-Lcjfa.jpg"
/// details1_photo : null
/// details2_photo : null
/// outfit_photo : null
/// status : true
/// created_at : "2023-12-15T12:19:12.000Z"
/// updated_at : "2024-01-13T02:34:02.000Z"
/// color : {"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}

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

/// id : 4
/// name : "Green"
/// color_code : "#00a303"
/// default_color : "#00a303"
/// is_multi : false
/// multi_color_1 : ""
/// multi_color_2 : ""
/// multi_color_3 : ""
/// status : true
/// created_at : "2023-11-09T03:45:07.000Z"
/// updated_at : "2023-11-09T03:45:07.000Z"

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

/// id : 24
/// name : "Ecstasy bd"
/// phone : "01958-237701"

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

/// id : 61
/// vendor_id : 24
/// brand_id : 25
/// season_id : 5
/// vendor_product_code : ""
/// product_code : "undefined-2023121618057"
/// isle_product_code : "ISLE-2024011319100"
/// name : "Half sleeve weekend shirt"
/// vat : 8
/// vat_type : "percent"
/// mrp_price : 1512
/// price : 1400
/// discount_type : null
/// discount : null
/// discounted_price : 1400
/// is_publish : false
/// size_guide : "/public/uploads/product-image-21655201690-NBgiE_nvy.jpg"
/// status : "active"
/// created_at : "2023-12-15T12:19:11.000Z"
/// updated_at : "2024-01-13T02:34:02.000Z"
/// brand : {"id":25,"name":"Tanjim"}
/// product_warehouses : []
/// product_vendor_warehouses : [{"id":94,"product_id":61,"vendor_warehouse_id":30,"status":true,"created_at":"2024-01-13T02:34:02.000Z","updated_at":"2024-01-13T02:34:02.000Z"}]

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
      this.brand, 
      this.productWarehouses, 
      this.productVendorWarehouses,});

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
    if (json['product_warehouses'] != null) {
      productWarehouses = [];
      json['product_warehouses'].forEach((v) {
        productWarehouses?.add(ProductWarehouses.fromJson(v));
      });
    }
    if (json['product_vendor_warehouses'] != null) {
      productVendorWarehouses = [];
      json['product_vendor_warehouses'].forEach((v) {
        productVendorWarehouses?.add(ProductVendorWarehouses.fromJson(v));
      });
    }
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
  List<dynamic>? productWarehouses;
  List<ProductVendorWarehouses>? productVendorWarehouses;

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
    if (productWarehouses != null) {
      map['product_warehouses'] = productWarehouses?.map((v) => v.toJson()).toList();
    }
    if (productVendorWarehouses != null) {
      map['product_vendor_warehouses'] = productVendorWarehouses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductWarehouses {
  ProductWarehouses({
    this.id,
    this.productId,
    this.vendorWarehouseId,
    this.status,
    this.createdAt,
    this.updatedAt,});

  ProductWarehouses.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    vendorWarehouseId = json['vendor_warehouse_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? productId;
  num? vendorWarehouseId;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['vendor_warehouse_id'] = vendorWarehouseId;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 94
/// product_id : 61
/// vendor_warehouse_id : 30
/// status : true
/// created_at : "2024-01-13T02:34:02.000Z"
/// updated_at : "2024-01-13T02:34:02.000Z"

class ProductVendorWarehouses {
  ProductVendorWarehouses({
      this.id, 
      this.productId, 
      this.vendorWarehouseId, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  ProductVendorWarehouses.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    vendorWarehouseId = json['vendor_warehouse_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? productId;
  num? vendorWarehouseId;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['vendor_warehouse_id'] = vendorWarehouseId;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 25
/// name : "Tanjim"

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

/// id : 24
/// name : "Ecstasy bd"
/// phone : "01958-237701"

class Vendor2 {
  Vendor2({
      this.id, 
      this.name, 
      this.phone,});

  Vendor2.fromJson(dynamic json) {
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

/// id : 2
/// name : "EXPRESS"
/// short_description : "Delivery within 24 hours in Dhaka"
/// description : "<ul><li>Order between 10am to 6pm</li><li>Delivery within 24 hours in Dhaka</li><li>Free Delivery over 10000tk order</li><li>150 tk Dhaka city delivery fee</li></ul>"
/// icon : "/public/uploads/asset-6-y18BTh-Pp.png"
/// always_available : false
/// available_city : true
/// delivery_charge_city : 150
/// available_outside_city : false
/// delivery_charge_outside_city : 1.7
/// createdAt : "2023-12-24T07:10:32.000Z"
/// updatedAt : "2024-01-14T06:55:23.000Z"

class DeliveryType {
  DeliveryType({
      this.id, 
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
      this.updatedAt,});

  DeliveryType.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    icon = json['icon'];
    alwaysAvailable = json['always_available'];
    availableCity = json['available_city'];
    deliveryChargeCity = json['delivery_charge_city'];
    availableOutsideCity = json['available_outside_city'];
    deliveryChargeOutsideCity = json['delivery_charge_outside_city'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? name;
  String? shortDescription;
  String? description;
  String? icon;
  bool? alwaysAvailable;
  bool? availableCity;
  num? deliveryChargeCity;
  bool? availableOutsideCity;
  num? deliveryChargeOutsideCity;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['short_description'] = shortDescription;
    map['description'] = description;
    map['icon'] = icon;
    map['always_available'] = alwaysAvailable;
    map['available_city'] = availableCity;
    map['delivery_charge_city'] = deliveryChargeCity;
    map['available_outside_city'] = availableOutsideCity;
    map['delivery_charge_outside_city'] = deliveryChargeOutsideCity;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

/// log : "Order placed"
/// date : "2024-02-01T09:35:45.099Z"
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