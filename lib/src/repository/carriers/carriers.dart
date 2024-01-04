import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/shared/networking/Networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

class CarriersRepository {
  static Future<List<DriverModel>?> getStoreDrivers(DriverType type) async {
    final result = await Networking.post(
      "/store-drivers",
      {"type": type.name.toLowerCase()},
    );
    final value = switch (result) {
      Success(:final value) => () {
          try {
            return (value.data['data'] as List)
                .map((item) => DriverModel.fromJson(item))
                .toList();
          } catch (e) {
            return null;
          }
        }(),
      _ => null,
    };
    return value;
  }

  static final storeDriverProvider =
      AutoDisposeFutureProvider.family<List<DriverModel>?, DriverType>(
          (ref, arg) => getStoreDrivers(arg));
}
