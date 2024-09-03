// To parse this JSON data, do
//
//     final modelResponseProfile = modelResponseProfileFromJson(jsonString);

import 'dart:convert';

ModelResponseProfile modelResponseProfileFromJson(String str) =>
    ModelResponseProfile.fromJson(json.decode(str));

String modelResponseProfileToJson(ModelResponseProfile data) =>
    json.encode(data.toJson());

class ModelResponseProfile {
  String message;
  Profile data;

  ModelResponseProfile({
    required this.message,
    required this.data,
  });

  factory ModelResponseProfile.fromJson(Map<String, dynamic> json) =>
      ModelResponseProfile(
        message: json["message"],
        data: Profile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Profile {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String? bioDesc;
  String? imageProfiles;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic idMitra;
  String? imageMitra;
  String? nama;
  String? namaToko;
  int? nis;
  dynamic nomor;
  String? status;
  dynamic pengikut;
  String? emailDariUser;
  int? jumlahproduct;
  int? jumlahjasa;
  int? penilaian;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.bioDesc,
    this.imageProfiles,
    required this.createdAt,
    required this.updatedAt,
    this.idMitra,
    this.imageMitra,
    this.nama,
    this.namaToko,
    this.nis,
    this.nomor,
    this.status,
    this.pengikut,
    this.emailDariUser,
    this.jumlahproduct,
    this.jumlahjasa,
    this.penilaian,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        bioDesc: json["bio_desc"] ?? 'Deskripsi masih kosong',
        imageProfiles: json["image_profiles"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idMitra: json["id_mitra"],
        imageMitra: json["image_mitra"],
        nama: json["nama"],
        namaToko: json["nama_toko"],
        nis: json["nis"],
        nomor: json["nomor"],
        status: json["status"],
        pengikut: json["pengikut"],
        emailDariUser: json["email_dariUser"],
        jumlahproduct: json["jumlahproduct"],
        jumlahjasa: json["jumlahjasa"],
        penilaian: json["penilaian"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "bio_desc": bioDesc,
        "image_profiles": imageProfiles,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id_mitra": idMitra,
        "image_mitra": imageMitra,
        "nama": nama,
        "nama_toko": namaToko,
        "nis": nis,
        "nomor": nomor,
        "status": status,
        "pengikut": pengikut,
        "email_dariUser": emailDariUser,
        "jumlahproduct": jumlahproduct,
        "jumlahjasa": jumlahjasa,
        "penilaian": penilaian,
      };
}
