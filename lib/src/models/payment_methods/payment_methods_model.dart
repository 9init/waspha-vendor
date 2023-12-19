import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_methods_model.freezed.dart';
part 'payment_methods_model.g.dart';

@freezed
class PaymentMethods with _$PaymentMethods {
  const PaymentMethods._();
  const factory PaymentMethods({
    @JsonKey(name: 'store')
    @Default(StorePaymentMethods())
    StorePaymentMethods store,
    @JsonKey(name: 'express')
    @Default(ExpressPaymentMethods())
    ExpressPaymentMethods express,
  }) = _PaymentMethods;

  factory PaymentMethods.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodsFromJson(json);

  get expandedJson => {
        'store_cash_on_delivery': store.cashOnDelivery,
        'store_device_on_delivery': store.deviceOnDelivery,
        'store_credit_card': store.creditCard,
        'express_cash_on_delivery': express.cashOnDelivery,
        'express_credit_card': express.creditCard,
      };
}

@freezed
class StorePaymentMethods with _$StorePaymentMethods {
  const factory StorePaymentMethods({
    @JsonKey(name: 'cash_on_delivery') @Default(false) bool cashOnDelivery,
    @JsonKey(name: 'device_on_delivery') @Default(false) bool deviceOnDelivery,
    @JsonKey(name: 'credit_card') @Default(false) bool creditCard,
  }) = _StorePaymentMethods;

  factory StorePaymentMethods.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentMethodsFromJson(json);
}

@freezed
class ExpressPaymentMethods with _$ExpressPaymentMethods {
  const factory ExpressPaymentMethods({
    @JsonKey(name: 'cash_on_delivery') @Default(false) bool cashOnDelivery,
    @JsonKey(name: 'credit_card') @Default(false) bool creditCard,
  }) = _ExpressPaymentMethods;

  factory ExpressPaymentMethods.fromJson(Map<String, dynamic> json) =>
      _$ExpressPaymentMethodsFromJson(json);
}
