import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor/core/gen/assets.gen.dart';

import '../common/profile_app_bar/profile_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Align(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    margin: EdgeInsets.only(right: 30),
                    padding: EdgeInsets.only(left: 10),
                    constraints:
                        BoxConstraints(maxWidth: 400.w, minWidth: 300.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        Text("Online",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Spacer(),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.green,
                        )
                      ],
                    ))
              ]),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: [
                    $AssetsImgsGen().box2.image(),
                    Text(
                      "Box",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                // Column(
                //   children: [
                //     $AssetsImgsGen().box2.image(),
                //     Text(
                //       "Box",
                //       style:
                //           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //     ),
                //   ],
                // ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xff00FF00),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "On",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 10,
                              child: Switch(
                                  value: true,
                                  onChanged: (v) {},
                                  activeColor: Colors.white,
                                  trackOutlineColor:
                                      MaterialStateProperty.all(Colors.white),
                                  inactiveTrackColor: Colors.transparent,
                                  activeTrackColor: Colors.transparent))
                        ],
                      ),
                    ),
                    Text(
                      "Delivery",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xffFF0000),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "OFF",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 10,
                              child: Switch(
                                  value: false,
                                  onChanged: (v) {},
                                  activeColor: Colors.white,
                                  trackOutlineColor:
                                      MaterialStateProperty.all(Colors.white),
                                  inactiveTrackColor: Colors.transparent,
                                  inactiveThumbColor: Colors.white,
                                  activeTrackColor: Colors.transparent))
                        ],
                      ),
                    ),
                    Text(
                      "Delivery",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            const Text('Home',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
                  child: const Column(
                    children: [
                      Text(
                        "Total Net Profit",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "EGP 1,000,000",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Balance",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "- 400",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                  style: TextStyle(fontSize: 20)),
                              Text(
                                "EGP 21.4",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                            Text("Payouts", style: TextStyle(fontSize: 20)),
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
