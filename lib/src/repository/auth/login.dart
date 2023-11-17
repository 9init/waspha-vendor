import 'package:dio/dio.dart';
import 'package:vendor/src/models/networking/Networking.dart';
import 'package:vendor/src/models/networking/results.dart';

import '../../models/vendor/Vendor.dart';

class LoginRepository {
  static Future<Vendor?> login(String vendorId, String password) async {
    final Result<Response<dynamic>, Exception> result =
        await Networking.post("/login", {
      "vendor_id": vendorId,
      "password": password,
    });

    final value = switch (result) {
      Success(value: final value) => Vendor.fromJson(value.data["data"]),
      Failure() => null,
    };

    return value;
  }
}
