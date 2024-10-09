import 'dart:convert';

AllCartResponse allCartResponseFromJson(String str) => AllCartResponse.fromJson(json.decode(str));

String allCartResponseToJson(AllCartResponse data) => json.encode(data.toJson());

class AllCartResponse {
    final String message;
    final List<Cart> carts;

    AllCartResponse({
        required this.message,
        required this.carts,
    });

    factory AllCartResponse.fromJson(Map<String, dynamic> json) => AllCartResponse(
        message: json["message"],
        carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
    };
}

class Cart {
    final int cartId;
    int quantity;
    final int totalPrice;
    final Barang barang;

    Cart({
        required this.cartId,
        required this.quantity,
        required this.totalPrice,
        required this.barang,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cartId: json["cart_id"],
        quantity: 1,
        totalPrice: json["total_price"],
        barang: Barang.fromJson(json["barang"]),
    );

    Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "quantity": quantity,
        "total_price": totalPrice,
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
    final int stock;
    final int quantity;
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
        required this.stock,
        required this.quantity,
        required this.createdAt,
        required this.updatedAt,
        required this.mitra,
    });

    factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        id: json["id"],
        namaBarang: json["nama_barang"],
        deskripsi: json["deskripsi"],
        harga: json["harga"],
        ratingBarang: json["rating_barang"].toDouble(),
        categoryId: json["category_id"],
        categoryNama: json["category_nama"],
        imageBarang: json["image_barang"],
        status: json["status"],
        stock: json["stock"],
        quantity: 1,
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
