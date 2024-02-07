class AllFollowBrandListResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  AllFollowBrandListResponse(
      {this.statusCode, this.status, this.message, this.data});

  AllFollowBrandListResponse.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  int? brandId;
  Brand? brand;

  Data({this.id, this.customerId, this.brandId, this.brand});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    brandId = json['brand_id'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['brand_id'] = this.brandId;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    return data;
  }
}

class Brand {
  int? id;
  String? slug;
  int? brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  int? sortOrder;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id,
        this.slug,
        this.brandCategoryId,
        this.brandCode,
        this.name,
        this.details,
        this.logo,
        this.banner,
        this.isFeatured,
        this.sortOrder,
        this.status,
        this.createdAt,
        this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    brandCategoryId = json['brand_category_id'];
    brandCode = json['brand_code'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    sortOrder = json['sort_order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['brand_category_id'] = this.brandCategoryId;
    data['brand_code'] = this.brandCode;
    data['name'] = this.name;
    data['details'] = this.details;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['is_featured'] = this.isFeatured;
    data['sort_order'] = this.sortOrder;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
