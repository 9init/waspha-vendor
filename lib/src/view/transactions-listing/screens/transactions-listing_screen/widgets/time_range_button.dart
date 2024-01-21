import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/transactions-listing/screens/transactions-listing_screen/widgets/transactions_listing_body.dart';

class TimeRangeButton extends StatelessWidget {
  const TimeRangeButton(
      {Key? key,
      required this.value,
      required this.text,
      required this.onSelected})
      : super(key: key);
  final String value;
  final String text;
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (widget, ref, child) => ElevatedButton(
        onPressed: () {
          onSelected(value);
        },
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: WasphaColors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: ref.read(selectedTimeRangeProvider) == value
                ? WasphaColors.redColor
                : WasphaColors.primary),
      ),
    );
  }
}
