import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vendor/src/models/location/location_model.dart';
import 'package:vendor/src/shared/serializable/driver_type.dart';

part 'driver_model.freezed.dart';

part 'driver_model.g.dart';

enum DriverType { ONLINE, OFFLINE, EXPRESS }

@Freezed(fromJson: true, toJson: false)
class DriverModel with _$DriverModel {
  const factory DriverModel({
    required int id,
    String? name,
    String? contact,
    String? avatar,
    String? email,
    Location? location,
    @DriverTypeConverter() DriverType? type,
    @JsonKey(name: 'ride_status') bool? rideStatus,
    @JsonKey(name: 'proposal_id') int? proposalId,
    @JsonKey(name: 'country_code') String? countryCode,
    @JsonKey(name: 'is_online') bool? isOnline,
    @JsonKey(name: 'vehicle_id') int? vehicleId,
    @JsonKey(name: 'rc_id') String? rcId,
    @JsonKey(name: 'rc_username') String? rcUsername,
    @JsonKey(name: 'avg_rating') num? avgRating,
  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);
}
