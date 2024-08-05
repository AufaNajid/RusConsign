import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  String message;
  Profiles profiles; // Perubahan dari data menjadi profiles

  Profile({
    required this.message,
    required this.profiles, // Perubahan dari data menjadi profiles
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    message: json["message"],
    profiles: Profiles.fromJson(json["data"]), // Perubahan dari data menjadi profiles
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "profiles": profiles.toJson(), // Perubahan dari data menjadi profiles
  };
}

class Profiles {
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

  Profiles({
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

  factory Profiles.fromJson(Map<String, dynamic> json) => Profiles(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    bioDesc: json["bio_desc"],
    imageProfiles: json["image_profiles"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    idMitra: json["id_mitra"],
    imageProfile: json["image_profile"],
    nama: json["nama"],
    namaToko: json["nama_toko"],
    nis: json["nis"],
    nomor: json["nomor"],
    image: json["image"],
    status: json["status"],
    pengikut: json["pengikut"],
    emailDariUser: json["email_dariUser"],
    jumlahproduct: json["jumlahproduct"],
    jumlahjasa: json["jumlahjasa"],
    penilaian: json["penilaian"],
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
