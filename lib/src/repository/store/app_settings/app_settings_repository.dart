import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vendor/core/constans/api/end_points/waspha_vendor_end_points.dart';
import 'package:vendor/src/models/app_settings/app_settings.dart';
import 'package:vendor/src/shared/networking/networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

part 'app_settings_repository.g.dart';

//TODO://CHECK THIS
@riverpod
class AppSettingsProvider extends _$AppSettingsProvider {
  Future<AppSettings?> getAppSettings() async {
    final response = await Networking.get(
      WasphaVendorEndPoints.appSettings,
    );

    final result = switch (response) {
      Success(:final value) => () {
          try {
            final data =
                value.data['data']; // Extract the 'data' part from the response
            debugPrint('The Response Type Is ${data.runtimeType}');
            debugPrint('The Of App Settings Is $data');
            return AppSettings.fromJson(
                data); // Parse the 'data' to AppSettings
          } catch (e) {
            debugPrint('The Error From App Settings Is $e');
            return null;
          }
        }(),
      _ => null,
    };
    return result;
  }

  @override
  FutureOr<AppSettings?> build() async {
    return getAppSettings();
  }
}
