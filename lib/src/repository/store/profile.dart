import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/earning/earning_model.dart';
import 'package:vendor/src/models/store/store_model.dart';
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

    debugPrint(value.toString());
    return value;
  }

  static final earningsProvider =
      FutureProvider<EarningModel?>((ref) => storeEarnings());

  static final storeProvider = FutureProvider<StoreModel?>((ref) => profile());
}
