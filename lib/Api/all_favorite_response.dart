import 'dart:convert';

ProductFavorite productFavoriteFromJson(String str) => ProductFavorite.fromJson(json.decode(str));

String productFavoriteToJson(ProductFavorite data) => json.encode(data.toJson());

class ProductFavorite {
    final String message;
    final List<Like> likes;

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
    final dynamic id;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Barang barang;

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
    final int id;
    final String namaBarang;
    final String deskripsi;
    final int harga;
    final double ratingBarang;
    final int categoryId;
    final String categoryNama;
    final String imageBarang;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Mitra mitra;

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
    final int id;
    final dynamic namaToko;
    final String namaLengkap;
    final int jumlahProduct;
    final int jumlahJasa;
    final int pengikut;
    final int penilaian;
    final String noWhatsapp;
    final dynamic profileImage;

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
        profileImage: json["profile_image"],
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
