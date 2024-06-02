class Profile {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? bioDesc;
  final String createdAt;
  final String updatedAt;
  final int? idMitra; // Made nullable
  final String nama;
  final String namaToko;
  final int? nis; // Made nullable
  final String? nomor;
  final String? image;
  final String status;
  final String? pengikut;
  final String emailDariUser;
  final int? jumlahProduct; // Made nullable
  final int? jumlahJasa; // Made nullable
  final int? penilaian; // Made nullable

  Profile({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.bioDesc,
    required this.createdAt,
    required this.updatedAt,
    this.idMitra,
    required this.nama,
    required this.namaToko,
    this.nis,
    this.nomor,
    this.image,
    required this.status,
    this.pengikut,
    required this.emailDariUser,
    this.jumlahProduct,
    this.jumlahJasa,
    this.penilaian,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      bioDesc: json['bio_desc'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      idMitra: json['id_mitra'] != null ? json['id_mitra'] as int : null,
      nama: json['nama'],
      namaToko: json['nama_toko'],
      nis: json['nis'] != null ? json['nis'] as int : null,
      nomor: json['nomor'],
      image: json['image'],
      status: json['status'],
      pengikut: json['pengikut'],
      emailDariUser: json['email_dari_user'],
      jumlahProduct: json['jumlahproduct'] != null ? json['jumlahproduct'] as int : null,
      jumlahJasa: json['jumlahjasa'] != null ? json['jumlahjasa'] as int : null,
      penilaian: json['penilaian'] != null ? json['penilaian'] as int : null,
    );
  }
}
