class UserProfileResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  UserProfileResponse({this.statusCode, this.status, this.message, this.data});

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
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
  MembershipTier? membershipTier;
  List<Orders>? orders;

  Data(
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
        this.updatedAt,
        this.membershipTier,
        this.orders});

  Data.fromJson(Map<String, dynamic> json) {
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
    membershipTier = json['membership_tier'] != null
        ? new MembershipTier.fromJson(json['membership_tier'])
        : null;
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
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
    if (this.membershipTier != null) {
      data['membership_tier'] = this.membershipTier!.toJson();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MembershipTier {
  int? id;
  String? tiersName;
  bool? isDefault;
  int? upgradePoint;
  int? upgradeTimeLimit;
  String? shortDescription;
  String? colorCode;
  String? image;
  String? createdAt;
  String? updatedAt;

  MembershipTier(
      {this.id,
        this.tiersName,
        this.isDefault,
        this.upgradePoint,
        this.upgradeTimeLimit,
        this.shortDescription,
        this.colorCode,
        this.image,
        this.createdAt,
        this.updatedAt});

  MembershipTier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tiersName = json['tiers_name'];
    isDefault = json['is_default'];
    upgradePoint = json['upgrade_point'];
    upgradeTimeLimit = json['upgrade_time_limit'];
    shortDescription = json['short_description'];
    colorCode = json['color_code'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tiers_name'] = this.tiersName;
    data['is_default'] = this.isDefault;
    data['upgrade_point'] = this.upgradePoint;
    data['upgrade_time_limit'] = this.upgradeTimeLimit;
    data['short_description'] = this.shortDescription;
    data['color_code'] = this.colorCode;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Orders {
  int? id;
  String? orderNo;
  String? createdAt;

  Orders({this.id, this.orderNo, this.createdAt});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['created_at'] = this.createdAt;
    return data;
  }
}
