// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return _Vendor.fromJson(json);
}

/// @nodoc
mixin _$Vendor {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get contact => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: "referral_code")
  String get referralCode => throw _privateConstructorUsedError;
  @JsonKey(name: "loyalty_points")
  int? get loyaltyPoints => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_device_active')
  bool? get isDeviceActive => throw _privateConstructorUsedError;
  int? get otp => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get rcId => throw _privateConstructorUsedError;
  String? get rcUsername => throw _privateConstructorUsedError;
  String? get deviceToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_email_verified')
  bool? get isEmailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_contact_verified')
  bool? get isContactVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_code')
  String? get currencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_approved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_form_submitted')
  bool? get isFormSubmitted => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_rating')
  double? get avgRating => throw _privateConstructorUsedError;
  Verified? get verified => throw _privateConstructorUsedError;
  Unverified? get unverified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorCopyWith<Vendor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCopyWith<$Res> {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) then) =
      _$VendorCopyWithImpl<$Res, Vendor>;
  @useResult
  $Res call(
      {String name,
      String email,
      String? contact,
      String? country,
      String? avatar,
      @JsonKey(name: "referral_code") String referralCode,
      @JsonKey(name: "loyalty_points") int? loyaltyPoints,
      String? createdAt,
      String? updatedAt,
      int? id,
      @JsonKey(name: 'is_device_active') bool? isDeviceActive,
      int? otp,
      String? language,
      String? rcId,
      String? rcUsername,
      String? deviceToken,
      @JsonKey(name: 'is_email_verified') bool? isEmailVerified,
      @JsonKey(name: 'is_contact_verified') bool? isContactVerified,
      @JsonKey(name: 'currency_code') String? currencyCode,
      @JsonKey(name: 'is_approved') bool? isApproved,
      @JsonKey(name: 'is_form_submitted') bool? isFormSubmitted,
      @JsonKey(name: 'avg_rating') double? avgRating,
      Verified? verified,
      Unverified? unverified});

  $VerifiedCopyWith<$Res>? get verified;
  $UnverifiedCopyWith<$Res>? get unverified;
}

/// @nodoc
class _$VendorCopyWithImpl<$Res, $Val extends Vendor>
    implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? contact = freezed,
    Object? country = freezed,
    Object? avatar = freezed,
    Object? referralCode = null,
    Object? loyaltyPoints = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
    Object? isDeviceActive = freezed,
    Object? otp = freezed,
    Object? language = freezed,
    Object? rcId = freezed,
    Object? rcUsername = freezed,
    Object? deviceToken = freezed,
    Object? isEmailVerified = freezed,
    Object? isContactVerified = freezed,
    Object? currencyCode = freezed,
    Object? isApproved = freezed,
    Object? isFormSubmitted = freezed,
    Object? avgRating = freezed,
    Object? verified = freezed,
    Object? unverified = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      loyaltyPoints: freezed == loyaltyPoints
          ? _value.loyaltyPoints
          : loyaltyPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeviceActive: freezed == isDeviceActive
          ? _value.isDeviceActive
          : isDeviceActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      rcId: freezed == rcId
          ? _value.rcId
          : rcId // ignore: cast_nullable_to_non_nullable
              as String?,
      rcUsername: freezed == rcUsername
          ? _value.rcUsername
          : rcUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isContactVerified: freezed == isContactVerified
          ? _value.isContactVerified
          : isContactVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFormSubmitted: freezed == isFormSubmitted
          ? _value.isFormSubmitted
          : isFormSubmitted // ignore: cast_nullable_to_non_nullable
              as bool?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as Verified?,
      unverified: freezed == unverified
          ? _value.unverified
          : unverified // ignore: cast_nullable_to_non_nullable
              as Unverified?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerifiedCopyWith<$Res>? get verified {
    if (_value.verified == null) {
      return null;
    }

    return $VerifiedCopyWith<$Res>(_value.verified!, (value) {
      return _then(_value.copyWith(verified: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnverifiedCopyWith<$Res>? get unverified {
    if (_value.unverified == null) {
      return null;
    }

    return $UnverifiedCopyWith<$Res>(_value.unverified!, (value) {
      return _then(_value.copyWith(unverified: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VendorImplCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$$VendorImplCopyWith(
          _$VendorImpl value, $Res Function(_$VendorImpl) then) =
      __$$VendorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String? contact,
      String? country,
      String? avatar,
      @JsonKey(name: "referral_code") String referralCode,
      @JsonKey(name: "loyalty_points") int? loyaltyPoints,
      String? createdAt,
      String? updatedAt,
      int? id,
      @JsonKey(name: 'is_device_active') bool? isDeviceActive,
      int? otp,
      String? language,
      String? rcId,
      String? rcUsername,
      String? deviceToken,
      @JsonKey(name: 'is_email_verified') bool? isEmailVerified,
      @JsonKey(name: 'is_contact_verified') bool? isContactVerified,
      @JsonKey(name: 'currency_code') String? currencyCode,
      @JsonKey(name: 'is_approved') bool? isApproved,
      @JsonKey(name: 'is_form_submitted') bool? isFormSubmitted,
      @JsonKey(name: 'avg_rating') double? avgRating,
      Verified? verified,
      Unverified? unverified});

  @override
  $VerifiedCopyWith<$Res>? get verified;
  @override
  $UnverifiedCopyWith<$Res>? get unverified;
}

/// @nodoc
class __$$VendorImplCopyWithImpl<$Res>
    extends _$VendorCopyWithImpl<$Res, _$VendorImpl>
    implements _$$VendorImplCopyWith<$Res> {
  __$$VendorImplCopyWithImpl(
      _$VendorImpl _value, $Res Function(_$VendorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? contact = freezed,
    Object? country = freezed,
    Object? avatar = freezed,
    Object? referralCode = null,
    Object? loyaltyPoints = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
    Object? isDeviceActive = freezed,
    Object? otp = freezed,
    Object? language = freezed,
    Object? rcId = freezed,
    Object? rcUsername = freezed,
    Object? deviceToken = freezed,
    Object? isEmailVerified = freezed,
    Object? isContactVerified = freezed,
    Object? currencyCode = freezed,
    Object? isApproved = freezed,
    Object? isFormSubmitted = freezed,
    Object? avgRating = freezed,
    Object? verified = freezed,
    Object? unverified = freezed,
  }) {
    return _then(_$VendorImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      loyaltyPoints: freezed == loyaltyPoints
          ? _value.loyaltyPoints
          : loyaltyPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeviceActive: freezed == isDeviceActive
          ? _value.isDeviceActive
          : isDeviceActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      rcId: freezed == rcId
          ? _value.rcId
          : rcId // ignore: cast_nullable_to_non_nullable
              as String?,
      rcUsername: freezed == rcUsername
          ? _value.rcUsername
          : rcUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isContactVerified: freezed == isContactVerified
          ? _value.isContactVerified
          : isContactVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFormSubmitted: freezed == isFormSubmitted
          ? _value.isFormSubmitted
          : isFormSubmitted // ignore: cast_nullable_to_non_nullable
              as bool?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as Verified?,
      unverified: freezed == unverified
          ? _value.unverified
          : unverified // ignore: cast_nullable_to_non_nullable
              as Unverified?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorImpl implements _Vendor {
  const _$VendorImpl(
      {required this.name,
      required this.email,
      this.contact,
      this.country,
      this.avatar,
      @JsonKey(name: "referral_code") required this.referralCode,
      @JsonKey(name: "loyalty_points") this.loyaltyPoints,
      this.createdAt,
      this.updatedAt,
      this.id,
      @JsonKey(name: 'is_device_active') this.isDeviceActive,
      this.otp,
      this.language,
      this.rcId,
      this.rcUsername,
      this.deviceToken,
      @JsonKey(name: 'is_email_verified') this.isEmailVerified,
      @JsonKey(name: 'is_contact_verified') this.isContactVerified,
      @JsonKey(name: 'currency_code') this.currencyCode,
      @JsonKey(name: 'is_approved') this.isApproved,
      @JsonKey(name: 'is_form_submitted') this.isFormSubmitted,
      @JsonKey(name: 'avg_rating') this.avgRating,
      this.verified,
      this.unverified});

  factory _$VendorImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String? contact;
  @override
  final String? country;
  @override
  final String? avatar;
  @override
  @JsonKey(name: "referral_code")
  final String referralCode;
  @override
  @JsonKey(name: "loyalty_points")
  final int? loyaltyPoints;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? id;
  @override
  @JsonKey(name: 'is_device_active')
  final bool? isDeviceActive;
  @override
  final int? otp;
  @override
  final String? language;
  @override
  final String? rcId;
  @override
  final String? rcUsername;
  @override
  final String? deviceToken;
  @override
  @JsonKey(name: 'is_email_verified')
  final bool? isEmailVerified;
  @override
  @JsonKey(name: 'is_contact_verified')
  final bool? isContactVerified;
  @override
  @JsonKey(name: 'currency_code')
  final String? currencyCode;
  @override
  @JsonKey(name: 'is_approved')
  final bool? isApproved;
  @override
  @JsonKey(name: 'is_form_submitted')
  final bool? isFormSubmitted;
  @override
  @JsonKey(name: 'avg_rating')
  final double? avgRating;
  @override
  final Verified? verified;
  @override
  final Unverified? unverified;

  @override
  String toString() {
    return 'Vendor(name: $name, email: $email, contact: $contact, country: $country, avatar: $avatar, referralCode: $referralCode, loyaltyPoints: $loyaltyPoints, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, isDeviceActive: $isDeviceActive, otp: $otp, language: $language, rcId: $rcId, rcUsername: $rcUsername, deviceToken: $deviceToken, isEmailVerified: $isEmailVerified, isContactVerified: $isContactVerified, currencyCode: $currencyCode, isApproved: $isApproved, isFormSubmitted: $isFormSubmitted, avgRating: $avgRating, verified: $verified, unverified: $unverified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.loyaltyPoints, loyaltyPoints) ||
                other.loyaltyPoints == loyaltyPoints) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isDeviceActive, isDeviceActive) ||
                other.isDeviceActive == isDeviceActive) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.rcId, rcId) || other.rcId == rcId) &&
            (identical(other.rcUsername, rcUsername) ||
                other.rcUsername == rcUsername) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isContactVerified, isContactVerified) ||
                other.isContactVerified == isContactVerified) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isFormSubmitted, isFormSubmitted) ||
                other.isFormSubmitted == isFormSubmitted) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.unverified, unverified) ||
                other.unverified == unverified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        email,
        contact,
        country,
        avatar,
        referralCode,
        loyaltyPoints,
        createdAt,
        updatedAt,
        id,
        isDeviceActive,
        otp,
        language,
        rcId,
        rcUsername,
        deviceToken,
        isEmailVerified,
        isContactVerified,
        currencyCode,
        isApproved,
        isFormSubmitted,
        avgRating,
        verified,
        unverified
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      __$$VendorImplCopyWithImpl<_$VendorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorImplToJson(
      this,
    );
  }
}

abstract class _Vendor implements Vendor {
  const factory _Vendor(
      {required final String name,
      required final String email,
      final String? contact,
      final String? country,
      final String? avatar,
      @JsonKey(name: "referral_code") required final String referralCode,
      @JsonKey(name: "loyalty_points") final int? loyaltyPoints,
      final String? createdAt,
      final String? updatedAt,
      final int? id,
      @JsonKey(name: 'is_device_active') final bool? isDeviceActive,
      final int? otp,
      final String? language,
      final String? rcId,
      final String? rcUsername,
      final String? deviceToken,
      @JsonKey(name: 'is_email_verified') final bool? isEmailVerified,
      @JsonKey(name: 'is_contact_verified') final bool? isContactVerified,
      @JsonKey(name: 'currency_code') final String? currencyCode,
      @JsonKey(name: 'is_approved') final bool? isApproved,
      @JsonKey(name: 'is_form_submitted') final bool? isFormSubmitted,
      @JsonKey(name: 'avg_rating') final double? avgRating,
      final Verified? verified,
      final Unverified? unverified}) = _$VendorImpl;

  factory _Vendor.fromJson(Map<String, dynamic> json) = _$VendorImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String? get contact;
  @override
  String? get country;
  @override
  String? get avatar;
  @override
  @JsonKey(name: "referral_code")
  String get referralCode;
  @override
  @JsonKey(name: "loyalty_points")
  int? get loyaltyPoints;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get id;
  @override
  @JsonKey(name: 'is_device_active')
  bool? get isDeviceActive;
  @override
  int? get otp;
  @override
  String? get language;
  @override
  String? get rcId;
  @override
  String? get rcUsername;
  @override
  String? get deviceToken;
  @override
  @JsonKey(name: 'is_email_verified')
  bool? get isEmailVerified;
  @override
  @JsonKey(name: 'is_contact_verified')
  bool? get isContactVerified;
  @override
  @JsonKey(name: 'currency_code')
  String? get currencyCode;
  @override
  @JsonKey(name: 'is_approved')
  bool? get isApproved;
  @override
  @JsonKey(name: 'is_form_submitted')
  bool? get isFormSubmitted;
  @override
  @JsonKey(name: 'avg_rating')
  double? get avgRating;
  @override
  Verified? get verified;
  @override
  Unverified? get unverified;
  @override
  @JsonKey(ignore: true)
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Verified _$VerifiedFromJson(Map<String, dynamic> json) {
  return _Verified.fromJson(json);
}

/// @nodoc
mixin _$Verified {
  Contact? get contact => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifiedCopyWith<Verified> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifiedCopyWith<$Res> {
  factory $VerifiedCopyWith(Verified value, $Res Function(Verified) then) =
      _$VerifiedCopyWithImpl<$Res, Verified>;
  @useResult
  $Res call({Contact? contact});

  $ContactCopyWith<$Res>? get contact;
}

/// @nodoc
class _$VerifiedCopyWithImpl<$Res, $Val extends Verified>
    implements $VerifiedCopyWith<$Res> {
  _$VerifiedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = freezed,
  }) {
    return _then(_value.copyWith(
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifiedImplCopyWith<$Res>
    implements $VerifiedCopyWith<$Res> {
  factory _$$VerifiedImplCopyWith(
          _$VerifiedImpl value, $Res Function(_$VerifiedImpl) then) =
      __$$VerifiedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Contact? contact});

  @override
  $ContactCopyWith<$Res>? get contact;
}

/// @nodoc
class __$$VerifiedImplCopyWithImpl<$Res>
    extends _$VerifiedCopyWithImpl<$Res, _$VerifiedImpl>
    implements _$$VerifiedImplCopyWith<$Res> {
  __$$VerifiedImplCopyWithImpl(
      _$VerifiedImpl _value, $Res Function(_$VerifiedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = freezed,
  }) {
    return _then(_$VerifiedImpl(
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifiedImpl implements _Verified {
  const _$VerifiedImpl({this.contact});

  factory _$VerifiedImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifiedImplFromJson(json);

  @override
  final Contact? contact;

  @override
  String toString() {
    return 'Verified(contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifiedImpl &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifiedImplCopyWith<_$VerifiedImpl> get copyWith =>
      __$$VerifiedImplCopyWithImpl<_$VerifiedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifiedImplToJson(
      this,
    );
  }
}

abstract class _Verified implements Verified {
  const factory _Verified({final Contact? contact}) = _$VerifiedImpl;

  factory _Verified.fromJson(Map<String, dynamic> json) =
      _$VerifiedImpl.fromJson;

  @override
  Contact? get contact;
  @override
  @JsonKey(ignore: true)
  _$$VerifiedImplCopyWith<_$VerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  String? get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call({String? number});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? number});
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(_$ContactImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactImpl implements _Contact {
  const _$ContactImpl({this.number});

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  final String? number;

  @override
  String toString() {
    return 'Contact(number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact({final String? number}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  String? get number;
  @override
  @JsonKey(ignore: true)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Unverified _$UnverifiedFromJson(Map<String, dynamic> json) {
  return _Unverified.fromJson(json);
}

/// @nodoc
mixin _$Unverified {
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnverifiedCopyWith<Unverified> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnverifiedCopyWith<$Res> {
  factory $UnverifiedCopyWith(
          Unverified value, $Res Function(Unverified) then) =
      _$UnverifiedCopyWithImpl<$Res, Unverified>;
  @useResult
  $Res call({String? email});
}

/// @nodoc
class _$UnverifiedCopyWithImpl<$Res, $Val extends Unverified>
    implements $UnverifiedCopyWith<$Res> {
  _$UnverifiedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnverifiedImplCopyWith<$Res>
    implements $UnverifiedCopyWith<$Res> {
  factory _$$UnverifiedImplCopyWith(
          _$UnverifiedImpl value, $Res Function(_$UnverifiedImpl) then) =
      __$$UnverifiedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email});
}

/// @nodoc
class __$$UnverifiedImplCopyWithImpl<$Res>
    extends _$UnverifiedCopyWithImpl<$Res, _$UnverifiedImpl>
    implements _$$UnverifiedImplCopyWith<$Res> {
  __$$UnverifiedImplCopyWithImpl(
      _$UnverifiedImpl _value, $Res Function(_$UnverifiedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$UnverifiedImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnverifiedImpl implements _Unverified {
  const _$UnverifiedImpl({this.email});

  factory _$UnverifiedImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnverifiedImplFromJson(json);

  @override
  final String? email;

  @override
  String toString() {
    return 'Unverified(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnverifiedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnverifiedImplCopyWith<_$UnverifiedImpl> get copyWith =>
      __$$UnverifiedImplCopyWithImpl<_$UnverifiedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnverifiedImplToJson(
      this,
    );
  }
}

abstract class _Unverified implements Unverified {
  const factory _Unverified({final String? email}) = _$UnverifiedImpl;

  factory _Unverified.fromJson(Map<String, dynamic> json) =
      _$UnverifiedImpl.fromJson;

  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$UnverifiedImplCopyWith<_$UnverifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
