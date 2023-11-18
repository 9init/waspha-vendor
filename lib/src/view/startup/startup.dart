import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/view/startup/viewmodel.dart';

class StartUp extends StatelessWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        Future(() {
          ref.watch(authCheckViewModelProvider).when(
                data: (isLoggedIn) {
                  isLoggedIn ? context.go("/home") : context.go("/login");
                },
                error: (error, stackStrace) {
                  context.go("/login");
                },
                loading: () {},
              );
        });
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo[900]!,
                Colors.indigo[600]!,
                Colors.pink[400]!,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/imgs/market.svg',
                height: 100,
                width: 100,
              ),
              const Text(
                "Waspha",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const Text(
                "Provider",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              )
            ],
          )),
        );
      }),
    );
  }
}
