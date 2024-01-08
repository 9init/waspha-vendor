import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

final checkboxProvider = AutoDisposeStateProvider<bool>(
    (ref) => false); // 0 can be your default radio button value

class TermsAndConditionsData extends StatelessWidget {
  const TermsAndConditionsData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (widget, ref, child) {
                bool isTermsAndConditionsChecked = ref.watch(checkboxProvider);
                return Checkbox(
                  activeColor: WasphaColors.primary,
                    value: isTermsAndConditionsChecked,
                    onChanged: (bool? newValue) {
                      ref.read(checkboxProvider.notifier).state =
                          newValue ?? false;
                    });
              },
            ),
            Text(
              context.localization.i_have_read_and_agree,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: WasphaColors.greyColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.localization.terms_and_conditions,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: WasphaColors.blueColor),
            ),
            Gap(5.w),
            Text(
              context.localization.and,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: WasphaColors.greyColor),
            ),
            Gap(5.w),
            Text(
              context.localization.privacy_policy,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: WasphaColors.blueColor),
            )
          ],
        )
      ],
    );
  }
}
