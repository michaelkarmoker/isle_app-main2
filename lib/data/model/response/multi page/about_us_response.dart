class AboutUsResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  AboutUsResponse({this.statusCode, this.status, this.message, this.data});

  AboutUsResponse.fromJson(Map<String, dynamic> json) {
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
  String? shortDescription;
  String? img;
  String? officeName;
  String? officeAddress;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.slug,
        this.subtitle,
        this.shortDescription,
        this.img,
        this.officeName,
        this.officeAddress,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    shortDescription = json['short_description'];
    img = json['img'];
    officeName = json['officeName'];
    officeAddress = json['officeAddress'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['subtitle'] = this.subtitle;
    data['short_description'] = this.shortDescription;
    data['img'] = this.img;
    data['officeName'] = this.officeName;
    data['officeAddress'] = this.officeAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
