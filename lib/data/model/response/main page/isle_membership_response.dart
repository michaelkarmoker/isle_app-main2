class IsleMemberShipResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  IsleMemberShipResponse(
      {this.statusCode, this.status, this.message, this.data});

  IsleMemberShipResponse.fromJson(Map<String, dynamic> json) {
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
  String? isleMembershipName;
  String? title;
  String? shortDescription;
  String? buttonTxt;
  String? banner;
  String? appPhoto;
  String? appDescription;
  String? appCouponDescription;
  String? googlePlayLogo;
  String? googlePlayLink;
  String? appStoreLogo;
  String? appStoreLink;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.isleMembershipName,
        this.title,
        this.shortDescription,
        this.buttonTxt,
        this.banner,
        this.appPhoto,
        this.appDescription,
        this.appCouponDescription,
        this.googlePlayLogo,
        this.googlePlayLink,
        this.appStoreLogo,
        this.appStoreLink,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isleMembershipName = json['isle_membership_name'];
    title = json['title'];
    shortDescription = json['short_description'];
    buttonTxt = json['button_txt'];
    banner = json['banner'];
    appPhoto = json['app_photo'];
    appDescription = json['app_description'];
    appCouponDescription = json['app_coupon_description'];
    googlePlayLogo = json['google_play_logo'];
    googlePlayLink = json['google_play_link'];
    appStoreLogo = json['app_store_logo'];
    appStoreLink = json['app_store_link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isle_membership_name'] = this.isleMembershipName;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['button_txt'] = this.buttonTxt;
    data['banner'] = this.banner;
    data['app_photo'] = this.appPhoto;
    data['app_description'] = this.appDescription;
    data['app_coupon_description'] = this.appCouponDescription;
    data['google_play_logo'] = this.googlePlayLogo;
    data['google_play_link'] = this.googlePlayLink;
    data['app_store_logo'] = this.appStoreLogo;
    data['app_store_link'] = this.appStoreLink;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
