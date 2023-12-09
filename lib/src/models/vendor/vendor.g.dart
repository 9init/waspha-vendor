// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorImpl _$$VendorImplFromJson(Map<String, dynamic> json) => _$VendorImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      contact: json['contact'] as String?,
      country: json['country'] as String?,
      avatar: json['avatar'] as String?,
      referralCode: json['referral_code'] as String,
      loyaltyPoints: json['loyalty_points'] as int?,
    );

Map<String, dynamic> _$$VendorImplToJson(_$VendorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'contact': instance.contact,
      'country': instance.country,
      'avatar': instance.avatar,
      'referral_code': instance.referralCode,
      'loyalty_points': instance.loyaltyPoints,
    };
