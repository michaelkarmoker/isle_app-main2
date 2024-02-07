class BrandTypeProductFilterModel {
  int? statusCode;
  String? status;
  String? message;
  BrandTypeProductFilterData? data;

  BrandTypeProductFilterModel(
      {this.statusCode, this.status, this.message, this.data});

  BrandTypeProductFilterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? BrandTypeProductFilterData.fromJson(json['data']) : null;
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

class BrandTypeProductFilterData {
  List<BrandTypeProductFilterAllBrands>? allBrands;
  List<BrandTypeProductFilterColors>? colors;
  List<BrandTypeProductFilterSizes>? sizes;

  BrandTypeProductFilterData({this.allBrands, this.colors, this.sizes});

  BrandTypeProductFilterData.fromJson(Map<String, dynamic> json) {
    if (json['allBrands'] != null) {
      allBrands = <BrandTypeProductFilterAllBrands>[];
      json['allBrands'].forEach((v) {
        allBrands!.add(BrandTypeProductFilterAllBrands.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <BrandTypeProductFilterColors>[];
      json['colors'].forEach((v) {
        colors!.add(BrandTypeProductFilterColors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <BrandTypeProductFilterSizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(BrandTypeProductFilterSizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allBrands != null) {
      data['allBrands'] = allBrands!.map((v) => v.toJson()).toList();
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

class BrandTypeProductFilterAllBrands {
  int? id;
  String? name;
  int? productCount;
  List<Pages>? pages;

  BrandTypeProductFilterAllBrands({this.id, this.name, this.productCount, this.pages});

  BrandTypeProductFilterAllBrands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productCount = json['product_count'];
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
    data['name'] = name;
    data['product_count'] = productCount;
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? id;
  String? slug;
  String? title;
  BrandPage? brandPage;

  Pages({this.id, this.slug, this.title, this.brandPage});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    brandPage = json['brand_page'] != null
        ? BrandPage.fromJson(json['brand_page'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
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

class BrandTypeProductFilterColors {
  int? id;
  String? name;
  String? colorCode;
  bool? isMulti;
  String? multiColor1;
  String? multiColor2;
  String? multiColor3;
  int? productCount;
  List<ProductColorVariants>? productColorVariants;

  BrandTypeProductFilterColors(
      {this.id,
        this.name,
        this.colorCode,
        this.isMulti,
        this.multiColor1,
        this.multiColor2,
        this.multiColor3,
        this.productCount,
        this.productColorVariants});

  BrandTypeProductFilterColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    isMulti = json['is_multi'];
    multiColor1 = json['multi_color_1'];
    multiColor2 = json['multi_color_2'];
    multiColor3 = json['multi_color_3'];
    productCount = json['product_count'];
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
    data['is_multi'] = isMulti;
    data['multi_color_1'] = multiColor1;
    data['multi_color_2'] = multiColor2;
    data['multi_color_3'] = multiColor3;
    data['product_count'] = productCount;
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

class BrandTypeProductFilterSizes {
  int? id;
  String? typeName;
  List<Sizes>? sizes;

  BrandTypeProductFilterSizes({this.id, this.typeName, this.sizes});

  BrandTypeProductFilterSizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
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

class Sizes {
  int? id;
  String? sizeCode;
  int? productCount;

  Sizes({this.id, this.sizeCode, this.productCount});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sizeCode = json['size_code'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['size_code'] = sizeCode;
    data['product_count'] = productCount;
    return data;
  }
}
