import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/colors/colors.dart';



final selectedGenderProvider = AutoDisposeStateProvider<String?>((ref) => null);

class DriverGender extends ConsumerWidget {
  const DriverGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? selectedGender = ref.watch(selectedGenderProvider);

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
        ).paddingRow(paddingRight: 10, paddingLeft: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              context.localization.male,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Radio<String?>(
              value: 'male',
              groupValue: selectedGender,
              activeColor: WasphaColors.blackColor,
              onChanged: (value) {
                ref.read(selectedGenderProvider.notifier).state = value;
                debugPrint('Selected Gender: $value');
              },
            ),
            Gap(10.w),
            Text(
              context.localization.female,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Radio<String?>(
              activeColor: WasphaColors.blackColor,
              value: 'female',
              groupValue: selectedGender,
              onChanged: (value) {
                ref.read(selectedGenderProvider.notifier).state = value;
                debugPrint('Selected Gender: $value');
              },
            ),
            Gap(10.w),

          ],
        ),
      ],
    ).PaddingColumn(paddingTop: 20, paddingLeft: 50, paddingRight: 50);
  }
}
