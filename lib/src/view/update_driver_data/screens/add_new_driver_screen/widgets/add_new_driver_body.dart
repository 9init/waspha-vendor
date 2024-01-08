import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/index.dart';

class AddNewDriverBody extends StatelessWidget {
  const AddNewDriverBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DriverFullNameAndAvatar(),
        DriverPhoneNumber(),
        DriverDeliveryMethods(),
        DriverGender(),
        TermsAndConditionsData(),
        Gap(10.h),
        DriverDataUpdateButton(),
        Gap(10.h),
      ],
    );
  }
}
