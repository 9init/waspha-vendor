import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor/core/constans/index.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/shadow_container/sahdow_container.dart';

class CarrierStatistics extends StatelessWidget {
  const CarrierStatistics({Key? key,  this.getDriverDataByIdResponseModel}) : super(key: key);
  final GetDriverDataByIdResponseModel? getDriverDataByIdResponseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ShadowContainer(

          height: 220,
          width: 350,
          color: WasphaColors.whiteColor,
          borderRadius: BorderRadius.circular(15.r),
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.localization.today}\n${context.localization.delivery_fee}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                            fontWeight: AppDimensions.bold,
                          ),
                        ),
                        Gap(5.h),
                        Text(
                          '${getDriverDataByIdResponseModel?.report?.todayDeliveryFees ?? ''}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    VerticalDivider(
                      endIndent: 0,
                      indent: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.localization.today}\n${context.localization.orders}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                            fontWeight: AppDimensions.bold,
                          ),
                        ),
                        Gap(5.h),
                        Text(
                          '${getDriverDataByIdResponseModel?.report?.todayOrders ?? ''}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ).paddingRow(paddingRight: 15, paddingLeft: 15),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.localization.total}\n${context.localization.delivery_fee}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                            fontWeight: AppDimensions.bold,
                          ),
                        ),
                        Gap(5.h),
                        Text(
                          '${getDriverDataByIdResponseModel?.report?.totalDeliveryFees ?? ''}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    VerticalDivider(
                      endIndent: 0,
                      indent: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.localization.total}\n${context.localization.orders}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                            fontWeight: AppDimensions.bold,
                          ),
                        ),
                        Gap(5.h),
                        Text(
                          '${getDriverDataByIdResponseModel?.report?.totalOrders ?? ''}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ).paddingRow(paddingRight: 15, paddingLeft: 15),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
