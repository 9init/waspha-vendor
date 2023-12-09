import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Commissions extends StatefulWidget {
  const Commissions({super.key});

  @override
  State<Commissions> createState() => _CommissionsState();
}

class _CommissionsState extends State<Commissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(onPressed: () => context.pop())),
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
                "Fees collect from customer side and calculated on subtotal and added in the final bill as below:",
                style: TextStyle(fontSize: 60.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Delivery Mode",
                style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Fixed fee = 1 EGP",
                style: TextStyle(fontSize: 60.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Pickup Mode",
                style: TextStyle(fontSize: 60.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Pickup Mode",
                style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Percentage fee = 3 %",
                style: TextStyle(fontSize: 60.sp),
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
                style: TextStyle(fontSize: 60.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Delivery Mode",
                style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Fixed fee = 1 EGP",
                style: TextStyle(fontSize: 60.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Pickup Mode",
                style: TextStyle(fontSize: 60.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "BOX Mode",
                style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Percentage fee = 3 %",
                style: TextStyle(fontSize: 60.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
