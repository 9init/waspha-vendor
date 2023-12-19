import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/shared/networking/Networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

import '../../models/vendor/vendor.dart';

class LoginRepository {
  static Future<Vendor?> login(String vendorId, String password,
      {bool keepLogin = false}) async {
    final result = await Networking.post("/login", {
      "vendor_id": vendorId,
      "password": password,
      "keepLogin": keepLogin,
    });

    final value = switch (result) {
      Success(value: final value) => Vendor.fromJson(value.data["data"]),
      Failure() => null,
      Error() => null,
    };

    return value;
  }

  static Future<Vendor?> vendorProfile() async {
    final result = await Networking.get("/vendor-profile");

    final value = switch (result) {
      Success(value: final value) => Vendor.fromJson(value.data["data"]),
      _ => null,
    };

    return value;
  }

  static final vendorProvider =
      AutoDisposeFutureProvider((ref) => vendorProfile());

  static Future<bool> isLoggedIn() async {
    final result = await Networking.post("/average-rating", {});

    return switch (result) {
      Success() => true,
      Failure() => false,
      Error() => false,
    };
  }
}
