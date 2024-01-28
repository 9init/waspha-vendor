import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/routes/routes_names.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/update_driver_data/providers/get_driver_contact_data_provider/get_driver_contact_data_provider.dart';

class DriverPhoneNumber extends StatefulHookConsumerWidget {
  final GetDriverDataByIdResponseModel? driverDataByIdResponseModel;
  final GlobalKey<FormState> formKey;

  DriverPhoneNumber({
    Key? key,
    this.driverDataByIdResponseModel,
    required this.formKey,
  }) : super(key: key);

  @override
  ConsumerState<DriverPhoneNumber> createState() => _DriverPhoneNumberState();
}

class _DriverPhoneNumberState extends ConsumerState<DriverPhoneNumber> {
  late PhoneController controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  void initController() {
    String initialNumber = widget.driverDataByIdResponseModel?.contact ?? '';
    controller = PhoneController(
      PhoneNumber(isoCode: IsoCode.SA, nsn: initialNumber),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateNumber(String newNumber,) {
    controller.dispose();
    controller = PhoneController(
      PhoneNumber(isoCode: IsoCode.SA, nsn: newNumber),
    );
    debugPrint('controller.selectNationalNumber()${controller.value!.countryCode}');
    setState(() {});
  }

  final phoneKey = GlobalKey<FormFieldState<PhoneNumber>>();

  @override
  Widget build(BuildContext context) {
    final phoneNumber = ref.watch(getDriverContactDataProvider);
    //setDriverCountryCode
    if (phoneNumber.driverMobileNumber.isNotEmpty) {
      updateNumber(phoneNumber.driverMobileNumber);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localization.mobile_number,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            PhoneFormField(
            onChanged:(PhoneNumber?phoneNumber){
              debugPrint('The Phone Number Is ${phoneNumber!.countryCode}');
              ref.read(getDriverContactDataProvider).countryCode=phoneNumber.countryCode;
            },
              key: phoneKey,
              autovalidateMode: AutovalidateMode.disabled,
              controller: controller,
            ),
          ],
        ).PaddingColumn(paddingRight: 80,paddingLeft: 85),
        Gap(10.h),
        GestureDetector(
          onTap: () => context.push(RoutesNames.contactListScreen),
          child: Container(
            height: 44.h,
            width: 244.w,
            decoration: BoxDecoration(
              color: WasphaColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
            ),
            child: Text(
              context.localization.pick_from_my_contact_list,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: WasphaColors.white),
            ).wrapCenter(),
          ),
        ),
      ],
    );
  }
}
