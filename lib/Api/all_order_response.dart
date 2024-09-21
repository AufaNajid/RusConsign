
// ignore: file_names
// To parse this JSON data, do
//
//     final allOrderResponse = allOrderResponseFromJson(jsonString);

import 'dart:convert';

AllOrderResponse allOrderResponseFromJson(String str) => AllOrderResponse.fromJson(json.decode(str));

String allOrderResponseToJson(AllOrderResponse data) => json.encode(data.toJson());

class AllOrderResponse {
  String role;
  String status;
  List<Cod> cods;

  AllOrderResponse({
    required this.role,
    required this.status,
    required this.cods,
  });

  factory AllOrderResponse.fromJson(Map<String, dynamic> json) => AllOrderResponse(
    role: json["role"],
    status: json["status"],
    cods: List<Cod>.from(json["cods"].map((x) => Cod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "status": status,
    "cods": List<dynamic>.from(cods.map((x) => x.toJson())),
  };
}

class Cod {
  int id;
  int userId;
  int mitraId;
  int barangId;
  int lokasiId;
  int quantity;
  String statusPembayaran;
  String grandTotal;
  String userStatusPembayaran;
  String mitraStatusPembayaran;
  DateTime createdAt;
  DateTime updatedAt;
  Barang barang;
  Lokasi lokasi;
  Mitra mitra;
  User user;

  Cod({
    required this.id,
    required this.userId,
    required this.mitraId,
    required this.barangId,
    required this.lokasiId,
    required this.quantity,
    required this.statusPembayaran,
    required this.grandTotal,
    required this.userStatusPembayaran,
    required this.mitraStatusPembayaran,
    required this.createdAt,
    required this.updatedAt,
    required this.barang,
    required this.lokasi,
    required this.mitra,
    required this.user,
  });

  factory Cod.fromJson(Map<String, dynamic> json) => Cod(
    id: json["id"],
    userId: json["user_id"],
    mitraId: json["mitra_id"],
    barangId: json["barang_id"],
    lokasiId: json["lokasi_id"],
    quantity: json["quantity"],
    statusPembayaran: json["status_pembayaran"],
    grandTotal: json["grand_total"],
    userStatusPembayaran: json["user_status_pembayaran"],
    mitraStatusPembayaran: json["mitra_status_pembayaran"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    barang: Barang.fromJson(json["barang"]),
    lokasi: Lokasi.fromJson(json["lokasi"]),
    mitra: Mitra.fromJson(json["mitra"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "mitra_id": mitraId,
    "barang_id": barangId,
    "lokasi_id": lokasiId,
    "quantity": quantity,
    "status_pembayaran": statusPembayaran,
    "grand_total": grandTotal,
    "user_status_pembayaran": userStatusPembayaran,
    "mitra_status_pembayaran": mitraStatusPembayaran,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "barang": barang.toJson(),
    "lokasi": lokasi.toJson(),
    "mitra": mitra.toJson(),
    "user": user.toJson(),
  };
}

class Barang {
  int id;
  String namaBarang;
  String deskripsi;
  int harga;
  dynamic ratingBarang;
  int categoryId;
  int mitraId;
  String statusPost;
  int stockBarang;
  String imageBarang;
  DateTime createdAt;
  DateTime updatedAt;

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
  };
}

class Lokasi {
  int id;
  String namaLokasi;
  String descLokasi;
  String gambarLokasi;
  DateTime createdAt;
  DateTime updatedAt;

  Lokasi({
    required this.id,
    required this.namaLokasi,
    required this.descLokasi,
    required this.gambarLokasi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
    id: json["id"],
    namaLokasi: json["nama_lokasi"],
    descLokasi: json["desc_lokasi"],
    gambarLokasi: json["gambar_lokasi"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_lokasi": namaLokasi,
    "desc_lokasi": descLokasi,
    "gambar_lokasi": gambarLokasi,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Mitra {
  int id;
  dynamic profileImage;
  String namaLengkap;
  String namaToko;
  int nis;
  String noDompetDigital;
  String imageIdCard;
  String status;
  int pengikut;
  int jumlahJasa;
  int jumlahProduct;
  int penilaian;
  String email;
  String noWhatsapp;
  dynamic statusPembayaran;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  Mitra({
    required this.id,
    required this.profileImage,
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
    required this.noWhatsapp,
    required this.statusPembayaran,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) => Mitra(
    id: json["id"],
    profileImage: json["profile_image"],
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
    noWhatsapp: json["no_whatsapp"],
    statusPembayaran: json["status_pembayaran"],
    rememberToken: json["remember_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_image": profileImage,
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
    "no_whatsapp" : noWhatsapp,
    "status_pembayaran": statusPembayaran,
    "remember_token": rememberToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic bioDesc;
  int mitraId;
  dynamic statusPembayaran;
  dynamic imageProfiles;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.bioDesc,
    required this.mitraId,
    required this.statusPembayaran,
    required this.imageProfiles,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    bioDesc: json["bio_desc"],
    mitraId: json["mitra_id"],
    statusPembayaran: json["status_pembayaran"],
    imageProfiles: json["image_profiles"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "bio_desc": bioDesc,
    "mitra_id": mitraId,
    "status_pembayaran": statusPembayaran,
    "image_profiles": imageProfiles,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
