import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/repository/notification/notification.dart';

import 'notification_card.dart';

class Notifications extends ConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications =
        ref.watch(NotificationRepository.notificationProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Notifications",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          notifications.isLoading
              ? Expanded(
                  child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ))
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 55.w, right: 20.w),
                        child: Divider(color: Colors.grey[200]),
                      );
                    },
                    itemCount: notifications.value?.length ?? 0,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        notificationModel: notifications.value![index],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
