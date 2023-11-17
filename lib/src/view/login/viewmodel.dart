import 'package:state_notifier/state_notifier.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vendor/src/repository/auth/login.dart';

class LoginModel {
  String vendorId = '';
  String password = '';

  LoginModel copyWith({String? vendorId, String? password}) {
    return LoginModel()
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

  // Method to perform the login logic
  Future<bool> performLogin() async {
    // Access the username and password from the model
    final vendorId = state.vendorId;
    final password = state.password;

    // Perform your login logic here
    final vendor = await LoginRepository.login(vendorId, password);

    print("My data");
    print(vendor);
    // Return a boolean indicating success or failure
    return vendor != null;
  }
}

// Provider for the LoginViewModel
final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginModel>((ref) {
  return LoginViewModel();
});
