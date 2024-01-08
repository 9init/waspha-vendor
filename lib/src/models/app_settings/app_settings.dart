import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';
//TODO://CHECK THIS

@Freezed(fromJson: true,toJson: false)
class AppSettings with _$AppSettings {
  const factory AppSettings({
    // @JsonKey(name: 'translations_updated_at') String? translationsUpdatedAt,
    // List<Category>? categories,
    // @JsonKey(name: 'delivery_modes') List<DeliveryMode>? deliveryModes,
    @JsonKey(name: 'delivery_vehicles') List<DeliveryVehicle>? deliveryVehicles,
    // @JsonKey(name: 'vendor_rejection_reasons')
    // List<RejectionReason>? vendorRejectionReasons,
    // @JsonKey(name: 'vendor_cancellation_reasons')
    // List<CancellationReason>? vendorCancellationReasons,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}

@Freezed(fromJson: true,toJson: false)
class Category with _$Category {
  const factory Category({
    int? id,
    LocalizedName? name,
    String? slug,
    String? image,
    @JsonKey(name: 'parent_id') int? parentId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@Freezed(fromJson: true,toJson: false)
class DeliveryMode with _$DeliveryMode {
  const factory DeliveryMode({
    int? id,
    String? name,
    LocalizedName? title,
    LocalizedName? subtitle,
    ImageUrls? image,
  }) = _DeliveryMode;

  factory DeliveryMode.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModeFromJson(json);
}

@Freezed(fromJson: true,toJson: false)
class DeliveryVehicle with _$DeliveryVehicle {
  const factory DeliveryVehicle({
    int? id,
    String? name,
    @JsonKey(name: 'display_name') String? displayName,
    LocalizedName? title,
    LocalizedName? subtitle,
    ImageUrls? image,
  }) = _DeliveryVehicle;

  factory DeliveryVehicle.fromJson(Map<String, dynamic> json) =>
      _$DeliveryVehicleFromJson(json);
}

@Freezed(fromJson: true,toJson: false)
class RejectionReason with _$RejectionReason {
  const factory RejectionReason({
    int? id,
    LocalizedName? value,
  }) = _RejectionReason;

  factory RejectionReason.fromJson(Map<String, dynamic> json) =>
      _$RejectionReasonFromJson(json);
}

@Freezed(fromJson: true,toJson: false)
class CancellationReason with _$CancellationReason {
  const factory CancellationReason({
    int? id,
    LocalizedName? value,
  }) = _CancellationReason;

  factory CancellationReason.fromJson(Map<String, dynamic> json) =>
      _$CancellationReasonFromJson(json);
}

@Freezed(fromJson: true,toJson: false)

class LocalizedName with _$LocalizedName {
  const factory LocalizedName({
    String? en,
    String? ar,
  }) = _LocalizedName;

  factory LocalizedName.fromJson(Map<String, dynamic> json) =>
      _$LocalizedNameFromJson(json);
}

@Freezed(fromJson: true,toJson: false)
class ImageUrls with _$ImageUrls {
  const factory ImageUrls({
    @JsonKey(name: 'white') String? white,
    @JsonKey(name: 'color') String? color,
  }) = _ImageUrls;

  factory ImageUrls.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlsFromJson(json);
}
