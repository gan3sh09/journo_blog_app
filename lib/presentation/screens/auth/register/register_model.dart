part of 'register_imports.dart';

// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  Data? data;
  String? accessToken;
  String? tokenType;

  RegisterModel({
    this.data,
    this.accessToken,
    this.tokenType,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
      };
}

class Data {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? profilePhotoUrl;

  Data({
    this.name,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.profilePhotoUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
        "profile_photo_url": profilePhotoUrl,
      };
}
