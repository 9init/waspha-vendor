import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/commission/commission_model.dart';
import 'package:vendor/src/models/earning/earning_model.dart';
import 'package:vendor/src/models/payment_methods/payment_methods_model.dart';
import 'package:vendor/src/models/store/store_model.dart';
import 'package:vendor/src/models/store_review/store_review_model.dart';
import 'package:vendor/src/shared/networking/Networking.dart';
import 'package:vendor/src/shared/networking/results.dart';
import 'package:vendor/src/view/home/viewmodel.dart';

class StoreRepository {
  static Future<StoreModel?> profile() async {
    final result = await Networking.post("/store-profile", {});

    final value = switch (result) {
      Success(value: final value) => StoreModel.fromJson(value.data["data"]),
      _ => null,
    };

    return value;
  }

  static Future<PaymentMethods?> getPaymentMethods() async {
    final result = await Networking.get("/payment-methods");

    final value = switch (result) {
      Success(:final value) => PaymentMethods.fromJson(value.data["data"]),
      _ => null,
    };

    return value;
  }

  static Future<PaymentMethods?> updatePaymentMethods(
      PaymentMethods method) async {
    final result =
        await Networking.post("/payment-methods", method.expandedJson);

    final value = switch (result) {
      Success(:final value) => PaymentMethods.fromJson(value.data["data"]),
      _ => null,
    };

    return value;
  }

  static Future<CommissionModel?> getCommission() async {
    final result = await Networking.get("/commission");

    final value = switch (result) {
      Success(value: final value) =>
        CommissionModel.fromJson(value.data["data"]),
      _ => null,
    };

    return value;
  }

  static Future<bool> updateStoreAttributes(HomeModel attributes) async {
    final result = await Networking.post(
      "/update-store-attributes",
      {
        "is_online": attributes.isStoreOnline,
        "delivery": attributes.isDeliveryEnabled,
        "pickup": attributes.isPickupEnabled
      },
    );
    return result is Success;
  }

  static Future<EarningModel?> storeEarnings() async {
    final result = await Networking.post("/transactions-listing", {});

    final value = switch (result) {
      Success(value: final value) => EarningModel.fromJson(value.data["data"]),
      _ => null,
    };

    return value;
  }

  static Future<StoreReviewModel?> storeReviews() async {
    final result = await Networking.post("/store-reviews-ratings", {});

    return switch (result) {
      Success(:final value) => StoreReviewModel.fromJson(value.data["data"]),
      _ => null,
    };
  }

  static final earningsProvider = FutureProvider((ref) => storeEarnings());
  static final storeProvider = FutureProvider((ref) => profile());
  static final storeReviewProvider =
      AutoDisposeFutureProvider((ref) => storeReviews());
  static final storeCommissionProvider =
      AutoDisposeFutureProvider((ref) => getCommission());
}
