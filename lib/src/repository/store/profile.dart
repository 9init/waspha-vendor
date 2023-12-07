import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/store/store_model.dart';
import 'package:vendor/src/shared/networking/Networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

class StoreRepository {
  static Future<StoreModel?> profile() async {
    final result = await Networking.post("/store-profile", {});

    final value = switch (result) {
      Success(value: final value) => StoreModel.fromJson(value.data["data"]),
      _ => null,
    };

    return value;
  }

  static final storeProvider = FutureProvider<StoreModel?>((ref) => profile());
}
