import 'package:dio/dio.dart';

import '../../models/vendor/vendor.dart';
import '../../shared/networking/networking.dart';
import '../../shared/networking/results.dart';

class RegisterRepository {
  static Future<Vendor?> register(
      {required String name,
      required String password,
      required String email,
      required String countryCode,
      required String phone,
      required String fullPhoneNo}) async {
    final Result<Response<dynamic>, Exception> result =
        await Networking.post("/vendor/signup-request", {
      "name": name,
      "password": password,
      "email": email,
      "contact": {
        "country_code": countryCode,
        "number": phone,
        "phone_number": fullPhoneNo,
      }
    });

    final value = switch (result) {
      Success(value: final value) => Vendor.fromJson(value.data["data"]),
      Failure() => null,
    };

    return value;
  }
}
