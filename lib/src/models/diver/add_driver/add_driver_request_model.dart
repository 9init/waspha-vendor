import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_driver_request_model.g.dart';
@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  checked: true,
  createToJson: true,
)
class AddDriverRequestModel {
  final String name;
  final DriverContactRequestModel contact;
  final String email;
  final String password;

  @JsonKey(name: 'vehicle_id')
  final int vehicleId;
  @JsonKey(name: 'is_online')
  final bool isOnline;
  final String avatar;

  const AddDriverRequestModel({
    required this.name,
    required this.contact,
    required this.email,
    required this.password,
    required this.vehicleId,
    required this.isOnline,
    required this.avatar,
  });

  Map<String, dynamic> toJson() => _$AddDriverRequestModelToJson(this);

  factory AddDriverRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddDriverRequestModelFromJson(json);
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  checked: true,
  createToJson: true,
)
class DriverContactRequestModel{
  @JsonKey(name: 'phone_code')
  final String countryCode;
  final String number;

  const DriverContactRequestModel({
    required this.countryCode,
    required this.number,
  });

  Map<String, dynamic> toJson() => _$DriverContactRequestModelToJson(this);

  factory DriverContactRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DriverContactRequestModelFromJson(json);
}
