// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor.freezed.dart';

part 'vendor.g.dart';

@freezed
class Vendor with _$Vendor {
  const factory Vendor({
    required String name,
    required String email,
    String? contact,
    String? country,
    String? avatar,
    @JsonKey(name: "referral_code") required String referralCode,
    @JsonKey(name: "loyalty_points") int? loyaltyPoints,
    String? createdAt,
    String? updatedAt,
    int? id,
    @JsonKey(name: 'is_device_active')bool? isDeviceActive,
    int? otp,
    String? language,
    String? rcId,
    String? rcUsername,
    String? deviceToken,
    @JsonKey(name: 'is_email_verified')bool? isEmailVerified,
    @JsonKey(name: 'is_contact_verified')bool? isContactVerified,
    @JsonKey(name: 'currency_code')String? currencyCode,
   @JsonKey(name: 'is_approved') bool? isApproved,
   @JsonKey(name: 'is_form_submitted') bool? isFormSubmitted,
    @JsonKey(name: 'avg_rating')double? avgRating,
    Verified? verified,
    Unverified? unverified,

  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}

@freezed
class Verified with _$Verified {
  const factory Verified({
    Contact? contact,
  })=_Verified;

  factory Verified.fromJson(Map<String, dynamic> json) => _$VerifiedFromJson(json);

}

@freezed
class Contact with _$Contact {
  const factory Contact ({
    String? number,
  })=_Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

}

@freezed
class Unverified with _$Unverified {
  const factory Unverified ({
    String? email,
  })=_Unverified;

  factory Unverified .fromJson(Map<String, dynamic> json) => _$UnverifiedFromJson(json);

}