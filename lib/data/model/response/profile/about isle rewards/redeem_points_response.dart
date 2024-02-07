class AboutIsleRedeemPointResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  AboutIsleRedeemPointResponse(
      {this.statusCode, this.status, this.message, this.data});

  AboutIsleRedeemPointResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<RedeemingPointsSteps>? redeemingPointsSteps;

  Data(
      {this.id,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.redeemingPointsSteps});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['redeeming_points_steps'] != null) {
      redeemingPointsSteps = <RedeemingPointsSteps>[];
      json['redeeming_points_steps'].forEach((v) {
        redeemingPointsSteps!.add(new RedeemingPointsSteps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.redeemingPointsSteps != null) {
      data['redeeming_points_steps'] =
          this.redeemingPointsSteps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RedeemingPointsSteps {
  int? id;
  int? redeemPointId;
  String? image;
  String? tagLine;
  String? createdAt;
  String? updatedAt;

  RedeemingPointsSteps(
      {this.id,
        this.redeemPointId,
        this.image,
        this.tagLine,
        this.createdAt,
        this.updatedAt});

  RedeemingPointsSteps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    redeemPointId = json['redeem_point_id'];
    image = json['image'];
    tagLine = json['tag_line'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['redeem_point_id'] = this.redeemPointId;
    data['image'] = this.image;
    data['tag_line'] = this.tagLine;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
