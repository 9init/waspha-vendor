import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/view/common/auth_btn/auth_btn.dart';
import 'package:vendor/src/view/common/custom_form/custom_form.dart';

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
              const SizedBox(height: 50),
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
