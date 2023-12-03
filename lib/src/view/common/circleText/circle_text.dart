import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/constans/index.dart';
import 'package:vendor/src/view/home/homemodel.dart';

class CircleWithText extends ConsumerWidget {
  const CircleWithText({
    Key? key,
    this.text = 'Box',
    required this.switchButtonType,
  }) : super(key: key);

  final String text;
  final SwitchButtonType switchButtonType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchState = ref.watch(homeModelProvider);
    final switchValue = switchState[switchButtonType] ?? false;

    return Column(
      children: [
        CircleAvatar(
          radius: AppDimensions.borderMedium,
          child: FittedBox(
            child: Switch.adaptive(
              value: switchValue,
              onChanged: (bool newVal) {
                ref.read(homeModelProvider.notifier).toggleSwitch(switchButtonType);
              },              // Other Switch properties...
            ),
          ),
        ),
        Text(text)
      ],
    );
  }
}
