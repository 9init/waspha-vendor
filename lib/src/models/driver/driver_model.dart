import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vendor/src/models/location/location_model.dart';
import 'package:vendor/src/shared/serializable/driver_type.dart';

part 'driver_model.freezed.dart';
part 'driver_model.g.dart';

enum DriverType { ONLINE, OFFLINE, EXPRESS }

@freezed
class DriverModel with _$DriverModel {
  const factory DriverModel({
    required int id,
    required String name,
    required String contact,
    String? avatar,
    String? email,
    Location? location,
    @DriverTypeConverter() required DriverType type,
    @JsonKey(name: 'ride_status') required bool rideStatus,
    @JsonKey(name: 'proposal_id') int? proposalId,
    @JsonKey(name: 'country_code') required String countryCode,
    @JsonKey(name: 'is_online') required bool isOnline,
    @JsonKey(name: 'vehicle_id') required int vehicleId,
    @JsonKey(name: 'rc_id') String? rcId,
    @JsonKey(name: 'rc_username') String? rcUsername,
    @JsonKey(name: 'avg_rating') required double avgRating,
  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);
}
