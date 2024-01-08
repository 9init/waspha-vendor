import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vendor/core/constans/api/end_points/waspha_vendor_end_points.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_request_model.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/shared/networking/networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

part 'get_driver_by_id_repository.g.dart';

@riverpod
class GetDriverByIdRepository extends _$GetDriverByIdRepository {
  Future<GetDriverByIdResponseModel?> getDriverById(
      {required GetDriverByIdRequestModel getDriverByIdRequestModel}) async {
    final data =
        GetDriverByIdRequestModel(driverId: getDriverByIdRequestModel.driverId)
            .toJson();
    final response = await Networking.post(
      WasphaVendorEndPoints.getDriverById,
      data,
    );
    final result = switch (response) {
      Success(:final value) => () {
          try {
            debugPrint('The Value Is ${value.data}');

            return GetDriverByIdResponseModel.fromJson(value.data);

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
  FutureOr<GetDriverByIdResponseModel?> build(
      {required GetDriverByIdRequestModel getDriverByIdRequestModel}) async{
    return  getDriverById(
        getDriverByIdRequestModel: getDriverByIdRequestModel);
  }
}
