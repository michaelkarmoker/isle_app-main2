class ProductDetailsFeedbackResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  ProductDetailsFeedbackResponse(
      {this.statusCode, this.status, this.message, this.data});

  ProductDetailsFeedbackResponse.fromJson(Map<String, dynamic> json) {
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
  List<Feedback>? feedback;
  double? retingPercentage;
  int? totalRatingCount;

  Data({this.feedback, this.retingPercentage, this.totalRatingCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['feedback'] != null) {
      feedback = <Feedback>[];
      json['feedback'].forEach((v) {
        feedback!.add(new Feedback.fromJson(v));
      });
    }
    retingPercentage = double.parse(json['retingPercentage'].toString());
    totalRatingCount = json['totalRatingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feedback != null) {
      data['feedback'] = this.feedback!.map((v) => v.toJson()).toList();
    }
    data['retingPercentage'] = this.retingPercentage;
    data['totalRatingCount'] = this.totalRatingCount;
    return data;
  }
}

class Feedback {
  int? rating;
  int? ratingCount;
  String? totalRating;

  Feedback({this.rating, this.ratingCount, this.totalRating});

  Feedback.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    totalRating = json['totalRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['totalRating'] = this.totalRating;
    return data;
  }
}
