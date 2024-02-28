class NotificationModel {
  String? status;
  String? message;
  Error? error;
  NotificationData? data;

  NotificationModel({this.status, this.message, this.error, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    data = json['data'] != null ? NotificationData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Error {
  String? error;

  Error({this.error});

  Error.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    return data;
  }
}

class NotificationData {
  int? totalunread;
  List<NotificationResult>? results;

  NotificationData({this.totalunread, this.results});

  NotificationData.fromJson(Map<String, dynamic> json) {
    totalunread = json['totalunread'];
    if (json['results'] != null) {
      results = <NotificationResult>[];
      json['results'].forEach((v) {
        results!.add(NotificationResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalunread'] = totalunread;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationResult {
  int? id;
  int? userId;
  String? image;
  String? title;
  String? description;
  String? readStatus;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  NotificationResult(
      {this.id,
        this.userId,
        this.image,
        this.title,
        this.description,
        this.readStatus,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  NotificationResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['read_status'] = readStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
