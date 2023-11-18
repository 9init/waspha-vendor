import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:vendor/src/view/common/auth/auth_container.dart';
import 'package:vendor/src/view/common/colors/colors.dart';

import '../login/login.dart';
import '../login/login_form.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const AuthContainer(
              text: "Password",
              title: "Recovery",
              titleSize: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Reset Password",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
            CustomFormField(
              controller: _passwordController,
              text: "Password",
              isPassword: true,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFormField(
              controller: _confirmPasswordController,
              text: "Re-enter Password",
              isPassword: true,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 50,
            ),
            AuthButton(onTap: () {}, text: "Continue"),
          ],
        ),
      ),
    );
  }
}
