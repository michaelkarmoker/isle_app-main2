class NotificationResponse {
  List<Notifications>? notifications;
  int? status;
  String? message;

  NotificationResponse({this.notifications, this.status, this.message});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Notifications {
  String? id;
  String? title;
  String? details;
  String? status;
  String? createdBy;
  String? created;
  String? modified;
  String? readStatus;

  Notifications(
      {this.id,
        this.title,
        this.details,
        this.status,
        this.createdBy,
        this.created,
        this.modified,
        this.readStatus});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    status = json['status'];
    createdBy = json['created_by'];
    created = json['created'];
    modified = json['modified'];
    readStatus = json['read_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['details'] = this.details;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['read_status'] = this.readStatus;
    return data;
  }
}
