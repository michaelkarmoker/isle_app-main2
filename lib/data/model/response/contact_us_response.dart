class ContactusResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ContactusResponse({this.statusCode, this.status, this.message, this.data});

  ContactusResponse.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? slug;
  String? shortDescription;
  String? banner;
  String? typeOfInquiry;
  String? email;
  String? firstName;
  String? lastName;
  int? mobileNumber;
  String? yourSubject;
  String? yourMessage;
  String? orderId;
  String? details;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.slug,
        this.shortDescription,
        this.banner,
        this.typeOfInquiry,
        this.email,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.yourSubject,
        this.yourMessage,
        this.orderId,
        this.details,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    banner = json['banner'];
    typeOfInquiry = json['type_of_inquiry'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    yourSubject = json['your_subject'];
    yourMessage = json['your_message'];
    orderId = json['order_id'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['banner'] = this.banner;
    data['type_of_inquiry'] = this.typeOfInquiry;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_number'] = this.mobileNumber;
    data['your_subject'] = this.yourSubject;
    data['your_message'] = this.yourMessage;
    data['order_id'] = this.orderId;
    data['details'] = this.details;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
