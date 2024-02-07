class NestedCatSubCatResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  NestedCatSubCatResponse(
      {this.statusCode, this.status, this.message, this.data});

  NestedCatSubCatResponse.fromJson(Map<String, dynamic> json) {
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
  String? slug;
  String? shortDescription;
  String? details;
  String? banner;
  bool? isBrandShow;
  bool? isFooterShow;
  List<SubCategories>? subCategories;

  Data(
      {this.id,
        this.pageId,
        this.title,
        this.slug,
        this.shortDescription,
        this.details,
        this.banner,
        this.isBrandShow,
        this.isFooterShow,
        this.subCategories});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    title = json['title'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    isBrandShow = json['is_brand_show'];
    isFooterShow = json['is_footer_show'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['is_brand_show'] = this.isBrandShow;
    data['is_footer_show'] = this.isFooterShow;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  int? categoryId;
  String? title;
  String? slug;
  String? details;
  String? shortDescription;
  String? banner;
  List<ChildCategories>? childCategories;

  SubCategories(
      {this.id,
        this.categoryId,
        this.title,
        this.slug,
        this.details,
        this.shortDescription,
        this.banner,
        this.childCategories});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    slug = json['slug'];
    details = json['details'];
    shortDescription = json['short_description'];
    banner = json['banner'];
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(new ChildCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['details'] = this.details;
    data['short_description'] = this.shortDescription;
    data['banner'] = this.banner;
    if (this.childCategories != null) {
      data['child_categories'] =
          this.childCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildCategories {
  int? id;
  int? subCategoryId;
  String? title;
  String? slug;
  String? shortDescription;
  String? details;
  String? banner;

  ChildCategories(
      {this.id,
        this.subCategoryId,
        this.title,
        this.slug,
        this.shortDescription,
        this.details,
        this.banner});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    title = json['title'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_category_id'] = this.subCategoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    return data;
  }
}
