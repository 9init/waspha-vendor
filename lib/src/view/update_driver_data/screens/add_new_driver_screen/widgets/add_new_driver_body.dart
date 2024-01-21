import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/view/update_driver_data/screens/add_new_driver_screen/widgets/index.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/index.dart';

class AddNewDriverBody extends StatelessWidget {
  const AddNewDriverBody({Key? key, required this.driverType})
      : super(key: key);
  final DriverType driverType;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKeyPhone = GlobalKey<FormState>();
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AddNewDriverNameAndAvatar(
              driverType: driverType,
            ),
            DriverPhoneNumber(
              formKey: formKeyPhone,
            ),
            const DriverDeliveryMethods(),
            const DriverGender(),
            const TermsAndConditionsData(),
            Gap(10.h),
            AddNewDriverButton(
              formKey: formKey,
              driverType: driverType,
            ),
            Gap(30.h),
          ],
        ),
      ),
    );
  }
}
