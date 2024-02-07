class ReturnRefundResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ReturnRefundResponse({this.statusCode, this.status, this.message, this.data});

  ReturnRefundResponse.fromJson(Map<String, dynamic> json) {
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
  String? subtitle;
  String? email;
  String? number;
  String? img;
  String? url;
  String? description;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.slug,
        this.subtitle,
        this.email,
        this.number,
        this.img,
        this.url,
        this.description,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    email = json['email'];
    number = json['number'];
    img = json['img'];
    url = json['url'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['subtitle'] = this.subtitle;
    data['email'] = this.email;
    data['number'] = this.number;
    data['img'] = this.img;
    data['url'] = this.url;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
