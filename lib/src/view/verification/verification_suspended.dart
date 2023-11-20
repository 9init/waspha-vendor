import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/home/home.dart';

import '../common/profileAppBar/profile_appBar.dart';

class VerificationSuspended extends StatelessWidget {
  const VerificationSuspended({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.warning_rounded,
              color: WasphaColors.error,
              size: 40,
            ),
            const SizedBox(height: 40),
            const Text(
              "Your account has been suspended",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SvgPicture.asset(
              'assets/imgs/lock.svg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 40),
            const Text("You should Payout To Waspha"),
            const Text(
              "EGP 1450",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
