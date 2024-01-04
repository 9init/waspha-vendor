import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/constans/api/end_points/waspha_vendor_end_points.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_request_model.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
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

  static Future<GetDriverByIdResponseModel?> getDriverById({
    required String driverId,
  }) async {
    final data = GetDriverByIdRequestModel(driverId: driverId).toJson();
    final response =
        await Networking.post(WasphaVendorEndPoints.getDriverById, data);
  }

  static final storeDriverProvider =
      AutoDisposeFutureProvider.family<List<DriverModel>?, DriverType>(
          (ref, arg) => getStoreDrivers(arg));
}
