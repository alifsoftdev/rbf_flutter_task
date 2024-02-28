import 'package:meta/meta.dart';
import 'dart:convert';

class LoginModel {
  String status;
  String message;
  Error error;
  Data data;

  LoginModel({
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  UserDetails userDetails;
  String token;

  Data({
    required this.userDetails,
    required this.token,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userDetails: UserDetails.fromJson(json["user_details"]??{}),
    token: json["token"]??"",
  );

  Map<String, dynamic> toJson() => {
    "user_details": userDetails.toJson(),
    "token": token,
  };
}

class UserDetails {
  int id;
  String name;
  String email;
  String phone;
  dynamic nid;
  String gender;
  String image;
  dynamic presentAddress;
  dynamic permanentAddress;
  String medium;
  String sync;
  dynamic emailVerified;
  String phoneVerified;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.nid,
    required this.gender,
    required this.image,
    required this.presentAddress,
    required this.permanentAddress,
    required this.medium,
    required this.sync,
    required this.emailVerified,
    required this.phoneVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory UserDetails.fromRawJson(String str) => UserDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"]??0,
    name: json["name"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    nid: json["nid"],
    gender: json["gender"]??"",
    image: json["image"]??"",
    presentAddress: json["present_address"],
    permanentAddress: json["permanent_address"],
    medium: json["medium"]??"",
    sync: json["sync"]??"",
    emailVerified: json["email_verified"],
    phoneVerified: json["phone_verified"]??"",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "nid": nid,
    "gender": gender,
    "image": image,
    "present_address": presentAddress,
    "permanent_address": permanentAddress,
    "medium": medium,
    "sync": sync,
    "email_verified": emailVerified,
    "phone_verified": phoneVerified,
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
