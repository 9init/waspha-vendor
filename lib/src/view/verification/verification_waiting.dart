// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor/src/view/common/auth/custom_btn.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

import '../common/custom_dots/custom_dots.dart';
import '../common/profile_app_bar/profile_app_bar.dart';
import 'verification_banner.dart';

class VerificationWaiting extends HookWidget {
  VerificationWaiting({super.key});
  List<VerifyBanner> banners = [
    VerifyBanner(
        image: 'assets/imgs/check.svg',
        text:
            "Check and update your business application, Add missing documents, update your delivery range, update the area you are working on, and more.",
        btnText: "Let's Go"),
    VerifyBanner(
        image: 'assets/imgs/check2.svg',
        text:
            "Create your store menu and manage your categories, And promote your items as offers.",
        btnText: "Start Crafting"),
    VerifyBanner(
        image: 'assets/imgs/check3.svg',
        text:
            "Start adding your own offline/online carrier members who will make delivery to your orders. Save time while the Waspha admin checks your business application form",
        btnText: "Start Adding"),
  ];
  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
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
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(banners[index].image!),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            banners[index].text!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CustomButton(
                            onTap: () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            text: banners[index].btnText!),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomDots(
                          selectedIndex: index,
                        )
                      ],
                    );
                  },
                  itemCount: banners.length),
            ),
          ],
        ),
      ),
    );
  }
}
