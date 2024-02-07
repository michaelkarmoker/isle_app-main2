class CheckWishlistResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  CheckWishlistResponse(
      {this.statusCode, this.status, this.message, this.data});

  CheckWishlistResponse.fromJson(Map<String, dynamic> json) {
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
  int? productId;
  String? corelationId;
  int? customerId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.productId,
        this.corelationId,
        this.customerId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    corelationId = json['corelation_id'];
    customerId = json['customer_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['corelation_id'] = this.corelationId;
    data['customer_id'] = this.customerId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
