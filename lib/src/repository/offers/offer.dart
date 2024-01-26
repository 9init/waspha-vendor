import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/offer/offer_model.dart';
import 'package:vendor/src/shared/networking/networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

class OfferRepository {
  static Future<List<OfferModel>> getOffers(OfferStatus status) async {
    final result =
        await Networking.post("/proposal-listing", {"status": status.name});

    return switch (result) {
      Success(value: final value) => (value.data['data'] as List)
          .map((item) => OfferModel.fromJson(item))
          .toList(),
      _ => [],
    };
  }

  static final offersProviderFamily =
      FutureProvider.family<List<OfferModel>, OfferStatus>((ref, status) {
    return getOffers(status);
  });
}
