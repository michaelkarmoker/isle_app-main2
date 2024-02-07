class ConfirmOrderResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ConfirmOrderResponse({this.statusCode, this.status, this.message, this.data});

  ConfirmOrderResponse.fromJson(Map<String, dynamic> json) {
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
  String? paymentStatus;
  String? orderStatus;
  List<String>? panelStatus;
  // List<Null>? acknowledgedPanel;
  List<StatusLog>? statusLog;
  bool? isVerify;
  bool? status;
  int? id;
  String? clientCorelationId;
  String? firstName;
  String? lastName;
  String? phone;
  int? stateId;
  int? districtId;
  int? subDistrictId;
  String? address;
  int? price;
  int? discount;
  int? finalPrice;
  String? giftNote;
  String? specialNote;
  String? deliveryType;
  String? paymentMethod;
  String? orderNo;
  String? updatedAt;
  String? createdAt;
  // List<Null>? orderDetails;

  Data(
      {this.paymentStatus,
        this.orderStatus,
        this.panelStatus,
        // this.acknowledgedPanel,
        this.statusLog,
        this.isVerify,
        this.status,
        this.id,
        this.clientCorelationId,
        this.firstName,
        this.lastName,
        this.phone,
        this.stateId,
        this.districtId,
        this.subDistrictId,
        this.address,
        this.price,
        this.discount,
        this.finalPrice,
        this.giftNote,
        this.specialNote,
        this.deliveryType,
        this.paymentMethod,
        this.orderNo,
        this.updatedAt,
        this.createdAt,
        // this.orderDetails
      });

  Data.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    panelStatus = json['panel_status'].cast<String>();
/*    if (json['acknowledged_panel'] != null) {
      acknowledgedPanel = <Null>[];
      json['acknowledged_panel'].forEach((v) {
        acknowledgedPanel!.add(new Null.fromJson(v));
      });
    }*/
    if (json['status_log'] != null) {
      statusLog = <StatusLog>[];
      json['status_log'].forEach((v) {
        statusLog!.add(new StatusLog.fromJson(v));
      });
    }
    isVerify = json['isVerify'];
    status = json['status'];
    id = json['id'];
    clientCorelationId = json['client_corelation_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    price = json['price'];
    discount = json['discount'];
    finalPrice = json['final_price'];
    giftNote = json['gift_note'];
    specialNote = json['special_note'];
    deliveryType = json['delivery_type'];
    paymentMethod = json['payment_method'];
    orderNo = json['order_no'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
/*    if (json['orderDetails'] != null) {
      orderDetails = <Null>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['panel_status'] = this.panelStatus;
/*    if (this.acknowledgedPanel != null) {
      data['acknowledged_panel'] =
          this.acknowledgedPanel!.map((v) => v.toJson()).toList();
    }*/
    if (this.statusLog != null) {
      data['status_log'] = this.statusLog!.map((v) => v.toJson()).toList();
    }
    data['isVerify'] = this.isVerify;
    data['status'] = this.status;
    data['id'] = this.id;
    data['client_corelation_id'] = this.clientCorelationId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['sub_district_id'] = this.subDistrictId;
    data['address'] = this.address;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['final_price'] = this.finalPrice;
    data['gift_note'] = this.giftNote;
    data['special_note'] = this.specialNote;
    data['delivery_type'] = this.deliveryType;
    data['payment_method'] = this.paymentMethod;
    data['order_no'] = this.orderNo;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
/*    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class StatusLog {
  String? status;
  String? panelStatus;
  String? msg;
  String? date;

  StatusLog({this.status, this.panelStatus, this.msg, this.date});

  StatusLog.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    panelStatus = json['panel_status'];
    msg = json['msg'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['panel_status'] = this.panelStatus;
    data['msg'] = this.msg;
    data['date'] = this.date;
    return data;
  }
}
