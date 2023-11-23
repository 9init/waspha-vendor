import 'package:flutter/material.dart';

class AlignedContainer extends StatelessWidget {
  const AlignedContainer({
    super.key,
    this.text = "Print Reciept",
    this.alignment = Alignment.centerLeft,
    this.child,
  });
  final String text;
  final Alignment alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF663399),
          borderRadius: alignment == Alignment.centerRight
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
        ),
        child: child ??
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
      ),
    );
  }
}
