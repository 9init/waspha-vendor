import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vendor/core/constans/dimension/dimensions.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class InsightsBody extends StatelessWidget {
  const InsightsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40)
    ];
    return Column(
      children: [
        Container(
          width: 350.w,
          height: 300.h,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                color: WasphaColors.primary,
                markerSettings: MarkerSettings(
                  color: WasphaColors.redColor,
                  isVisible: true,
                ),
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  showCumulativeValues: true,
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    color: WasphaColors.blackColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Card(
          child: Container(
              height: 180.h,
              width: 348.w,
              decoration: BoxDecoration(
                color: WasphaColors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: WasphaColors.grey300.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'January',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: AppDimensions.textSizeExtraLarge,
                                ),
                          ),
                          Text(
                            '2022',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: WasphaColors.darkBlackColor,
                        ),
                      ),
                    ],
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Delivery fee',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: AppDimensions.textSizeExtraLarge,
                                  ),
                            ),
                            Expanded(
                              child: Text(
                                '2022',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: WasphaColors.grey200,
                        ),
                        Column(
                          children: [
                            Text(
                              'ETA',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: AppDimensions.textSizeExtraLarge,
                                  ),
                            ),

                            Expanded(
                              child: Text(
                                '2022',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: WasphaColors.grey200,
                        ),
                        Column(
                          children: [
                            Text(
                              'Orders',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: AppDimensions.textSizeExtraLarge,
                                  ),
                            ),
                            Text(
                              '2022',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ).PaddingColumn(
                  paddingLeft: 50, paddingRight: 50, paddingTop: 20)),
        ).wrapCenter()
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
