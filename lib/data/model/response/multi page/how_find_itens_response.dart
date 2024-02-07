class FindItemsResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  FindItemsResponse({this.statusCode, this.status, this.message, this.data});

  FindItemsResponse.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? banner;
  String? email;
  String? url;
  String? video;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.slug,
        this.subtitle,
        this.description,
        this.banner,
        this.email,
        this.url,
        this.video,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    description = json['description'];
    banner = json['banner'];
    email = json['email'];
    url = json['url'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['banner'] = this.banner;
    data['email'] = this.email;
    data['url'] = this.url;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
