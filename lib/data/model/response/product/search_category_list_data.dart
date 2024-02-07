class SeachCategoryListModel {
  int? statusCode;
  String? status;
  String? message;
  List<SeachCategoryListData>? data;

  SeachCategoryListModel({this.statusCode, this.status, this.message, this.data});

  SeachCategoryListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SeachCategoryListData>[];
      json['data'].forEach((v) {
        data!.add(SeachCategoryListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeachCategoryListData {
  int? id;
  String? title;
  String? slug;

  SeachCategoryListData({this.id, this.title, this.slug});

  SeachCategoryListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    return data;
  }
}
