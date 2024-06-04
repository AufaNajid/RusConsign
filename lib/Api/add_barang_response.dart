// To parse this JSON data, do
//
//     final addProductModel = addProductModelFromJson(jsonString);

import 'dart:convert';

AddProductModel addProductModelFromJson(String str) => AddProductModel.fromJson(json.decode(str));

String addProductModelToJson(AddProductModel data) => json.encode(data.toJson());

class AddProductModel {
  String message;
  Product product;
  Mitra mitra;
  String categoryName;

  AddProductModel({
    required this.message,
    required this.product,
    required this.mitra,
    required this.categoryName,
  });

  factory AddProductModel.fromJson(Map<String, dynamic> json) => AddProductModel(
    message: json["message"],
    product: Product.fromJson(json["product"]),
    mitra: Mitra.fromJson(json["mitra"]),
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "product": product.toJson(),
    "mitra": mitra.toJson(),
    "category_name": categoryName,
  };
}

class Mitra {
  int id;
  String name;
  int jumlahProduct;
  int jumlahJasa;
  dynamic pengikut;
  int penilaian;

  Mitra({
    required this.id,
    required this.name,
    required this.jumlahProduct,
    required this.jumlahJasa,
    required this.pengikut,
    required this.penilaian,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) => Mitra(
    id: json["id"],
    name: json["name"],
    jumlahProduct: json["jumlah_product"],
    jumlahJasa: json["jumlah_jasa"],
    pengikut: json["pengikut"],
    penilaian: json["penilaian"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "jumlah_product": jumlahProduct,
    "jumlah_jasa": jumlahJasa,
    "pengikut": pengikut,
    "penilaian": penilaian,
  };
}

class Product {
  String namaBarang;
  String deskrpsi;
  String harga;
  String ratingBarang;
  String categoryId;
  String imageBarang;
  int mitraId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Product({
    required this.namaBarang,
    required this.deskrpsi,
    required this.harga,
    required this.ratingBarang,
    required this.categoryId,
    required this.imageBarang,
    required this.mitraId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    namaBarang: json["nama_barang"],
    deskrpsi: json["deskripsi"],
    harga: json["harga"],
    ratingBarang: json["rating_barang"],
    categoryId: json["category_id"],
    imageBarang: json["image_barang"],
    mitraId: json["mitra_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "nama_barang": namaBarang,
    "deskripsi": deskrpsi,
    "harga": harga,
    "rating_barang": ratingBarang,
    "category_id": categoryId,
    "image_barang": imageBarang,
    "mitra_id": mitraId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
