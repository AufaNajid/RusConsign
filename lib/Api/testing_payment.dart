// To parse this JSON data, do
//
//     final testingPayment = testingPaymentFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

TestingPayment testingPaymentFromJson(String str) => TestingPayment.fromJson(json.decode(str));

String testingPaymentToJson(TestingPayment data) => json.encode(data.toJson());

class TestingPayment {
  String id;
  String externalId;
  String userId;
  String payerEmail;
  String description;
  String status;
  String merchantName;
  String merchantProfilePictureUrl;
  int amount;
  DateTime expiryDate;
  String invoiceUrl;
  List<AvailableBank> availableBanks;
  List<AvailableRetailOutlet> availableRetailOutlets;
  List<AvailableEwallet> availableEwallets;
  List<AvailableQrCode> availableQrCodes;
  List<AvailableDirectDebit> availableDirectDebits;
  List<AvailablePaylater> availablePaylaters;
  bool shouldExcludeCreditCard;
  bool shouldSendEmail;
  DateTime created;
  DateTime updated;
  String currency;

  TestingPayment({
    required this.id,
    required this.externalId,
    required this.userId,
    required this.payerEmail,
    required this.description,
    required this.status,
    required this.merchantName,
    required this.merchantProfilePictureUrl,
    required this.amount,
    required this.expiryDate,
    required this.invoiceUrl,
    required this.availableBanks,
    required this.availableRetailOutlets,
    required this.availableEwallets,
    required this.availableQrCodes,
    required this.availableDirectDebits,
    required this.availablePaylaters,
    required this.shouldExcludeCreditCard,
    required this.shouldSendEmail,
    required this.created,
    required this.updated,
    required this.currency,
  });

  factory TestingPayment.fromJson(Map<String, dynamic> json) => TestingPayment(
    id: json["id"],
    externalId: json["external_id"],
    userId: json["user_id"],
    payerEmail: json["payer_email"],
    description: json["description"],
    status: json["status"],
    merchantName: json["merchant_name"],
    merchantProfilePictureUrl: json["merchant_profile_picture_url"],
    amount: json["amount"],
    expiryDate: DateTime.parse(json["expiry_date"]),
    invoiceUrl: json["invoice_url"],
    availableBanks: List<AvailableBank>.from(json["available_banks"].map((x) => AvailableBank.fromJson(x))),
    availableRetailOutlets: List<AvailableRetailOutlet>.from(json["available_retail_outlets"].map((x) => AvailableRetailOutlet.fromJson(x))),
    availableEwallets: List<AvailableEwallet>.from(json["available_ewallets"].map((x) => AvailableEwallet.fromJson(x))),
    availableQrCodes: List<AvailableQrCode>.from(json["available_qr_codes"].map((x) => AvailableQrCode.fromJson(x))),
    availableDirectDebits: List<AvailableDirectDebit>.from(json["available_direct_debits"].map((x) => AvailableDirectDebit.fromJson(x))),
    availablePaylaters: List<AvailablePaylater>.from(json["available_paylaters"].map((x) => AvailablePaylater.fromJson(x))),
    shouldExcludeCreditCard: json["should_exclude_credit_card"],
    shouldSendEmail: json["should_send_email"],
    created: DateTime.parse(json["created"]),
    updated: DateTime.parse(json["updated"]),
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "external_id": externalId,
    "user_id": userId,
    "payer_email": payerEmail,
    "description": description,
    "status": status,
    "merchant_name": merchantName,
    "merchant_profile_picture_url": merchantProfilePictureUrl,
    "amount": amount,
    "expiry_date": expiryDate.toIso8601String(),
    "invoice_url": invoiceUrl,
    "available_banks": List<dynamic>.from(availableBanks.map((x) => x.toJson())),
    "available_retail_outlets": List<dynamic>.from(availableRetailOutlets.map((x) => x.toJson())),
    "available_ewallets": List<dynamic>.from(availableEwallets.map((x) => x.toJson())),
    "available_qr_codes": List<dynamic>.from(availableQrCodes.map((x) => x.toJson())),
    "available_direct_debits": List<dynamic>.from(availableDirectDebits.map((x) => x.toJson())),
    "available_paylaters": List<dynamic>.from(availablePaylaters.map((x) => x.toJson())),
    "should_exclude_credit_card": shouldExcludeCreditCard,
    "should_send_email": shouldSendEmail,
    "created": created.toIso8601String(),
    "updated": updated.toIso8601String(),
    "currency": currency,
  };
}

class AvailableBank {
  String bankCode;
  CollectionType collectionType;
  BankBranch bankBranch;
  AccountHolderName accountHolderName;
  int transferAmount;

  AvailableBank({
    required this.bankCode,
    required this.collectionType,
    required this.bankBranch,
    required this.accountHolderName,
    required this.transferAmount,
  });

  factory AvailableBank.fromJson(Map<String, dynamic> json) => AvailableBank(
    bankCode: json["bank_code"],
    collectionType: collectionTypeValues.map[json["collection_type"]]!,
    bankBranch: bankBranchValues.map[json["bank_branch"]]!,
    accountHolderName: accountHolderNameValues.map[json["account_holder_name"]]!,
    transferAmount: json["transfer_amount"],
  );

  Map<String, dynamic> toJson() => {
    "bank_code": bankCode,
    "collection_type": collectionTypeValues.reverse[collectionType],
    "bank_branch": bankBranchValues.reverse[bankBranch],
    "account_holder_name": accountHolderNameValues.reverse[accountHolderName],
    "transfer_amount": transferAmount,
  };
}

enum AccountHolderName {
  RUS_CONSIGN
}

final accountHolderNameValues = EnumValues({
  "RUS CONSIGN": AccountHolderName.RUS_CONSIGN
});

enum BankBranch {
  VIRTUAL_ACCOUNT
}

final bankBranchValues = EnumValues({
  "Virtual Account": BankBranch.VIRTUAL_ACCOUNT
});

enum CollectionType {
  POOL
}

final collectionTypeValues = EnumValues({
  "POOL": CollectionType.POOL
});

class AvailableDirectDebit {
  String directDebitType;

  AvailableDirectDebit({
    required this.directDebitType,
  });

  factory AvailableDirectDebit.fromJson(Map<String, dynamic> json) => AvailableDirectDebit(
    directDebitType: json["direct_debit_type"],
  );

  Map<String, dynamic> toJson() => {
    "direct_debit_type": directDebitType,
  };
}

class AvailableEwallet {
  String ewalletType;

  AvailableEwallet({
    required this.ewalletType,
  });

  factory AvailableEwallet.fromJson(Map<String, dynamic> json) => AvailableEwallet(
    ewalletType: json["ewallet_type"],
  );

  Map<String, dynamic> toJson() => {
    "ewallet_type": ewalletType,
  };
}

class AvailablePaylater {
  String paylaterType;

  AvailablePaylater({
    required this.paylaterType,
  });

  factory AvailablePaylater.fromJson(Map<String, dynamic> json) => AvailablePaylater(
    paylaterType: json["paylater_type"],
  );

  Map<String, dynamic> toJson() => {
    "paylater_type": paylaterType,
  };
}

class AvailableQrCode {
  String qrCodeType;

  AvailableQrCode({
    required this.qrCodeType,
  });

  factory AvailableQrCode.fromJson(Map<String, dynamic> json) => AvailableQrCode(
    qrCodeType: json["qr_code_type"],
  );

  Map<String, dynamic> toJson() => {
    "qr_code_type": qrCodeType,
  };
}

class AvailableRetailOutlet {
  String retailOutletName;

  AvailableRetailOutlet({
    required this.retailOutletName,
  });

  factory AvailableRetailOutlet.fromJson(Map<String, dynamic> json) => AvailableRetailOutlet(
    retailOutletName: json["retail_outlet_name"],
  );

  Map<String, dynamic> toJson() => {
    "retail_outlet_name": retailOutletName,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
