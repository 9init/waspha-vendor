import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

class DriverTypeAndRating extends StatelessWidget {
  const DriverTypeAndRating({Key? key, required this.getDriverDataByIdResponseModel}) : super(key: key);
  final GetDriverDataByIdResponseModel getDriverDataByIdResponseModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${getDriverDataByIdResponseModel.type ?? ''} ${context.localization.carrier}',
          style: Theme.of(context).textTheme.titleMedium,
        ).wrapCenter(),
        Gap(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: WasphaColors.darkBlackColor,
            ),
            Text(
              '${getDriverDataByIdResponseModel.rating?.rate} (${getDriverDataByIdResponseModel.rating?.count} ${context.localization.ratings})',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ).paddingRow(paddingLeft: 5, paddingRight: 5),
      ],
    );
  }
}
