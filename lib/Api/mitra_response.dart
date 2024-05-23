
class Mitra {
  final int id;
  final String imageProfile;
  final String nama;
  final String namaToko;
  final int nis;
  final String no_dompet_digital;
  final String image_id_card;
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
    required this.no_dompet_digital,
    required this.image_id_card,
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
      no_dompet_digital: json['no_dompet_digital'],
      image_id_card: json['image'],
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
      'no_dompet_digital': no_dompet_digital,
      'image': image_id_card,
      'status': status,
      'pengikut': pengikut,
      'jumlahproduct': jumlahProduct,
      'jumlahjasa': jumlahJasa,
      'penilaian': penilaian,
    };
  }
}
