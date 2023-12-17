import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/vendor/vendor.dart';
import 'package:vendor/src/repository/store/profile.dart';

class StoreProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(StoreRepository.storeProvider).asData?.value;
    final vendor = ref.watch(vendorProvider);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Store Management",
            style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 110.r,
              backgroundImage: store?.avatar == null
                  ? AssetImage($AssetsImgsGen().storeLogo.path) as ImageProvider
                  : CachedNetworkImageProvider(store!.avatar!),
            ),
            SizedBox(height: 20.h),
            Text(
              Localizations.localeOf(context).languageCode == "ar"
                  ? store?.name?.ar ?? context.localization.loading
                  : store?.name?.en ?? context.localization.loading,
              style: TextStyle(
                fontSize: 70.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                SizedBox(width: 20.w),
                Text(
                  store?.averageRating?.toString() ?? "0.0",
                  style: TextStyle(
                    fontSize: 45.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 20.w),
                Text(
                  store?.avgRating != null
                      ? "(${store?.avgRating?.count} ratings)"
                      : context.localization.loading,
                  style: TextStyle(
                    fontSize: 45.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xff663399)),
              onPressed: () => context.push("/store_reviews"),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 45.sp, color: Colors.white),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 60.sp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.w),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      context.push("/commissions");
                    },
                    title: Text(
                      "Applicable Commissions",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 60.sp,
                    ),
                  ),
                  Divider(
                    color: Color(0XffE2E8ED),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Business Management ",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 60.sp,
                    ),
                  ),
                  Divider(
                    color: Color(0XffE2E8ED),
                  ),
                  ListTile(
                    onTap: () {
                      context.go("/Profile34Screen");
                    },
                    title: Text(
                      "Default Pay methods",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 60.sp,
                    ),
                  ),
                  Divider(
                    color: Color(0XffE2E8ED),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Menu Management ",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 60.sp,
                    ),
                  ),
                  Divider(
                    color: Color(0XffE2E8ED),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Carriers Management ",
                      style: TextStyle(
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 60.sp,
                    ),
                  ),
                  Divider(color: Color(0XffE2E8ED)),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Brand Relationship",
                      style: TextStyle(
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 60.sp,
                    ),
                  ),
                  Divider(
                    color: Color(0XffE2E8ED),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h),
            Text(
              "ID: ${vendor?.referralCode ?? "Error"}",
              style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200.h)
          ],
        ),
      ),
    );
  }
}
