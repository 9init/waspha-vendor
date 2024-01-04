import 'package:vendor/core/constans/api/end_points/waspha_vendor_end_points.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_request_model.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/shared/networking/Networking.dart';

class GetDriverByIdRepository {
  static Future<GetDriverByIdResponseModel?> getDriverById({
    required String driverId,
  }) async {
    final data = GetDriverByIdRequestModel(driverId: driverId).toJson();
    final response =
        await Networking.post(WasphaVendorEndPoints.getDriverById, data);
  }
}
