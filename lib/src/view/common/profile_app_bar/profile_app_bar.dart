import 'package:flutter/material.dart';
import 'package:vendor/core/gen/assets.gen.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  ProfileAppBar({
    super.key,
  });
  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage($AssetsImgsGen().avatar.path),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage($AssetsImgsGen().storeLogo.path),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
