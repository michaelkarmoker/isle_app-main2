class AllDeliveryTypeResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  AllDeliveryTypeResponse(
      {this.statusCode, this.status, this.message, this.data});

  AllDeliveryTypeResponse.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? shortDescription;
  String? description;
  String? icon;
  bool? alwaysAvailable;
  bool? availableCity;
  int? deliveryChargeCity;
  bool? availableOutsideCity;
  double? deliveryChargeOutsideCity;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.shortDescription,
        this.description,
        this.icon,
        this.alwaysAvailable,
        this.availableCity,
        this.deliveryChargeCity,
        this.availableOutsideCity,
        this.deliveryChargeOutsideCity,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    icon = json['icon'];
    alwaysAvailable = json['always_available'];
    availableCity = json['available_city'];
    deliveryChargeCity = json['delivery_charge_city'];
    availableOutsideCity = json['available_outside_city'];
    deliveryChargeOutsideCity = double.parse(json['delivery_charge_outside_city'].toString());
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['always_available'] = this.alwaysAvailable;
    data['available_city'] = this.availableCity;
    data['delivery_charge_city'] = this.deliveryChargeCity;
    data['available_outside_city'] = this.availableOutsideCity;
    data['delivery_charge_outside_city'] = this.deliveryChargeOutsideCity;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
