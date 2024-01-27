import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/routes/routes_names.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/update_driver_data/providers/countries/countries.dart';
import 'package:vendor/src/view/update_driver_data/providers/get_driver_contact_data_provider/get_driver_contact_data_provider.dart';

class DriverPhoneNumber extends HookConsumerWidget {
  final GetDriverDataByIdResponseModel? driverDataByIdResponseModel;

  const DriverPhoneNumber({
    Key? key,
    this.driverDataByIdResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverContactData = ref.watch(getDriverContactDataProvider);
    final phoneController = useTextEditingController(
        text: driverDataByIdResponseModel?.contact ?? '');
    final String? initialCountryCode = Countries.getCountryCodeFromDialCode(
        driverDataByIdResponseModel?.countryCode ?? '');
    driverContactData.countryCode.isEmpty
        ? driverDataByIdResponseModel?.countryCode ?? ''
        : '';
    debugPrint('The init Country Code Is $initialCountryCode');
    debugPrint(
        'The Country Code From Response Is ${driverDataByIdResponseModel?.countryCode}');
    phoneController.text = driverContactData.driverMobileNumber ?? '';
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
            IntlPhoneField(
              validator: (value) {
                if (value == null || value.number.isEmpty) {
                  return context.localization.please_enter_a_phone_number;
                }
                return null;
              },
              disableLengthCheck: true,
              enabled: true,
              controller: phoneController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              initialCountryCode: initialCountryCode ?? 'EG',
              onCountryChanged: (country) {
                ref
                    .read(getDriverContactDataProvider.notifier)
                    .setDriverCountryCode(countryCode: country.dialCode);
                debugPrint('The Change Country Code Is ${country.dialCode}');
              },
              onChanged: (phoneNumber) {
                debugPrint('The Complete Number Is ${phoneNumber.number}');
                debugPrint(
                    'The Complete Country Code Is ${phoneNumber.countryCode}');
                driverContactData.driverMobileNumber = phoneNumber.number;
                driverContactData.countryCode = phoneNumber.countryCode;
              },
            ),
          ],
        ).PaddingColumn(paddingRight: 80, paddingLeft: 85),
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
