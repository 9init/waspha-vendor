import 'package:flutter/material.dart';

class CircleWithText extends StatelessWidget {
  const CircleWithText({
    super.key,
    this.text = 'Box',
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 25,
        ),
        Text(text)
      ],
    );
  }
}
