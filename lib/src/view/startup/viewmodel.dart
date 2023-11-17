import 'package:state_notifier/state_notifier.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vendor/src/repository/auth/login.dart';

class AuthCheckViewModel extends StateNotifier<bool> {
  AuthCheckViewModel() : super(false);

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await LoginRepository.isLoggedIn();
    state = isLoggedIn;
  }
}

final authCheckViewModelProvider =
    StateNotifierProvider<AuthCheckViewModel, bool>((ref) {
  return AuthCheckViewModel()..checkLoginStatus();
});
