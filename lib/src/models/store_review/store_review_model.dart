import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_review_model.freezed.dart';
part 'store_review_model.g.dart';

@freezed
abstract class StoreReviewModel with _$StoreReviewModel {
  const factory StoreReviewModel({
    @JsonKey(name: 'rating_average') required double ratingAverage,
    @JsonKey(name: 'reviews_ratings')
    required List<StoreReviewRating> reviewsRatings,
  }) = _StoreReviewModel;

  factory StoreReviewModel.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewModelFromJson(json);
}

@freezed
abstract class StoreReviewRating with _$StoreReviewRating {
  const factory StoreReviewRating({
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    required int id,
    required String? review,
    required int rating,
    @JsonKey(name: 'order_id') required int orderId,
    required StoreReviewUser user,
  }) = _StoreReviewRating;

  factory StoreReviewRating.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewRatingFromJson(json);
}

@freezed
abstract class StoreReviewUser with _$StoreReviewUser {
  const factory StoreReviewUser({
    required int id,
    required String name,
    required String? avatar,
  }) = _StoreReviewUser;

  factory StoreReviewUser.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewUserFromJson(json);
}
