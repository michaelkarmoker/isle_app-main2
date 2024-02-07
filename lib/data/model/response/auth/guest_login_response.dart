class GuestLoginResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  GuestLoginResponse({this.statusCode, this.status, this.message, this.data});

  GuestLoginResponse.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? accessToken;
  String? refreshToken;

  Data({this.user, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class User {
  bool? applicable10PercentOff;
  int? point;
  int? usePoint;
  bool? status;
  bool? isEmail;
  bool? isSms;
  int? id;
  String? firstName;
  bool? isGuest;
  String? membershipTierId;
  String? updatedAt;
  String? createdAt;

  User(
      {this.applicable10PercentOff,
        this.point,
        this.usePoint,
        this.status,
        this.isEmail,
        this.isSms,
        this.id,
        this.firstName,
        this.isGuest,
        this.membershipTierId,
        this.updatedAt,
        this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    applicable10PercentOff = json['applicable_10_percent_off'];
    point = json['point'];
    usePoint = json['use_point'];
    status = json['status'];
    isEmail = json['is_email'];
    isSms = json['is_sms'];
    id = json['id'];
    firstName = json['first_name'];
    isGuest = json['is_guest'];
    membershipTierId = json['membership_tier_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicable_10_percent_off'] = this.applicable10PercentOff;
    data['point'] = this.point;
    data['use_point'] = this.usePoint;
    data['status'] = this.status;
    data['is_email'] = this.isEmail;
    data['is_sms'] = this.isSms;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['is_guest'] = this.isGuest;
    data['membership_tier_id'] = this.membershipTierId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
