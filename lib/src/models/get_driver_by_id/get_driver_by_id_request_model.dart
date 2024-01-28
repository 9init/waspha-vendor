import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_driver_by_id_request_model.freezed.dart';
part 'get_driver_by_id_request_model.g.dart';
@Freezed(fromJson: false,toJson: true)
class GetDriverByIdRequestModel with _$GetDriverByIdRequestModel{
  const factory GetDriverByIdRequestModel({
@JsonKey(name: 'driver_id')required  String driverId,
})=_GetDriverByIdRequestModel;
}