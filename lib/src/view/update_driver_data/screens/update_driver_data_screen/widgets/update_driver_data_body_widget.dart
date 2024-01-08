import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_request_model.dart';
import 'package:vendor/src/repository/carriers/get_driver_by_id_repository/get_driver_by_id_repository.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/index.dart';

class UpdateDriverDataBodyWidget extends ConsumerWidget {
  const UpdateDriverDataBodyWidget( {Key? key,required this.driverId}) : super(key: key);
final String driverId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverData = ref.watch(
      getDriverByIdRepositoryProvider(
        getDriverByIdRequestModel: GetDriverByIdRequestModel(driverId: driverId),
      ),
    );
    return driverData.when(
      data: (data) {
        debugPrint('The Data Is $data');
        if (data == null || data.data == null) {
          return Center(child: Text('No data available'));
        }
        return ListView(
          children: [
            DriverFullNameAndAvatar(
              driverDataByIdResponseModel: data.data!,
            ),
            DriverPhoneNumber(
              driverDataByIdResponseModel: data.data!,
            ),
            DriverDeliveryMethods(driverDataByIdResponseModel: data.data!,),
            DriverGender(),
            TermsAndConditionsData(),
            Gap(10.h),
            DriverDataUpdateButton(),
            Gap(10.h),

          ],
        );
      },
      error: (e, s) {
        debugPrint('The Error Is $e');
        debugPrint('The Error Is $s');

        return Icon(Icons.error);
      },
      loading: () {
        debugPrint('Is In Loading ');
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
