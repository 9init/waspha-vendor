import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor/core/di/index.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/helpers/url_launcher/url_launcher.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/toast_manager/toast_manager.dart';

class CallDriverWidget extends StatelessWidget {
  const CallDriverWidget({Key? key, this.getDriverDataByIdResponseModel})
      : super(key: key);
  final GetDriverDataByIdResponseModel? getDriverDataByIdResponseModel;

  @override
  Widget build(BuildContext context) {
    void makePhoneCall() {
      if (getDriverDataByIdResponseModel!.contact != null) {
        final UrlLauncher urlLauncher = di<UrlLauncher>();
        urlLauncher.makePhoneCall(getDriverDataByIdResponseModel!.contact!.fullPhoneNumber!);
      } else {
        di<ToastManager>().error(context.localization.no_phone_number_message);
      }
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 75.h,
      width: 348.w,
      decoration: BoxDecoration(
        color: WasphaColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: WasphaColors.darkBlackColor,
        ),
      ),
      child: GestureDetector(
        onTap: () => makePhoneCall(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyAssets.svg.call.svg(),
            Gap(10.w),
            Text(
              context.localization.call,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: WasphaColors.primary),
            ),
          ],
        ),
      ),
    ).wrapCenter();
  }
}
