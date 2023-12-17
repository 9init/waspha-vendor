import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
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
                      showOnOff: true,
                      value: homeModel.isStoreOnline ?? false,
                      width: 300.w,
                      activeText: context.localization.online,
                      inactiveText: context.localization.offline,
                      activeTextFontWeight: FontWeight.normal,
                      inactiveTextFontWeight: FontWeight.normal,
                      valueFontSize: 50.sp,
                      switchBorder: Border.all(color: Colors.black),
                      onToggle: (val) => homeModelNotifier.setStoreOnline(val),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    children: [
                      $AssetsImgsGen().box2.image(),
                      Text(
                        "Box",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  HomeSwitcher(
                    title: "Delivery",
                    value: homeModel.isDeliveryEnabled ?? false,
                    onChanged: (val) =>
                        homeModelNotifier.setIsDeliveryEnabled(val),
                  ),
                  SizedBox(width: 20),
                  HomeSwitcher(
                    title: "Pickup",
                    value: homeModel.isPickupEnabled ?? false,
                    onChanged: (val) =>
                        homeModelNotifier.setIsPickupEnabled(val),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  context.push('/payouts');
                },
                child: Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 90.h, horizontal: 30.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.grey,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Total Net Profit",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          homeModel.earnings?.totalNetProfit?.toString() ??
                              context.localization.loading,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                      style: TextStyle(fontSize: 50.sp),
                                    ),
                                    Text(
                                      homeModel.earnings?.totalSettlement
                                              ?.toString() ??
                                          context.localization.loading,
                                      style: TextStyle(
                                          fontSize: 50.sp,
                                          fontWeight: FontWeight.bold),
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
                                    Text("Today Net Profit",
                                        style: TextStyle(fontSize: 50.sp)),
                                    Text(
                                      homeModel.earnings?.todayProfit
                                              .toString() ??
                                          context.localization.loading,
                                      style: TextStyle(
                                          fontSize: 50.sp,
                                          fontWeight: FontWeight.bold),
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
                              Text("Payouts", style: TextStyle(fontSize: 20)),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                        if (homeModel.latestUpdate != null)
                          Text(
                              "${context.localization.last_update} ${DateFormat('MM/d/yyyy hh:mm a').format(homeModel.latestUpdate!)}")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.centerRight, child: Text("Dismiss all"))
            ],
          ),
        ),
      ),
    );
  }
}
