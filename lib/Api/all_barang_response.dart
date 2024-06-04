// To parse this JSON data, do
//
//     final allBarangModel = allBarangModelFromJson(jsonString);

import 'dart:convert';

AllBarangModel allBarangModelFromJson(String str) => AllBarangModel.fromJson(json.decode(str));

String allBarangModelToJson(AllBarangModel data) => json.encode(data.toJson());

class AllBarangModel {
  String message;
  List<Barang> barangs;

  AllBarangModel({
    required this.message,
    required this.barangs,
  });

  factory AllBarangModel.fromJson(Map<String, dynamic> json) => AllBarangModel(
    message: json["message"],
    barangs: List<Barang>.from(json["barangs"].map((x) => Barang.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "barangs": List<dynamic>.from(barangs.map((x) => x.toJson())),
  };
}

class Barang {
  int id;
  String namaBarang;
  String deskripsi;
  int harga;
  int ratingBarang;
  String categoryName;
  String imageBarang;
  DateTime createdAt;
  DateTime updatedAt;
  Mitra mitra;

  Barang({
    required this.id,
    required this.namaBarang,
    required this.deskripsi,
    required this.harga,
    required this.ratingBarang,
    required this.categoryName,
    required this.imageBarang,
    required this.createdAt,
    required this.updatedAt,
    required this.mitra,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
    id: json["id"],
    namaBarang: json["nama_barang"],
    deskripsi: json["deskrpsi"],
    harga: json["harga"],
    ratingBarang: json["rating_barang"],
    categoryName: json["category_name"],
    imageBarang: json["image_barang"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    mitra: Mitra.fromJson(json["mitra"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_barang": namaBarang,
    "deskrpsi": deskripsi,
    "harga": harga,
    "rating_barang": ratingBarang,
    "category_name": categoryName,
    "image_barang": imageBarang,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "mitra": mitra.toJson(),
  };
}

class Mitra {
  int id;
  String namaLengkap;
  int jumlahProduct;
  int jumlahJasa;
  dynamic pengikut;
  int penilaian;

  Mitra({
    required this.id,
    required this.namaLengkap,
    required this.jumlahProduct,
    required this.jumlahJasa,
    required this.pengikut,
    required this.penilaian,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) => Mitra(
    id: json["id"],
    namaLengkap: json["nama_lengkap"],
    jumlahProduct: json["jumlah_product"],
    jumlahJasa: json["jumlah_jasa"],
    pengikut: json["pengikut"],
    penilaian: json["penilaian"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_lengkap": namaLengkap,
    "jumlah_product": jumlahProduct,
    "jumlah_jasa": jumlahJasa,
    "pengikut": pengikut,
    "penilaian": penilaian,
  };
}
