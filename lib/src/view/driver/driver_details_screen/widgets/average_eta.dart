import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/shadow_container/sahdow_container.dart';

class AverageEta extends StatelessWidget {
  const AverageEta({Key? key,  this.getDriverDataByIdResponseModel})
      : super(key: key);
  final GetDriverDataByIdResponseModel? getDriverDataByIdResponseModel;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 60,
      width: 350,
      borderRadius: BorderRadius.circular(15.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.localization.average_eta,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Gap(10.w),
          Text(
            '${getDriverDataByIdResponseModel?.report?.averageEta ?? ''}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      color: WasphaColors.whiteColor,
    );
  }
}
