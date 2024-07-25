// To parse this JSON data, do
//
//     final allBarangResponse = allBarangResponseFromJson(jsonString);

import 'dart:convert';

AllBarangResponse allBarangResponseFromJson(String str) => AllBarangResponse.fromJson(json.decode(str));

String allBarangResponseToJson(AllBarangResponse data) => json.encode(data.toJson());

class AllBarangResponse {
  String message;
  List<Barang> barangs;

  AllBarangResponse({
    required this.message,
    required this.barangs,
  });

  factory AllBarangResponse.fromJson(Map<String, dynamic> json) => AllBarangResponse(
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
<<<<<<< HEAD
  var ratingBarang;
=======
  double ratingBarang;
>>>>>>> c05ce53ead39b1a651be6eb7ca5cd3a6c4898e6e
  int categoryId;
  String categoryNama;
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
    required this.categoryId,
    required this.categoryNama,
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
    ratingBarang: (json['rating_barang'] as num).toDouble(),
    categoryId: json["category_id"],
    categoryNama: json["category_nama"],
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
    "category_id": categoryId,
    "category_nama": categoryNama,
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
  int pengikut;
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
