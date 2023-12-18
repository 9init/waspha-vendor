import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/src/models/notification/notification_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                  backgroundImage:
                      notificationModel.extraData?.sentBy?.avatar == null
                          ? AssetImage($AssetsImgsGen().avatar.path)
                              as ImageProvider
                          : CachedNetworkImageProvider(
                              notificationModel.extraData!.sentBy!.avatar!)),
            ),
            SizedBox(width: 30.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(
                      notificationModel.extraData?.sentBy?.name ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        timeago.format(
                          notificationModel.createdAt,
                          locale: Localizations.localeOf(context).languageCode,
                        ),
                        style:
                            TextStyle(fontSize: 40.sp, color: Colors.grey[700]),
                      ),
                    ),
                  ]),
                  Text(
                    notificationModel.title,
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    notificationModel.body,
                    style: TextStyle(fontSize: 40.sp, color: Colors.grey[700]),
                    softWrap: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
