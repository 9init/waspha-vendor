import 'package:state_notifier/state_notifier.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vendor/src/repository/auth/login.dart';

class AuthCheckViewModel extends StateNotifier<AsyncValue<bool>> {
  AuthCheckViewModel() : super(const AsyncLoading()) {
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    try {
      final isLoggedIn = await LoginRepository.isLoggedIn();
      state = AsyncData(isLoggedIn);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

final authCheckViewModelProvider =
    StateNotifierProvider<AuthCheckViewModel, AsyncValue<bool>>((ref) {
  return AuthCheckViewModel();
});
