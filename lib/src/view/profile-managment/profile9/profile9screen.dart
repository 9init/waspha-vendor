import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Profile9Screen extends StatefulWidget {
  const Profile9Screen({super.key});

  @override
  State<Profile9Screen> createState() => _Profile9ScreenState();
}

class _Profile9ScreenState extends State<Profile9Screen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Commissions",
                style: TextStyle(fontSize: 100.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Customer side",
                style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Fees collect from customer side and calculated on subtotal and added  in the final bill as below:",
                style: TextStyle(fontSize: 50.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Delivery Mode",
                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Fixed fee = 1 EGP",
                style: TextStyle(fontSize: 50.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Pickup Mode",
                style: TextStyle(fontSize: 50.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Pickup Mode",
                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Percentage fee = 3 %",
                style: TextStyle(fontSize: 50.sp),
              ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                "Provider side",
                style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Fees collect from provider side and applied on subtotal  and calculated on the final settlements as below:",
                style: TextStyle(fontSize: 50.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Delivery Mode",
                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Fixed fee = 1 EGP",
                style: TextStyle(fontSize: 50.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Pickup Mode",
                style: TextStyle(fontSize: 50.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "BOX Mode",
                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Percentage fee = 3 %",
                style: TextStyle(fontSize: 50.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
