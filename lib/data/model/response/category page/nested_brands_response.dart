/*
class NestedBrandsResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  NestedBrandsResponse({this.statusCode, this.status, this.message, this.data});

  NestedBrandsResponse.fromJson(Map<String, dynamic> json) {
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
  String? slug;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  bool? status;
  String? createdAt;
  String? updatedAt;
  bool isDrop= false;
  List<Brands>? brands;

  Data(
      {this.id,
        this.slug,
        this.name,
        this.details,
        this.logo,
        this.banner,
        this.isFeatured,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.brands});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['details'] = this.details;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['is_featured'] = this.isFeatured;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  int? id;
  String? slug;
  int? brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  bool? isMegaMenu;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Brands(
      {this.id,
        this.slug,
        this.brandCategoryId,
        this.brandCode,
        this.name,
        this.details,
        this.logo,
        this.banner,
        this.isFeatured,
        this.isMegaMenu,
        this.status,
        this.createdAt,
        this.updatedAt});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    brandCategoryId = json['brand_category_id'];
    brandCode = json['brand_code'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    isMegaMenu = json['is_mega_menu'];
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
    data['is_mega_menu'] = this.isMegaMenu;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
*/
class NestedBrandsResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  NestedBrandsResponse({this.statusCode, this.status, this.message, this.data});

  NestedBrandsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  int? pageId;
  List<Brands>? brands;

  Data(
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
        this.pageId,
        this.brands});

  Data.fromJson(Map<String, dynamic> json) {
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
    pageId = json['page_id'];
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['page_id'] = pageId;
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  int? id;
  int? sortOrder;
  String? slug;
  String? name;
  bool isDrop= false;
  List<MegaMenuBrands>? megaMenuBrands;

  Brands({this.id, this.sortOrder, this.slug, this.name, this.megaMenuBrands});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sortOrder = json['sort_order'];
    slug = json['slug'];
    name = json['name'];
    if (json['mega_menu_brands'] != null) {
      megaMenuBrands = <MegaMenuBrands>[];
      json['mega_menu_brands'].forEach((v) {
        megaMenuBrands!.add(MegaMenuBrands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sort_order'] = sortOrder;
    data['slug'] = slug;
    data['name'] = name;
    if (megaMenuBrands != null) {
      data['mega_menu_brands'] =
          megaMenuBrands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MegaMenuBrands {
  int? id;
  int? brandId;
  int? pageId;
  int? sortOrder;

  MegaMenuBrands({this.id, this.brandId, this.pageId, this.sortOrder});

  MegaMenuBrands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandId = json['brand_id'];
    pageId = json['page_id'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['brand_id'] = brandId;
    data['page_id'] = pageId;
    data['sort_order'] = sortOrder;
    return data;
  }
}
