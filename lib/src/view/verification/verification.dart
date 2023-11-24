import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:vendor/src/view/common/auth/auth_container.dart';

import '../common/auth/custom_btn.dart';
import '../login/login.dart';

class Verification extends HookWidget {
  Verification({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final OtpFieldController _otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    final pinsState = useState('');

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const AuthContainer(
              title: "Verfication",
              titleSize: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Verification Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "OTP has been sent to your mobile number",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    text: "Edit",
                    onTap: () {},
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: OTPTextField(
                length: 4,
                controller: _otpController,
                width: 300,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  pinsState.value = pin;
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AuthButton(onTap: () {}, text: "Continue"),
          ],
        ),
      ),
    );
  }
}

