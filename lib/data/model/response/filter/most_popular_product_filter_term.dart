class MostPopularFilterTermModel {
  int? statusCode;
  String? status;
  String? message;
  MostPopularFilterTermData? data;

  MostPopularFilterTermModel(
      {this.statusCode, this.status, this.message, this.data});

  MostPopularFilterTermModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? MostPopularFilterTermData.fromJson(json['data']) : null;
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

class MostPopularFilterTermData {
  List<MostPopularFilterTermBrands>? brands;
  List<MostPopularFilterTermColors>? colors;
  List<MostPopularFilterTermSizes>? sizes;

  MostPopularFilterTermData({this.brands, this.colors, this.sizes});

  MostPopularFilterTermData.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = <MostPopularFilterTermBrands>[];
      json['brands'].forEach((v) {
        brands!.add(MostPopularFilterTermBrands.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <MostPopularFilterTermColors>[];
      json['colors'].forEach((v) {
        colors!.add(MostPopularFilterTermColors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <MostPopularFilterTermSizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(MostPopularFilterTermSizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

class MostPopularFilterTermBrands {
  int? id;
  String? name;

  MostPopularFilterTermBrands({this.id, this.name});

  MostPopularFilterTermBrands.fromJson(Map<String, dynamic> json) {
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

class MostPopularFilterTermColors {
  int? id;
  String? name;
  String? colorCode;

  MostPopularFilterTermColors({this.id, this.name, this.colorCode});

  MostPopularFilterTermColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color_code'] = colorCode;
    return data;
  }
}

class MostPopularFilterTermSizes {
  int? id;
  String? typeName;
  List<Sizes>? sizes;

  MostPopularFilterTermSizes({this.id, this.typeName, this.sizes});

  MostPopularFilterTermSizes.fromJson(Map<String, dynamic> json) {
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
