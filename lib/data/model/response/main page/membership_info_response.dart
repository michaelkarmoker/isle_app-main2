class MembershipInfoResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  MembershipInfoResponse(
      {this.statusCode, this.status, this.message, this.data});

  MembershipInfoResponse.fromJson(Map<String, dynamic> json) {
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
  String? rawTitle;
  String? subRawTitle;
  String? slug;
  String? banner;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.rawTitle,
        this.subRawTitle,
        this.slug,
        this.banner,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rawTitle = json['raw_title'];
    subRawTitle = json['sub_raw_title'];
    slug = json['slug'];
    banner = json['banner'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['raw_title'] = this.rawTitle;
    data['sub_raw_title'] = this.subRawTitle;
    data['slug'] = this.slug;
    data['banner'] = this.banner;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
