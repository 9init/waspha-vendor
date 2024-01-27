import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_driver_response_model.freezed.dart';
part 'add_driver_response_model.g.dart';
@Freezed(fromJson: true,toJson: false)
class AddDriverResponseModel with _$AddDriverResponseModel{
  const factory AddDriverResponseModel({
    bool? status,
    String? message,

  })=_AddDriverResponseModel;
  factory AddDriverResponseModel.fromJson(Map<String,dynamic>json)=>_$AddDriverResponseModelFromJson(json);

}