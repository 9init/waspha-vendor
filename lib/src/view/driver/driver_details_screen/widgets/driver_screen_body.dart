import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_request_model.dart';
import 'package:vendor/src/repository/carriers/get_driver_by_id_repository/get_driver_by_id_repository.dart';
import 'package:vendor/src/view/driver/driver_details_screen/widgets/index.dart';

class DriverScreenBody extends ConsumerWidget {
  const DriverScreenBody({Key? key, required this.driverId}) : super(key: key);
  final String driverId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverData = ref.watch(
      getDriverByIdRepositoryProvider(
        getDriverByIdRequestModel:
            GetDriverByIdRequestModel(driverId: driverId),
      ),
    );
    return driverData.when(
      data: (data) {
        if (data == null || data.data == null) {
          return Center(child: Text('No data available'));
        }
        debugPrint('The Last Order Value is ${data.data?.report?.latestOrder}');
        return ListView(
          children: [
            Gap(10.h),
            DriverAvatarAndNameDetails(
              getDriverDataByIdResponseModel: data.data!,
            ),
            DriverTypeAndRating(
              getDriverDataByIdResponseModel: data.data!,
            ),
            Gap(15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                context.localization.carrier_statistics,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Gap(10.h),
            CarrierStatistics(
              getDriverDataByIdResponseModel: data.data,
            ),
            Gap(10.h),
            AverageEta(
              getDriverDataByIdResponseModel: data.data,
            ),
            Gap(10.h),
            Visibility(
              visible: data.data?.report?.latestOrder!=null,
              child: LastOrderAssigned(
                getDriverDataByIdResponseModel: data.data,
              ),
            ),
            Gap(10.h),
            CallDriverWidget(
              getDriverDataByIdResponseModel: data.data!,
            ),
            Gap(20.h),
          ],
        );
      },
      error: (e, s) => Text('The Error Is$e $s'),
      loading: () => Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
