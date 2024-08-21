// To parse this JSON data, do
//
//     final mitraResponse = mitraResponseFromJson(jsonString);

import 'dart:convert';

MitraResponse mitraResponseFromJson(String str) => MitraResponse.fromJson(json.decode(str));

String mitraResponseToJson(MitraResponse data) => json.encode(data.toJson());

class MitraResponse {
  Data data;

  MitraResponse({
    required this.data,
  });

  factory MitraResponse.fromJson(Map<String, dynamic> json) => MitraResponse(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String imageProfile;
  String nama;
  String namaToko;
  String bioDeskripsi;
  int nis;
  String nomor;
  String image;
  String status;
  int pengikut;
  String email;
  int jumlahproduct;
  int jumlahjasa;
  int penilaian;
  // dynamic user;

  Data({
    required this.id,
    required this.imageProfile,
    required this.nama,
    required this.namaToko,
    required this.bioDeskripsi,
    required this.nis,
    required this.nomor,
    required this.image,
    required this.status,
    required this.pengikut,
    required this.email,
    required this.jumlahproduct,
    required this.jumlahjasa,
    required this.penilaian,
    // required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    imageProfile: json["image profile"],
    nama: json["nama"],
    namaToko: json["nama toko"],
    bioDeskripsi: json["bio_deskripsi"],
    nis: json["nis"],
    nomor: json["nomor"],
    image: json["image"],
    status: json["status"],
    pengikut: json["pengikut"],
    email: json["email"],
    jumlahproduct: json["jumlahproduct"],
    jumlahjasa: json["jumlahjasa"],
    penilaian: json["penilaian"],
    // user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image profile": imageProfile,
    "nama": nama,
    "nama toko": namaToko,
    "bio_deskripsi": bioDeskripsi,
    "nis": nis,
    "nomor": nomor,
    "image": image,
    "status": status,
    "pengikut": pengikut,
    "email": email,
    "jumlahproduct": jumlahproduct,
    "jumlahjasa": jumlahjasa,
    "penilaian": penilaian,
    // "user": user,
  };
}
