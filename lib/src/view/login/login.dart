import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/view/common/auth/social_media.dart';
import 'package:vendor/src/view/common/colors/colors.dart';
import 'package:vendor/src/view/login/login_form.dart';

import '../common/auth/auth_container.dart';
import 'viewmodel.dart';

class Login extends HookConsumerWidget {
  Login({super.key});
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<bool> validateLogin(LoginViewModel viewModel) async {
    if (_formKey.currentState!.validate()) {
      return await viewModel.performLogin();
    }
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(loginViewModelProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const WasphaHeader(
                text: "Welcome, Please login to\nyour account.",
                backButtonEnabled: false,
              ),
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
                onChanged: (value) => viewModel.updateVendorID(value),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFormField(
                text: "Password",
                isPassword: true,
                onChanged: (value) => viewModel.updatePassword(value),
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
                    GestureDetector(
                      onTap: () {
                        final value = ref.watch(isRememberPassProvider);
                        viewModel.updateRememberPassword(!value);
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: ref.watch(isRememberPassProvider),
                            onChanged: (value) {
                              viewModel.updateRememberPassword(value!);
                            },
                          ),
                          const Text("Remember me"),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.push('/forget_pass');
                      },
                      child: const Text("Forgot Password?"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AuthButton(
                onTap: () async {
                  if (ref.read(isLoadingProvider)) return;

                  final result = await validateLogin(viewModel);
                  if (result && context.mounted) {
                    context.go("/main");
                  }

                  if (!result &&
                      context.mounted &&
                      !ref.read(isVendorIdOrPasswordNullProvider)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Invalid Vendor ID or Password"),
                      ),
                    );
                  }
                },
                text: ref.watch(isLoadingProvider) ? "Loading" : "Continue",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      context.go('/register');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
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
                      colors: [WasphaColors.tertiary, WasphaColors.secondary]),
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
