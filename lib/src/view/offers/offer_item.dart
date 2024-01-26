import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:vendor/src/models/offer/offer_model.dart';
import 'package:intl/intl.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({
    super.key,
    required this.offer,
  });

  final OfferModel offer;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Two text has spacer between each other
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Offer #${offer.id}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    timeago.format(
                      offer.orderDate!,
                      locale: Localizations.localeOf(context).languageCode,
                    ),
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundImage: offer.user?.avatar == null
                          ? AssetImage($AssetsImgsGen().avatar.path)
                              as ImageProvider
                          : CachedNetworkImageProvider(offer.user!.avatar!),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "${offer.price?.value} EGP",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(offer.deliveryLocation!))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                "${toBeginningOfSentenceCase(offer.type)} - ${offer.numberOfItems ?? 0} Items",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6.h),
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Align(
                      child: CountDownText(
                        due: offer.expiryTime,
                        finishedText: toBeginningOfSentenceCase(offer.status),
                        showLabel: true,
                        daysTextShort: "d:",
                        hoursTextShort: "h:",
                        minutesTextShort: "m:",
                        secondsTextShort: "s",
                        longDateName: false,
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
