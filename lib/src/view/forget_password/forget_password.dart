import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
              "Recover password using\nEmail or phone No.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            EmailField(
              emailController: _emailController,
            ),
            const SizedBox(height: 20),
            MobileField(
              mobileController: _mobileController,
            ),
            const SizedBox(height: 70),
            AuthButton(onTap: () {}, text: "Continue"),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// Create the state provider for radio box
final _selectedOptionProvider = StateProvider<int>((ref) => 0);

class EmailField extends ConsumerWidget {
  const EmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Radio(
          value: 0,
          groupValue: ref.watch(_selectedOptionProvider),
          onChanged: (value) {
            ref.read(_selectedOptionProvider.notifier).state = value as int;
          },
        ),
        Expanded(
          child: CustomFormField(
            controller: emailController,
            text: "Email Address",
          ),
        ),
      ],
    );
  }
}

class MobileField extends ConsumerWidget {
  const MobileField({
    super.key,
    required this.mobileController,
  });

  final PhoneController mobileController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Radio(
          value: 1,
          groupValue: ref.watch(_selectedOptionProvider),
          onChanged: (value) {
            ref.read(_selectedOptionProvider.notifier).state = value as int;
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: PhoneFormField(
              controller: mobileController,
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
    );
  }
}
