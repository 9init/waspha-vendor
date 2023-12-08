import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/src/models/vendor/vendor.dart';
import 'package:vendor/src/view/home/viewmodel.dart';

class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  ProfileAppBar({
    super.key,
  });
  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeModel = ref.watch(homeModelProvider);
    final vendor = ref.watch(vendorProvider);
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: CircleAvatar(
          backgroundImage: vendor?.avatar == null
              ? AssetImage($AssetsImgsGen().avatar.path) as ImageProvider
              : CachedNetworkImageProvider(vendor!.avatar!),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              context.go('/Profile5Screen');
            },
            child: CircleAvatar(
              backgroundImage: homeModel.storeImage == null
                  ? AssetImage($AssetsImgsGen().storeLogo.path) as ImageProvider
                  : CachedNetworkImageProvider(homeModel.storeImage!),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
