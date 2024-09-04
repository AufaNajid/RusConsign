// To parse this JSON data, do
//
//     final allCartResponse = allCartResponseFromJson(jsonString);

import 'dart:convert';

AllCartResponse allCartResponseFromJson(String str) => AllCartResponse.fromJson(json.decode(str));

String allCartResponseToJson(AllCartResponse data) => json.encode(data.toJson());

class AllCartResponse {
    final String message;
    final List<Cart> cart;

    AllCartResponse({
        required this.message,
        required this.cart,
    });

    factory AllCartResponse.fromJson(Map<String, dynamic> json) => AllCartResponse(
        message: json["message"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
    };
}

class Cart {
    final int cartsId;
    final int barangId;
    final int userId;
    int quantity;
    final String totalPrice;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Barang barang;

    Cart({
        required this.cartsId,
        required this.barangId,
        required this.userId,
        required this.quantity,
        required this.totalPrice,
        required this.createdAt,
        required this.updatedAt,
        required this.barang,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cartsId: json["carts_id"],
        barangId: json["barang_id"],
        userId: json["user_id"],
        quantity: json["quantity"],
        totalPrice: json["total_price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        barang: Barang.fromJson(json["barang"]),
    );

    Map<String, dynamic> toJson() => {
        "carts_id": cartsId,
        "barang_id": barangId,
        "user_id": userId,
        "quantity": quantity,
        "total_price": totalPrice,
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
    final dynamic ratingBarang;
    final int categoryId;
    final int mitraId;
    final String statusPost;
    final int stockBarang;
    final String imageBarang;
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
        required this.mitraId,
        required this.statusPost,
        required this.stockBarang,
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
        categoryId: json["category_id"],
        mitraId: json["mitra_id"],
        statusPost: json["status_post"],
        stockBarang: json["stock_barang"],
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
        "mitra_id": mitraId,
        "status_post": statusPost,
        "stock_barang": stockBarang,
        "image_barang": imageBarang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "mitra": mitra.toJson(),
    };
}

class Mitra {
    final int id;
    final String imageProfile;
    final String namaLengkap;
    final String namaToko;
    final int nis;
    final String noDompetDigital;
    final String imageIdCard;
    final String status;
    final int pengikut;
    final int jumlahJasa;
    final int jumlahProduct;
    final int penilaian;
    final String email;
    final dynamic statusPembayaran;
    final dynamic rememberToken;
    final DateTime createdAt;
    final DateTime updatedAt;

    Mitra({
        required this.id,
        required this.imageProfile,
        required this.namaLengkap,
        required this.namaToko,
        required this.nis,
        required this.noDompetDigital,
        required this.imageIdCard,
        required this.status,
        required this.pengikut,
        required this.jumlahJasa,
        required this.jumlahProduct,
        required this.penilaian,
        required this.email,
        required this.statusPembayaran,
        required this.rememberToken,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Mitra.fromJson(Map<String, dynamic> json) => Mitra(
        id: json["id"],
        imageProfile: json["image_profile"],
        namaLengkap: json["nama_lengkap"],
        namaToko: json["nama_toko"],
        nis: json["nis"],
        noDompetDigital: json["no_dompet_digital"],
        imageIdCard: json["image_id_card"],
        status: json["status"],
        pengikut: json["pengikut"],
        jumlahJasa: json["jumlah_jasa"],
        jumlahProduct: json["jumlah_product"],
        penilaian: json["penilaian"],
        email: json["email"],
        statusPembayaran: json["status_pembayaran"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_profile": imageProfile,
        "nama_lengkap": namaLengkap,
        "nama_toko": namaToko,
        "nis": nis,
        "no_dompet_digital": noDompetDigital,
        "image_id_card": imageIdCard,
        "status": status,
        "pengikut": pengikut,
        "jumlah_jasa": jumlahJasa,
        "jumlah_product": jumlahProduct,
        "penilaian": penilaian,
        "email": email,
        "status_pembayaran": statusPembayaran,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
