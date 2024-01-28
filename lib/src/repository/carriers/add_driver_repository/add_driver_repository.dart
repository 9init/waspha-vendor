import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vendor/core/constans/api/end_points/waspha_vendor_end_points.dart';
import 'package:vendor/src/models/diver/add_driver/add_driver_request_model.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/shared/networking/networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

part 'add_driver_repository.g.dart';

@riverpod
class AddDriverRepository extends _$AddDriverRepository {
  Future<GetDriverByIdResponseModel?> addDriver(
      {required AddDriverRequestModel addDriverRequestModel}) async {
    final data = AddDriverRequestModel(
            name: addDriverRequestModel.name,
            contact: DriverContactRequestModel(
              countryCode: addDriverRequestModel.contact.countryCode,
              number: addDriverRequestModel.contact.number,
            ),
            email: addDriverRequestModel.email,
            password: addDriverRequestModel.password,
            vehicleId: addDriverRequestModel.vehicleId,
            isOnline: addDriverRequestModel.isOnline,
            avatar: addDriverRequestModel.avatar)
        .toJson();
    final response = await Networking.post(
      WasphaVendorEndPoints.addDriver,
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
      {required AddDriverRequestModel addDriverRequestModel}) async {
    return addDriver(addDriverRequestModel: addDriverRequestModel);
  }
}
