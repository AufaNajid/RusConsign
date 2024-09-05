import 'dart:convert';

DetailBarangModel detailBarangModelFromJson(String str) => DetailBarangModel.fromJson(json.decode(str));

String detailBarangModelToJson(DetailBarangModel data) => json.encode(data.toJson());

class DetailBarangModel {
    final int id;
    final String namaBarang;
    final String deskripsi;
    final int harga;
    final dynamic ratingBarang;
    final int categoryId;
    final String categoryNama;
    final String imageBarang;
    final String status;
    final int stock;
    final int quantity;
    final String statusPost;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Mitra mitra;

    DetailBarangModel({
        required this.id,
        required this.namaBarang,
        required this.deskripsi,
        required this.harga,
        required this.ratingBarang,
        required this.categoryId,
        required this.categoryNama,
        required this.imageBarang,
        required this.status,
        required this.stock,
        required this.quantity,
        required this.statusPost,
        required this.createdAt,
        required this.updatedAt,
        required this.mitra,
    });

    factory DetailBarangModel.fromJson(Map<String, dynamic> json) => DetailBarangModel(
        id: json["id"],
        namaBarang: json["nama_barang"],
        deskripsi: json["deskripsi"],
        harga: json["harga"],
        ratingBarang: json["rating_barang"],
        categoryId: json["category_id"],
        categoryNama: json["category_nama"],
        imageBarang: json["image_barang"],
        status: json["status"],
        stock: json["stock"],
        quantity: json["quantity"],
        statusPost: json["status_post"],
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
        "stock": stock,
        "quantity": quantity,
        "status_post": statusPost,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "mitra": mitra.toJson(),
    };
}

class Mitra {
    final int id;
    final String namaToko;
    final String namaLengkap;
    final int jumlahProduct;
    final int jumlahJasa;
    final int pengikut;
    final int penilaian;
    final String noWhatsapp;
    final String profileImage;

    Mitra({
        required this.id,
        required this.namaToko,
        required this.namaLengkap,
        required this.jumlahProduct,
        required this.jumlahJasa,
        required this.pengikut,
        required this.penilaian,
        required this.noWhatsapp,
        required this.profileImage,
    });

    factory Mitra.fromJson(Map<String, dynamic> json) => Mitra(
        id: json["id"],
        namaToko: json["nama_toko"],
        namaLengkap: json["nama_lengkap"],
        jumlahProduct: json["jumlah_product"],
        jumlahJasa: json["jumlah_jasa"],
        pengikut: json["pengikut"],
        penilaian: json["penilaian"],
        noWhatsapp: json["no_whatsapp"],
        profileImage: json["profile_image"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_toko": namaToko,
        "nama_lengkap": namaLengkap,
        "jumlah_product": jumlahProduct,
        "jumlah_jasa": jumlahJasa,
        "pengikut": pengikut,
        "penilaian": penilaian,
        "no_whatsapp": noWhatsapp,
        "profile_image": profileImage,
    };
}
