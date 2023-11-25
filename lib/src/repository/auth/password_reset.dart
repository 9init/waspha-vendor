import 'package:dio/dio.dart';
import 'package:vendor/src/models/phone/phone_model.dart';
import 'package:vendor/src/shared/networking/Networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

class PasswordResetRepository {
  static Future<bool> requestResetPasswordWithPhoneNumber(
      PhoneModel phone) async {
    final Result<Response<dynamic>, Exception> result =
        await Networking.post("/forget-password", {
      "vendor_id": {
        "country_code": phone.countryCode,
        "number": phone.number,
        "phone_number": phone.phoneNumber,
      },
    });

    return switch (result) {
      Success(value: _) => true,
      Failure(exception: _) => false
    };
  }

  static Future<bool> requestResetPasswordWithEmail(String email) async {
    final Result<Response<dynamic>, Exception> result =
        await Networking.post("/forget-password", {
      "vendor_id": email,
    });

    return switch (result) {
      Success(value: _) => true,
      Failure(exception: _) => false
    };
  }
}
