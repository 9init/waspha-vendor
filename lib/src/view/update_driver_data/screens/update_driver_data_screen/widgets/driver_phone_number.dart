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

  DriverPhoneNumber(
      {Key? key,
      this.driverDataByIdResponseModel,})
      : super(key: key);

  @override
  ConsumerState<DriverPhoneNumber> createState() => _DriverPhoneNumberState();
}

class _DriverPhoneNumberState extends ConsumerState<DriverPhoneNumber> {
  late PhoneController controller;

  @override
  initState() {
    super.initState();
    controller = PhoneController(null);
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = ref.watch(getDriverContactDataProvider);
    controller.value = PhoneNumber(
        isoCode: IsoCode.SA,
        nsn: phoneNumber.driverMobileNumber.isEmpty
            ? widget.driverDataByIdResponseModel?.contact ?? ''
            : phoneNumber.driverMobileNumber);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.mobile_number,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              PhoneFormField(
                controller: controller,
              ),
            ],
          ),
        ),
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
            ).center(),
          ),
        ),
      ],
    );
  }
}
