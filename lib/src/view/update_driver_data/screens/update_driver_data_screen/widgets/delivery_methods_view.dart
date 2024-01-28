import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/src/models/app_settings/app_settings.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/shadow_container/sahdow_container.dart';

final selectedVehiclesProvider =
    AutoDisposeStateProvider<DeliveryVehicle>((ref) => DeliveryVehicle());

class DeliveryMethodsView extends StatelessWidget {
  const DeliveryMethodsView({
    Key? key,
    required this.deliveryVehicle,
  }) : super(key: key);

  final DeliveryVehicle deliveryVehicle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InnerShadow(
          blur: 5,
          color: WasphaColors.grey200.withOpacity(0.4),
          offset: const Offset(2.5, 2.5),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: WasphaColors.white,
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: deliveryVehicle.image?.color ?? '',
              width: 50.w,
              height: 50.h,
            ),
          ),
        ),
        Text(
          deliveryVehicle.title?.en ?? '',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Consumer(
          builder: (context, ref, child) {
            var selectedVehicle = ref.watch(selectedVehiclesProvider);
            debugPrint('selectedVehicle${selectedVehicle}');
            return Radio<DeliveryVehicle>(
              activeColor: WasphaColors.blackColor,
              value: deliveryVehicle,
              groupValue: selectedVehicle,
              onChanged: (DeliveryVehicle? newValue) {
                if (newValue != null) {
                  ref.read(selectedVehiclesProvider.notifier).state = newValue;
                  debugPrint('The New Value Is $newValue');
                  // Potentially force a rebuild if not automatically happening
                }
              },
            );
          },
        ),
      ],
    ).PaddingColumn(paddingRight: 10, paddingLeft: 10);
  }
}
