import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/src/models/driver/driver_model.dart';
import 'package:vendor/src/routes/routes_names.dart';

class CarrierItem extends StatelessWidget {
  CarrierItem({
    super.key,
    required this.driverModel,
  });

  final DriverModel driverModel;

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
                backgroundImage: driverModel.avatar != null
                    ? CachedNetworkImageProvider(driverModel.avatar!)
                    : AssetImage($AssetsImgsGen().avatar.path) as ImageProvider,
              ),
            ),
            SizedBox(width: 30.w),
            Expanded(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driverModel.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IntrinsicWidth(
                        child: Row(
                          children: List.generate(5, (index) {
                            final color = index <= driverModel.avgRating - 1
                                ? Color(0xFFFFB900)
                                : Colors.grey;
                            return Icon(Icons.star, color: color, size: 17);
                          }),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => context.pushNamed(
                        RoutesNames.updateDriverDataScreen,
                        pathParameters: <String, String>{'driver_id': driverModel.id.toString()}),
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
