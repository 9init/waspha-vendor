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
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as int?,
      isDeviceActive: json['is_device_active'] as bool?,
      otp: json['otp'] as int?,
      language: json['language'] as String?,
      rcId: json['rcId'] as String?,
      rcUsername: json['rcUsername'] as String?,
      deviceToken: json['deviceToken'] as String?,
      isEmailVerified: json['is_email_verified'] as bool?,
      isContactVerified: json['is_contact_verified'] as bool?,
      currencyCode: json['currency_code'] as String?,
      isApproved: json['is_approved'] as bool?,
      isFormSubmitted: json['is_form_submitted'] as bool?,
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
      verified: json['verified'] == null
          ? null
          : Verified.fromJson(json['verified'] as Map<String, dynamic>),
      unverified: json['unverified'] == null
          ? null
          : Unverified.fromJson(json['unverified'] as Map<String, dynamic>),
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
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'is_device_active': instance.isDeviceActive,
      'otp': instance.otp,
      'language': instance.language,
      'rcId': instance.rcId,
      'rcUsername': instance.rcUsername,
      'deviceToken': instance.deviceToken,
      'is_email_verified': instance.isEmailVerified,
      'is_contact_verified': instance.isContactVerified,
      'currency_code': instance.currencyCode,
      'is_approved': instance.isApproved,
      'is_form_submitted': instance.isFormSubmitted,
      'avg_rating': instance.avgRating,
      'verified': instance.verified,
      'unverified': instance.unverified,
    };

_$VerifiedImpl _$$VerifiedImplFromJson(Map<String, dynamic> json) =>
    _$VerifiedImpl(
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerifiedImplToJson(_$VerifiedImpl instance) =>
    <String, dynamic>{
      'contact': instance.contact,
    };

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      number: json['number'] as String?,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
    };

_$UnverifiedImpl _$$UnverifiedImplFromJson(Map<String, dynamic> json) =>
    _$UnverifiedImpl(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$UnverifiedImplToJson(_$UnverifiedImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
