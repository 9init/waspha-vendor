import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/di/index.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/diver/delete_driver/delete_driver_request_model.dart';
import 'package:vendor/src/models/diver/edit_driver/edit_driver_request_model.dart';
import 'package:vendor/src/repository/carriers/delete_driver_repository/delete_driver_repository.dart';
import 'package:vendor/src/repository/carriers/edit_driver_repository/edit_driver_repository.dart';
import 'package:vendor/src/view/common/alert_dialog/alert_dialog.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/toast_manager/toast_manager.dart';
import 'package:vendor/src/view/common/waspha_button/waspha_button.dart';
import 'package:vendor/src/view/update_driver_data/providers/get_driver_contact_data_provider/get_driver_contact_data_provider.dart';
import 'package:vendor/src/view/update_driver_data/providers/pick_image_provider/pick_image_provider.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/delivery_methods_view.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/driver_gender.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/terms_conditions_data.dart';

class DriverDataUpdateButton extends HookConsumerWidget {
  const DriverDataUpdateButton({
    Key? key,
    required this.formKey,
    required this.driverId,
    required this.vehicleId,
  }) : super(key: key);
  final GlobalKey<FormBuilderState> formKey;
  final int? driverId;
  final int? vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DriverContactState driverMobileNumber =
        ref.watch(getDriverContactDataProvider);
    final String driverAvatar = ref.watch(pickImageProviderProvider) as String;
    final String? driverGender = ref.watch(selectedGenderProvider);
    final bool checkBoxIsGranted = ref.watch(checkboxProvider);
    final userVehicleType = ref.watch(selectedVehiclesProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WasphaButton(
            onButtonTapped: () => showAdaptiveDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => InterActiveAlertDialog(
                    confirmationClick: () => ref
                        .watch(
                      deleteDriverRepositoryProvider(
                        deleteDriverRequestModel: DeleteDriverRequestModel(
                          id: driverId.toString(),
                        ),
                      ).future,
                    )
                        .whenComplete(() {
                      di<ToastManager>()
                          .success(context.localization.review_data_message);
                      Future.delayed(
                        Duration(seconds: 1),
                        () => context.pop(),
                      );
                    }),
                    driverData: Container(),
                    body:context.localization.delete_confirmation_title ,
                    title:context.localization.delete_confirmation_message ,
                  ),
                ),
            buttonHeight: 63,
            buttonWidth: 114,
            buttonColor: WasphaColors.redColor,
            borderRadiusGeometry: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
            ),
            buttonText: context.localization.delete),

        WasphaButton(
          onButtonTapped: () {
            log('The Validiation Fields Is ${formKey.currentState!.fields}');
            debugPrint('The Validiation Fields Is ${formKey.currentState!.value}');
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();
              final savedValues = formKey.currentState?.value;
              final String? vehicleDescription = savedValues?['vehicleDescription'];
              final plateNumber = savedValues?['plateNumber'];
              final driverName = savedValues?['driverName'];
              final driverPassword = savedValues?['driverPassword'];
              final driverConfirmationPassword =
                  savedValues?['driverConfirmationPassword'];
              debugPrint('The driverPassword Fields Is ${driverPassword}');
              debugPrint('The driverName Fields Is ${driverName}');
              debugPrint('The driverConfirmationPassword Fields Is ${driverConfirmationPassword}');

              if (checkBoxIsGranted) {
                showAdaptiveDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => InterActiveAlertDialog(
                    driverData: Container(),
                    confirmationClick: () async {
                      final driverData = ref
                          .watch(
                            await editDriverRepositoryProvider(
                              editDriverRequestModel: EditDriverRequestModel(
                                id: driverId,
                                name: driverName,
                                contact: driverMobileNumber.driverMobileNumber,
                                avatar: driverAvatar,
                                countryCode: '',
                                vehicle: DriverVehicleData(
                                  numberPlate: plateNumber,
                                  type: userVehicleType,
                                  id: vehicleId,
                                ),
                              ),
                            ).future,
                          )
                          .then((value) =>
                              di<ToastManager>().success(value?.message ?? ''))
                          .catchError(
                            (onError) => debugPrint('The Error Is $onError'),
                          );
                    },
                    body: context.localization.update_confirmation_title,
                    title: context.localization.update_confirmation_message,
                  ),
                );
              } else {
                di<ToastManager>()
                    .error(context.localization.not_granted_message);
              }
            }
          },
          buttonHeight: 63,
          buttonWidth: 233,
          buttonColor: WasphaColors.primary,
          borderRadiusGeometry: BorderRadius.only(
            topRight: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r),
          ),
          buttonText: context.localization.update_team_member,
        ),
      ],
    ).wrapCenter();
  }
}