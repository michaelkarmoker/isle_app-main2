class FooterByTypesResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;
  FooterByTypesResponse(
      {this.statusCode, this.status, this.message, this.data});

  FooterByTypesResponse.fromJson(Map<String, dynamic> json) {
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
  List<CustomerCare>? customerCare;
  List<Company>? company;
  List<Legal>? legal;
  List<QuickLink>? quickLink;

  Data({this.customerCare, this.company, this.legal, this.quickLink});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['customer_care'] != null) {
      customerCare = <CustomerCare>[];
      json['customer_care'].forEach((v) {
        customerCare!.add(new CustomerCare.fromJson(v));
      });
    }
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(new Company.fromJson(v));
      });
    }
    if (json['legal'] != null) {
      legal = <Legal>[];
      json['legal'].forEach((v) {
        legal!.add(new Legal.fromJson(v));
      });
    }
    if (json['quick_link'] != null) {
      quickLink = <QuickLink>[];
      json['quick_link'].forEach((v) {
        quickLink!.add(new QuickLink.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerCare != null) {
      data['customer_care'] =
          this.customerCare!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.map((v) => v.toJson()).toList();
    }
    if (this.legal != null) {
      data['legal'] = this.legal!.map((v) => v.toJson()).toList();
    }
    if (this.quickLink != null) {
      data['quick_link'] = this.quickLink!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerCare {
  int? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrl;
  String? type;
  String? sortOrder;
  String? createdAt;
  String? updatedAt;

  CustomerCare(
      {this.id,
        this.pageTitle,
        this.slug,
        this.subtitle,
        this.details,
        this.cover,
        this.pageUrl,
        this.type,
        this.sortOrder,
        this.createdAt,
        this.updatedAt});

  CustomerCare.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_title'] = this.pageTitle;
    data['slug'] = this.slug;
    data['subtitle'] = this.subtitle;
    data['details'] = this.details;
    data['cover'] = this.cover;
    data['page_url'] = this.pageUrl;
    data['type'] = this.type;
    data['sort_order'] = this.sortOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Company {
  int? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrl;
  String? type;
  String? sortOrder;
  String? createdAt;
  String? updatedAt;

  Company(
      {this.id,
        this.pageTitle,
        this.slug,
        this.subtitle,
        this.details,
        this.cover,
        this.pageUrl,
        this.type,
        this.sortOrder,
        this.createdAt,
        this.updatedAt});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_title'] = this.pageTitle;
    data['slug'] = this.slug;
    data['subtitle'] = this.subtitle;
    data['details'] = this.details;
    data['cover'] = this.cover;
    data['page_url'] = this.pageUrl;
    data['type'] = this.type;
    data['sort_order'] = this.sortOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Legal {
  int? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrl;
  String? type;
  String? sortOrder;
  String? createdAt;
  String? updatedAt;

  Legal(
      {this.id,
        this.pageTitle,
        this.slug,
        this.subtitle,
        this.details,
        this.cover,
        this.pageUrl,
        this.type,
        this.sortOrder,
        this.createdAt,
        this.updatedAt});

  Legal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_title'] = this.pageTitle;
    data['slug'] = this.slug;
    data['subtitle'] = this.subtitle;
    data['details'] = this.details;
    data['cover'] = this.cover;
    data['page_url'] = this.pageUrl;
    data['type'] = this.type;
    data['sort_order'] = this.sortOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class QuickLink {
  int? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrl;
  String? type;
  String? sortOrder;
  String? createdAt;
  String? updatedAt;

  QuickLink(
      {this.id,
        this.pageTitle,
        this.slug,
        this.subtitle,
        this.details,
        this.cover,
        this.pageUrl,
        this.type,
        this.sortOrder,
        this.createdAt,
        this.updatedAt});

  QuickLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_title'] = this.pageTitle;
    data['slug'] = this.slug;
    data['subtitle'] = this.subtitle;
    data['details'] = this.details;
    data['cover'] = this.cover;
    data['page_url'] = this.pageUrl;
    data['type'] = this.type;
    data['sort_order'] = this.sortOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
