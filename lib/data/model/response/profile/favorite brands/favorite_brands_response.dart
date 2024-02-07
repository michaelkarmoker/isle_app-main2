class FavoriteBrandsResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  FavoriteBrandsResponse(
      {this.statusCode, this.status, this.message, this.data});

  FavoriteBrandsResponse.fromJson(Map<String, dynamic> json) {
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
  bool? isMegaMenu;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Pages>? pages;

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
        this.isMegaMenu,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.pages});

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
    isMegaMenu = json['is_mega_menu'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
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
    data['is_mega_menu'] = this.isMegaMenu;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? id;
  String? slug;
  String? title;
  String? details;
  String? buttonTxt;
  String? bgPhoto;
  String? mobileBgPhoto;
  String? banner;
  String? bannerTxt;
  String? color;
  String? bgColor;
  String? activeColor;
  String? activeBgBtnColor;
  bool? status;
  String? createdAt;
  String? updatedAt;
  BrandPage? brandPage;

  Pages(
      {this.id,
        this.slug,
        this.title,
        this.details,
        this.buttonTxt,
        this.bgPhoto,
        this.mobileBgPhoto,
        this.banner,
        this.bannerTxt,
        this.color,
        this.bgColor,
        this.activeColor,
        this.activeBgBtnColor,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.brandPage});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    details = json['details'];
    buttonTxt = json['button_txt'];
    bgPhoto = json['bg_photo'];
    mobileBgPhoto = json['mobile_bg_photo'];
    banner = json['banner'];
    bannerTxt = json['banner_txt'];
    color = json['color'];
    bgColor = json['bg_color'];
    activeColor = json['active_color'];
    activeBgBtnColor = json['active_bg_btn_color'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brandPage = json['brand_page'] != null
        ? new BrandPage.fromJson(json['brand_page'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['details'] = this.details;
    data['button_txt'] = this.buttonTxt;
    data['bg_photo'] = this.bgPhoto;
    data['mobile_bg_photo'] = this.mobileBgPhoto;
    data['banner'] = this.banner;
    data['banner_txt'] = this.bannerTxt;
    data['color'] = this.color;
    data['bg_color'] = this.bgColor;
    data['active_color'] = this.activeColor;
    data['active_bg_btn_color'] = this.activeBgBtnColor;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.brandPage != null) {
      data['brand_page'] = this.brandPage!.toJson();
    }
    return data;
  }
}

class BrandPage {
  int? brandId;
  int? pageId;

  BrandPage({this.brandId, this.pageId});

  BrandPage.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    pageId = json['page_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['page_id'] = this.pageId;
    return data;
  }
}
