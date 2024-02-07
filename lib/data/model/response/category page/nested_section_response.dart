class NestedSectionResponse {
  int? statusCode;
  String? status;
  String? message;
  List<NestedSectionResponseData>? data;

  NestedSectionResponse(
      {this.statusCode, this.status, this.message, this.data});

  NestedSectionResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NestedSectionResponseData>[];
      json['data'].forEach((v) {
        data!.add(new NestedSectionResponseData.fromJson(v));
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

class NestedSectionResponseData {
  int? id;
  int? pageId;
  String? sectionTypeMegamenu;
  String? sectionTypeHomepage;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  String? hoverBanner;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? parentSectionId;
  bool isDrop= false;
  List<Children>? children;

  NestedSectionResponseData(
      {this.id,
        this.pageId,
        this.sectionTypeMegamenu,
        this.sectionTypeHomepage,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.hoverBanner,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.parentSectionId,
        this.children});

  NestedSectionResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    sectionTypeMegamenu = json['section_type_megamenu'];
    sectionTypeHomepage = json['section_type_homepage'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    hoverBanner = json['hover_banner'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentSectionId = json['parent_section_id'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['section_type_megamenu'] = this.sectionTypeMegamenu;
    data['section_type_homepage'] = this.sectionTypeHomepage;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['hover_banner'] = this.hoverBanner;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_section_id'] = this.parentSectionId;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int? id;
  int? pageId;
  String? sectionTypeMegamenu;
  String? sectionTypeHomepage;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  String? hoverBanner;
  bool? status;
  String? createdAt;
  String? updatedAt;
  int? parentSectionId;
  bool isDrop2= false;
  List<Children1>? children;

  Children(
      {this.id,
        this.pageId,
        this.sectionTypeMegamenu,
        this.sectionTypeHomepage,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.hoverBanner,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.parentSectionId,
        this.children});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    sectionTypeMegamenu = json['section_type_megamenu'];
    sectionTypeHomepage = json['section_type_homepage'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    hoverBanner = json['hover_banner'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentSectionId = json['parent_section_id'];
    if (json['children'] != null) {
      children = <Children1>[];
      json['children'].forEach((v) {
        children!.add(new Children1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['section_type_megamenu'] = this.sectionTypeMegamenu;
    data['section_type_homepage'] = this.sectionTypeHomepage;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['hover_banner'] = this.hoverBanner;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_section_id'] = this.parentSectionId;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children1 {
  int? id;
  int? pageId;
  String? sectionTypeMegamenu;
  String? sectionTypeHomepage;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  bool? status;
  String? createdAt;
  String? updatedAt;
  bool isDrop3= false;
  int? parentSectionId;

  Children1(
      {this.id,
        this.pageId,
        this.sectionTypeMegamenu,
        this.sectionTypeHomepage,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.parentSectionId});

  Children1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    sectionTypeMegamenu = json['section_type_megamenu'];
    sectionTypeHomepage = json['section_type_homepage'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentSectionId = json['parent_section_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['section_type_megamenu'] = this.sectionTypeMegamenu;
    data['section_type_homepage'] = this.sectionTypeHomepage;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_section_id'] = this.parentSectionId;
    return data;
  }
}


