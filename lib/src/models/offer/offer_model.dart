import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const factory OfferModel({
    required Price price,
    required int id,
    @JsonKey(name: 'order_type') required String orderType,
    @JsonKey(name: 'no_of_items') required int numberOfItems,
    @JsonKey(name: 'is_delivery_mode_changed')
    required bool isDeliveryModeChanged,
    @JsonKey(name: 'request_code') required int requestCode,
    @JsonKey(name: 'order_date') required String orderDate,
    @JsonKey(name: 'expiry_time') required String expiryTime,
    @JsonKey(name: 'is_revised') required bool isRevised,
    @JsonKey(name: 'revision_number') required int revisionNumber,
    required String description,
    required String status,
    required String type,
    @JsonKey(name: 'delivery_mode_id') required int deliveryModeId,
    @JsonKey(name: 'delivery_vehicle_id') required int deliveryVehicleId,
    @JsonKey(name: 'delivery_location') required String deliveryLocation,
    required User user,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}

@freezed
class Price with _$Price {
  const factory Price({
    required String label,
    required double value,
    @JsonKey(name: 'estimate_delivery_fee') required double estimateDeliveryFee,
    @JsonKey(name: 'wasphaFeeAmount') required double wasphaFeeAmount,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String avatar,
    @JsonKey(name: 'rc_id') required String rcId,
    @JsonKey(name: 'rc_username') required String rcUsername,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
