class SearchBrandTypeModel {
  int? statusCode;
  String? status;
  String? message;
  SearchBrandsTypeData? data;

  SearchBrandTypeModel({this.statusCode, this.status, this.message, this.data});

  SearchBrandTypeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SearchBrandsTypeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SearchBrandsTypeData {
  int? id;
  String? slug;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  int? sortOrder;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<SearchBrandTypeBrands>? brands;

  SearchBrandsTypeData(
      {this.id,
        this.slug,
        this.name,
        this.details,
        this.logo,
        this.banner,
        this.isFeatured,
        this.sortOrder,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.brands});

  SearchBrandsTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    sortOrder = json['sort_order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['brands'] != null) {
      brands = <SearchBrandTypeBrands>[];
      json['brands'].forEach((v) {
        brands!.add(SearchBrandTypeBrands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['details'] = details;
    data['logo'] = logo;
    data['banner'] = banner;
    data['is_featured'] = isFeatured;
    data['sort_order'] = sortOrder;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchBrandTypeBrands {
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
  List<Pages>? pages;

  SearchBrandTypeBrands(
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
        this.updatedAt,
        this.pages});

  SearchBrandTypeBrands.fromJson(Map<String, dynamic> json) {
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
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['brand_category_id'] = brandCategoryId;
    data['brand_code'] = brandCode;
    data['name'] = name;
    data['details'] = details;
    data['logo'] = logo;
    data['banner'] = banner;
    data['is_featured'] = isFeatured;
    data['sort_order'] = sortOrder;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? id;
  BrandPage? brandPage;

  Pages({this.id, this.brandPage});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandPage = json['brand_page'] != null
        ? BrandPage.fromJson(json['brand_page'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (brandPage != null) {
      data['brand_page'] = brandPage!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_id'] = brandId;
    data['page_id'] = pageId;
    return data;
  }
}
