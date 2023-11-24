import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:vendor/src/view/common/auth/auth_container.dart';
import 'package:vendor/src/view/login/login.dart';

import '../login/login_form.dart';

class ForgetPassword extends HookWidget {
  ForgetPassword({super.key});

  final TextEditingController _emailController = TextEditingController();
  final PhoneController _mobileController = PhoneController(null);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isEmailChecked = useState(true);
    final isMobileChecked = useState(false);
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              const WasphaHeader(
                title1: "Forgot your",
                title2: "Password?",
                title2Size: 30,
              ),
              const Spacer(),
              const Text(
                "Recover password using \n Email or phone No.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                      value: isEmailChecked.value,
                      onChanged: (v) {
                        isEmailChecked.value = v!;
                        isMobileChecked.value = !v;
                      }),
                  Expanded(
                    child: CustomFormField(
                      controller: _emailController,
                      text: "Email Address",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                      value: isMobileChecked.value,
                      onChanged: (v) {
                        isMobileChecked.value = v!;
                        isEmailChecked.value = !v;
                      }),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: PhoneFormField(
                        controller: _mobileController,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                          border: UnderlineInputBorder(),
                        ),
                        showFlagInInput: true,
                        defaultCountry: IsoCode.EG,
                        validator: (phoneNumber) {
                          if (phoneNumber == null) {
                            return "Please enter your phone number";
                          }
                          return null;
                        },
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              AuthButton(onTap: () {}, text: "Continue"),
              const Spacer(),
              const Spacer()
            ],
          )),
    );
  }
}
