import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vendor/core/constans/const_strings/const_strings.dart';
import 'package:vendor/src/models/transactions-listing/transactions_listing_response_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class TransactionsChartWidget extends StatelessWidget {
  const TransactionsChartWidget({Key? key, required this.transactions})
      : super(key: key);
  final List<Transactions> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 300.h,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        series: <CartesianSeries<Transactions, String>>[
          ColumnSeries<Transactions, String>(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.r),
              topLeft: Radius.circular(8.r),
            ),
            width: 0.34.w,
            dataSource: transactions ,
            color: WasphaColors.primary,
            xValueMapper: (Transactions sales, _) {
              final reformatDate = DateFormat(DateFormatStyle.dayMonthYear).format(
                DateTime.parse(sales.earningDate ?? ''),
              );
              return reformatDate;
            },
            yValueMapper: (Transactions sales, _) => sales.report?.totalEarning,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(
                fontSize: 10.sp,
                color: WasphaColors.blackColor,
              ),
            ),
          ),
        ],
        // tooltipBehavior: _tooltipBehavior,
      ),
    );
  }
}
