import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_model.freezed.dart';
part 'commission_model.g.dart';

@freezed
abstract class CommissionModel with _$CommissionModel {
  const factory CommissionModel({
    @JsonKey(name: 'store_id') required int storeId,
    @JsonKey(name: 'user_delivery_fee') required int userDeliveryFee,
    @JsonKey(name: 'user_pickup_fee') required int userPickupFee,
    @JsonKey(name: 'store_delivery_fee') required int storeDeliveryFee,
    @JsonKey(name: 'store_pickup_fee') required int storePickupFee,
    @JsonKey(name: 'store_box_fee') required int storeBoxFee,
    @JsonKey(name: 'user_delivery_fee_type')
    required String userDeliveryFeeType,
    @JsonKey(name: 'user_pickup_fee_type') required String userPickupFeeType,
    @JsonKey(name: 'store_delivery_fee_type')
    required String storeDeliveryFeeType,
    @JsonKey(name: 'store_pickup_fee_type') required String storePickupFeeType,
    @JsonKey(name: 'store_box_fee_type') required String storeBoxFeeType,
  }) = _CommissionModel;

  factory CommissionModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionModelFromJson(json);
}
