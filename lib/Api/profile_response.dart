import 'dart:convert';

Profilee profileFromJson(String str) => Profilee.fromJson(json.decode(str));

String profileToJson(Profilee data) => json.encode(data.toJson());

class Profilee {
  String message;
  ProfilesData profiles; // Perubahan dari data menjadi profiles

  Profilee({
    required this.message,
    required this.profiles, // Perubahan dari data menjadi profiles
  });

  factory Profilee.fromJson(Map<String, dynamic> json) => Profilee(
        message: json["message"],
        profiles: ProfilesData.fromJson(
            json["data"]), // Perubahan dari data menjadi profiles
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "profiles": profiles.toJson(), // Perubahan dari data menjadi profiles
      };
}

class ProfilesData {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String bioDesc;
  String imageProfiles;
  DateTime createdAt;
  DateTime updatedAt;
  int idMitra;
  String imageProfile;
  String nama;
  String namaToko;
  int nis;
  String nomor;
  String image;
  String status;
  int pengikut;
  String emailDariUser;
  int jumlahproduct;
  int jumlahjasa;
  int penilaian;

  ProfilesData({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.bioDesc,
    required this.imageProfiles,
    required this.createdAt,
    required this.updatedAt,
    required this.idMitra,
    required this.imageProfile,
    required this.nama,
    required this.namaToko,
    required this.nis,
    required this.nomor,
    required this.image,
    required this.status,
    required this.pengikut,
    required this.emailDariUser,
    required this.jumlahproduct,
    required this.jumlahjasa,
    required this.penilaian,
  });

  factory ProfilesData.fromJson(Map<String, dynamic> json) => ProfilesData(
        id: json["id"],
        name: json["name"] ?? '',
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        bioDesc: json["bio_desc"] ?? 'Bio Masih Kosong',
        imageProfiles: json["image_profiles"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idMitra: json["id_mitra"] ?? 0,
        imageProfile: json["image_profile"] ?? '',
        nama: json["nama"] ?? '',
        namaToko: json["nama_toko"] ?? 'Nama Toko Masih Kosong',
        nis: json["nis"] ?? 0,
        nomor: json["nomor"] ?? '',
        image: json["image"] ?? '',
        status: json["status"] ?? "",
        pengikut: json["pengikut"] ?? 0,
        emailDariUser: json["email_dariUser"] ?? '',
        jumlahproduct: json["jumlahproduct"] ?? 0,
        jumlahjasa: json["jumlahjasa"] ?? 0,
        penilaian: json["penilaian"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "bio_desc": bioDesc,
        "image_profiles": imageProfiles,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id_mitra": idMitra,
        "image_profile": imageProfile,
        "nama": nama,
        "nama_toko": namaToko,
        "nis": nis,
        "nomor": nomor,
        "image": image,
        "status": status,
        "pengikut": pengikut,
        "email_dariUser": emailDariUser,
        "jumlahproduct": jumlahproduct,
        "jumlahjasa": jumlahjasa,
        "penilaian": penilaian,
      };
}
