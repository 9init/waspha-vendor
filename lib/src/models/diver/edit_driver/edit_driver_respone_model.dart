import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_driver_respone_model.freezed.dart';
part 'edit_driver_respone_model.g.dart';
@Freezed(fromJson: true,toJson: false)
class EditDriverResponseModel with _$EditDriverResponseModel {
  const factory EditDriverResponseModel({
    bool? status,
    String? message,
  }) = _EditDriverResponseModel;
  factory EditDriverResponseModel.fromJson(Map<String,dynamic>json)=>_$EditDriverResponseModelFromJson(json);

}
