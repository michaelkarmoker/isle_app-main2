class ApplyCouponResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ApplyCouponResponse({this.statusCode, this.status, this.message, this.data});

  ApplyCouponResponse.fromJson(Map<String, dynamic> json) {
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
  bool? validity;
  int? discount;
  int? couponId;
  int? vendorId;
  int? brandId;
  String? type;

  Data(
      {this.validity,
        this.discount,
        this.couponId,
        this.vendorId,
        this.brandId,
        this.type});

  Data.fromJson(Map<String, dynamic> json) {
    validity = json['validity'];
    discount = json['discount'];
    couponId = json['coupon_id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['validity'] = this.validity;
    data['discount'] = this.discount;
    data['coupon_id'] = this.couponId;
    data['vendor_id'] = this.vendorId;
    data['brand_id'] = this.brandId;
    data['type'] = this.type;
    return data;
  }
}
