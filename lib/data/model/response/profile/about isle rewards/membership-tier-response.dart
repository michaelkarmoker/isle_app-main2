class MembershipTierResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  MembershipTierResponse(
      {this.statusCode, this.status, this.message, this.data});

  MembershipTierResponse.fromJson(Map<String, dynamic> json) {
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
  String? tiersName;
  bool? isDefault;
  int? upgradePoint;
  int? upgradeTimeLimit;
  String? shortDescription;
  String? colorCode;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.tiersName,
        this.isDefault,
        this.upgradePoint,
        this.upgradeTimeLimit,
        this.shortDescription,
        this.colorCode,
        this.image,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tiersName = json['tiers_name'];
    isDefault = json['is_default'];
    upgradePoint = json['upgrade_point'];
    upgradeTimeLimit = json['upgrade_time_limit'];
    shortDescription = json['short_description'];
    colorCode = json['color_code'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tiers_name'] = this.tiersName;
    data['is_default'] = this.isDefault;
    data['upgrade_point'] = this.upgradePoint;
    data['upgrade_time_limit'] = this.upgradeTimeLimit;
    data['short_description'] = this.shortDescription;
    data['color_code'] = this.colorCode;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
