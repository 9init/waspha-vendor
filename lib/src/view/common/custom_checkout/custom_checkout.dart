import 'package:flutter/material.dart';

class CustomCheckoutTile extends StatelessWidget {
  const CustomCheckoutTile({
    super.key,
    required this.text,
    this.value = false,
    this.onChanged,
  });
  final String text;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(value: value, onChanged: onChanged),
        Text(text)
      ],
    );
  }
}
