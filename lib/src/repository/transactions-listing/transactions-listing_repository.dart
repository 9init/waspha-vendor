import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vendor/core/constans/api/end_points/waspha_vendor_end_points.dart';
import 'package:vendor/src/models/transactions-listing/transactions_listing_request_model.dart';
import 'package:vendor/src/models/transactions-listing/transactions_listing_response_model.dart';
import 'package:vendor/src/shared/networking/networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

part 'transactions-listing_repository.g.dart';

@riverpod
class TransactionsRepository extends _$TransactionsRepository {
  Future<TransactionsListingResponseModel?> getTransactionsListing(
      {required TransactionsListingRequestModel
          transactionsListingRequestModel}) async {
    final data = TransactionsListingRequestModel(
            startDate: transactionsListingRequestModel.startDate,
            endDate: transactionsListingRequestModel.endDate)
        .toJson();
    final response = await Networking.post(
      WasphaVendorEndPoints.transactionsListing,
      data,
    );
    final result = switch (response) {
      Success(:final value) => () {
          try {
            debugPrint('The Value Is ${value.data}');
            return TransactionsListingResponseModel.fromJson(value.data);
          } catch (e) {
            debugPrint('The Error Is $e');
            return null;
          }
        }(),
      _ => null,
    };
    return result;
  }

  @override
  FutureOr<TransactionsListingResponseModel?> build(
      {required TransactionsListingRequestModel
          transactionsListingRequestModel}) async {
    return getTransactionsListing(
        transactionsListingRequestModel: transactionsListingRequestModel);
  }
}
