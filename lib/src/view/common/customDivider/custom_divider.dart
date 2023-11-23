import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Divider(
        thickness: 2,
      ),
    );
  }
}

class TextFee extends StatelessWidget {
  const TextFee({
    super.key,
    required this.leading,
    required this.trailing,
    this.size = 14,
    this.boldLeading = false,
    this.isFree = false,
    this.credit,
  });
  final String leading, trailing;
  final double size;
  final bool boldLeading, isFree;
  final String? credit;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(leading,
          style: TextStyle(
              fontSize: size,
              fontWeight: boldLeading ? FontWeight.bold : FontWeight.normal)),
      Text(trailing,
          style: TextStyle(
              fontSize: size, color: isFree ? Colors.red : Colors.black)),
      if (credit != null)
        Text(
          credit ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
    ]);
  }
}
