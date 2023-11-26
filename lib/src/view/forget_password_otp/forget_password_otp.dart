import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/loading_state/loading_state.dart';
import 'package:vendor/src/view/common/auth/auth_container.dart';
import 'package:vendor/src/view/common/otp_form/otp_form.dart';
import 'package:vendor/src/view/forget_password/viewmodel.dart';
import 'package:vendor/src/view/forget_password_otp/viewmodel.dart';
import 'package:vendor/src/view/login/login.dart';

class ForgetPasswordOtp extends StatelessWidget {
  const ForgetPasswordOtp({
    super.key,
    required this.passResetModel,
  });
  final PasswordResetModel passResetModel;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: _ForgetPasswordOtp(resetModel: passResetModel),
      ),
      onWillPop: () async => false,
    );
  }
}

class _ForgetPasswordOtp extends ConsumerWidget {
  _ForgetPasswordOtp({required this.resetModel});
  final PasswordResetModel resetModel;
  final otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpVerification = ref.watch(otpVerificationNotifier.notifier);
    final otpRequestState = ref.watch(otpVerificationNotifier);

    ref.listen(otpVerificationNotifier, (previous, LoadingState state) {
      if (state == LoadingState.success) {
        context.go("/reset_pass", extra: otpVerification.followUpCode!);
      }

      if (state == LoadingState.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong OTP"),
          ),
        );
      }
    });

    return Column(
      children: [
        const WasphaHeader(
          title1: "Password",
          title2: "Recovery",
          title2Size: 30,
          backButtonEnabled: true,
        ),
        const Spacer(),
        const Text(
          "Verification code",
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'OTP will send to ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: resetModel.value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text:
                "Change ${resetModel.selectedOption == ResetOption.EMAIL ? "email" : "number"}",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pop();
              },
          ),
        ),
        const SizedBox(height: 20),
        OtpForm(
          numberOfFields: 4,
          formKey: otpFormKey,
          onOtpEntered: (enteredValues) {
            otpVerification.setEnteredOtp(enteredValues.join());
          },
        ),
        const SizedBox(height: 20),
        AuthButton(
          onTap: () {
            if (otpRequestState == LoadingState.loading) return;
            if (otpFormKey.currentState!.validate()) {
              otpVerification.verifyOtp(resetModel);
            }
          },
          text: otpRequestState == LoadingState.loading
              ? "Loading..."
              : "Continue",
        ),
        const Spacer(),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
