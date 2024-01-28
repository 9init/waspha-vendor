import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/repository/store/app_settings/app_settings_repository.dart';
import 'package:vendor/src/view/common/custom_form/index.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/index.dart';

class DriverDeliveryMethods extends HookConsumerWidget {
  const DriverDeliveryMethods({
    Key? key,
    this.driverDataByIdResponseModel,
  }) : super(key: key);
  final GetDriverDataByIdResponseModel? driverDataByIdResponseModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleType = driverDataByIdResponseModel?.vehicle?.type ?? '';

    // Initialize the selected vehicle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(selectedVehiclesProvider.notifier).state.isEmpty) {
        ref.read(selectedVehiclesProvider.notifier).state = vehicleType;
      }
    });
    final vehicleDescriptionController = useTextEditingController(
        text: driverDataByIdResponseModel?.vehicle?.name ?? '');
    final plateNumberController = useTextEditingController(
        text: driverDataByIdResponseModel?.vehicle?.numberPlate ?? '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text(
                '${context.localization.delivery_method}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Consumer(builder: (context, ref, child) {
              final deliveryMethods = ref.watch(appSettingsProviderProvider);

              return deliveryMethods.when(
                data: (data) {
                  Future.microtask(() {
                    if (ref
                            .read(selectedVehiclesProvider.notifier)
                            .state
                            .isEmpty &&
                        driverDataByIdResponseModel?.vehicle != null) {
                      ref.read(selectedVehiclesProvider.notifier).state =
                          driverDataByIdResponseModel!.vehicle!.type!;
                    }
                  });
                  return Container(
                    height: 165.h,
                    width: 390.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DeliveryMethodsView(
                          deliveryVehicle: data!.deliveryVehicles![index],
                        );
                      },
                      itemCount: data?.deliveryVehicles!.length,
                    ),
                  );
                },
                error: (e, s) {
                  return Container();
                },
                loading: () => CircularProgressIndicator.adaptive(),
              );
            }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Text(
                    context.localization.vehicle_details,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                // CustomFormField for Vehicle Description
                CustomFormField(
                  paddingLeft: 25,
                  paddingRight: 25,
                  textFieldName: 'vehicleDescription',
                  controller: vehicleDescriptionController,
                  text: context.localization.vehicle_description,
                  labelText: context.localization.vehicle_description,
                  validator: (value) {
                    // Check if the value is empty
                    if (value!.isEmpty) {
                      // Return an error message if the field is empty
                      return  context.localization.please_enter_a_value_for_vehicle_description;
                    }
                    // Return null if the value is not empty (indicating no error)
                    return null;
                  },
                ),

// CustomFormField for Plate Number
                CustomFormField(
                  paddingRight: 25,
                  paddingLeft: 25,
                  textFieldName: 'plateNumber',
                  controller: plateNumberController,
                  text: context.localization.plate_number,
                  labelText: context.localization.plate_number,
                  validator: (value) {
                    // Check if the value is empty
                    if (value!.isEmpty) {
                      // Return an error message if the field is empty
                      return context.localization.please_enter_a_value_for_plate_number ;
                    }
                    // Return null if the value is not empty (indicating no error)
                    return null;
                  },
                ),
              ],
            )
          ],
        ).PaddingColumn(paddingLeft: 10, paddingRight: 10, paddingTop: 15),
      ],
    );
  }
}
