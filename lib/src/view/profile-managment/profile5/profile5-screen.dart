import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: AppBar(leading: BackButton(
        onPressed: () {
          context.go('/main');
        },
      )),
      body: Align(
        child: Column(
          children: [
            CircleAvatar(radius: 40, child: $AssetsImgsGen().storeLogo.image()),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "noon Alexandria branch ",
              style: TextStyle(
                fontSize: 80.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                SizedBox(width: 30.w),
                Text(
                  "4.5",
                  style: TextStyle(
                    fontSize: 60.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 30.w),
                Text(
                  "(90 ratings)",
                  style: TextStyle(
                    fontSize: 60.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xff663399)),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 40.sp, color: Colors.white),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 60.sp, color: Colors.white)
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.w),
                child: Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      onTap: () {
                        context.go("/Profile9Screen");
                      },
                      title: Text(
                        "Applicable Commissions",
                        style: TextStyle(
                            fontSize: 40.sp, fontWeight: FontWeight.bold),
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
                            fontSize: 40.sp, fontWeight: FontWeight.bold),
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
                            fontSize: 40.sp, fontWeight: FontWeight.bold),
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
                            fontSize: 40.sp, fontWeight: FontWeight.bold),
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
                            fontSize: 40.sp, fontWeight: FontWeight.bold),
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
                        "Brand Relationship",
                        style: TextStyle(
                          fontSize: 40.sp,
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
                ))),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "ID: 123456789",
              style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
