import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:vendor/src/view/register/viewmodel.dart';

import '../common/auth/auth_container.dart';
import '../common/auth/social_media.dart';
import '../login/login.dart';
import '../login/login_form.dart';

class Register extends ConsumerWidget {
  Register({super.key});
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final PhoneController _mobileController = PhoneController(null);
  final TextEditingController _referralController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<bool> validateRegister(WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      return await ref
          .read(registerViewModelProvider.notifier)
          .performRegister();
    }
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const WasphaHeader(
                  title1: "Sign up now",
                  text: "Please fill the details",
                  title1Size: 30,
                ),
                const Text("signup  via social networks"),
                const SizedBox(
                  height: 10,
                ),
                SocialMedia(
                  googleOnTap: () {},
                  facebookOnTap: () {},
                  appleOnTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("or Create a new account"),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  controller: _fullNameController,
                  text: "Full Name",
                  onChanged: (value) {
                    ref
                        .read(registerViewModelProvider.notifier)
                        .updateFullName(value);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(controller: _emailController, text: "Email"),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  controller: _passwordController,
                  text: "Password",
                  isPassword: true,
                  onChanged: (value) {
                    ref
                        .read(registerViewModelProvider.notifier)
                        .updatePassword(value);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  controller: _confirmPasswordController,
                  text: "Re-enter Password",
                  isPassword: true,
                  onChanged: (value) {
                    ref
                        .read(registerViewModelProvider.notifier)
                        .updateConfirmPassword(value);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
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
                    onChanged: (value) {
                      ref
                          .read(registerViewModelProvider.notifier)
                          .updatePhoneNumber(value!.international);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                    controller: _referralController,
                    isOptional: true,
                    onChanged: (value) {
                      ref
                          .read(registerViewModelProvider.notifier)
                          .updateReferralNo(int.parse(value));
                    },
                    text: "Referral Code (Optional)"),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  onTap: () async {
                    if (ref.read(isRegisterLoadingProvider)) return;

                    final result = await validateRegister(ref);
                    if (result && context.mounted) {
                      context.go("/main");
                    }
                  },
                  text: ref.read(isRegisterLoadingProvider)
                      ? "Loading"
                      : "Sign up",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () => context.go('/login'),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
