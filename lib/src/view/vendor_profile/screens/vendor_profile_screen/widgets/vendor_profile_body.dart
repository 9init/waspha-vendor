import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/repository/auth/login.dart';

import 'index.dart';

class VendorProfileBody extends ConsumerWidget {
  const VendorProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendor = ref.watch(LoginRepository.vendorProvider);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        VendorAvatarAndName(
          vendor: vendor.value!,
        ),
        ...List.generate(
          rowsWidget(context).length,
          (index) => rowsWidget(context)[index],
        ),
        RowWidget(
            title: context.localization.sign_out,
            svgPath: MyAssets.svg.signOut.path),
      ],
    );
  }
}
