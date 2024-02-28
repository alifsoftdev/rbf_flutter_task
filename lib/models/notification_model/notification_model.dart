import 'package:meta/meta.dart';
import 'dart:convert';

class NotificationModel {
  String status;
  String message;
  Error error;
  Data data;

  NotificationModel({
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });

  factory NotificationModel.fromRawJson(String str) => NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"]??"",
    message: json["message"]??"",
    error: Error.fromJson(json["error"]??{}),
    data: Data.fromJson(json["data"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "error": error.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  int totalunread;
  List<Result> results;

  Data({
    required this.totalunread,
    required this.results,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalunread: json["totalunread"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "totalunread": totalunread,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  int userId;
  dynamic image;
  String title;
  String description;
  String readStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  bool? isSelected; // Add isSelected property

  Result({
    required this.id,
    required this.userId,
    required this.image,
    required this.title,
    required this.description,
    required this.readStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    this.isSelected, // Include isSelected in the constructor
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"]??0,
    userId: json["user_id"]??0,
    image: json["image"]??"",
    title: json["title"]??"",
    description: json["description"]??"",
    readStatus: json["read_status"]??"",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image,
    "title": title,
    "description": description,
    "read_status": readStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class Error {
  Error();

  factory Error.fromRawJson(String str) => Error.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Error.fromJson(Map<String, dynamic> json) => Error(
  );

  Map<String, dynamic> toJson() => {
  };
}
