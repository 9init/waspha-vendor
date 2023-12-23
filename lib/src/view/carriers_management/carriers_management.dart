import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/driver/driver_model.dart';

class CarrierManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            context.localization.carriers_management,
            style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          ListTile(
            onTap: () {
              context.push("/carrier", extra: DriverType.ONLINE);
            },
            title: Text(
              context.localization.online_carriers,
              style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 60.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: Color(0XffE2E8ED)),
          ),
          ListTile(
            onTap: () {
              context.push("/carrier", extra: DriverType.OFFLINE);
            },
            title: Text(
              context.localization.offline_carriers,
              style: TextStyle(
                fontSize: 45.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 60.sp,
            ),
          ),
        ]),
      ),
    );
  }
}
