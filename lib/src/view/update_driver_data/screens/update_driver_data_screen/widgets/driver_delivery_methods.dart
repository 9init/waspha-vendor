import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/get_driver_by_id/get_driver_by_id_response_model.dart';
import 'package:vendor/src/repository/store/app_settings/app_settings_repository.dart';
import 'package:vendor/src/view/common/custom_form/index.dart';

class DriverDeliveryMethods extends HookWidget {
  const DriverDeliveryMethods({
    Key? key,
    this.driverDataByIdResponseModel,
  }) : super(key: key);
  final GetDriverDataByIdResponseModel? driverDataByIdResponseModel;

  @override
  Widget build(BuildContext context) {
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
            Text(
              '${context.localization.delivery_method}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            //TODO://CHECK THIS
            Consumer(builder: (widget, ref, child) {
              final deliveryMethods = ref.watch(appSettingsProviderProvider);
              return deliveryMethods.when(data: (data) {
                log('The Data Is $data');
                return Container(
                  height: 135.h,
                  width: 390.w,
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index) {
                  //     debugPrint('The Image Url Is ${data?.deliveryVehicles?[index].image?.color }');
                  //     return Column(
                  //       children: [
                  //         CircleAvatar(
                  //           radius: 50.r,
                  //           backgroundImage: CachedNetworkImageProvider(
                  //               data?.deliveryVehicles?[index].image?.color ?? ''),
                  //         )
                  //       ],
                  //     );
                  //   },
                  //   itemCount: data?.deliveryVehicles!.length,
                  // ),
                );
              }, error: (e, s) {
                return Container();
              }, loading: () {
                return Container();
              });
            }),
            // Container(
            //   height: 135.h,
            //   width: 390.w,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: vehicleList.length,
            //     itemBuilder: (context, index) => DeliveryMethodsView(
            //       vehicle: vehicleList[index],
            //     ),
            //   ),
            // ),
            Text(
              context.localization.vehicle_details,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ).PaddingColumn(paddingLeft: 70, paddingTop: 15),
        Column(
          children: [
            CustomFormField(
              textFieldName: 'vehicleDescription',
              controller: vehicleDescriptionController,
              text: context.localization.vehicle_description,
              labelText: context.localization.vehicle_description,
            ),
            CustomFormField(
              textFieldName: 'plateNumber',
              controller: plateNumberController,
              text: context.localization.plate_number,
              labelText: context.localization.plate_number,
            ),
          ],
        ).PaddingColumn(paddingLeft: 40)
      ],
    );
  }
}
