import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor/core/gen/assets.gen.dart';

class Profile5Screen extends StatefulWidget {
  const Profile5Screen({super.key});

  @override
  State<Profile5Screen> createState() => _Profile5ScreenState();
}

class _Profile5ScreenState extends State<Profile5Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: () {
                context.go('/main');
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [$AssetsImgsGen().storeLogo.image()],
      )),
    );
  }
}
