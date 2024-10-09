import 'dart:convert';

List<LokasiResponse> lokasiResponseFromJson(String str) =>
    List<LokasiResponse>.from(
        json.decode(str).map((x) => LokasiResponse.fromJson(x)));

String lokasiResponseToJson(List<LokasiResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LokasiResponse {
  final int id;
  final String namaLokasi;
  final String descLokasi;
  final String gambarLokasi;
  final DateTime createdAt;
  final DateTime updatedAt;

  LokasiResponse({
    required this.id,
    required this.namaLokasi,
    required this.descLokasi,
    required this.gambarLokasi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LokasiResponse.fromJson(Map<String, dynamic> json) => LokasiResponse(
        id: json["id"],
        namaLokasi: json["nama_lokasi"],
        descLokasi: json["desc_lokasi"],
        gambarLokasi: json["gambar_lokasi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lokasi": namaLokasi,
        "desc_lokasi": descLokasi,
        "gambar_lokasi": gambarLokasi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
