class ColorResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ColorResponse({this.statusCode, this.status, this.message, this.data});

  ColorResponse.fromJson(Map<String, dynamic> json) {
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
  String? primaryColor;
  String? secondaryColor;
  String? secondaryAltColor;
  List<Pages>? pages;

  Data(
      {this.primaryColor,
        this.secondaryColor,
        this.secondaryAltColor,
        this.pages});

  Data.fromJson(Map<String, dynamic> json) {
    primaryColor = json['primary_color'];
    secondaryColor = json['secondary_color'];
    secondaryAltColor = json['secondary_alt_color'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary_color'] = this.primaryColor;
    data['secondary_color'] = this.secondaryColor;
    data['secondary_alt_color'] = this.secondaryAltColor;
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? id;
  String? slug;
  String? bgColor;

  Pages({this.id, this.slug, this.bgColor});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    bgColor = json['bg_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['bg_color'] = this.bgColor;
    return data;
  }
}
