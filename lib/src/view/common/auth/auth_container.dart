import 'package:flutter/material.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/curev_clipper/custom_clip.dart';

import '../colors/colors.dart';

class WasphaHeader extends StatelessWidget {
  const WasphaHeader({
    super.key,
    this.text,
    this.title1 ,
    this.title2 ,
    this.title1Size = 20,
    this.title2Size = 40,
    this.backButtonEnabled = true,
  });

  final String? text;
  final String? title1;
  final String? title2;
  final double title1Size;
  final double title2Size;
  final bool backButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipPath(
          clipper: CurveClipper(),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  WasphaColors.tertiary,
                  WasphaColors.secondary,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backButtonEnabled
                      ? const Padding(
                          padding:
                              EdgeInsets.only(left: 25, right: 25, bottom: 15),
                          child: BackButton(color: Colors.white),
                        )
                      : const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title1 ?? context.localization.intro_message,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: title1Size,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          title2 ?? context.localization.app_name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: title2Size,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        text != null
                            ? Text(
                                text!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -100,
          child: Image.asset(
            "assets/imgs/onboarding/atom.png",
            scale: 1.2,
            opacity: const AlwaysStoppedAnimation(0.2),
          ),
        ),
      ],
    );
  }
}
