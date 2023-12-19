import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/loading_state/loading_state.dart';
import 'package:vendor/src/models/payment_methods/payment_methods_model.dart';
import 'package:vendor/src/repository/store/profile.dart';

class PaymentMethodState {
  PaymentMethods paymentMethods = PaymentMethods();
  LoadingState loadingState = LoadingState.loading;

  PaymentMethodState copyWith({
    PaymentMethods? paymentMethods,
    LoadingState? loadingState,
  }) {
    return PaymentMethodState()
      ..loadingState = loadingState ?? this.loadingState
      ..paymentMethods = paymentMethods ?? this.paymentMethods;
  }
}

class PaymentMethodViewModel extends StateNotifier<PaymentMethodState> {
  PaymentMethodViewModel(Ref ref) : super(PaymentMethodState()) {
    StoreRepository.getPaymentMethods().then((methods) {
      state = state.copyWith(
        loadingState:
            methods != null ? LoadingState.success : LoadingState.error,
        paymentMethods: methods,
      );
    });
  }

  void updateStorePaymentMethods(StorePaymentMethods storeMethods) {
    final methods = PaymentMethods(
      store: storeMethods,
      express: state.paymentMethods.express,
    );

    state = state.copyWith(paymentMethods: methods);
  }

  void updateExpressPaymentMethods(ExpressPaymentMethods expressMethods) {
    final methods = PaymentMethods(
      store: state.paymentMethods.store,
      express: expressMethods,
    );

    state = state.copyWith(paymentMethods: methods);
  }
}

// Provider for the LoginViewModel
final paymentMethodViewModelProvider = AutoDisposeStateNotifierProvider<
    PaymentMethodViewModel, PaymentMethodState>((ref) {
  return PaymentMethodViewModel(ref);
});
