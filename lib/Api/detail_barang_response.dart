// To parse this JSON data, do
//
//     final detailBarangModel = detailBarangModelFromJson(jsonString);

import 'dart:convert';

DetailBarangModel detailBarangModelFromJson(String str) => DetailBarangModel.fromJson(json.decode(str));

String detailBarangModelToJson(DetailBarangModel data) => json.encode(data.toJson());

class DetailBarangModel {
  String message;
  Barang barang;

  DetailBarangModel({
    required this.message,
    required this.barang,
  });

  factory DetailBarangModel.fromJson(Map<String, dynamic> json) => DetailBarangModel(
    message: json["message"],
    barang: Barang.fromJson(json["barang"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "barang": barang.toJson(),
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
    deskripsi: json["deskripsi"],
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
    "deskripsi": deskripsi,
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
