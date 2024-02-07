class AccountFeedbackResponse {
  AccountFeedbackResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  AccountFeedbackResponse.fromJson(dynamic json) {
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

class Data {
  Data({
      this.id, 
      this.customerId, 
      this.message, 
      this.rating, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.customer, 
      this.feedbackAdminReplies,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    message = json['message'];
    rating = json['rating'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['feedback_admin_Replies'] != null) {
      feedbackAdminReplies = [];
      json['feedback_admin_Replies'].forEach((v) {
        feedbackAdminReplies?.add(FeedbackAdminReplies.fromJson(v));
      });
    }
  }
  num? id;
  num? customerId;
  String? message;
  num? rating;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Customer? customer;
  List<FeedbackAdminReplies>? feedbackAdminReplies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['message'] = message;
    map['rating'] = rating;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    if (feedbackAdminReplies != null) {
      map['feedback_admin_Replies'] = feedbackAdminReplies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class FeedbackAdminReplies {
  FeedbackAdminReplies({
      this.id, 
      this.feedbackId, 
      this.message, 
      this.createdAt, 
      this.updatedAt,});

  FeedbackAdminReplies.fromJson(dynamic json) {
    id = json['id'];
    feedbackId = json['feedback_id'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? feedbackId;
  String? message;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['feedback_id'] = feedbackId;
    map['message'] = message;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Customer {
  Customer({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.isGuest, 
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
      this.currentTierFirstOrder, 
      this.point, 
      this.usePoint, 
      this.status, 
      this.isEmail, 
      this.isSms, 
      this.createdAt, 
      this.updatedAt,});

  Customer.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isGuest = json['is_guest'];
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
    currentTierFirstOrder = json['current_tier_first_order'];
    point = json['point'];
    usePoint = json['use_point'];
    status = json['status'];
    isEmail = json['is_email'];
    isSms = json['is_sms'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? firstName;
  String? lastName;
  bool? isGuest;
  String? phone;
  String? email;
  String? gender;
  String? dateOfBirth;
  dynamic stateId;
  dynamic districtId;
  dynamic subDistrictId;
  String? address;
  String? password;
  dynamic otp;
  dynamic otpVerified;
  dynamic emailVerified;
  dynamic emailVerifiedAt;
  String? photo;
  num? membershipTierId;
  bool? currentTierFirstOrder;
  num? point;
  num? usePoint;
  bool? status;
  bool? isEmail;
  bool? isSms;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['is_guest'] = isGuest;
    map['phone'] = phone;
    map['email'] = email;
    map['gender'] = gender;
    map['date_of_birth'] = dateOfBirth;
    map['state_id'] = stateId;
    map['district_id'] = districtId;
    map['sub_district_id'] = subDistrictId;
    map['address'] = address;
    map['password'] = password;
    map['otp'] = otp;
    map['otp_verified'] = otpVerified;
    map['email_verified'] = emailVerified;
    map['email_verified_at'] = emailVerifiedAt;
    map['photo'] = photo;
    map['membership_tier_id'] = membershipTierId;
    map['current_tier_first_order'] = currentTierFirstOrder;
    map['point'] = point;
    map['use_point'] = usePoint;
    map['status'] = status;
    map['is_email'] = isEmail;
    map['is_sms'] = isSms;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}