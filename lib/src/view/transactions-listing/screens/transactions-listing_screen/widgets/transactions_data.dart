import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:vendor/core/constans/const_strings/const_strings.dart';
import 'package:vendor/core/constans/index.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/transactions-listing/transactions_listing_response_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/shadow_container/sahdow_container.dart';

class TransactionsData extends StatelessWidget {
  const TransactionsData({Key? key, required this.transactions})
      : super(key: key);
  final Transactions transactions;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      borderRadius: BorderRadius.circular(20.r),
      height: 175,
      width: 348,
      color: WasphaColors.white,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    '${DateFormat(DateFormatStyle.nameOfDayFormat)
                        .format(
                      DateTime.parse(transactions.earningDate!),
                    )}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                        fontSize:
                        AppDimensions.textSizeSmall),
                  ),
                  Text(
                      '${DateFormat(DateFormatStyle.dayMonthYear)
                          .format(
                        DateTime.parse(transactions.earningDate!),
                      )}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  color: WasphaColors.blackColor,
                ),
              ),
            ],
          ),
          Gap(15.h),
          IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      context.localization.net_profit,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                    ),
                    Text(
                      '${transactions.report!
                          .totalEarning!}',
                      style:
                      Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                  ],
                ),
                Gap(20.w),
                VerticalDivider(),
                Gap(20.w),
                Column(
                  children: [
                    Text(
                      context.localization.settlement,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                    ),
                    Text(
                      '${transactions.report!
                          .settlement!}',
                      style:
                      Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
