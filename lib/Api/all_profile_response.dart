// To parse this JSON data, do
//
//     final modelResponseProfile = modelResponseProfileFromJson(jsonString);

import 'dart:convert';

ModelResponseProfile modelResponseProfileFromJson(String str) => ModelResponseProfile.fromJson(json.decode(str));

String modelResponseProfileToJson(ModelResponseProfile data) => json.encode(data.toJson());

class ModelResponseProfile {
    String message;
    Data data;

    ModelResponseProfile({
        required this.message,
        required this.data,
    });

    factory ModelResponseProfile.fromJson(Map<String, dynamic> json) => ModelResponseProfile(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String? bioDesc;
    String? imageProfiles;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic idMitra;
    String? imageProfile;
    String? nama;
    String? namaToko;
    int? nis;
    dynamic nomor;
    String? image;
    String? status;
    dynamic pengikut;
    String? emailDariUser;
    int? jumlahproduct;
    int? jumlahjasa;
    int? penilaian;

    Data({
        required this.id,
        required this.name,
        required this.email,
        this.emailVerifiedAt,
        this.bioDesc,
        this.imageProfiles,
        required this.createdAt,
        required this.updatedAt,
        this.idMitra,
        this.imageProfile,
        this.nama,
        this.namaToko,
        this.nis,
        this.nomor,
        this.image,
        this.status,
        this.pengikut,
        this.emailDariUser,
        this.jumlahproduct,
        this.jumlahjasa,
        this.penilaian,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        bioDesc: json["bio_desc"],
        imageProfiles: json["image_profiles"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idMitra: json["id_mitra"],
        imageProfile: json["image_profile"],
        nama: json["nama"],
        namaToko: json["nama_toko"],
        nis: json["nis"],
        nomor: json["nomor"],
        image: json["image"],
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
        "image_profile": imageProfile,
        "nama": nama,
        "nama_toko": namaToko,
        "nis": nis,
        "nomor": nomor,
        "image": image,
        "status": status,
        "pengikut": pengikut,
        "email_dariUser": emailDariUser,
        "jumlahproduct": jumlahproduct,
        "jumlahjasa": jumlahjasa,
        "penilaian": penilaian,
    };
}
