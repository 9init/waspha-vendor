import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_driver_by_id_response_model.freezed.dart';

part 'get_driver_by_id_response_model.g.dart';

@Freezed(fromJson: true, toJson: false)
class GetDriverByIdResponseModel with _$GetDriverByIdResponseModel {
  const factory GetDriverByIdResponseModel({
    bool? status,
    GetDriverDataByIdResponseModel? data,
    String? message,
  }) = _GetDriverByIdResponseModel;
  factory GetDriverByIdResponseModel.fromJson(Map<String,dynamic>json)=>_$GetDriverByIdResponseModelFromJson(json);
}

@Freezed(fromJson: true, toJson: false)
class GetDriverDataByIdResponseModel with _$GetDriverDataByIdResponseModel {
  const factory GetDriverDataByIdResponseModel({
    int? id,
    @JsonKey(name: 'country_code')String? countryCode,
    String? name,
    String? contact,
    String? type,
    String? avatar,
    String? status,
    DriverReport? report,
    DriverVehicle? vehicle,
    DriverRating? rating,
  }) = _GetDriverDataByIdResponseModel;
  factory GetDriverDataByIdResponseModel.fromJson(Map<String,dynamic>json)=>_$GetDriverDataByIdResponseModelFromJson(json);

}

@Freezed(fromJson: true, toJson: false)
class DriverReport with _$DriverReport {
  const factory DriverReport({
    @JsonKey(name: 'wallet_debit_amount') num? walletDebitAmount,
    @JsonKey(name: 'total_orders') num? totalOrders,
    @JsonKey(name: 'today_orders') num? todayOrders,
    @JsonKey(name: 'today_delivery_fees') num? todayDeliveryFees,
    @JsonKey(name: 'total_delivery_fees') num? totalDeliveryFees,
    @JsonKey(name: 'latest_order') String? latestOrder,
    @JsonKey(name: 'average_eta') num? averageEta,
  }) = _DriverReport;
  factory DriverReport.fromJson(Map<String,dynamic>json)=>_$DriverReportFromJson(json);

}

@Freezed(fromJson: true, toJson: false)
class DriverVehicle with _$DriverVehicle {
  const factory DriverVehicle({
    int? id,
    String? name,
   @JsonKey(name: 'number_plate') String? numberPlate,
    String? type,
    String? image,
    @JsonKey(name: 'color_image')String? colorImage,
    Title? title,
  }) = _DriverVehicle;
  factory DriverVehicle.fromJson(Map<String,dynamic>json)=>_$DriverVehicleFromJson(json);

}
@Freezed(fromJson: true, toJson: false)
class DriverRating with _$DriverRating {
  const factory DriverRating({
    double? rate,
    num? count,
  }) = _DriverRating;
  factory DriverRating.fromJson(Map<String,dynamic>json)=>_$DriverRatingFromJson(json);

}@Freezed(fromJson: true, toJson: false)
class Title with _$Title {
  const factory Title({
    String? en,
    String? ar,
  }) = _Title;
  factory Title.fromJson(Map<String,dynamic>json)=>_$TitleFromJson(json);

}
