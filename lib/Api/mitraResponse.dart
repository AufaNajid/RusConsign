import 'dart:convert';

class Mitra {
  final int id;
  final String imageProfile;
  final String nama;
  final String namaToko;
  final int nis;
  final String nomor;
  final String image;
  final String status;
  final int? pengikut;
  final int jumlahProduct;
  final int jumlahJasa;
  final int penilaian;

  Mitra({
    required this.id,
    required this.imageProfile,
    required this.nama,
    required this.namaToko,
    required this.nis,
    required this.nomor,
    required this.image,
    required this.status,
    this.pengikut,
    required this.jumlahProduct,
    required this.jumlahJasa,
    required this.penilaian,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) {
    return Mitra(
      id: json['id'],
      imageProfile: json['image profile'],
      nama: json['nama'],
      namaToko: json['nama toko'],
      nis: json['nis'],
      nomor: json['nomor'],
      image: json['image'],
      status: json['status'],
      pengikut: json['pengikut'],
      jumlahProduct: json['jumlahproduct'],
      jumlahJasa: json['jumlahjasa'],
      penilaian: json['penilaian'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image profile': imageProfile,
      'nama': nama,
      'nama toko': namaToko,
      'nis': nis,
      'nomor': nomor,
      'image': image,
      'status': status,
      'pengikut': pengikut,
      'jumlahproduct': jumlahProduct,
      'jumlahjasa': jumlahJasa,
      'penilaian': penilaian,
    };
  }
}
