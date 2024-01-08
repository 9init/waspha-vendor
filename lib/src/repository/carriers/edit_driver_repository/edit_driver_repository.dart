import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vendor/core/constans/api/end_points/waspha_vendor_end_points.dart';
import 'package:vendor/src/models/diver/edit_driver/edit_driver_request_model.dart';
import 'package:vendor/src/models/diver/edit_driver/edit_driver_respone_model.dart';
import 'package:vendor/src/shared/networking/networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

part 'edit_driver_repository.g.dart';

@riverpod
class EditDriverRepository extends _$EditDriverRepository {
  Future<EditDriverResponseModel?> editDriver(
      {required EditDriverRequestModel editDriverRequestModel}) async {
    final data = EditDriverRequestModel(
        id: editDriverRequestModel.id,
        name: editDriverRequestModel.name,
        contact: editDriverRequestModel.contact,
        avatar: editDriverRequestModel.avatar,
        vehicle: DriverVehicle(
          name: editDriverRequestModel.vehicle?.name,
          numberPlate: editDriverRequestModel.vehicle?.numberPlate,
          type: editDriverRequestModel.vehicle?.type,
        )).toJson();
    final response = await Networking.post(
      WasphaVendorEndPoints.editDriver,
      data,
    );
    final result = switch (response) {
      Success(:final value) => () {
          try {
            debugPrint('The Value Is ${value.data}');
            return EditDriverResponseModel.fromJson(value.data);
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
  FutureOr<EditDriverResponseModel?> build(
      {required EditDriverRequestModel editDriverRequestModel}) async {
    return editDriver(editDriverRequestModel: editDriverRequestModel);
  }
}
