import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/src/repository/auth/login.dart';
import 'package:vendor/src/view/home/viewmodel.dart';

class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  ProfileAppBar({
    super.key,
  });
  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeModel = ref.watch(homeModelProvider);
    final vendor = ref.watch(LoginRepository.vendorProvider);
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: CircleAvatar(
          backgroundImage: !vendor.hasValue
              ? AssetImage($AssetsImgsGen().avatar.path) as ImageProvider
              : CachedNetworkImageProvider(vendor.value!.avatar!),
        ),
      ),
      title: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Home",
          style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => context.push('/notification'),
          icon: const Icon(Icons.notifications),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              context.push('/store_profile');
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
