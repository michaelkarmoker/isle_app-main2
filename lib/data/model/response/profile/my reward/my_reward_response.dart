class RewardHistoryResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  RewardHistoryResponse(
      {this.statusCode, this.status, this.message, this.data});

  RewardHistoryResponse.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  int? orderId;
  int? point;
  String? createdAt;
  String? updatedAt;
  Order? order;

  Data(
      {this.id,
        this.customerId,
        this.orderId,
        this.point,
        this.createdAt,
        this.updatedAt,
        this.order});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    orderId = json['order_id'];
    point = json['point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['order_id'] = this.orderId;
    data['point'] = this.point;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
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
  int? couponOrIsleDiscount;
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

  Order(
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
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
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
    calculatedVat = json['calculated_vat'];
    deliveryCharge = json['delivery_charge'];
    finalPrice = json['final_price'];
    couponId = json['coupon_id'];
    couponOrIsleDiscount = json['coupon_or_isle_discount'];
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
