import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/gen/assets.gen.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  padding: EdgeInsets.only(left: 10),
                  child: FlutterSwitch(
                    showOnOff: true,
                    value: homeModel.isStoreOnline ?? false,
                    width: 100.w,
                    activeText: "Online",
                    inactiveText: "Offline",
                    activeTextFontWeight: FontWeight.normal,
                    inactiveTextFontWeight: FontWeight.normal,
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
                        fontSize: 20.sp,
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
                  onChanged: (val) => homeModelNotifier.setIsPickupEnabled(val),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Home',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.push('/payouts');
              },
              child: Center(
                child: Container(
                  width: 348,
                  height: 250,
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
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Text(
                        "EGP 1,000,000",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Balance",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              Text(
                                "- 400",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          VerticalDivider(),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text("Today Net Profit",
                                  style: TextStyle(fontSize: 20.sp)),
                              Text(
                                "EGP 21.4",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.arrow_forward)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Row(
                          children: [
                            Text("Payouts", style: TextStyle(fontSize: 20.sp)),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                      Text("Last update 11/9/2022 11:25 AM")
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
    );
  }
}
