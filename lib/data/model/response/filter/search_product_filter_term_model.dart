class SearchPoductFilterTermModel {
  int? statusCode;
  String? status;
  String? message;
  SearchPoductFilterTermData? data;

  SearchPoductFilterTermModel(
      {this.statusCode, this.status, this.message, this.data});

  SearchPoductFilterTermModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SearchPoductFilterTermData.fromJson(json['data']) : null;
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

class SearchPoductFilterTermData {
  List<SearchPoductFilterTermSizes>? sizes;
  List<SearchPoductFilterTermColors>? colors;
  List<SearchPoductFilterTermBrands>? brands;

  SearchPoductFilterTermData({this.sizes, this.colors, this.brands});

  SearchPoductFilterTermData.fromJson(Map<String, dynamic> json) {
    if (json['sizes'] != null) {
      sizes = <SearchPoductFilterTermSizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(SearchPoductFilterTermSizes.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <SearchPoductFilterTermColors>[];
      json['colors'].forEach((v) {
        colors!.add(SearchPoductFilterTermColors.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <SearchPoductFilterTermBrands>[];
      json['brands'].forEach((v) {
        brands!.add(SearchPoductFilterTermBrands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchPoductFilterTermSizes {
  int? id;
  String? typeName;
  List<Sizes>? sizes;

  SearchPoductFilterTermSizes({this.id, this.typeName, this.sizes});

  SearchPoductFilterTermSizes.fromJson(Map<String, dynamic> json) {
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

  Sizes({this.id, this.sizeCode});

  Sizes.fromJson(Map<String, dynamic> json) {
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

class SearchPoductFilterTermColors {
  int? id;
  String? name;
  String? colorCode;
  List<ProductColorVariants>? productColorVariants;

  SearchPoductFilterTermColors({this.id, this.name, this.colorCode, this.productColorVariants});

  SearchPoductFilterTermColors.fromJson(Map<String, dynamic> json) {
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

class SearchPoductFilterTermBrands {
  int? id;
  String? name;

  SearchPoductFilterTermBrands({this.id, this.name});

  SearchPoductFilterTermBrands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
