import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/repository/store/profile.dart';

class Commissions extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commission = ref.watch(StoreRepository.storeCommissionProvider);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Commissions",
            style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: commission.isLoading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "Customer side",
                      style: TextStyle(
                          fontSize: 70.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Fees collect from customer side and calculated on subtotal and added in the final bill as below:",
                      style: TextStyle(fontSize: 45.sp),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Delivery Mode",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "${commission.value!.userDeliveryFeeType} fee = ${commission.value!.userDeliveryFee} ${commission.value!.userDeliveryFeeType == "percentage" ? "%" : "EGP"}",
                      style: TextStyle(fontSize: 45.sp),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Pickup Mode",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "${commission.value!.userPickupFeeType} fee = ${commission.value!.userPickupFee}${commission.value!.userPickupFeeType == "percentage" ? "%" : "EGP"}",
                      style: TextStyle(fontSize: 45.sp),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Text(
                      "Provider side",
                      style: TextStyle(
                          fontSize: 70.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Fees collect from provider side and applied on subtotal  and calculated on the final settlements as below:",
                      style: TextStyle(fontSize: 45.sp),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Delivery Mode",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "${commission.value!.storeDeliveryFeeType} fee = ${commission.value!.storeDeliveryFee}${commission.value!.storeDeliveryFeeType == "percentage" ? "%" : "EGP"}",
                      style: TextStyle(fontSize: 45.sp),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Pickup Mode",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "${commission.value!.storePickupFeeType} fee = ${commission.value!.storePickupFee}${commission.value!.storePickupFeeType == "percentage" ? "%" : "EGP"}",
                      style: TextStyle(fontSize: 45.sp),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "BOX Mode",
                      style: TextStyle(
                          fontSize: 45.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "${commission.value!.storeBoxFeeType} fee = ${commission.value!.storeBoxFee}${commission.value!.storeBoxFeeType == "percentage" ? "%" : "EGP"}",
                      style: TextStyle(fontSize: 45.sp),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
