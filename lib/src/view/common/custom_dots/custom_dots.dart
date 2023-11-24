// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CustomDots extends StatelessWidget {
  CustomDots({super.key, this.selectedIndex = 0});
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          3,
          (index) => Container(
                margin: const EdgeInsets.all(5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? WasphaColors.primary
                        : Colors.grey,
                    shape: BoxShape.circle),
              )),
    );
  }
}
