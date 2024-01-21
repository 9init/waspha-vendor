import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vendor/core/constans/index.dart';
import 'package:vendor/core/extensions/custom_padding.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/common/home_switch/home_switch.dart';
import 'package:vendor/src/view/home/viewmodel.dart';

import '../common/profile_app_bar/profile_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeModel = ref.watch(homeModelProvider);
    final homeModelNotifier = ref.read(homeModelProvider.notifier);
    return Scaffold(
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: FlutterSwitch(
                      inactiveTextColor: WasphaColors.darkBlackColor,
                      activeToggleColor: WasphaColors.greenColor,
                      activeTextColor: WasphaColors.darkBlackColor,
                      activeColor: WasphaColors.white,
                      showOnOff: true,
                      value: homeModel.isStoreOnline ?? false,
                      height: 30.h,
                      width: 112.w,
                      activeText: context.localization.online,
                      inactiveText: context.localization.offline,
                      activeTextFontWeight: FontWeight.bold,
                      inactiveTextFontWeight: FontWeight.bold,
                      valueFontSize: 14.sp,
                      switchBorder: Border.all(color: Colors.black),
                      onToggle: (val) => homeModelNotifier.setStoreOnline(val),
                    ),
                  ),
                ],
              ),
              Gap(10.h),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.w,
                        child: Stack(
                          children: [
                            MyAssets.imgs.box2.image(),
                            Align(
                              alignment: Alignment(-1.1, 0.9),
                              child: CircleAvatar(
                                radius: 20.r,
                                backgroundColor: WasphaColors.redColor,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: WasphaColors.white,
                                    size: 15,
                                  ).wrapCenter(),
                                ).wrapCenter(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Box",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: AppDimensions.textSizeExtraLarge),
                      ),
                    ],
                  ),
                  Spacer(),
                  HomeSwitcher(
                    title: "Delivery",
                    value: homeModel.isDeliveryEnabled,
                    onChanged: (val) =>
                        homeModelNotifier.setIsDeliveryEnabled(val),
                    switchTitle: homeModel.isDeliveryEnabled? "On" : "Off",
                  ),
                  SizedBox(width: 20),
                  HomeSwitcher(
                    switchTitle: homeModel.isPickupEnabled ? "On" : "Off",
                    title: "Pickup",
                    value: homeModel.isPickupEnabled ,
                    onChanged: (val) =>
                        homeModelNotifier.setIsPickupEnabled(val),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              GestureDetector(
                onTap: () {
                  context.push('/payouts');
                },
                child: Center(
                  child: Container(
                    width: 390.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          WasphaColors.white,
                          WasphaColors.greyColor,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Gap(10.h),
                        Text(
                          "Total Net Profit",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          homeModel.earnings?.totalNetProfit?.toString() ??
                              context.localization.loading,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: 20),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      "Balance",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      homeModel.earnings?.totalSettlement
                                              ?.toString() ??
                                          context.localization.loading,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                thickness: 1,
                                width: 100.w,
                                color: Colors.black,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text(
                                      "Today Net Profit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      homeModel.earnings?.todayProfit
                                              .toString() ??
                                          context.localization.loading,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.arrow_forward),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Row(
                            children: [
                              Text(
                                "Payouts",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                        if (homeModel.latestUpdate != null)
                          Text(
                            "${context.localization.last_update} ${DateFormat('MM/d/yyyy hh:mm a').format(homeModel.latestUpdate!)}",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Dismiss all",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
