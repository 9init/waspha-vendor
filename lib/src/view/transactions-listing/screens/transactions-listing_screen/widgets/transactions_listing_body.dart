import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/transactions-listing/transactions_listing_request_model.dart';
import 'package:vendor/src/repository/transactions-listing/transactions-listing_repository.dart';
import 'package:vendor/src/view/transactions-listing/providers/transactions_listing_providers/calculate_start_and_end_time.dart';
import 'package:vendor/src/view/transactions-listing/screens/transactions-listing_screen/widgets/index.dart';

final selectedTimeRangeProvider = StateProvider<String>((ref) => 'weekly');

class TransactionsListingBody extends ConsumerWidget {
  const TransactionsListingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultStartDate = "2022-12-19T19:55:11.000Z";
    final defaultEndDate = "2022-12-26T14:16:54.000Z";
    final welcomeNotifierProviderr = ref.watch(welcomeNotifierProvider);
    if (welcomeNotifierProviderr.startTime != defaultStartDate ||
        welcomeNotifierProviderr.endTime != defaultEndDate) {
      ref.read(
        transactionsRepositoryProvider(
          transactionsListingRequestModel: TransactionsListingRequestModel(
            startDate: welcomeNotifierProviderr.startTime ?? defaultStartDate,
            endDate: welcomeNotifierProviderr.endTime ?? defaultEndDate,
          ),
        ),
      );
    }
    return ref
        .watch(
      transactionsRepositoryProvider(
        transactionsListingRequestModel: TransactionsListingRequestModel(
          startDate: welcomeNotifierProviderr.startTime ?? defaultStartDate,
          endDate: welcomeNotifierProviderr.endTime ?? defaultEndDate,
        ),
      ),
    )
        .when(
      data: (data) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
            Text(
              context.localization.insights,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            Gap(20.h),
            Row(
              children: [
                TimeRangeButton(
                  value: 'weekly',
                  text: 'Weekly',
                  onSelected: (String value) {
                    ref
                        .read(selectedTimeRangeProvider.notifier)
                        .state =
                        value;
                    ref
                        .read(welcomeNotifierProvider.notifier)
                        .calculateEndDate(value);
                  },
                ),
                TimeRangeButton(
                  value: 'monthly',
                  text: 'Monthly',
                  onSelected: (String value) async {
                    ref
                        .read(selectedTimeRangeProvider.notifier)
                        .state =
                        value;
                    ref
                        .read(welcomeNotifierProvider.notifier)
                        .calculateEndDate(value);
                  },
                ),
                TimeRangeButton(
                  value: 'yearly',
                  text: 'Yearly',
                  onSelected: (String value) {
                    ref
                        .read(selectedTimeRangeProvider.notifier)
                        .state =
                        value;
                    ref
                        .read(welcomeNotifierProvider.notifier)
                        .calculateEndDate(value);
                  },
                ),
              ],
            ).paddingRow(paddingLeft: 10, paddingRight: 10),
            Gap(20.h),
            TransactionsChartWidget(
              transactions: data!.data!.transactions!,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.data!.transactions!.length,
              itemBuilder: (context, index) =>
              TransactionsData(transactions: data.data!.transactions![index],),
            ),
            Gap(10.h),
          ],
        );
      },
      error: (e, s) => Text('The Error Is $e $s'),
      loading: () =>
          Center(
            child: CircularProgressIndicator.adaptive(),
          ),
    );
  }

}