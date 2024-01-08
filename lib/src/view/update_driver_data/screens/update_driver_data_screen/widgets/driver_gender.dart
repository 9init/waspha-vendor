import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/update_driver_data/enums/enums.dart';


final selectedGenderProvider =
    AutoDisposeStateProvider<Gender>((ref) => Gender.male);

class DriverGender extends ConsumerWidget {
  const DriverGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Gender selectedGender = ref.watch(selectedGenderProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.gender,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyAssets.svg.male.svg(),
            MyAssets.svg.female.svg(),
          ],
        ).paddingRow(paddingRight: 10,paddingLeft: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              context.localization.male,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Radio<Gender>(
              value: Gender.male,
              groupValue: selectedGender,
              activeColor:WasphaColors.blackColor,
              onChanged: (value) {
                if (value != null) {
                  ref.read(selectedGenderProvider.notifier).state = value;
                  debugPrint('Selected Gender: ${value.toString()}');
                  debugPrint(
                      'Selected Gender From Provider Is: ${ref.read(selectedGenderProvider.notifier).state}');
                }
              },
            ),
            Gap(10.w),
            Text(
              context.localization.female,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Radio<Gender>(
              activeColor:WasphaColors.blackColor,

              value: Gender.female,
              groupValue: selectedGender,
              onChanged: (value) {
                if (value != null) {
                  ref.read(selectedGenderProvider.notifier).state = value;
                  debugPrint('Selected Gender: ${value.toString()}');
                }
              },
            ),
          ],
        ),
      ],
    ).PaddingColumn(paddingTop: 20, paddingLeft: 50, paddingRight: 50);
  }
}
