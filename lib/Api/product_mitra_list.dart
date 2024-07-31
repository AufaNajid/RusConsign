// To parse this JSON data, do
//
//     final productMitraList = productMitraListFromJson(jsonString);

import 'dart:convert';

ProductMitraList productMitraListFromJson(String str) => ProductMitraList.fromJson(json.decode(str));

String productMitraListToJson(ProductMitraList data) => json.encode(data.toJson());

class ProductMitraList {
    String message;
    List<Barang> barangs;

    ProductMitraList({
        required this.message,
        required this.barangs,
    });

    factory ProductMitraList.fromJson(Map<String, dynamic> json) => ProductMitraList(
        message: json["message"],
        barangs: List<Barang>.from(json["barangs"].map((x) => Barang.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "barangs": List<dynamic>.from(barangs.map((x) => x.toJson())),
    };
}

class Barang {
    int idBarang;
    String namaBarang;
    String deskripsi;
    int harga;
    dynamic ratingBarang;
    String categoryName;
    String imageBarang;
    DateTime createdAt;
    DateTime updatedAt;

    Barang({
        required this.idBarang,
        required this.namaBarang,
        required this.deskripsi,
        required this.harga,
        required this.ratingBarang,
        required this.categoryName,
        required this.imageBarang,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        idBarang: json["id_barang"],
        namaBarang: json["nama_barang"],
        deskripsi: json["deskripsi"],
        harga: json["harga"],
        ratingBarang: json["rating_barang"],
        categoryName: json["category_name"],
        imageBarang: json["image_barang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "nama_barang": namaBarang,
        "deskripsi": deskripsi,
        "harga": harga,
        "rating_barang": ratingBarang,
        "category_name": categoryName,
        "image_barang": imageBarang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
