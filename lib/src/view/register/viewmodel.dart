import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/auth/register.dart';

class RegisterModel {
  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool loading = false;
  String phoneNumber = '';
  int? referralNo;

  RegisterModel copyWith(
      {String? fullName,
      String? email,
      String? password,
      String? confirmPassword,
      bool? loading,
      String? phoneNumber,
      int? referralNo}) {
    return RegisterModel()
      ..loading = loading ?? this.loading
      ..fullName = fullName ?? this.fullName
      ..email = email ?? this.email
      ..password = password ?? this.password
      ..confirmPassword = confirmPassword ?? this.confirmPassword
      ..phoneNumber = phoneNumber ?? this.phoneNumber
      ..referralNo = referralNo ?? this.referralNo;
  }
}


class RegisterViewModelNotifier extends StateNotifier<RegisterModel> {
  RegisterViewModelNotifier(): super(RegisterModel());

  void updateFullName(String newFullName) {
    state = state.copyWith(fullName: newFullName);
  }

  void updateEmail(String newEmail) {
    state = state.copyWith(email: newEmail);
  }

  void updatePassword(String newPassword) {
    state = state.copyWith(password: newPassword);
  }

  void updateConfirmPassword(String newConfirmPassword) {
    state = state.copyWith(confirmPassword: newConfirmPassword);
  }

  void updateLoading(bool isLoading) {
    state = state.copyWith(loading: isLoading);
  }

  void updatePhoneNumber(String newPhoneNumber) {
    state = state.copyWith(phoneNumber: newPhoneNumber);
  }

  void updateReferralNo(int newReferralNo) {
    state = state.copyWith(referralNo: newReferralNo);
  }

  Future<bool> performRegister() async {
    final fullName = state.fullName;
    final email = state.email;
    final confirmPassword = state.confirmPassword;
    final phoneNumber = state.phoneNumber;

    updateLoading(true);
    final vendor = await RegisterRepository.register(
        name: fullName,
        password: confirmPassword,
        email: email,
        countryCode: "+20",
        phone: phoneNumber,
        fullPhoneNo: phoneNumber);
    updateLoading(false);

    return vendor != null;
  }
  
}

final registerViewModelProvider =
    StateNotifierProvider<RegisterViewModelNotifier, RegisterModel>((ref) {
  return RegisterViewModelNotifier();
});

// A Provider to indicate the loading state during login
final isRegisterLoadingProvider =
    Provider<bool>((ref) => ref.watch(registerViewModelProvider).loading);