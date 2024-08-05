import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
    String message;
    User user;

    EditProfileModel({
        required this.message,
        required this.user,
    });

    factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String bioDesc;
    int mitraId;
    dynamic statusPembayaran;
    String imageProfiles;
    DateTime createdAt;
    DateTime updatedAt;

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
