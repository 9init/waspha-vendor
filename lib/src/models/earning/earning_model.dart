import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vendor/src/shared/serializable/datetime.dart';

part 'earning_model.freezed.dart';
part 'earning_model.g.dart';

@freezed
class EarningModel with _$EarningModel {
  const EarningModel._();
  const factory EarningModel({
    @JsonKey(name: 'total_orders') int? totalOrders,
    @JsonKey(name: 'total_net_profit') double? totalNetProfit,
    @JsonKey(name: 'total_settlement') double? totalSettlement,
    List<Transaction>? transactions,
  }) = _EarningModel;

  factory EarningModel.fromJson(Map<String, dynamic> json) =>
      _$EarningModelFromJson(json);

  // Getter to calculate todayProfit
  double? get todayProfit {
    // Check if transactions is null or empty
    if (transactions == null || transactions!.isEmpty) {
      return null; // Return null if there are no transactions
    }

    // Get the current date and time
    DateTime today = DateTime.now();

    // Calculate totalEarning for transactions with earningDate equal to today
    return transactions
        ?.where((transaction) =>
            transaction.earningDate?.year == today.year &&
            transaction.earningDate?.month == today.month &&
            transaction.earningDate?.day == today.day)
        .map((transaction) => transaction.report?.totalEarning ?? 0)
        .fold(0.0, (value, element) => (value ?? 0) + element);
  }
}

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @JsonKey(name: 'rfp_id') int? rfpId,
    @JsonKey(name: 'user_avatar') String? userAvatar,
    @JsonKey(name: 'store_avatar') String? storeAvatar,
    @DateTimeSerializer() @JsonKey(name: 'earning_date') DateTime? earningDate,
    @JsonKey(name: 'proposal_id') int? proposalId,
    @JsonKey(name: 'proposal_type') String? proposalType,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    int? sid,
    @JsonKey(name: 'subcategoory_name_ar') String? subcategoryNameAr,
    @JsonKey(name: 'categoory_name_ar') String? categoryNameAr,
    Category? category,
    Report? report,
    @JsonKey(name: 'driver_avatar') String? driverAvatar,
    @JsonKey(name: 'vehicle_avatar') String? vehicleAvatar,
    @JsonKey(name: 'delivery_type') String? deliveryType,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'parent_category') ParentCategory? parentCategory,
    Subcategory? subcategory,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class ParentCategory with _$ParentCategory {
  const factory ParentCategory({
    String? en,
  }) = _ParentCategory;

  factory ParentCategory.fromJson(Map<String, dynamic> json) =>
      _$ParentCategoryFromJson(json);
}

@freezed
class Subcategory with _$Subcategory {
  const factory Subcategory({
    String? en,
  }) = _Subcategory;

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
}

@freezed
class Report with _$Report {
  const factory Report({
    double? credit,
    double? debit,
    @JsonKey(name: 'total_earning') double? totalEarning,
    double? settlement,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
