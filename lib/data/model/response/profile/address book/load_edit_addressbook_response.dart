class EditLoadAddressBookResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  EditLoadAddressBookResponse(
      {this.statusCode, this.status, this.message, this.data});

  EditLoadAddressBookResponse.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  String? addressType;
  String? firstName;
  String? lastName;
  String? phone;
  int? stateId;
  int? districtId;
  int? subDistrictId;
  String? address;
  bool? isPrimary;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.customerId,
        this.addressType,
        this.firstName,
        this.lastName,
        this.phone,
        this.stateId,
        this.districtId,
        this.subDistrictId,
        this.address,
        this.isPrimary,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    addressType = json['address_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    isPrimary = json['is_primary'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['address_type'] = this.addressType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['sub_district_id'] = this.subDistrictId;
    data['address'] = this.address;
    data['is_primary'] = this.isPrimary;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
