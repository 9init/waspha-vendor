import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/loading_state/loading_state.dart';
import 'package:vendor/src/view/common/auth_btn/auth_btn.dart';
import 'package:vendor/src/view/payment_methods/viewmodel.dart';

class PaymentMethods extends ConsumerWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final methodsProvider = ref.watch(paymentMethodViewModelProvider);
    final methodsNotifier = ref.watch(paymentMethodViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Pay Methods",
            style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value:
                            methodsProvider.paymentMethods.store.cashOnDelivery,
                        onChanged: (v) {
                          final sMethod = methodsProvider.paymentMethods.store;
                          final method = sMethod.copyWith(cashOnDelivery: v!);
                          methodsNotifier.updateStorePaymentMethods(method);
                        },
                      ),
                      Text(
                        "Cash on delivery",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: methodsProvider
                            .paymentMethods.store.deviceOnDelivery,
                        onChanged: (v) {
                          final sMethod = methodsProvider.paymentMethods.store;
                          final method = sMethod.copyWith(deviceOnDelivery: v!);
                          methodsNotifier.updateStorePaymentMethods(method);
                        },
                      ),
                      Text(
                        "Device on delivery",
                        style: TextStyle(fontSize: 50.sp),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox.adaptive(
                        value: methodsProvider.paymentMethods.store.creditCard,
                        onChanged: (v) {
                          final sMethod = methodsProvider.paymentMethods.store;
                          final method = sMethod.copyWith(creditCard: v!);
                          methodsNotifier.updateStorePaymentMethods(method);
                        },
                      ),
                      Text(
                        "Credit Card",
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
              "Express Carrier",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox.adaptive(
                      value:
                          methodsProvider.paymentMethods.express.cashOnDelivery,
                      onChanged: (v) {
                        final eMethod = methodsProvider.paymentMethods.express;
                        final method = eMethod.copyWith(cashOnDelivery: v!);
                        methodsNotifier.updateExpressPaymentMethods(method);
                      },
                    ),
                    Text(
                      "Cash on delivery",
                      style: TextStyle(fontSize: 50.sp),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox.adaptive(
                      value: methodsProvider.paymentMethods.express.creditCard,
                      onChanged: (v) {
                        final eMethod = methodsProvider.paymentMethods.express;
                        final method = eMethod.copyWith(creditCard: v!);
                        methodsNotifier.updateExpressPaymentMethods(method);
                      },
                    ),
                    Text(
                      "Credit Card",
                      style: TextStyle(fontSize: 50.sp),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            AuthButton(
              onTap: () async {
                if (methodsProvider.loadingState == LoadingState.loading)
                  return;

                methodsNotifier.updatePaymentMethod().then((done) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: done
                          ? Text(context.localization.saved)
                          : Text(context.localization.something_went_wrong),
                    ),
                  );
                });
              },
              text: methodsProvider.loadingState == LoadingState.loading
                  ? context.localization.loading_button
                  : context.localization.continue_button,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
