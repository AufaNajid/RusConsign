class Jasa {
  final int jasaId;
  final String nameJasa;
  final String descJasa;
  final double priceJasa;
  final double ratingJasa;
  final int mitraId;
  final String imageJasa;

  Jasa({
    required this.jasaId,
    required this.nameJasa,
    required this.descJasa,
    required this.priceJasa,
    required this.ratingJasa,
    required this.mitraId,
    required this.imageJasa,
  });

  factory Jasa.fromJson(Map<String, dynamic> json) {
    return Jasa(
      jasaId: json['jasaId'],
      nameJasa: json['name_jasa'],
      descJasa: json['desc_jasa'],
      priceJasa: json['price_jasa'].toDouble(),
      ratingJasa: json['rating_jasa'].toDouble(),
      mitraId: json['mitra_id'],
      imageJasa: json['image_jasa'],
    );
  }
}