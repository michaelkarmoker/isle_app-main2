import 'dart:convert';
/// client_corelation_id : "0772b94b4e7baaaf"
/// customer_id : 27
/// first_name : "Md. Naymur"
/// last_name : "Rahaman"
/// phone : "01733424273"
/// email : "sunny@mail.com"
/// state_id : 1
/// district_id : 2
/// sub_district_id : 1
/// address : "Mirpur"
/// gift_note : "My Note"
/// special_note : "Sunny"
/// coupon : "SUNNY1014"
/// brand_coupon : "Sunny110b"
/// payment_method : "cod"
/// bill_address : true
/// delivery_types : [{"vendor_id":21,"delivery_type_id":1,"package_type_id":null,"delivery_charge":200},{"vendor_id":23,"delivery_type_id":2,"package_type_id":null,"delivery_charge":150},{"vendor_id":24,"delivery_type_id":3,"package_type_id":null,"delivery_charge":100},{"vendor_id":25,"delivery_type_id":3,"package_type_id":null,"delivery_charge":100}]
/// redeem_point : 0
/// first_order_discount : true
/// is_guest : false

OrderPlaceRequest orderPlaceRequestFromJson(String str) => OrderPlaceRequest.fromJson(json.decode(str));
String orderPlaceRequestToJson(OrderPlaceRequest data) => json.encode(data.toJson());
class OrderPlaceRequest {
  OrderPlaceRequest({
      this.clientCorelationId, 
      this.customerId, 
      this.firstName, 
      this.lastName, 
      this.phone, 
      this.email, 
      this.stateId, 
      this.districtId, 
      this.subDistrictId, 
      this.address, 
      this.giftNote, 
      this.specialNote, 
      this.coupon, 
      this.brandCoupon, 
      this.paymentMethod, 
      this.billAddress, 

      this.redeemPoint, 
      this.firstOrderDiscount, 
      this.isGuest,});

  OrderPlaceRequest.fromJson(dynamic json) {
    clientCorelationId = json['client_corelation_id'];
    customerId = json['customer_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    giftNote = json['gift_note'];
    specialNote = json['special_note'];
    coupon = json['coupon'];
    brandCoupon = json['brand_coupon'];
    paymentMethod = json['payment_method'];
    billAddress = json['bill_address'];
    if (json['delivery_types'] != null) {
      deliveryTypes = [];
      json['delivery_types'].forEach((v) {
        deliveryTypes?.add(DeliveryTypes.fromJson(v));
      });
    }
    redeemPoint = json['redeem_point'];
    firstOrderDiscount = json['first_order_discount'];
    isGuest = json['is_guest'];
  }
  String? clientCorelationId;
  String? customerId;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  int? stateId;
  int? districtId;
  int? subDistrictId;
  String? address;
  String? giftNote;
  String? specialNote;
  String? coupon;
  String? brandCoupon;
  String? paymentMethod;
  bool? billAddress;
  List<DeliveryTypes> deliveryTypes=[];
  int? redeemPoint;
  bool? firstOrderDiscount;
  bool? isGuest;

  double subtotal=0.0;
  double grandTotal=0.0;
  double vat=0.0;
  double shippingCost=0.0;
  double brandCouponAmount=0.0;
  double isleCouponAmount=0.0;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_corelation_id'] = clientCorelationId;
    map['customer_id'] = customerId;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['state_id'] = stateId;
    map['district_id'] = districtId;
    map['sub_district_id'] = subDistrictId;
    map['address'] = address;
    map['gift_note'] = giftNote;
    map['special_note'] = specialNote;
    map['coupon'] = coupon;
    map['brand_coupon'] = brandCoupon;
    map['payment_method'] = paymentMethod;
    map['bill_address'] = billAddress;
    if (deliveryTypes != null) {
      map['delivery_types'] = deliveryTypes?.map((v) => v.toJson()).toList();
    }
    map['redeem_point'] = redeemPoint;
    map['first_order_discount'] = firstOrderDiscount;
    map['is_guest'] = isGuest;
    return map;
  }

}

/// vendor_id : 21
/// delivery_type_id : 1
/// package_type_id : null
/// delivery_charge : 200

DeliveryTypes deliveryTypesFromJson(String str) => DeliveryTypes.fromJson(json.decode(str));
String deliveryTypesToJson(DeliveryTypes data) => json.encode(data.toJson());
class DeliveryTypes {
  DeliveryTypes({
      this.vendorId, 
      this.deliveryTypeId, 
      this.packageTypeId, 
      this.deliveryCharge,});

  DeliveryTypes.fromJson(dynamic json) {
    vendorId = json['vendor_id'];
    deliveryTypeId = json['delivery_type_id'];
    packageTypeId = json['package_type_id'];
    deliveryCharge = json['delivery_charge'];
  }
  int? vendorId;
  int? deliveryTypeId;
  dynamic packageTypeId;
  double? deliveryCharge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vendor_id'] = vendorId;
    map['delivery_type_id'] = deliveryTypeId;
    map['package_type_id'] = packageTypeId;
    map['delivery_charge'] = deliveryCharge;
    return map;
  }

}