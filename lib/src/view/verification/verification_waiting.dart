import 'package:flutter/material.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/home/home.dart';

import '../common/profileAppBar/profile_appBar.dart';

class VerificationWaiting extends StatelessWidget {
  const VerificationWaiting({super.key});

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
            const SizedBox(height: 20),
            const Text(
              "Your account is under verification, you\n can set up your account during the\n verification and explore the app",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    );
                  },
                  itemCount: 3),
            ),
          ],
        ),
      ),
    );
  }
}
