class ThanaResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  ThanaResponse({this.statusCode, this.status, this.message, this.data});

  ThanaResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  int? districtId;
  String? name;
  District? district;

  Data({this.id, this.districtId, this.name, this.district});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    name = json['name'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_id'] = this.districtId;
    data['name'] = this.name;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    return data;
  }
}

class District {
  String? districtName;

  District({this.districtName});

  District.fromJson(Map<String, dynamic> json) {
    districtName = json['district_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['district_name'] = this.districtName;
    return data;
  }
}
