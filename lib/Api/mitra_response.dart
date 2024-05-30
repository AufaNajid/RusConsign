
class Mitra {
  final int id;
  final String imageProfile;
  final String nama;
  final String namaToko;
  final String nis;
  final String noDompetDigital;
  final String imageIdCard;
  final String status;
  final int? pengikut;
  final int jumlahProduct;
  final int jumlahJasa;
  final double penilaian;

  Mitra({
    required this.id,
    required this.imageProfile,
    required this.nama,
    required this.namaToko,
    required this.nis,
    required this.noDompetDigital,
    required this.imageIdCard,
    required this.status,
    this.pengikut,
    required this.jumlahProduct,
    required this.jumlahJasa,
    required this.penilaian,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) {
    return Mitra(
      id: json['data']['id'] ?? 0,
      imageProfile: json['image profile'] ?? '',
      nama: json['data']['nama'] ?? '',
      namaToko: json['data']['nama_toko'] ?? '',
      nis: json['data']['nis'] ?? '',
      noDompetDigital: json['data']['no_dompet_digital'] ?? '',
      imageIdCard: json['data']['image'] ?? '',
      status: json['data']['status'] ?? 'pending',
      pengikut: json['pengikut'],
      jumlahProduct : json['jumlahproduct'] ?? 0,
      jumlahJasa: json['jumlahjasa'] ?? 0,
      penilaian: json['penilaian'] ?? 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image profile': imageProfile,
      'nama': nama,
      'nama toko': namaToko,
      'nis': nis,
      'no_dompet_digital': noDompetDigital,
      'image': imageIdCard,
      'status': status,
      'pengikut': pengikut,
      'jumlahproduct': jumlahProduct,
      'jumlahjasa': jumlahJasa,
      'penilaian': penilaian,
    };
  }
}
