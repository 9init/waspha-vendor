import 'package:dio/dio.dart';

import '../../models/vendor/vendor.dart';
import '../../shared/networking/networking.dart';
import '../../shared/networking/results.dart';

class ForgetPasswordRepository {
  static Future<Vendor?> forgetPass(String vendorId, String phoneNo) async {
    final Result<Response<dynamic>, Exception> result =
        await Networking.post("/vendor/forget-password", {
      "vendor_id": {
        "country_code": "+92",
        // "number": "3123823470",
        "phone_number": phoneNo
      }
    });

    final value = switch (result) {
      Success(value: final value) => Vendor.fromJson(value.data["data"]),
      Failure() => null,
    };

    return value;
  }
}
