
class Mitra {
  final int id;
  final String imageProfile;
  final String nama_lengkap;
  final String namaToko;
  final String nis;
  final String no_dompet_digital;
  final String image_id_card;
  final String status;
  final int? pengikut;
  final int jumlahProduct;
  final int jumlahJasa;
  final double penilaian;
  final String? email;

  Mitra({
    required this.id,
    required this.imageProfile,
    required this.nama_lengkap,
    required this.namaToko,
    required this.nis,
    required this.no_dompet_digital,
    required this.image_id_card,
    required this.status,
    this.pengikut,
    required this.jumlahProduct,
    required this.jumlahJasa,
    required this.penilaian,
    required this.email,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) {
    return Mitra(
      id: json['data']['id'] != null ? json['data']['id'] : 0,
      imageProfile: json['image profile'] != null ? json['image profile'] : '',
      nama_lengkap: json['data']['nama'] != null ? json['data']['nama'] : '',
      namaToko: json['data']['nama_toko'] != null ? json['data']['nama_toko'] : '',
      nis: json['data']['nis'] != null ? json['data']['nis'] : '',
      no_dompet_digital: json['data']['no_dompet_digital'] != null ? json['data']['no_dompet_digital'] : '',
      image_id_card: json['data']['image'] != null ? json['data']['image'] : '',
      status: json['data']['status'] != null ? json['data']['status'] : 'pending',
      pengikut: json['pengikut'],
      jumlahProduct : json['jumlahproduct'] != null ? json['jumlahproduct'] : 0,
      jumlahJasa: json['jumlahjasa'] != null ? json['jumlahjasa'] : 0,
      penilaian: json['penilaian'] != null ? json['penilaian'] : 0,
      email: json['email'] ,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image profile': imageProfile,
      'nama': nama_lengkap,
      'nama toko': namaToko,
      'nis': nis,
      'no_dompet_digital': no_dompet_digital,
      'image': image_id_card,
      'status': status,
      'email': email,
      'pengikut': pengikut,
      'jumlahproduct': jumlahProduct,
      'jumlahjasa': jumlahJasa,
      'penilaian': penilaian,

    };
  }
}
