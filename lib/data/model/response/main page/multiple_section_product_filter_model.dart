class MultipleSectionProductFilterModel {
  int? statusCode;
  String? status;
  String? message;
  MultipleSectionProductFilterData? data;

  MultipleSectionProductFilterModel(
      {this.statusCode, this.status, this.message, this.data});

  MultipleSectionProductFilterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? MultipleSectionProductFilterData.fromJson(json['data']) : null;
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

class MultipleSectionProductFilterData {
  List<Sections>? sections;
  List<MultiBrands>? brands;
  List<MultiColorModel>? colors;
  List<MultiSizesModel>? sizes;

  MultipleSectionProductFilterData({this.sections, this.brands, this.colors, this.sizes});

  MultipleSectionProductFilterData.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <MultiBrands>[];
      json['brands'].forEach((v) {
        brands!.add(MultiBrands.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <MultiColorModel>[];
      json['colors'].forEach((v) {
        colors!.add(MultiColorModel.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <MultiSizesModel>[];
      json['sizes'].forEach((v) {
        sizes!.add(MultiSizesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sections {
  int? id;
  String? title;

  Sections({this.id, this.title});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class MultiBrands {
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

  MultiBrands(
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
        this.updatedAt});

  MultiBrands.fromJson(Map<String, dynamic> json) {
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
    data['is_mega_menu'] = isMegaMenu;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MultiColorModel {
  int? id;
  String? name;
  String? colorCode;
  List<ProductColorVariants>? productColorVariants;

  MultiColorModel({this.id, this.name, this.colorCode, this.productColorVariants});

  MultiColorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(ProductColorVariants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color_code'] = colorCode;
    if (productColorVariants != null) {
      data['product_color_variants'] =
          productColorVariants!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class ProductColorVariants {
  int? id;

  ProductColorVariants({this.id});

  ProductColorVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class MultiSizesModel {
  int? id;
  String? typeName;
  List<MultiSizeData>? sizes;

  MultiSizesModel({this.id, this.typeName, this.sizes});

  MultiSizesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    if (json['sizes'] != null) {
      sizes = <MultiSizeData>[];
      json['sizes'].forEach((v) {
        sizes!.add(MultiSizeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type_name'] = typeName;
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MultiSizeData {
  int? id;
  String? sizeCode;

  MultiSizeData({this.id, this.sizeCode});

  MultiSizeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sizeCode = json['size_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['size_code'] = sizeCode;
    return data;
  }
}
