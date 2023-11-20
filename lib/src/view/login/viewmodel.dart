import 'package:state_notifier/state_notifier.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vendor/src/repository/auth/login.dart';

class LoginModel {
  String vendorId = '';
  String password = '';
  bool loading = false;

  LoginModel copyWith({String? vendorId, String? password, bool? loading}) {
    return LoginModel()
      ..loading = loading ?? this.loading
      ..vendorId = vendorId ?? this.vendorId
      ..password = password ?? this.password;
  }
}

class LoginViewModel extends StateNotifier<LoginModel> {
  LoginViewModel() : super(LoginModel());

  // Method to update the username in the model
  void updateVendorID(String newUsername) {
    state = state.copyWith(vendorId: newUsername);
  }

  // Method to update the password in the model
  void updatePassword(String newPassword) {
    state = state.copyWith(password: newPassword);
  }

  void updateLoading(bool isLoading) {
    state = state.copyWith(loading: isLoading);
  }

  // Method to perform the login logic
  Future<bool> performLogin() async {
    // Access the username and password from the model
    final vendorId = state.vendorId;
    final password = state.password;

    // Perform your login logic here
    updateLoading(true);
    final vendor = await LoginRepository.login(vendorId, password);
    updateLoading(false);

    return vendor != null;
  }
}

// Provider for the LoginViewModel
final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginModel>((ref) {
  return LoginViewModel();
});

// A Provider to emit a boolean indicating whether vendorId or password is null
final isVendorIdOrPasswordNullProvider = Provider<bool>((ref) =>
    ref.watch(loginViewModelProvider).vendorId.isEmpty ||
    ref.watch(loginViewModelProvider).password.isEmpty);

// A Provider to indicate the loading state during login
final isLoadingProvider =
    Provider<bool>((ref) => ref.watch(loginViewModelProvider).loading);
