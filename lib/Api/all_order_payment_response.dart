// To parse this JSON data, do
//
//     final allOrderPaymentResponse = allOrderPaymentResponseFromJson(jsonString);

import 'dart:convert';

AllOrderPaymentResponse allOrderPaymentResponseFromJson(String str) => AllOrderPaymentResponse.fromJson(json.decode(str));

String allOrderPaymentResponseToJson(AllOrderPaymentResponse data) => json.encode(data.toJson());

class AllOrderPaymentResponse {
  String role;
  String status;
  List<Payment> payments;

  AllOrderPaymentResponse({
    required this.role,
    required this.status,
    required this.payments,
  });

  factory AllOrderPaymentResponse.fromJson(Map<String, dynamic> json) => AllOrderPaymentResponse(
    role: json["role"],
    status: json["status"],
    payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "status": status,
    "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
  };
}

class Payment {
  int id;
  String externalId;
  String noTransaction;
  int quantity;
  String invoiceUrl;
  String grandTotal;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Barang barang;
  User user;

  Payment({
    required this.id,
    required this.externalId,
    required this.noTransaction,
    required this.quantity,
    required this.invoiceUrl,
    required this.grandTotal,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.barang,
    required this.user,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    externalId: json["external_id"],
    noTransaction: json["no_transaction"],
    quantity: json["quantity"],
    invoiceUrl: json["invoice_url"],
    grandTotal: json["grand_total"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    barang: Barang.fromJson(json["barang"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "external_id": externalId,
    "no_transaction": noTransaction,
    "quantity": quantity,
    "invoice_url": invoiceUrl,
    "grand_total": grandTotal,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "barang": barang.toJson(),
    "user": user.toJson(),
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
  int stock;
  int quantity;
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
    ratingBarang: json["rating_barang"],
    categoryId: json["category_id"],
    categoryNama: json["category_nama"],
    imageBarang: json["image_barang"],
    status: json["status"],
    stock: json["stock"],
    quantity: json["quantity"],
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
  int id;
  String namaToko;
  String namaLengkap;
  int jumlahProduct;
  int jumlahJasa;
  int pengikut;
  int penilaian;
  String noWhatsapp;
  dynamic profileImage;

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

class User {
  int id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
  };
}
