import 'dart:convert';

KomentarResponse komentarResponseFromJson(String str) => KomentarResponse.fromJson(json.decode(str));

String komentarResponseToJson(KomentarResponse data) => json.encode(data.toJson());

class KomentarResponse {
    final Summary summary;
    final List<Rate> rates;
    final List<Review> reviews;

    KomentarResponse({
        required this.summary,
        required this.rates,
        required this.reviews,
    });

    factory KomentarResponse.fromJson(Map<String, dynamic> json) => KomentarResponse(
        summary: Summary.fromJson(json["summary"]),
        rates: List<Rate>.from(json["rates"].map((x) => Rate.fromJson(x))),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "summary": summary.toJson(),
        "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    };
}

class Rate {
    final int total;
    final int rate;

    Rate({
        required this.total,
        required this.rate,
    });

    factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        total: json["total"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "rate": rate,
    };
}

class Review {
    final int id;
    final int userId;
    final int barangId;
    final String komentar;
    final int rate;
    final DateTime createdAt;
    final DateTime updatedAt;
    final User user;

    Review({
        required this.id,
        required this.userId,
        required this.barangId,
        required this.komentar,
        required this.rate,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        userId: json["user_id"],
        barangId: json["barang_id"],
        komentar: json["komentar"],
        rate: json["rate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "barang_id": barangId,
        "komentar": komentar,
        "rate": rate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
    };
}

class User {
    final int id;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final String bioDesc;
    final int mitraId;
    final String statusPembayaran;
    final dynamic imageProfiles;
    final DateTime createdAt;
    final DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.bioDesc,
        required this.mitraId,
        required this.statusPembayaran,
        required this.imageProfiles,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        bioDesc: json["bio_desc"],
        mitraId: json["mitra_id"],
        statusPembayaran: json["status_pembayaran"],
        imageProfiles: json["image_profiles"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "bio_desc": bioDesc,
        "mitra_id": mitraId,
        "status_pembayaran": statusPembayaran,
        "image_profiles": imageProfiles,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Summary {
    final int total;
    final double avg;

    Summary({
        required this.total,
        required this.avg,
    });

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        total: json["total"],
        avg: json["avg"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "avg": avg,
    };
}
