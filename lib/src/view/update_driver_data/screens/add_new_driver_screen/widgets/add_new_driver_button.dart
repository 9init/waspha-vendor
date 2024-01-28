import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/di/index.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/diver/add_driver/add_driver_request_model.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/repository/carriers/add_driver_repository/add_driver_repository.dart';
import 'package:vendor/src/repository/carriers/add_driver_repository/add_driver_response_model.dart';
import 'package:vendor/src/repository/carriers/carriers.dart';
import 'package:vendor/src/view/common/alert_dialog/alert_dialog.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/toast_manager/toast_manager.dart';
import 'package:vendor/src/view/common/waspha_button/waspha_button.dart';
import 'package:vendor/src/view/update_driver_data/providers/get_driver_contact_data_provider/get_driver_contact_data_provider.dart';
import 'package:vendor/src/view/update_driver_data/providers/pick_image_provider/pick_image_provider.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/index.dart';

class AddNewDriverButton extends ConsumerWidget {
  const AddNewDriverButton({
    Key? key,
    required this.formKey,
    required this.driverType,
  }) : super(key: key);
  final GlobalKey<FormBuilderState> formKey;
  final DriverType driverType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverAvtar = ref.watch(pickImageProviderProvider);
    final driverVehicle = ref.watch(selectedVehiclesProvider);
    final driverGender = ref.watch(selectedGenderProvider);
    final driverContactData = ref.watch(getDriverContactDataProvider);
    final bool termsCheckBox =ref.watch(checkboxProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: WasphaButton(
        onButtonTapped: () {
          if (!termsCheckBox) {
            // Show a toast message indicating that the checkbox is not checked
            di<ToastManager>().error(context.localization.not_granted_message);
            return;
          }
          if (formKey.currentState!.saveAndValidate()) {
            showAdaptiveDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => InterActiveAlertDialog(
                confirmationClick: () {
                  if (formKey.currentState!.saveAndValidate()) {
                    final Map<String, dynamic> savedValues =
                        formKey.currentState!.value;
                    final String driverName = savedValues['driverName'];
                    final String driverPassword = savedValues['driverPassword'];
                    debugPrint(
                        'The DriverCountryCode Is +${driverContactData.countryCode}');
                    debugPrint(
                        'The Selected Driver Id  Is ${driverVehicle.id}');
                    String countryCode = driverContactData.countryCode;
                    if (!countryCode.startsWith('+')) {
                      countryCode = '+$countryCode';
                    }

                    ref
                        .read(
                      addDriverRepositoryProvider(
                        addDriverRequestModel: AddDriverRequestModel(
                          name: driverName,
                          contact: DriverContactRequestModel(
                              countryCode: driverContactData.countryCode.isEmpty
                                  ? '+020'
                                  : '${countryCode}',
                              number: driverContactData.driverMobileNumber!),
                          email: 'kota@gmail.com',
                          password: driverPassword,
                          vehicleId: driverVehicle.id!,
                          isOnline:
                              driverType == DriverType.ONLINE ? true : false,
                          avatar:
                              "https://waspha.s3.amazonaws.com/driver/mOHqn3E4fNimage.jpeg",
                        ),
                      ).future,
                    )
                        .whenComplete(() {
                      (AddDriverResponseModel? response) {
                        debugPrint(
                            'The Response Is ${response?.message ?? ''}');
                        di<ToastManager>().success(response?.message ?? '');

                        ref.invalidate(
                          CarriersRepository.storeDriverProvider(driverType),
                        );
                        // context.pushReplacement(
                        //   '/carrier',
                        //   extra: driverType,
                        // );
                        context.pop();
                        context.pop();
                      };
                    }).catchError(
                      (error, stackTrace) {
                        // Handle error
                        debugPrint('Error: $error');
                        di<ToastManager>().error('Kota');
                      },
                    );
                  }
                },
                driverData: Container(),
                body: context.localization.add_driver_confirmation_title,
                title: context.localization.add_driver_confirmation_message,
              ),
            );
          } else {}
        },
        buttonHeight: 63,
        buttonWidth: 348,
        buttonColor: WasphaColors.primary,
        borderRadiusGeometry: BorderRadius.circular(
          15.r,
        ),
        buttonText: context.localization.create_team_member,
      ),
    );
  }
}
