class TopHomeBannerResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  TopHomeBannerResponse(
      {this.statusCode, this.status, this.message, this.data});

  TopHomeBannerResponse.fromJson(Map<String, dynamic> json) {
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
  int? pageId;
  String? title;
  String? shortDescription;
  String? banner;
  String? buttonTxt;
  String? bannerUrl;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Page? page;

  Data(
      {this.id,
        this.pageId,
        this.title,
        this.shortDescription,
        this.banner,
        this.buttonTxt,
        this.bannerUrl,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.page});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    title = json['title'];
    shortDescription = json['short_description'];
    banner = json['banner'];
    buttonTxt = json['button_txt'];
    bannerUrl = json['banner_url'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['banner'] = this.banner;
    data['button_txt'] = this.buttonTxt;
    data['banner_url'] = this.bannerUrl;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    return data;
  }
}

class Page {
  String? pageTitle;

  Page({this.pageTitle});

  Page.fromJson(Map<String, dynamic> json) {
    pageTitle = json['page_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_title'] = this.pageTitle;
    return data;
  }
}
