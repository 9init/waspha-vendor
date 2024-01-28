import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/shadow_container/sahdow_container.dart';

class LastOrderAssigned extends StatelessWidget {
  const LastOrderAssigned(
      {Key? key,  this.getDriverDataByIdResponseModel})
      : super(key: key);
  final GetDriverDataByIdResponseModel? getDriverDataByIdResponseModel;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 90,
      width: 350,
      borderRadius: BorderRadius.circular(15.r),
      child: Column(
        children: [
          Text(
            context.localization.last_order_assigned,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Gap(5.h),
          Visibility(
            visible: getDriverDataByIdResponseModel?.report?.latestOrder!=null,
            child: Text(
              '${DateFormat('dd/MM/yyyy hh:mm a').format(
                DateTime.parse(
                    getDriverDataByIdResponseModel?.report?.latestOrder ?? ''),
              )}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
      color: WasphaColors.whiteColor,
    );
  }
}
