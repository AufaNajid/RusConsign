// To parse this JSON data, do
//
//     final lokasiById = lokasiByIdFromJson(jsonString);

import 'dart:convert';

LokasiById lokasiByIdFromJson(String str) => LokasiById.fromJson(json.decode(str));

String lokasiByIdToJson(LokasiById data) => json.encode(data.toJson());

class LokasiById {
  int id;
  String namaLokasi;
  String descLokasi;
  String gambarLokasi;
  DateTime createdAt;
  DateTime updatedAt;

  LokasiById({
    required this.id,
    required this.namaLokasi,
    required this.descLokasi,
    required this.gambarLokasi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LokasiById.fromJson(Map<String, dynamic> json) => LokasiById(
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
