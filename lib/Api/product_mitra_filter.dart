// To parse this JSON data, do
//
//     final productMitraFilteredList = productMitraFilteredListFromJson(jsonString);

import 'dart:convert';

ProductMitraFilteredList productMitraFilteredListFromJson(String str) => ProductMitraFilteredList.fromJson(json.decode(str));

String productMitraFilteredListToJson(ProductMitraFilteredList data) => json.encode(data.toJson());

class ProductMitraFilteredList {
  String message;
  List<BarangMitraFiltered> barangs;

  ProductMitraFilteredList({
    required this.message,
    required this.barangs,
  });

  factory ProductMitraFilteredList.fromJson(Map<String, dynamic> json) => ProductMitraFilteredList(
    message: json["message"],
    barangs: List<BarangMitraFiltered>.from(json["barangs"].map((x) => BarangMitraFiltered.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "barangs": List<dynamic>.from(barangs.map((x) => x.toJson())),
  };
}

class BarangMitraFiltered {
  int id;
  String namaBarang;
  String deskripsi;
  int harga;
  int ratingBarang;
  int categoryId;
  String categoryNama;
  String imageBarang;
  int stock;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  Mitra mitra;

  BarangMitraFiltered({
    required this.id,
    required this.namaBarang,
    required this.deskripsi,
    required this.harga,
    required this.ratingBarang,
    required this.categoryId,
    required this.categoryNama,
    required this.imageBarang,
    required this.stock,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.mitra,
  });

  factory BarangMitraFiltered.fromJson(Map<String, dynamic> json) => BarangMitraFiltered(
    id: json["id"],
    namaBarang: json["nama_barang"],
    deskripsi: json["deskripsi"],
    harga: json["harga"],
    ratingBarang: json["rating_barang"],
    categoryId: json["category_id"],
    categoryNama: json["category_nama"],
    imageBarang: json["image_barang"],
    stock: json["stock"],
    quantity: json["quantity"],
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
    "category_id": categoryId,
    "category_nama": categoryNama,
    "image_barang": imageBarang,
    "stock": stock,
    "quantity": quantity,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "mitra": mitra.toJson(),
  };
}

class Mitra {
  int id;
  String namaToko;
  String namaLengkap;
  int jumlahProduct;
  int jumlahJasa;
  int pengikut;
  int penilaian;

  Mitra({
    required this.id,
    required this.namaToko,
    required this.namaLengkap,
    required this.jumlahProduct,
    required this.jumlahJasa,
    required this.pengikut,
    required this.penilaian,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) => Mitra(
    id: json["id"],
    namaToko: json["nama_toko"],
    namaLengkap: json["nama_lengkap"],
    jumlahProduct: json["jumlah_product"],
    jumlahJasa: json["jumlah_jasa"],
    pengikut: json["pengikut"],
    penilaian: json["penilaian"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_toko": namaToko,
    "nama_lengkap": namaLengkap,
    "jumlah_product": jumlahProduct,
    "jumlah_jasa": jumlahJasa,
    "pengikut": pengikut,
    "penilaian": penilaian,
  };
}
