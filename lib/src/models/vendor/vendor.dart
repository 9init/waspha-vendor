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
  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}
