import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_listing_request_model.freezed.dart';

part 'transactions_listing_request_model.g.dart';

@Freezed(fromJson: false, toJson: true)
class TransactionsListingRequestModel with _$TransactionsListingRequestModel {
  const factory TransactionsListingRequestModel({
    @JsonKey(name: 'start') required String startDate,
    @JsonKey(name: 'end') required String endDate,
  }) = _TransactionsListingRequestModel;
}
