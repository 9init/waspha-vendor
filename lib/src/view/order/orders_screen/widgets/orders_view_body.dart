import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor/core/constans/dimension/dimensions.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/user_avatar/user_avatar.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            // width: 350.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              color: WasphaColors.white,
            ),
            child: EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              headerProps: const EasyHeaderProps(
                padding: EdgeInsets.symmetric(horizontal: 50),
                monthPickerType: MonthPickerType.switcher,
                selectedDateFormat: SelectedDateFormat.fullDateDMY,
              ),
              dayProps: const EasyDayProps(
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: WasphaColors.blackColor),
                ),
              ),
            ),
          ),
        ),
        Gap(10.h),
        Card(
          elevation: 2,
          child: Container(
            width: 350.w,
            height: 230.h,
            decoration: BoxDecoration(
              color: WasphaColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Order#128',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color: WasphaColors.blackColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  '25/11/2022',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    UserAvatar(
                      radius: 25.r,
                      backgroundColor: WasphaColors.greyColor,
                      imageType: BackgroundImageType.network,
                      imageUrl: '',
                    ),
                    Gap(20.w),
                    Expanded(
                      child: Text(
                        '51 Smoha Midan ama nwellsquear alexndria egypt',
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Delivery fee',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontSize: AppDimensions.textSizeMedium),
                          ),
                          Text(
                            'EGP 5.85',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: WasphaColors.grey200,
                        thickness: 2,
                      ),
                      Column(
                        children: [
                          Text(
                            'ETA',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontSize: AppDimensions.textSizeMedium),
                          ),
                          Text(
                            '25 min',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ).paddingRow(paddingLeft: 10, paddingRight: 10),
                )
              ],
            ).PaddingColumn(paddingRight: 30, paddingLeft: 30),
          ),
        )
      ],
    );
  }
}
