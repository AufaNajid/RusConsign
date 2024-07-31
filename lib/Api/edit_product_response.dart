// To parse this JSON data, do
//
//     final editProductResponse = editProductResponseFromJson(jsonString);

import 'dart:convert';

EditProductResponse editProductResponseFromJson(String str) => EditProductResponse.fromJson(json.decode(str));

String editProductResponseToJson(EditProductResponse data) => json.encode(data.toJson());

class EditProductResponse {
    String message;
    Barang barang;

    EditProductResponse({
        required this.message,
        required this.barang,
    });

    factory EditProductResponse.fromJson(Map<String, dynamic> json) => EditProductResponse(
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
        ratingBarang: json["rating_barang"],
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
