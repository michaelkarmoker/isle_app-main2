class SectionNewInProductFilterModel {
  int? statusCode;
  String? status;
  String? message;
  SectionNewInSizesSizesData? data;

  SectionNewInProductFilterModel(
      {this.statusCode, this.status, this.message, this.data});

  SectionNewInProductFilterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SectionNewInSizesSizesData.fromJson(json['data']) : null;
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

class SectionNewInSizesSizesData {
  List<SectionNewInSections>? sections;
  List<SectionNewInBrands>? brands;
  List<SectionNewInColors>? colors;
  List<SectionNewInSizesModel>? sizes;
  SectionNewInNewIn? newIn;
  SectionNewInDiscount? discount;

  SectionNewInSizesSizesData(
      {this.sections,
        this.brands,
        this.colors,
        this.sizes,
        this.newIn,
        this.discount});

  SectionNewInSizesSizesData.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <SectionNewInSections>[];
      json['sections'].forEach((v) {
        sections!.add(SectionNewInSections.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <SectionNewInBrands>[];
      json['brands'].forEach((v) {
        brands!.add(SectionNewInBrands.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <SectionNewInColors>[];
      json['colors'].forEach((v) {
        colors!.add(SectionNewInColors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <SectionNewInSizesModel>[];
      json['sizes'].forEach((v) {
        sizes!.add(SectionNewInSizesModel.fromJson(v));
      });
    }
    newIn = json['new_in'] != null ? SectionNewInNewIn.fromJson(json['new_in']) : null;
    discount = json['discount'] != null
        ? SectionNewInDiscount.fromJson(json['discount'])
        : null;
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
    if (newIn != null) {
      data['new_in'] = newIn!.toJson();
    }
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }
    return data;
  }
}

class SectionNewInSections {
  int? id;
  String? title;
  int? productCount;
  List<Children>? children;

  SectionNewInSections({this.id, this.title, this.productCount, this.children});

  SectionNewInSections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    productCount = json['product_count'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['product_count'] = productCount;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int? id;
  String? title;
  int? productCount;

  Children({this.id, this.title, this.productCount});

  Children.fromJson(Map<String, dynamic> json) {
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

class SectionNewInBrands {
  int? id;
  String? name;
  int? productCount;

  SectionNewInBrands({this.id, this.name, this.productCount});

  SectionNewInBrands.fromJson(Map<String, dynamic> json) {
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

class SectionNewInColors {
  int? id;
  String? name;
  String? colorCode;
  int? productCount;
  List<ProductColorVariants>? productColorVariants;

  SectionNewInColors(
      {this.id,
        this.name,
        this.colorCode,
        this.productCount,
        this.productColorVariants});

  SectionNewInColors.fromJson(Map<String, dynamic> json) {
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

class SectionNewInSizesModel {
  int? id;
  String? typeName;
  List<SectionNewInSizesData>? sizes;

  SectionNewInSizesModel({this.id, this.typeName, this.sizes});

  SectionNewInSizesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    if (json['sizes'] != null) {
      sizes = <SectionNewInSizesData>[];
      json['sizes'].forEach((v) {
        sizes!.add(SectionNewInSizesData.fromJson(v));
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

class SectionNewInSizesData {
  int? id;
  String? sizeCode;
  int? productCount;

  SectionNewInSizesData({this.id, this.sizeCode, this.productCount});

  SectionNewInSizesData.fromJson(Map<String, dynamic> json) {
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

class SectionNewInNewIn {
  int? lastWeekProductCount;
  int? last15DaysProductCount;
  int? lastMonthProductCount;
  int? lastYearProductCount;

  SectionNewInNewIn(
      {this.lastWeekProductCount,
        this.last15DaysProductCount,
        this.lastMonthProductCount,
        this.lastYearProductCount});

  SectionNewInNewIn.fromJson(Map<String, dynamic> json) {
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

class SectionNewInDiscount {
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

  SectionNewInDiscount(
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

  SectionNewInDiscount.fromJson(Map<String, dynamic> json) {
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
