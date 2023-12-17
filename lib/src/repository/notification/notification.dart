import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/notification/notification_model.dart';
import 'package:vendor/src/shared/networking/Networking.dart';
import 'package:vendor/src/shared/networking/results.dart';

class NotificationRepository {
  static Future<List<NotificationModel>?> getNotifications() async {
    final result = await Networking.post("/notification-listing", {});

    return switch (result) {
      Success(value: final value) => (value.data['data'] as List)
          .map((item) => NotificationModel.fromJson(item))
          .toList(),
      _ => null,
    };
  }

  static final notificationProvider =
      AutoDisposeFutureProvider((ref) => getNotifications());
}
