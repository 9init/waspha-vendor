import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vendor/src/models/driver/driver_model.dart';

class DriverTypeConverter implements JsonConverter<DriverType, String> {
  const DriverTypeConverter();

  @override
  DriverType fromJson(String value) {
    return DriverType.values.firstWhere(
      (e) => e.toString().split('.').last.toUpperCase() == value.toUpperCase(),
      orElse: () => DriverType.ONLINE,
    );
  }

  @override
  String toJson(DriverType type) {
    return type.toString().split('.').last.toLowerCase();
  }
}
