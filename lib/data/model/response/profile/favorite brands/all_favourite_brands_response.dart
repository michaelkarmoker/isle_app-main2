/// statusCode : 200
/// status : "success"
/// message : "follow get successfully"
/// data : [{"id":248,"customer_id":31,"brand_id":16,"brand":{"id":16,"slug":"Turaag-dfha","brand_category_id":null,"brand_code":"Turaag2310219997","name":"Turaag","details":"Activewear1","logo":"/public/uploads/turag-bneH4gsKL.webp","banner":"/public/uploads/turag-banner-HKOjrn0ne.webp","is_featured":true,"sort_order":0,"status":true,"created_at":"2023-11-20T23:01:02.000Z","updated_at":"2023-11-21T00:59:43.000Z"}},{"id":250,"customer_id":31,"brand_id":26,"brand":{"id":26,"slug":"zar zain-avbc","brand_category_id":3,"brand_code":"zar zain2311157033","name":"zar zain","details":"This is my time,\r\nIt’s the spark that lights the fire inside me,\r\nIt’s what everyone said I couldn","logo":"/public/uploads/289609219_369103968645841_4822566215506430441_n-lKypX6MpZ-.jpg","banner":"/public/uploads/289609219_369103968645841_4822566215506430441_n-L_i1C_qPK.jpg","is_featured":false,"sort_order":0,"status":true,"created_at":"2023-12-15T02:07:09.000Z","updated_at":"2024-01-15T03:48:06.000Z"}},{"id":251,"customer_id":31,"brand_id":20,"brand":{"id":20,"slug":"Turag Active-asth","brand_category_id":3,"brand_code":"Turag Active231144799","name":"Turag Active","details":"Wave Riders Limited introduces Turaag Active, merging cutting-edge technology and innovation in Fitness and Fashion to ignite an Active Lifestyle trend in Bangladesh. Our spirited team channels years of hands-on experience and continuous learning to create a groundbreaking line of activewear, aimed at revolutionizing the local fitness apparel industry.\r\n\r\nTuraag Active is born from a vision to infuse uniqueness into the market. Designed with a deep understanding of people's needs, international fashion trends, body parameters, and Bangladesh's subtropical climate, our activewear sets new standards. From concept to production, our products are meticulously crafted to excel.","logo":"/public/uploads/logo-_CieJc1Vtv.webp","banner":"/public/uploads/turaag-banner-q4ylm2O2n.webp","is_featured":false,"sort_order":0,"status":true,"created_at":"2023-12-04T03:14:45.000Z","updated_at":"2024-01-23T08:06:47.000Z"}},{"id":254,"customer_id":31,"brand_id":37,"brand":{"id":37,"slug":"Cozy cub-frxg","brand_category_id":4,"brand_code":"Cozy cub24074249","name":"Cozy cub","details":"Kidswear","logo":"/public/uploads/298443198_113709284770653_2306609895830122372_n-I20mfCBtsG.jpg","banner":"/public/uploads/298443198_113709284770653_2306609895830122372_n-IK-7YMehL.jpg","is_featured":false,"sort_order":0,"status":true,"created_at":"2024-01-07T13:01:09.000Z","updated_at":"2024-01-09T03:39:59.000Z"}}]

class AllFavouriteBrandsResponse {
  AllFavouriteBrandsResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  AllFavouriteBrandsResponse.fromJson(dynamic json) {
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

/// id : 248
/// customer_id : 31
/// brand_id : 16
/// brand : {"id":16,"slug":"Turaag-dfha","brand_category_id":null,"brand_code":"Turaag2310219997","name":"Turaag","details":"Activewear1","logo":"/public/uploads/turag-bneH4gsKL.webp","banner":"/public/uploads/turag-banner-HKOjrn0ne.webp","is_featured":true,"sort_order":0,"status":true,"created_at":"2023-11-20T23:01:02.000Z","updated_at":"2023-11-21T00:59:43.000Z"}

class Data {
  Data({
      this.id, 
      this.customerId, 
      this.brandId, 
      this.brand,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    brandId = json['brand_id'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }
  num? id;
  num? customerId;
  num? brandId;
  Brand? brand;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['brand_id'] = brandId;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    return map;
  }

}

/// id : 16
/// slug : "Turaag-dfha"
/// brand_category_id : null
/// brand_code : "Turaag2310219997"
/// name : "Turaag"
/// details : "Activewear1"
/// logo : "/public/uploads/turag-bneH4gsKL.webp"
/// banner : "/public/uploads/turag-banner-HKOjrn0ne.webp"
/// is_featured : true
/// sort_order : 0
/// status : true
/// created_at : "2023-11-20T23:01:02.000Z"
/// updated_at : "2023-11-21T00:59:43.000Z"

class Brand {
  Brand({
      this.id, 
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
      this.updatedAt,});

  Brand.fromJson(dynamic json) {
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
  num? id;
  String? slug;
  dynamic brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  num? sortOrder;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['brand_category_id'] = brandCategoryId;
    map['brand_code'] = brandCode;
    map['name'] = name;
    map['details'] = details;
    map['logo'] = logo;
    map['banner'] = banner;
    map['is_featured'] = isFeatured;
    map['sort_order'] = sortOrder;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}