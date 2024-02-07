class BrandProductFilterTermModel {
  int? statusCode;
  String? status;
  String? message;
  BrandProductFilterTermData? data;

  BrandProductFilterTermModel(
      {this.statusCode, this.status, this.message, this.data});

  BrandProductFilterTermModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? BrandProductFilterTermData.fromJson(json['data']) : null;
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

class BrandProductFilterTermData {
  List<BrandProductFilterTermAllBrands>? allBrands;
  List<BrandProductFilterTermColors>? colors;
  List<BrandProductFilterTermSizes>? sizes;

  BrandProductFilterTermData({this.allBrands, this.colors, this.sizes});

  BrandProductFilterTermData.fromJson(Map<String, dynamic> json) {
    if (json['allBrands'] != null) {
      allBrands = <BrandProductFilterTermAllBrands>[];
      json['allBrands'].forEach((v) {
        allBrands!.add(BrandProductFilterTermAllBrands.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <BrandProductFilterTermColors>[];
      json['colors'].forEach((v) {
        colors!.add(BrandProductFilterTermColors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <BrandProductFilterTermSizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(BrandProductFilterTermSizes.fromJson(v));
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

class BrandProductFilterTermAllBrands {
  int? id;
  String? name;
  int? productCount;
  List<Pages>? pages;

  BrandProductFilterTermAllBrands({this.id, this.name, this.productCount, this.pages});

  BrandProductFilterTermAllBrands.fromJson(Map<String, dynamic> json) {
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
  BrandPage? brandPage;

  Pages({this.id, this.slug, this.brandPage});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    brandPage = json['brand_page'] != null
        ? BrandPage.fromJson(json['brand_page'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
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

class BrandProductFilterTermColors {
  int? id;
  String? name;
  String? colorCode;
  bool? isMulti;
  String? multiColor1;
  String? multiColor2;
  String? multiColor3;
  int? productCount;
  List<ProductColorVariants>? productColorVariants;

  BrandProductFilterTermColors(
      {this.id,
        this.name,
        this.colorCode,
        this.isMulti,
        this.multiColor1,
        this.multiColor2,
        this.multiColor3,
        this.productCount,
        this.productColorVariants});

  BrandProductFilterTermColors.fromJson(Map<String, dynamic> json) {
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

class BrandProductFilterTermSizes {
  int? id;
  String? typeName;
  List<Sizes>? sizes;

  BrandProductFilterTermSizes({this.id, this.typeName, this.sizes});

  BrandProductFilterTermSizes.fromJson(Map<String, dynamic> json) {
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
