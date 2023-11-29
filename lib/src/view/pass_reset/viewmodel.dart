import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/loading_state/loading_state.dart';
import 'package:vendor/src/models/password_change/password_change_model.dart';
import 'package:vendor/src/repository/auth/password_reset.dart';

class PasswordChangeNotifier extends StateNotifier<PasswordChangeModel> {
  PasswordChangeNotifier()
      : super(const PasswordChangeModel(state: LoadingState.initial));

  Future<void> changePassword(String newPassword, String resetCode) async {
    debugPrint("$newPassword, $resetCode");

    // Set the state to loading
    state = const PasswordChangeModel(state: LoadingState.loading);

    // Fetch and update state
    state = await PasswordResetRepository.resetPassword(resetCode, newPassword);
  }
}

final passwordChangeNotifierProvider =
    StateNotifierProvider<PasswordChangeNotifier, PasswordChangeModel>(
  (ref) => PasswordChangeNotifier(),
);
