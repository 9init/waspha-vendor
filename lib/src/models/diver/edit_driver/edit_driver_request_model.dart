import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_driver_request_model.g.dart';
@JsonSerializable(explicitToJson: true)
class EditDriverRequestModel  {
  final int? id;
  final String? name;
  final String? contact;
  final String? avatar;
  final DriverVehicle? vehicle;

  const EditDriverRequestModel({
    this.id,
    this.name,
    this.contact,
    this.avatar,
    this.vehicle,
  });

  Map<String, dynamic> toJson() => _$EditDriverRequestModelToJson(this);
}
@JsonSerializable(explicitToJson: true)

class DriverVehicle {
  final String? name;
  @JsonKey(name: 'number_plate')final String? numberPlate;
  final String? type;

  const DriverVehicle({
    this.name,
    this.numberPlate,
    this.type,
  });

  Map<String, dynamic> toJson() => _$DriverVehicleToJson(this);
}
