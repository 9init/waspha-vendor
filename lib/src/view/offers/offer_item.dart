import 'package:flutter/material.dart';
import 'package:vendor/core/gen/assets.gen.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(children: [
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            backgroundImage: AssetImage($AssetsImgsGen().avatar.path),
          ),
        ),
      ]),
    );
  }
}
