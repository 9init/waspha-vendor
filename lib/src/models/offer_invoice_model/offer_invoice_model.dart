import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vendor/src/shared/serializable/datetime.dart';

part 'offer_invoice_model.freezed.dart';
part 'offer_invoice_model.g.dart';

@freezed
class OfferInvoiceModel with _$OfferInvoiceModel {
  const factory OfferInvoiceModel({
    required Total? total,
    required Proposal? proposal,
    required String? currency,
    required Fees? fees,
    required Delivery? delivery,
    required double? subtotal,
    @JsonKey(name: 'discounted_subtotal') required double? discountedSubtotal,
    required double? discount,
    required Profit? profit,
  }) = _OfferInvoiceModel;

  factory OfferInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$OfferInvoiceModelFromJson(json);
}

@freezed
class Total with _$Total {
  const factory Total({
    required String? label,
    required double? value,
    @JsonKey(name: 'wasphaFeeAmount') required double? wasphaFeeAmount,
  }) = _Total;

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);
}

@freezed
class Proposal with _$Proposal {
  const factory Proposal({
    required int? id,
    @JsonKey(name: 'delivery_fee') required double? deliveryFee,
    required String? type,
    @JsonKey(name: 'order_type') required String? orderType,
    @JsonKey(name: 'package_charges') required dynamic? packageCharges,
    @JsonKey(name: 'rfp_store_id') required RfpStoreId? rfpStoreId,
    @JsonKey(name: 'delivery_mode_id') required int? deliveryModeId,
    @JsonKey(name: 'store_id') required dynamic? storeId,
    @DateTimeSerializer() required DateTime? createdAt,
    @JsonKey(name: "expiry_date")
    @DateTimeSerializer()
    required DateTime? expiryDate,
    required String? status,
    required List<Item>? item,
    required Eta? eta,
    @JsonKey(name: 'delivery_mode') required String? deliveryMode,
    required Schedule? schedule,
  }) = _Proposal;

  factory Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);
}

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    @JsonKey(name: "is_scheduled") required bool? isScheduled,
    @JsonKey(name: "scheduled_delivery_time")
    required String? scheduledDeliveryTime,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

@freezed
class RfpStoreId with _$RfpStoreId {
  const factory RfpStoreId({
    @JsonKey(name: 'createdAt') required String? createdAt,
    @JsonKey(name: 'updatedAt') required String? updatedAt,
    required int? id,
    @JsonKey(name: 'is_read') required bool? isRead,
    @JsonKey(name: 'is_specific') required bool? isSpecific,
    @JsonKey(name: 'rfp_id') required int? rfpId,
    @JsonKey(name: 'store_id') required int? storeId,
    @JsonKey(name: 'status_id') required int? statusId,
  }) = _RfpStoreId;

  factory RfpStoreId.fromJson(Map<String, dynamic> json) =>
      _$RfpStoreIdFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    @JsonKey(name: 'createdAt') required String? createdAt,
    @JsonKey(name: 'updatedAt') required String? updatedAt,
    required int? id,
    required String? title,
    required double? price,
    required int? quantity,
    @JsonKey(name: 'tax_ratio') required double? taxRatio,
    required String? requirements,
    required String? remarks,
    required String? image,
    @JsonKey(name: 'remarks_image') required String? remarksImage,
    @JsonKey(name: 'deletedAt') required dynamic? deletedAt,
    @JsonKey(name: 'proposal_id') required int? proposalId,
    @JsonKey(name: 'product_id') required int? productId,
    @JsonKey(name: 'total_price') required double? totalPrice,
    required String? description,
    @JsonKey(name: 'menu_promotion') required dynamic? menuPromotion,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Eta with _$Eta {
  const factory Eta({
    required double? max,
    required double? min,
    required double? avg,
  }) = _Eta;

  factory Eta.fromJson(Map<String, dynamic> json) => _$EtaFromJson(json);
}

@freezed
class Fees with _$Fees {
  const factory Fees({
    @JsonKey(name: 'waspha_fees_from') required FeesFrom? wasphaFeesFrom,
    @JsonKey(name: 'vendor_fees_from') required FeesFrom? vendorFeesFrom,
  }) = _Fees;

  factory Fees.fromJson(Map<String, dynamic> json) => _$FeesFromJson(json);
}

@freezed
class FeesFrom with _$FeesFrom {
  const factory FeesFrom({
    required List<UserFees>? user,
    required List<VendorFees>? vendor,
  }) = _FeesFrom;

  factory FeesFrom.fromJson(Map<String, dynamic> json) =>
      _$FeesFromFromJson(json);
}

@freezed
class UserFees with _$UserFees {
  const factory UserFees({
    required String? key,
    required String? label,
    required String? type,
    required double? value,
    @JsonKey(name: 'calculated_value') required double? calculatedValue,
  }) = _UserFees;

  factory UserFees.fromJson(Map<String, dynamic> json) =>
      _$UserFeesFromJson(json);
}

@freezed
class VendorFees with _$VendorFees {
  const factory VendorFees({
    required String? key,
    required String? label,
    required String? type,
    required double? value,
    @JsonKey(name: 'calculated_value') required double? calculatedValue,
  }) = _VendorFees;

  factory VendorFees.fromJson(Map<String, dynamic> json) =>
      _$VendorFeesFromJson(json);
}

@freezed
class Delivery with _$Delivery {
  const factory Delivery({
    required String? key,
    required String? label,
    required String? type,
    required double? value,
    @JsonKey(name: 'calculated_value') required double? calculatedValue,
  }) = _Delivery;

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);
}

@freezed
class Profit with _$Profit {
  const factory Profit({
    required double? credit,
    required double? debit,
    @JsonKey(name: 'total_earning') required double? totalEarning,
    required double? settlement,
  }) = _Profit;

  factory Profit.fromJson(Map<String, dynamic> json) => _$ProfitFromJson(json);
}
