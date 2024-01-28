import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/view/common/auth_btn/auth_btn.dart';
import 'package:vendor/src/view/common/custom_form/custom_form.dart';

import '../common/auth/auth_container.dart';
import 'viewmodel.dart';

class Login extends HookConsumerWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _mobileController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormState>());

    Future<bool> validateLogin(WidgetRef ref, LoginViewModel viewModel) async {
      if (_formKey.currentState!.validate()) {
        return await viewModel.performLogin(ref);
      }
      return false;
    }

    final viewModel = ref.read(loginViewModelProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              WasphaHeader(
                text: context.localization.login_welcome_message,
                backButtonEnabled: false,
              ),
              const SizedBox(height: 50),
              CustomFormField(
                text: context.localization.email_or_mobile,
                controller: _mobileController,
                onChanged: (value) => viewModel.updateVendorID(value!),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFormField(
                text: context.localization.password,
                isPassword: true,
                onChanged: (value) => viewModel.updatePassword(value!),
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
                          Text(
                            context.localization.remember_me,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.push('/forget_pass');
                      },
                      child: Text(context.localization.forgot_password),
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

                  final result = await validateLogin(ref, viewModel);
                  if (result && context.mounted) {
                    context.go("/main");
                  }

                  if (!result &&
                      context.mounted &&
                      !ref.read(isVendorIdOrPasswordNullProvider)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            context.localization.invalid_vendor_id_or_password),
                      ),
                    );
                  }
                },
                text: ref.watch(isLoadingProvider)
                    ? context.localization.loading_button
                    : context.localization.continue_button,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.localization.dont_have_an_account),
                  TextButton(
                    onPressed: () {
                      context.go('/register');
                    },
                    child: Text(
                      context.localization.sign_up,
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
