import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/constans/index.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/routes/routes_names.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/edit_personal_name/edit_personal_name.dart';
import 'package:vendor/src/view/common/user_avatar/user_avatar.dart';
import 'package:vendor/src/view/driver/providers/inject_driver_id.dart';

class DriverAvatarAndNameDetails extends StatelessWidget {
  const DriverAvatarAndNameDetails(
      {Key? key, required this.getDriverDataByIdResponseModel})
      : super(key: key);
  final GetDriverDataByIdResponseModel getDriverDataByIdResponseModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 100.h,
          width: 220.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              getDriverDataByIdResponseModel.avatar != null
                  ? UserAvatar(
                      borderRadiusColor: WasphaColors.grey200,
                      hasRadiusColor: true,
                      radius: 50,
                      backgroundColor: WasphaColors.transparentColor,
                      imageType: BackgroundImageType.network,
                      imageUrl: getDriverDataByIdResponseModel.avatar ?? '',
                    )
                  : UserAvatar(
                      borderRadiusColor: WasphaColors.grey200,
                      hasRadiusColor: true,
                      radius: 50,
                      backgroundColor: WasphaColors.transparentColor,
                      imageType: BackgroundImageType.assets,
                      imageUrl: MyAssets.imgs.avatar.path,
                    ),
              Align(
                alignment: Alignment(-0.5, -1.1),
                child: UserAvatar(
                  borderRadiusColor: WasphaColors.grey200,
                  hasRadiusColor: true,
                  radius: 23,
                  backgroundColor: WasphaColors.whiteColor,
                  imageType: BackgroundImageType.network,
                  child: CachedNetworkImage(
                    imageUrl:
                        getDriverDataByIdResponseModel.vehicle?.colorImage ??
                            '',
                  ),
                ),
              ),
              Positioned(
                bottom: 5.h,
                left: 130.w,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12.r,
                      backgroundColor:
                          getDriverDataByIdResponseModel.status == 'available'
                              ? WasphaColors.greenColor
                              : WasphaColors.redColor,
                    ),
                    Gap(5.w),
                    Text(
                      getDriverDataByIdResponseModel.status == 'available'
                          ? context.localization.available
                          : context.localization.busy,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: AppDimensions.textSizeExtraLarge),
                    )
                  ],
                ),
              )
            ],
          ),
        ).wrapCenter(),
        Gap(20.h),
        Consumer(
          builder: (widget, ref, child) {
            final driverId=ref.watch(injectDriverIdProvider);
            debugPrint('The Get Driver Id ${driverId.toString()}');
            return EditPersonalName(
              personalName: getDriverDataByIdResponseModel.name ?? '',
              editPersonalNameFunction: () => context.pushNamed(
                RoutesNames.updateDriverDataScreen,
                pathParameters: <String, String>{
                  'driver_id': driverId.toString()
                },
              ),
            );
          },
        )
      ],
    );
  }
}
