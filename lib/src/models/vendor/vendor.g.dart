// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorImpl _$$VendorImplFromJson(Map<String, dynamic> json) => _$VendorImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      contact: json['contact'] as String?,
      country: json['country'] as String?,
      loyaltyPoints: json['loyalty_points'] as int?,
    );

Map<String, dynamic> _$$VendorImplToJson(_$VendorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'contact': instance.contact,
      'country': instance.country,
      'loyalty_points': instance.loyaltyPoints,
    };
