import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_driver_request_model.g.dart';

@JsonSerializable(explicitToJson: true,includeIfNull: false,checked: true,createToJson: true,)
class EditDriverRequestModel {
  final int? id;
  final String? name;
  final String? contact;
  final String? avatar;
  @JsonKey(name: 'country_code')final String? countryCode;
  final DriverVehicleData? vehicle;

  const EditDriverRequestModel({
    this.id,
    this.name,
    this.contact,
    this.avatar,
    this.countryCode,
    this.vehicle,
  });

  Map<String, dynamic> toJson() => _$EditDriverRequestModelToJson(this);

  factory EditDriverRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditDriverRequestModelFromJson(json);
}

@JsonSerializable(explicitToJson: true,includeIfNull: false,checked: true,createToJson: true,)
class DriverVehicleData {
  final String? name;
  @JsonKey(name: 'number_plate')
  final String? numberPlate;
  final String? type;
final num? id;
  const DriverVehicleData({
    this.name,
    this.numberPlate,
    this.type,
    this.id,
  });

  Map<String, dynamic> toJson() => _$DriverVehicleDataToJson(this);

  factory DriverVehicleData.fromJson(Map<String, dynamic> json) =>
      _$DriverVehicleDataFromJson(json);
}
