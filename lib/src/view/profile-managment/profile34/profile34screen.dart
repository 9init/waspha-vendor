import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Profile34Screen extends StatelessWidget {
  const Profile34Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/main');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pay Methods",
              style: TextStyle(fontSize: 100.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Use this setting to be used as default when creating a new offer for your customer request. ",
              style: TextStyle(fontSize: 45.sp),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Offline/Online Carrier",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: false,
                        onChanged: (v) {},
                      ),
                      Text(
                        "Customer credit    ",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: true,
                        onChanged: (v) {},
                      ),
                      Text(
                        "Cash on delivery    ",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: true,
                        onChanged: (v) {},
                      ),
                      Text(
                        "Device on delivery  ",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: false,
                        onChanged: (v) {},
                      ),
                      Text(
                        "Credit Card              ",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )
                ]),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "eXpress Carrier",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: false,
                        onChanged: (v) {},
                      ),
                      Text(
                        "Customer credit    ",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: true,
                        onChanged: (v) {},
                      ),
                      Text(
                        "Cash on delivery    ",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: true,
                        onChanged: (v) {},
                      ),
                      Text(
                        "Device on delivery  ",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: false,
                        onChanged: (v) {},
                      ),
                      Text(
                        "Credit Card              ",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )
                ])
          ],
        )),
      ),
    );
  }
}
