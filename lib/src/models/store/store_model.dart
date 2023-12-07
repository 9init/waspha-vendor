import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class StoreModel with _$StoreModel {
  const factory StoreModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'is_approved') bool? isApproved,
    String? message,
    @JsonKey(name: 'name') LocalizedName? name,
    @JsonKey(name: 'is_online') bool? isOnline,
    bool? delivery,
    bool? pickup,
    String? avatar,
    String? image,
    Map<String, List<StoreTimings>>? timings,
    @JsonKey(name: 'average_rating') double? averageRating,
    @JsonKey(name: 'proposal_prep_time') int? proposalPrepTime,
    @JsonKey(name: 'proposal_selection_time') int? proposalSelectionTime,
    @JsonKey(name: 'location') StoreLocation? location,
    String? phone,
    @JsonKey(name: 'delivery_range') int? deliveryRange,
    List<int>? categories,
    List<int>? subcategories,
    List<String>? documents,
    @JsonKey(name: 'unread_counts') UnreadCounts? unreadCounts,
    @JsonKey(name: 'unviewed_counts') UnviewedCounts? unviewedCounts,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}

@freezed
class LocalizedName with _$LocalizedName {
  const factory LocalizedName({
    String? en,
    String? ar,
  }) = _LocalizedName;

  factory LocalizedName.fromJson(Map<String, dynamic> json) =>
      _$LocalizedNameFromJson(json);
}

@freezed
class StoreTimings with _$StoreTimings {
  const factory StoreTimings({
    @JsonKey(name: 'from') DateTime? from,
    @JsonKey(name: 'to') DateTime? to,
  }) = _StoreTimings;

  factory StoreTimings.fromJson(Map<String, dynamic> json) =>
      _$StoreTimingsFromJson(json);
}

@freezed
class StoreLocation with _$StoreLocation {
  const factory StoreLocation({
    String? address,
    double? lat,
    double? lng,
  }) = _StoreLocation;

  factory StoreLocation.fromJson(Map<String, dynamic> json) =>
      _$StoreLocationFromJson(json);
}

@freezed
class UnreadCounts with _$UnreadCounts {
  const factory UnreadCounts({
    int? notifications,
    int? orders,
    int? latestOrders,
    int? dashboard,
    int? acceptedOrders,
    int? wasphaBox,
  }) = _UnreadCounts;

  factory UnreadCounts.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountsFromJson(json);
}

@freezed
class UnviewedCounts with _$UnviewedCounts {
  const factory UnviewedCounts({
    int? notifications,
  }) = _UnviewedCounts;

  factory UnviewedCounts.fromJson(Map<String, dynamic> json) =>
      _$UnviewedCountsFromJson(json);
}
