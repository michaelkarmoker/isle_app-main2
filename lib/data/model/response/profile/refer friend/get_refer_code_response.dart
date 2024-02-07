class ReferCodeResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  ReferCodeResponse({this.statusCode, this.status, this.message, this.data});

  ReferCodeResponse.fromJson(Map<String, dynamic> json) {
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
  String? referCode;
  int? referCodeUsed;
  int? referCodeLimit;
  int? userUsed;
  bool? selfRefer;
  int? referPoint;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  Data(
      {this.id,
        this.customerId,
        this.referCode,
        this.referCodeUsed,
        this.referCodeLimit,
        this.userUsed,
        this.selfRefer,
        this.referPoint,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.customer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    referCode = json['refer_code'];
    referCodeUsed = json['refer_code_used'];
    referCodeLimit = json['refer_code_limit'];
    userUsed = json['user_used'];
    selfRefer = json['self_refer'];
    referPoint = json['refer_point'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['refer_code'] = this.referCode;
    data['refer_code_used'] = this.referCodeUsed;
    data['refer_code_limit'] = this.referCodeLimit;
    data['user_used'] = this.userUsed;
    data['self_refer'] = this.selfRefer;
    data['refer_point'] = this.referPoint;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? gender;
  String? dateOfBirth;
  String? stateId;
  String? districtId;
  String? subDistrictId;
  String? address;
  String? password;
  String? otp;
  String? otpVerified;
  String? emailVerified;
  String? emailVerifiedAt;
  String? photo;
  int? membershipTierId;
  int? point;
  int? usePoint;
  bool? status;
  bool? isEmail;
  bool? isSms;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.gender,
        this.dateOfBirth,
        this.stateId,
        this.districtId,
        this.subDistrictId,
        this.address,
        this.password,
        this.otp,
        this.otpVerified,
        this.emailVerified,
        this.emailVerifiedAt,
        this.photo,
        this.membershipTierId,
        this.point,
        this.usePoint,
        this.status,
        this.isEmail,
        this.isSms,
        this.createdAt,
        this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    password = json['password'];
    otp = json['otp'];
    otpVerified = json['otp_verified'];
    emailVerified = json['email_verified'];
    emailVerifiedAt = json['email_verified_at'];
    photo = json['photo'];
    membershipTierId = json['membership_tier_id'];
    point = json['point'];
    usePoint = json['use_point'];
    status = json['status'];
    isEmail = json['is_email'];
    isSms = json['is_sms'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['sub_district_id'] = this.subDistrictId;
    data['address'] = this.address;
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['otp_verified'] = this.otpVerified;
    data['email_verified'] = this.emailVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['photo'] = this.photo;
    data['membership_tier_id'] = this.membershipTierId;
    data['point'] = this.point;
    data['use_point'] = this.usePoint;
    data['status'] = this.status;
    data['is_email'] = this.isEmail;
    data['is_sms'] = this.isSms;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
