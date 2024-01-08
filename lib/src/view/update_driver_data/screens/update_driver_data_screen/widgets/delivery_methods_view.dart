import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/update_driver_data/enums/enums.dart';
import 'package:vendor/src/view/update_driver_data/screens/update_driver_data_screen/widgets/vehicles.dart';

final selectedVehiclesProvider = AutoDisposeStateProvider<VehicleType>(
  (ref) => VehicleType.Bicycle,
);


class DeliveryMethodsView extends StatelessWidget {
  const DeliveryMethodsView({Key? key, required this.vehicle})
      : super(key: key);
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              color: WasphaColors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              vehicle.image,
            )),
        Text(
          vehicle.name,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Consumer(
          builder: (context, ref, child) {
            final VehicleType selectedVehicle =
                ref.watch(selectedVehiclesProvider);
            return Radio(
              value: vehicle.type, // Use the type from the provided Vehicle
              groupValue: selectedVehicle,
              activeColor: WasphaColors.blackColor,
              onChanged: (value) {
                if (value != null) {
                  ref.read(selectedVehiclesProvider.notifier).state = value;
                  debugPrint('Selected Gender: ${value.toString()}');
                  debugPrint(
                      'Selected Gender From Provider Is: ${ref.read(selectedVehiclesProvider.notifier).state}');
                }
              },
            );
          },
        ),
      ],
    );
  }
}
