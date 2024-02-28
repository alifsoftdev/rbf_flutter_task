import 'package:meta/meta.dart';
import 'dart:convert';

class NotificationUpdateModel {
  String status;
  String message;
  Error error;
  Data data;

  NotificationUpdateModel({
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });

  factory NotificationUpdateModel.fromRawJson(String str) => NotificationUpdateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationUpdateModel.fromJson(Map<String, dynamic> json) => NotificationUpdateModel(
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
  List<int> updatedId;

  Data({
    required this.updatedId,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    updatedId: List<int>.from(json["updated_id"].map((x) => x)??[]),
  );

  Map<String, dynamic> toJson() => {
    "updated_id": List<dynamic>.from(updatedId.map((x) => x)),
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
