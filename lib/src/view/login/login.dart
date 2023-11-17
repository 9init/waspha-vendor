import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/view/common/auth/social_media.dart';
import 'package:vendor/src/view/login/login_form.dart';

import '../common/auth/auth_container.dart';
import 'viewmodel.dart';

class Login extends HookConsumerWidget {
  Login({super.key});
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validateLogin(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      ref.read(loginViewModelProvider.notifier).performLogin();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRememberBoxChecked = useState(false);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const AuthContainer(
                text: "Welcome, Please login to \n your account."),
            const SizedBox(
              height: 10,
            ),
            const Text("Login  via social networks"),
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
            const Text("or login with mobile"),
            const SizedBox(
              height: 10,
            ),
            CustomFormField(
              text: "Email or Mobile Number",
              controller: _mobileController,
              onChanged: (value) => ref
                  .read(loginViewModelProvider.notifier)
                  .updateVendorID(value),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFormField(
              text: "Password",
              isPassword: true,
              onChanged: (value) => ref
                  .read(loginViewModelProvider.notifier)
                  .updatePassword(value),
              controller: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Checkbox(
                      value: isRememberBoxChecked.value,
                      onChanged: (value) {
                        isRememberBoxChecked.value = value!;
                      }),
                  const Text("Remember me"),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {}, child: const Text("Forgot Password?")),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AuthButton(
              onTap: () => validateLogin(ref),
              text: "Continue",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 110,
              height: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFF002286),
                        Color.fromARGB(255, 161, 75, 95),
                      ]),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                text.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )),
            ),
          )),
    );
  }
}
