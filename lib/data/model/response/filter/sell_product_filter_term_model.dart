class SellProductFilterTermModel {
  int? statusCode;
  String? status;
  String? message;
  SellProductFilterTermData? data;

  SellProductFilterTermModel(
      {this.statusCode, this.status, this.message, this.data});

  SellProductFilterTermModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SellProductFilterTermData.fromJson(json['data']) : null;
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

class SellProductFilterTermData {
  List<SellProductFilterTermCategories>? categories;
  SellProductFilterTermNewIn? newIn;
  SellProductFilterTermDiscount? discount;
  List<SellProductFilterTermSizesModel>? sizes;
  List<SellProductFilterTermColors>? colors;
  List<SellProductFilterTermBrands>? brands;

  SellProductFilterTermData(
      {this.categories,
        this.newIn,
        this.discount,
        this.sizes,
        this.colors,
        this.brands});

  SellProductFilterTermData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <SellProductFilterTermCategories>[];
      json['categories'].forEach((v) {
        categories!.add(SellProductFilterTermCategories.fromJson(v));
      });
    }
    newIn = json['new_in'] != null ? SellProductFilterTermNewIn.fromJson(json['new_in']) : null;
    discount = json['discount'] != null
        ? SellProductFilterTermDiscount.fromJson(json['discount'])
        : null;
    if (json['sizes'] != null) {
      sizes = <SellProductFilterTermSizesModel>[];
      json['sizes'].forEach((v) {
        sizes!.add(SellProductFilterTermSizesModel.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <SellProductFilterTermColors>[];
      json['colors'].forEach((v) {
        colors!.add(SellProductFilterTermColors.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <SellProductFilterTermBrands>[];
      json['brands'].forEach((v) {
        brands!.add(SellProductFilterTermBrands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (newIn != null) {
      data['new_in'] = newIn!.toJson();
    }
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }
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

class SellProductFilterTermCategories {
  int? id;
  String? title;
  int? productCount;

  SellProductFilterTermCategories({this.id, this.title, this.productCount});

  SellProductFilterTermCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['product_count'] = productCount;
    return data;
  }
}

class SellProductFilterTermNewIn {
  int? lastWeekProductCount;
  int? last15DaysProductCount;
  int? lastMonthProductCount;
  int? lastYearProductCount;

  SellProductFilterTermNewIn(
      {this.lastWeekProductCount,
        this.last15DaysProductCount,
        this.lastMonthProductCount,
        this.lastYearProductCount});

  SellProductFilterTermNewIn.fromJson(Map<String, dynamic> json) {
    lastWeekProductCount = json['last_week_product_count'];
    last15DaysProductCount = json['last_15_days_product_count'];
    lastMonthProductCount = json['last_month_product_count'];
    lastYearProductCount = json['last_year_product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_week_product_count'] = lastWeekProductCount;
    data['last_15_days_product_count'] = last15DaysProductCount;
    data['last_month_product_count'] = lastMonthProductCount;
    data['last_year_product_count'] = lastYearProductCount;
    return data;
  }
}

class SellProductFilterTermDiscount {
  int? discount10;
  int? discount20;
  int? discount30;
  int? discount40;
  int? discount50;
  int? discount60;
  int? discount70;
  int? discount80;
  int? discount90;
  int? discount100;

  SellProductFilterTermDiscount(
      {this.discount10,
        this.discount20,
        this.discount30,
        this.discount40,
        this.discount50,
        this.discount60,
        this.discount70,
        this.discount80,
        this.discount90,
        this.discount100});

  SellProductFilterTermDiscount.fromJson(Map<String, dynamic> json) {
    discount10 = json['discount_10'];
    discount20 = json['discount_20'];
    discount30 = json['discount_30'];
    discount40 = json['discount_40'];
    discount50 = json['discount_50'];
    discount60 = json['discount_60'];
    discount70 = json['discount_70'];
    discount80 = json['discount_80'];
    discount90 = json['discount_90'];
    discount100 = json['discount_100'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['discount_10'] = discount10;
    data['discount_20'] = discount20;
    data['discount_30'] = discount30;
    data['discount_40'] = discount40;
    data['discount_50'] = discount50;
    data['discount_60'] = discount60;
    data['discount_70'] = discount70;
    data['discount_80'] = discount80;
    data['discount_90'] = discount90;
    data['discount_100'] = discount100;
    return data;
  }
}

class SellProductFilterTermSizesModel {
  int? id;
  String? typeName;
  List<SellProductFilterTermSizesData>? sizes;

  SellProductFilterTermSizesModel({this.id, this.typeName, this.sizes});

  SellProductFilterTermSizesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    if (json['sizes'] != null) {
      sizes = <SellProductFilterTermSizesData>[];
      json['sizes'].forEach((v) {
        sizes!.add(SellProductFilterTermSizesData.fromJson(v));
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

class SellProductFilterTermSizesData {
  int? id;
  String? sizeCode;
  int? productCount;

  SellProductFilterTermSizesData({this.id, this.sizeCode, this.productCount});

  SellProductFilterTermSizesData.fromJson(Map<String, dynamic> json) {
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

class SellProductFilterTermColors {
  int? id;
  String? name;
  String? colorCode;
  int? productCount;
  List<ProductColorVariants>? productColorVariants;

  SellProductFilterTermColors(
      {this.id,
        this.name,
        this.colorCode,
        this.productCount,
        this.productColorVariants});

  SellProductFilterTermColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
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

class SellProductFilterTermBrands {
  int? id;
  String? name;
  int? productCount;

  SellProductFilterTermBrands({this.id, this.name, this.productCount});

  SellProductFilterTermBrands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['product_count'] = productCount;
    return data;
  }
}
