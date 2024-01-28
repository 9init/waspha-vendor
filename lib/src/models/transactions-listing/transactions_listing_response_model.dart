import 'package:freezed_annotation/freezed_annotation.dart';
part 'transactions_listing_response_model.freezed.dart';
part 'transactions_listing_response_model.g.dart';
@Freezed(fromJson: true,toJson: false)
class TransactionsListingResponseModel with _$TransactionsListingResponseModel{
  const factory TransactionsListingResponseModel({
    bool? status,
    String? message,
    TransactionsListingData? data,

  })=_TransactionsListingResponseModel;
  factory TransactionsListingResponseModel.fromJson(Map<String,dynamic>json)=>_$TransactionsListingResponseModelFromJson(json);
}
@Freezed(fromJson: true,toJson: false)
class TransactionsListingData with _$TransactionsListingData{
  const factory TransactionsListingData({
    @JsonKey(name: 'total_orders') int? totalOrders,
    @JsonKey(name: 'total_net_profit') num? totalNetProfit,
    @JsonKey(name: 'total_settlement') num? totalSettlement,
    List<Transactions>? transactions,
  })=_TransactionsListingData;
  factory TransactionsListingData.fromJson(Map<String,dynamic>json)=>_$TransactionsListingDataFromJson(json);
}
@Freezed(fromJson: true,toJson: false)
class Transactions with _$Transactions{
  const factory Transactions({
    @JsonKey(name: 'rfp_id')int? rfpId,
    @JsonKey(name: 'user_avatar')String? userAvatar,
    @JsonKey(name: 'store_avatar')String? storeAvatar,
    @JsonKey(name: 'earning_date')String? earningDate,
    @JsonKey(name: 'proposal_id')  int? proposalId,
    @JsonKey(name: 'proposal_type') String? proposalType,
   @JsonKey(name: 'payment_method') String? paymentMethod,
    int? sid,
    String? subcategooryNameAr,
    String? categooryNameAr,
    // TransactionsCategory? category,
    TransactionsReport? report,
    String? driverAvatar,
    String? vehicleAvatar,
    String? deliveryType,

  })=_Transactions;
  factory Transactions.fromJson(Map<String,dynamic>json)=>_$TransactionsFromJson(json);
}
// @Freezed(fromJson: true,toJson: false)
// class TransactionsCategory with _$TransactionsCategory{
//   const factory TransactionsCategory({
//     int? totalOrders,
//     num? totalNetProfit,
//     num? totalSettlement,
//     List<Transactions>? transactions,
//   })=_TransactionsCategory;
//   factory TransactionsCategory.fromJson(Map<String,dynamic>json)=>_$TransactionsCategoryFromJson(json);
// }
@Freezed(fromJson: true,toJson: false)
class TransactionsReport with _$TransactionsReport{
  const factory TransactionsReport({
    int? credit,
    num? debit,
   @JsonKey(name: 'total_earning') num? totalEarning,
    num? settlement,
  })=_TransactionsReport;
  factory TransactionsReport.fromJson(Map<String,dynamic>json)=>_$TransactionsReportFromJson(json);
}
