import 'dart:convert';

MitraResponse mitraResponseFromJson(String str) => MitraResponse.fromJson(json.decode(str));

String mitraResponseToJson(MitraResponse data) => json.encode(data.toJson());

class MitraResponse {
    final Data data;

    MitraResponse({
        required this.data,
    });

    factory MitraResponse.fromJson(Map<String, dynamic> json) => MitraResponse(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    final int id;
    final dynamic profileImage;
    final String nama;
    final String namaToko;
    final String bioDeskripsi;
    final int nis;
    final String nomor;
    final String image;
    final String status;
    final int pengikut;
    final String email;
    final int jumlahproduct;
    final int jumlahjasa;
    final int penilaian;
    final String noWhatsapp;
    final User user;

    Data({
        required this.id,
        required this.profileImage,
        required this.nama,
        required this.namaToko,
        required this.bioDeskripsi,
        required this.nis,
        required this.nomor,
        required this.image,
        required this.status,
        required this.pengikut,
        required this.email,
        required this.jumlahproduct,
        required this.jumlahjasa,
        required this.penilaian,
        required this.noWhatsapp,
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        profileImage: json["profile_image"],
        nama: json["nama"],
        namaToko: json["nama toko"],
        bioDeskripsi: json["bio_deskripsi"],
        nis: json["nis"],
        nomor: json["nomor"],
        image: json["image"],
        status: json["status"],
        pengikut: json["pengikut"],
        email: json["email"],
        jumlahproduct: json["jumlahproduct"],
        jumlahjasa: json["jumlahjasa"],
        penilaian: json["penilaian"],
        noWhatsapp: json["no_whatsapp"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profile_image": profileImage,
        "nama": nama,
        "nama toko": namaToko,
        "bio_deskripsi": bioDeskripsi,
        "nis": nis,
        "nomor": nomor,
        "image": image,
        "status": status,
        "pengikut": pengikut,
        "email": email,
        "jumlahproduct": jumlahproduct,
        "jumlahjasa": jumlahjasa,
        "penilaian": penilaian,
        "no_whatsapp": noWhatsapp,
        "user": user.toJson(),
    };
}

class User {
    final String nama;
    final String email;
    final dynamic pengikut;
    final dynamic jumlahJasa;
    final dynamic jumlahProduct;
    final dynamic penilaian;

    User({
        required this.nama,
        required this.email,
        required this.pengikut,
        required this.jumlahJasa,
        required this.jumlahProduct,
        required this.penilaian,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        nama: json["nama"],
        email: json["email"],
        pengikut: json["pengikut"],
        jumlahJasa: json["jumlah_jasa"],
        jumlahProduct: json["jumlah_product"],
        penilaian: json["penilaian"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "pengikut": pengikut,
        "jumlah_jasa": jumlahJasa,
        "jumlah_product": jumlahProduct,
        "penilaian": penilaian,
    };
}
