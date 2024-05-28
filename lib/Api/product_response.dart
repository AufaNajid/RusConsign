// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  List<Datum> data;

  Product({
    required this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String namaProduct;
  String deskripsi;
  int harga;
  double rating;
  String image;
  int idMitra;

  Datum({
    required this.id,
    required this.namaProduct,
    required this.deskripsi,
    required this.harga,
    required this.rating,
    required this.image,
    required this.idMitra,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    namaProduct: json["nama_product"],
    deskripsi: json["deskripsi"],
    harga: json["harga"],
    rating: json["rating"]?.toDouble(),
    image: json["image"],
    idMitra: json["id_mitra"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_product": namaProduct,
    "deskripsi": deskripsi,
    "harga": harga,
    "rating": rating,
    "image": image,
    "id_mitra": idMitra,
  };
}
