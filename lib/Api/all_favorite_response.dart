// To parse this JSON data, do
//
//     final productFavorite = productFavoriteFromJson(jsonString);

import 'dart:convert';

ProductFavorite productFavoriteFromJson(String str) => ProductFavorite.fromJson(json.decode(str));

String productFavoriteToJson(ProductFavorite data) => json.encode(data.toJson());

class ProductFavorite {
  String message;
  List<Like> likes;

  ProductFavorite({
    required this.message,
    required this.likes,
  });

  factory ProductFavorite.fromJson(Map<String, dynamic> json) => ProductFavorite(
    message: json["message"],
    likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "likes": List<dynamic>.from(likes.map((x) => x.toJson())),
  };
}

class Like {
  dynamic id;
  DateTime createdAt;
  DateTime updatedAt;
  Barang barang;

  Like({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.barang,
  });

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    barang: Barang.fromJson(json["barang"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "barang": barang.toJson(),
  };
}

class Barang {
  int id;
  String namaBarang;
  String deskripsi;
  int harga;
  dynamic ratingBarang;
  int categoryId;
  String categoryNama;
  String imageBarang;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Mitra mitra;

  Barang({
    required this.id,
    required this.namaBarang,
    required this.deskripsi,
    required this.harga,
    required this.ratingBarang,
    required this.categoryId,
    required this.categoryNama,
    required this.imageBarang,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.mitra,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
    id: json["id"],
    namaBarang: json["nama_barang"],
    deskripsi: json["deskripsi"],
    harga: json["harga"],
    ratingBarang: json["rating_barang"]?.toDouble(),
    categoryId: json["category_id"],
    categoryNama: json["category_nama"],
    imageBarang: json["image_barang"],
    status: json["status"],
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
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "mitra": mitra.toJson(),
  };
}

class Mitra {
  int id;
  dynamic namaToko;
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

