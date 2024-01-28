import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_driver_response_model.freezed.dart';
part 'delete_driver_response_model.g.dart';
@Freezed(fromJson: true,toJson: false)
class DeleteDriverResponseModel with _$DeleteDriverResponseModel {
  const factory DeleteDriverResponseModel({
    bool? status,
    String? message,
  }) = _DeleteDriverResponseModel;
  factory DeleteDriverResponseModel.fromJson(Map<String,dynamic>json)=>_$DeleteDriverResponseModelFromJson(json);
}
