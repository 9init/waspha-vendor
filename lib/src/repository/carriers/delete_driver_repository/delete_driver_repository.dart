import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vendor/core/constans/api/end_points/waspha_vendor_end_points.dart';
import 'package:vendor/src/models/diver/delete_driver/delete_driver_request_model.dart';
import 'package:vendor/src/models/diver/delete_driver/delete_driver_response_model.dart';
import 'package:vendor/src/shared/networking/networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

part 'delete_driver_repository.g.dart';

@riverpod
class DeleteDriverRepository extends _$DeleteDriverRepository {
  Future<DeleteDriverResponseModel?> deleteDriverById(
      {required DeleteDriverRequestModel deleteDriverRequestModel}) async {
    final data =
        DeleteDriverRequestModel(id: deleteDriverRequestModel.id).toJson();
    final response = await Networking.post(
      WasphaVendorEndPoints.deleteDriver,
      data,
    );
    final result = switch (response) {
      Success(:final value) => () {
          try {
            debugPrint('The Value Is ${value.data}');
            return DeleteDriverResponseModel.fromJson(value.data);
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
  FutureOr<DeleteDriverResponseModel?> build(
      {required DeleteDriverRequestModel deleteDriverRequestModel}) async {
    return deleteDriverById(deleteDriverRequestModel: deleteDriverRequestModel);
  }
}
